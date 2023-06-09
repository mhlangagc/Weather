import Foundation

@frozen enum InfoPlistKey: String {
    case apiProtocol
    case secureApiProtocol
    case openWeatherURI
}

class AppConfigManager {
    
    static let infoDictionary = Bundle.main.infoDictionary
    
    static var bundleID: String {
        return Bundle.main.bundleIdentifier ?? ""
    }
    
    static var versionString: String {
        infoDictionary?["CFBundleShortVersionString"] as? String ?? ""
    }
    
    static var buildString: String {
        infoDictionary?["CFBundleVersion"] as? String ?? ""
    }
    
    static var appName: String {
        return Bundle.main.infoDictionary?["CFBundleName"] as? String ?? ""
    }
    
    static var apiProtocol: String {
        infoDictionary?[InfoPlistKey.apiProtocol.rawValue] as! String
    }
    
    static var secureApiProtocol: String {
        return infoDictionary?[InfoPlistKey.secureApiProtocol.rawValue] as! String
    }
    
    static var openWeatherURI: String {
        infoDictionary?[InfoPlistKey.openWeatherURI.rawValue] as? String ?? ""
    }
    
}
