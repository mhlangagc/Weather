import Foundation
import Combine

final class WeatherViewModel {
    
    lazy var networkController = resolve(WeatherNetworkProtocol.self)
    var weather = Observable<OpenWeather>()
    var forecast = Observable<Forecast>()
    var cancellables = Set<AnyCancellable>()
    var error = Observable<APIError>()
    
    func fetchWeatherData() {
        let location = Location(lon: 31.017536,
                                lat: -29.838615)
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
    
    func fetchForecastData() {
        let location = Location(lon: 31.017536,
                                lat: -29.838615)
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
