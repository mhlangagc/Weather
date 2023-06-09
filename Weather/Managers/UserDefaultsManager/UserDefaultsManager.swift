import Foundation

final class UserDefaultsManager {
    
    static let shared = UserDefaultsManager()
    private let userDefaults = UserDefaults.standard
    
    @frozen enum UserDefaultsKeys: String {
        case networkOfflineNotificationTime = "app.networkOfflineNotificationTime.key"
    }
    
    func saveValue(value: Any, forKey key: UserDefaultsKeys) {
        userDefaults.setValue(value, forKey: key.rawValue)
        userDefaults.synchronize()
    }
    
    func fetchValue(forKey key: UserDefaultsKeys) -> Any? {
        return userDefaults.value(forKey: key.rawValue)
    }
    
    func deleteValue(forKey key: UserDefaultsKeys) -> Any? {
        return userDefaults.removeObject(forKey: key.rawValue)
    }
}
