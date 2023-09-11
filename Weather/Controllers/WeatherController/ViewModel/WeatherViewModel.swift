import Foundation
import Combine
import CoreLocation

final class WeatherViewModel {
    
    /// Sensetive Data Test
    let postData = "username=Steve&password=123456".data(using: .utf8)
    var delegate: WeatherViewModelDelegate
    var networkService: WeatherNetworkServiceProtocol
    var forecastData: Forecast?
    var weatherData: OpenWeather?
    var locationManager: CLLocationManager?
    lazy var networkReachabilityManager = resolve(ReachabilityManagerProtocol.self)
    
    var cancellables = Set<AnyCancellable>()
    
    init(delegate: WeatherViewModelDelegate,
         networkService: WeatherNetworkServiceProtocol = WeatherNetworkService.shared) {
        self.delegate = delegate
        self.networkService = networkService
    }
    
    func getWeatherData(from location: Location) {
        networkService.fetchWeatherData(for: location)
            .receive(on: DispatchQueue.main)
            .sink { results in
                switch results {
                case .failure(let error):
                    self.delegate.hideLoader()
                    self.delegate.showApiError(error)
                case .finished:
                    debugLog("✅Weather Data Fetched")
                }
            } receiveValue: { weather in
                self.weatherData = weather
                self.delegate.hideLoader()
                self.delegate.showTableView()
                self.delegate.weatherFetchComplete()
            }.store(in: &cancellables)
    }
    
    func getForecastData(from location: Location) {
        networkService.fetchForecastData(for: location)
            .receive(on: DispatchQueue.main)
            .sink { results in
                switch results {
                case .failure(let error):
                    self.delegate.hideLoader()
                    self.delegate.showApiError(error)
                case .finished:
                    debugLog("✅Weather Data Fetched")
                }
            } receiveValue: { forecast in
                self.forecastData = forecast
                self.delegate.hideLoader()
                self.delegate.showTableView()
                self.delegate.forecastFetchComplete()
            }.store(in: &cancellables)
    }
}
