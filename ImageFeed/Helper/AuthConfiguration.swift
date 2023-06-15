import Foundation

struct Keys {
    static let AccessKey = "So8C2de5yTNY-mT9zXdMjL5tR-HFg3i42w9GIZWqG54"
    static let SecretKey = "FpAfMayGDYDYkk_O_6AJV0aGQsQApUO26ucb-gArVnk"
    static let RedirectURI = "urn:ietf:wg:oauth:2.0:oob"
    static let AccessScope = "public+read_user+write_likes"
    static let DefaultBaseURL: URL = URL(string: "https://api.unsplash.com")!
    static let UnsplashAuthorizeURLString = "https://unsplash.com/oauth/authorize"
    static let AuthorizationPath = "/oauth/authorize/native"
    static let BaseURL =  URL(string: "https://unsplash.com")!
    static let Code = "code"
}

struct AuthConfiguration {
    let AccessKey: String
    let SecretKey: String
    let RedirectURI: String
    let AccessScope: String
    let DefaultBaseURL: URL
    let UnsplashAuthorizeURLString: String
    
    let AuthorizationPath: String
    let BaseURL: URL
    let Code: String
    
    static var standard: AuthConfiguration {
        return AuthConfiguration(AccessKey: Keys.AccessKey,
                                 SecretKey: Keys.SecretKey,
                                 RedirectURI: Keys.RedirectURI,
                                 AccessScope: Keys.AccessScope,
                                 DefaultBaseURL: Keys.DefaultBaseURL,
                                 UnsplashAuthorizeURLString: Keys.UnsplashAuthorizeURLString,
                                 
                                 AuthorizationPath: Keys.Code,
                                 BaseURL: Keys.BaseURL,
                                 Code: Keys.Code)
    }
}

