import Foundation
import UIKit
import CoreLocation

extension WeatherViewController: WeatherViewModelDelegate {
    
    func fetchWeatherData() {
        guard let coordinates: CLLocationCoordinate2D = viewModel.locationManager?.location?.coordinate else { return }
        
        let location = Location(lon: coordinates.longitude, lat: coordinates.latitude)
        let isNetworkRechable = self.viewModel.networkReachabilityManager.isReachable
        
        if !isNetworkRechable {
            AlertManager.showAlertMessage(title: WeatherStrings.networkUnavailable,
                                          message: WeatherStrings.networkUnavailableDetail,
                                          on: self)
            return
        }
        
        if isNetworkRechable {
            self.viewModel.getWeatherData(from: location)
            self.viewModel.getForecastData(from: location)
        } else {
            ReachabilityManager.shared.networkStatusChanged = { [weak self] in
                Dispatch.main {
                    guard let self = self else { return }
                    if !isNetworkRechable {
                        AlertManager.showAlertMessage(title: WeatherStrings.networkUnavailable,
                                                      message: WeatherStrings.networkUnavailableDetail,
                                                      on: self)
                    } else {
                        self.viewModel.getWeatherData(from: location)
                        self.viewModel.getForecastData(from: location)
                    }
                }
            }
        }
    }
    
    func showLoader() {
        self.loadingIndicatorView.startAnimating()
    }
    
    func hideLoader() {
        self.loadingIndicatorView.stopAnimating()
    }
    
    func showTableView() {
        if let weatherIcon = viewModel.weatherData?.weather?.first?.icon {
            let topColour = weatherIcon.contains("d") ? Colour.darkBlue.cgColor : Colour.black.cgColor
            let bottomColour = weatherIcon.contains("d") ? Colour.lightBlue.cgColor : Colour.darkBlue.cgColor
            gradientLayer.colors = [topColour, bottomColour]
        }
        weatherTableView.isHidden = false
        weatherTableView.reloadData()
    }
    
    func showApiError(_ error: APIError) {
        let tryAgainButton = UIAlertAction(title: WeatherStrings.tryAgainTitle, style: .default) { _ in
            self.fetchWeatherData()
        }
        
        var errorMessage = ""
        switch error {
        case .custom(let error):
            errorMessage = error
        case .noNetwork:
            errorMessage = WeatherStrings.networkUnavailableDetail
        default:
            errorMessage = error.localizedDescription
        }
        
        AlertManager.show(title: WeatherStrings.weatherErrorTitle,
                          message: errorMessage,
                          actions: [tryAgainButton],
                          on: self)
    }
    
    func weatherFetchComplete() {
        logoImageView.isHidden = true
        labelsStackView.isHidden = true
        setupHeaderView()
    }
    
    func forecastFetchComplete() {
        logoImageView.isHidden = true
        labelsStackView.isHidden = true
    }
}
