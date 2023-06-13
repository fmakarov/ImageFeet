import Foundation

final class ImagesListService {
    private (set) var photos: [Photo] = []
    
    private var lastLoadedPage: Int?
    static let DidChangeNotification = Notification.Name(rawValue: "ImagesListServiceDidChange")
    // ...
    
    func fetchPhotosNextPage() {
        // ...
    }
    
}

struct Photo {
    let id: String
    let size: CGSize
    let createdAt: Date?
    let welcomeDescription: String?
    let thumbImageURL: String
    let largeImageURL: String
    let isLiked: Bool
}
