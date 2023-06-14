import Foundation
import UIKit
import Combine

final class WeatherNetworkService: WeatherNetworkServiceProtocol, APIResponseProtocol {
    
    static let shared = WeatherNetworkService()
    var defaultError = APIError.default
    
    func fetchWeatherData(for location: Location) -> Future<OpenWeather, APIError> {
        return Future<OpenWeather, APIError> { [weak self] promise in
            
            let urlPath = WeatherURLCenter.weather(location).buildURL()
            
            APIKit.shared.fetchAPIData(forPath: urlPath,
                                       method: .get,
                                       model: OpenWeather.self) { (response, error) in
                self?.handleResponse(response: response, error: error) { (result) in
                    switch result {
                    case .failure(let error):
                        promise(.failure(error))
                    case .success(let weather):
                        promise(.success(weather))
                    }
                }
            }
        }
    }
    
    
    func fetchForecastData(for location: Location) -> Future<Forecast, APIError> {
        return Future<Forecast, APIError> { [weak self] promise in
            
            let urlPath = WeatherURLCenter.forecast(location, 6).buildURL()
            APIKit.shared.fetchAPIData(forPath: urlPath,
                                       method: .get,
                                       model: Forecast.self) { (response, error) in
                self?.handleResponse(response: response, error: error) { (result) in
                    switch result {
                    case .failure(let error):
                        promise(.failure(error))
                    case .success(let weather):
                        promise(.success(weather))
                    }
                }
            }
        }
    }
}
