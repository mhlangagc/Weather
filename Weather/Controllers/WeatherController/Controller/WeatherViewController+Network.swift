import Foundation
import CoreLocation

extension WeatherViewController {
    
    func fetchData() {
        guard let coordinates: CLLocationCoordinate2D = viewModel.locationManager?.location?.coordinate else { return }
        let location = Location(lon: coordinates.longitude, lat: coordinates.latitude)
        viewModel.fetchWeatherData(from: location)
        viewModel.fetchForecastData(from: location)
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
                guard let self = self else { return }
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
