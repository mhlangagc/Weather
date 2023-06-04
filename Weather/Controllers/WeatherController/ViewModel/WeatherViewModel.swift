import Foundation

final class WeatherViewModel {
    
    lazy var networkController = resolve(WeatherNetworkProtocol.self)
    func fetchWeatherData() {
        
    }
}
