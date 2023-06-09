import Foundation
import CoreLocation

extension WeatherViewController {
    
    
    func fetchData() {
        guard let coordinates: CLLocationCoordinate2D = viewModel.locationManager?.location?.coordinate else { return }
        let location = Location(lon: coordinates.longitude, lat: coordinates.latitude)
        
        ReachabilityManager.shared.networkStatusChanged = { [weak self] in
            Dispatch.main {
                guard let self = self else { return }
                let isNetworkRechable = self.viewModel.networkReachabilityManager.isReachable
                if !isNetworkRechable {
                    AlertManager.showAlertMessage(title: "Network Unavailable",
                                                  message: "Your network is unreachable. Check your settings and try again",
                                                  on: self)
                } else {
                    self.viewModel.fetchWeatherData(from: location)
                    self.viewModel.fetchForecastData(from: location)
                }
            }
        }
    }
    
    func bindToViewModel() {
        viewModel.weather.addAndNotify(observer: self) { [weak self] _ in
            Dispatch.main {
                guard let self = self else { return }
                self.loadingIndicatorView.stopAnimating()
                self.hideSplashUI()
                self.showTableView()
                self.setupHeaderView()
            }
        }
        
        viewModel.forecast.addAndNotify(observer: self) { [weak self] _ in
            Dispatch.main {
                guard let self = self else { return }
                self.loadingIndicatorView.stopAnimating()
                self.showTableView()
                self.weatherTableView.reloadData()
            }
        }
        
        viewModel.error.addAndNotify(observer: self) { [weak self] _ in
            Dispatch.main {
            }
        }
    }
    
    private func hideSplashUI() {
        logoImageView.isHidden = true
        labelsStackView.isHidden = true
    }
    
    private func showTableView() {
        weatherTableView.isHidden = false
    }
}
