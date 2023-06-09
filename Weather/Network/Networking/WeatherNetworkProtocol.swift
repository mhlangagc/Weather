import Foundation
import Combine

protocol WeatherNetworkProtocol {
    func fetchWeatherData(for location: Location) -> Future<OpenWeather, APIError>
}
