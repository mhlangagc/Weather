//
//  WeatherViewModelMock.swift
//  WeatherTests
//
//  Created by Gugulethu Mhlanga on 2023/06/14.
//

import CoreLocation
@testable import Weather

class WeatherViewModelDelegateMock: WeatherViewModelDelegate{
    
    var hideLoaderInvoked = false
    var showErrorInvoked = false
    var apiError: String?
    var showTableViewInvoked = false
    var weatherDataFetched = false
    var forecastDataFetched = false
    
    func hideLoader() {
        hideLoaderInvoked = true
    }
    
    func showTableView() {
        self.showTableViewInvoked = true
    }
    
    func showApiError(_ error: APIError) {
        showErrorInvoked = true
        apiError = error.localizedDescription
    }
    
    func weatherFetchComplete() {
        weatherDataFetched = true
    }
    
    func forecastFetchComplete() {
        forecastDataFetched = true
    }
    
    func reset(){
        hideLoaderInvoked = false
        showErrorInvoked = false
        apiError = nil
        showTableViewInvoked = false
        weatherDataFetched = false
        forecastDataFetched = false
    }
}
