import Foundation

protocol ReachabilityManagerProtocol {
    var isReachable: Bool { get }
    var isUnreachable: Bool { get }
    var isReachableViaCellular: Bool { get }
    var isReachableViaWiFi: Bool { get }
}

final class ReachabilityManager: NSObject, ReachabilityManagerProtocol {
    
    static let shared = ReachabilityManager()
    lazy var reachability = Reachability()
    var networkStatusChanged: (() -> Void)?
    
    var isReachable: Bool {
        return reachability?.connection != Reachability.Connection.none
    }
    
    var isUnreachable: Bool {
        return reachability?.connection == Reachability.Connection.none
    }
    
    var isReachableViaCellular: Bool {
        return reachability?.connection == Reachability.Connection.cellular
    }
    
    var isReachableViaWiFi: Bool {
        return reachability?.connection == .wifi
    }
    
    override init() {
        super.init()
        registerObserver()
        startNotifier()
    }
    
    private func registerObserver() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(networkStatusChanged(_:)),
                                               name: .reachabilityChanged,
                                               object: reachability)
    }
    
    @objc func networkStatusChanged(_ notification: Notification) {
        if !currentTimeIsWithinNetworkOfflineNotificationTime {
            networkStatusChanged?()
        }
    }
    
    private func startNotifier() {
        do {
            try reachability?.startNotifier()
        } catch {
            print("Unable to start notifier")
        }
    }
    
    private func stopNotifier() -> Void {
        do {
            try reachability?.startNotifier()
        } catch {
            print("Error stopping notifier")
        }
    }
}

// MARK: Save Network Offline Notification Time
extension ReachabilityManager {
    private var networkOfflineNotificationTime: Date? {
        UserDefaultsManager.shared.fetchValue(forKey: .networkOfflineNotificationTime) as? Date
    }
    
    private func saveLastAuthenticationTime() {
        UserDefaultsManager.shared.saveValue(value: Date(), forKey: .networkOfflineNotificationTime)
    }
    
    private var currentTimeIsWithinNetworkOfflineNotificationTime: Bool {
        if let networkOfflineNotificationTime = networkOfflineNotificationTime {
            let timeInterval = Date().timeIntervalSince(networkOfflineNotificationTime)
            return timeInterval < TimeInterval(60)
        }
        return false
    }
    
    private func removeLastNotificationTime() {
        UserDefaults.standard.removeObject(forKey: UserDefaultsManager.UserDefaultsKeys.networkOfflineNotificationTime.rawValue)
    }
}
