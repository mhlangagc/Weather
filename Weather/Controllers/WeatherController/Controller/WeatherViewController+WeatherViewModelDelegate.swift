import Foundation
import CoreLocation

extension WeatherViewController: WeatherViewModelDelegate {
    
    func fetchWeatherData() {
        guard let coordinates: CLLocationCoordinate2D = viewModel.locationManager?.location?.coordinate else { return }
        let location = Location(lon: coordinates.longitude, lat: coordinates.latitude)
        
        ReachabilityManager.shared.networkStatusChanged = { [weak self] in
            Dispatch.main {
                guard let self = self else { return }
                let isNetworkRechable = self.viewModel.networkReachabilityManager.isReachable
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
    
    func showLoader() {
        self.loadingIndicatorView.startAnimating()
    }
    
    func hideLoader() {
        self.loadingIndicatorView.stopAnimating()
    }
    
    func showTableView() {
        weatherTableView.isHidden = false
        weatherTableView.reloadData()
    }
    
    func showApiError(_ error: APIError) {
        AlertManager.showAlertMessage(title: WeatherStrings.weatherErrorTitle,
                                      message: error.localizedDescription,
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
