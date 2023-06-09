import Foundation
import Combine

protocol WeatherNetworkProtocol {
    func fetchWeatherData(for location: Location) -> Future<OpenWeather, APIError>
    func fetchForecastData(for location: Location) -> Future<Forecast, APIError> 
}
