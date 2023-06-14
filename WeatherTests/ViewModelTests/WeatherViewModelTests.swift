//
//  WeatherNetworkControllerTests.swift
//  WeatherTests
//
//  Created by Gugulethu Mhlanga on 2023/06/14.
//

import XCTest
import CoreLocation
@testable import Weather

final class WeatherViewModelTests: XCTestCase {
    
    /*
    var locationManager: CLLocationManager?
    var mockNetworkService: MockNetworkService?
    var viewModelUnderTest: WeatherViewModel?
    var mockLocation: Location?
    
    override class func setUp() {
        super.setUp()
        
        registerMockDependencies()
        mockNetworkService = MockNetworkService.shared
        viewModelUnderTest = WeatherViewModel()
        mockLocation = ConvertJsonToModel.convert(fromFile: "MockLocation")
        
    }
    
    override class func tearDown() {
        super.tearDown()
        DependencyContainer.shared.reset()
        mockNetworkService = nil
        viewModelUnderTest = nil
        mockLocation = nil
    }
    
    func registerMockDependencies() {
        DependencyContainer.shared.registerDefaults()
    }
    
    func fetchWeatherData(from location: Location) {
        networkController.fetchWeatherData(for: mockLocation)
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
        
    }
    */
}
