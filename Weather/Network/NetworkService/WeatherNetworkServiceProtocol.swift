import Foundation
import Combine

protocol WeatherNetworkServiceProtocol {
    func fetchWeatherData(for location: Location) -> Future<OpenWeather, APIError>
    func fetchForecastData(for location: Location) -> Future<Forecast, APIError> 
}
