import UIKit

class OAuth2TokenStorage {
    private let userDefaults: UserDefaults
    private let tokenKey = "BearerToken"
    
    init(userDefaults: UserDefaults = UserDefaults.standard) {
        self.userDefaults = userDefaults
    }
    
    var token: String? {
        get {
            return userDefaults.string(forKey: tokenKey)
        }
        set {
            userDefaults.set(newValue, forKey: tokenKey)
        }
    }
}



