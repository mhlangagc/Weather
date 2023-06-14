//
//  WeatherViewModelDelegate.swift
//  Weather
//
//  Created by Gugulethu Mhlanga on 2023/06/14.
//

import Combine
import CoreLocation

protocol WeatherViewModelDelegate: AnyObject {
    func hideLoader()
    func showTableView()
    func showApiError(_ error: APIError)
    func weatherFetchComplete()
    func forecastFetchComplete()
}
