//
//  MockNetworkController.swift
//  WeatherTests
//
//  Created by Gugulethu Mhlanga on 2023/06/14.
//

import Foundation
import Combine
import XCTest
@testable import Weather

final class MockNetworkService: WeatherNetworkServiceProtocol {
    
    static let shared = MockNetworkService()
    
    var weatherDataFetch = false
    var weatherDataFetchFailed = false
    var forecastDataFetch = false
    var forecastDataFetchFailed = false
    
    func fetchWeatherData(for location: Location) -> Future<OpenWeather, APIError> {
        return Future<OpenWeather, APIError> { [weak self] promise in
            guard let self = self else { return }
            if self.weatherDataFetch {
                guard let mockOpenWeatherData: OpenWeather  = ConvertJsonToModel.convert(fromFile: "MockOpenWeather") else { return }
                promise(.success(mockOpenWeatherData))
            }
            if self.weatherDataFetchFailed {
                promise(.failure(APIError.default))
            }
        }
        
        
    }
    
    func fetchForecastData(for location: Location) -> Future<Forecast, APIError> {
        return Future<Forecast, APIError> { [weak self] promise in
            guard let self = self else { return }
            
            if self.forecastDataFetch {
                guard let mockOpenWeatherData: Forecast = ConvertJsonToModel.convert(fromFile: "MockFocast") else { return }
                promise(.success(mockOpenWeatherData))
            }
            
            if self.forecastDataFetchFailed {
                promise(.failure(APIError.default))
            }
        }
        
    }
    
}
