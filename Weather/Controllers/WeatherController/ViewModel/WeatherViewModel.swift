import Foundation
import Combine
import CoreLocation

final class WeatherViewModel {
    
    var locationManager: CLLocationManager?
    
    lazy var networkController = resolve(WeatherNetworkProtocol.self)
    var weather = Observable<OpenWeather>()
    var forecast = Observable<Forecast>()
    var cancellables = Set<AnyCancellable>()
    var error = Observable<APIError>()
        
    func fetchWeatherData(from location: Location) {
        networkController.fetchWeatherData(for: location)
            .receive(on: DispatchQueue.main)
            .sink { results in
                switch results {
                case .failure(let error):
                    self.error.value = error
                case .finished:
                    debugLog("✅Weather Data Fetched")
                }
            } receiveValue: { weather in
                self.weather.value = weather
            }.store(in: &cancellables)
    }
    
    func fetchForecastData(from location: Location) {
        networkController.fetchForecastData(for: location)
            .receive(on: DispatchQueue.main)
            .sink { results in
                switch results {
                case .failure(let error):
                    self.error.value = error
                case .finished:
                    debugLog("✅Weather Data Fetched")
                }
            } receiveValue: { forecast in
                self.forecast.value = forecast
            }.store(in: &cancellables)
    }
}
