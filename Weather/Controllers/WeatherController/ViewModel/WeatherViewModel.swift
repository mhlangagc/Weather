import Foundation
import Combine
import CoreLocation

final class WeatherViewModel {
    
    weak var delegate: WeatherViewModelDelegate?
    var forecastData: Forecast?
    var weatherData: OpenWeather?
    var locationManager: CLLocationManager?
    lazy var networkReachabilityManager = resolve(ReachabilityManagerProtocol.self)
    lazy var networkController = resolve(WeatherNetworkServiceProtocol.self)
    var cancellables = Set<AnyCancellable>()
    
    func fetchWeatherData(from location: Location) {
        networkController.fetchWeatherData(for: location)
            .receive(on: DispatchQueue.main)
            .sink { results in
                switch results {
                case .failure(let error):
                    self.delegate?.hideLoader()
                    self.delegate?.showApiError(error)
                case .finished:
                    debugLog("✅Weather Data Fetched")
                }
            } receiveValue: { weather in
                self.weatherData = weather
                self.delegate?.hideLoader()
                self.delegate?.showTableView()
                self.delegate?.weatherFetchComplete()
            }.store(in: &cancellables)
    }
    
    func fetchForecastData(from location: Location) {
        networkController.fetchForecastData(for: location)
            .receive(on: DispatchQueue.main)
            .sink { results in
                switch results {
                case .failure(let error):
                    self.delegate?.hideLoader()
                    self.delegate?.showApiError(error)
                case .finished:
                    debugLog("✅Weather Data Fetched")
                }
            } receiveValue: { forecast in
                self.forecastData = forecast
                self.delegate?.hideLoader()
                self.delegate?.showTableView()
                self.delegate?.forecastFetchComplete()
            }.store(in: &cancellables)
    }
}
