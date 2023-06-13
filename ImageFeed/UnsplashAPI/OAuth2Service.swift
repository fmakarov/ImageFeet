import UIKit

final class OAuth2Service {
    static let shared = OAuth2Service()
    private let urlSession = URLSession.shared
    private let tokenStorage = OAuth2TokenStorage.shared
    private var task: URLSessionTask?
    private var lastCode: String?
    
    private (set) var authToken: String? {
        get { return OAuth2TokenStorage().token }
        set { OAuth2TokenStorage().token = newValue }
    }
    
    func fetchOAuthToken(_ code: String, completion: @escaping (Result<String, Error>) -> Void) {
        assert(Thread.isMainThread)
        if lastCode == code { return }
        task?.cancel()
        lastCode = code
        
        let request = authTokenRequest(code: code)
        let session = urlSession
        let task = session.objectTask(for: request) { [weak self] (result: Result<OAuthTokenResponseBody, Error>) in
            switch result {
            case .success(let decodedObject):
                completion(.success(decodedObject.accessToken))
                self?.task = nil
            case .failure(let error):
                completion(.failure(error))
            }
        }
        self.task = task
        task.resume()
    }
}

private func authTokenRequest(code: String) -> URLRequest {
    URLRequest.makeHTTPRequest(
        path: "/oauth/token"
        + "?client_id=\(Keys.AccessKey)"
        + "&&client_secret=\(Keys.SecretKey)"
        + "&&redirect_uri=\(Keys.RedirectURI)"
        + "&&code=\(code)"
        + "&&grant_type=authorization_code",
        httpMethod: "POST",
        baseURL: URL(string: "https://unsplash.com")!
    )
}

// MARK: - HTTP Request

extension URLRequest {
    static func makeHTTPRequest(path: String, httpMethod: String, baseURL: URL = Keys.DefaultBaseURL) -> URLRequest {
        var request = URLRequest(url: URL(string: path, relativeTo: baseURL)!)
        request.httpMethod = httpMethod
        return request
    }
}

private enum NetworkError: Error {
    case codeError
}

extension URLSession {
    func objectTask<T: Decodable>(for request: URLRequest, completion: @escaping (Result<T, Error>) -> Void) -> URLSessionTask {
        let task = dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                if let error = error {
                    completion(.failure(error))
                    return
                }
                if let response = response as? HTTPURLResponse,
                   !(200...299).contains(response.statusCode) {
                    completion(.failure(NetworkError.codeError))
                    return
                }
                if let data = data {
                    do {
                        let decodedData = try JSONDecoder().decode(T.self, from: data)
                        completion(.success(decodedData))
                    } catch let error {
                        completion(.failure(error))
                    }
                } else {
                    return
                }
            }
        }
        return task
    }
}
