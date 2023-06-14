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

final class MockNetworkService: APIResponseProtocol {
    
    static let shared = MockNetworkService()
    var defaultError = APIError.default
    
    var isWeatherDataFetched = false
    var isForecastDataFetched = false
    
//    func fetchWeatherData(for location: Location) -> Future<OpenWeather, APIError> {
//        isWeatherDataFetched = true
//    }
//    
//    func fetchForecastData(for location: Location) -> Future<Forecast, APIError> {
//        isForecastDataFetched = true
//    }
    
}
