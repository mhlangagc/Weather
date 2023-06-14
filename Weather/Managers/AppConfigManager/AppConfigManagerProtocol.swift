import Foundation

protocol AppConfigManagerProtocol {
    static var secureApiProtocol: String { get set }
    static var openWeatherURI: String { get set }
    static var openWeatherKey: String { get set }
}
