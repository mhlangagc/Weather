//
//  AppConfigManagerTest.swift
//  WeatherTests
//
//  Created by Gugulethu Mhlanga on 2023/06/14.
//

import XCTest
@testable import Weather

final class AppConfigManagerTest: XCTestCase, AppConfigManagerProtocol {
    static var secureApiProtocol: String = "https"
    static var openWeatherURI: String = "api.openweathermap.org/data/2.5"
    static var openWeatherKey: String = "53f9d8e4213222cf517d86dc406d67fc"
    
    func testAppConfigurationStrings() {
        XCTAssertEqual(AppConfigManagerTest.secureApiProtocol, AppConfigManager.secureApiProtocol)
        XCTAssertEqual(AppConfigManagerTest.openWeatherURI, AppConfigManager.openWeatherURI)
        XCTAssertEqual(AppConfigManagerTest.openWeatherKey, AppConfigManager.openWeatherKey)
    }
}
