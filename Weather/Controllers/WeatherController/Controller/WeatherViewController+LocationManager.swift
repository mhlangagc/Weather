import Foundation
import UIKit
import CoreLocation

extension WeatherViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .notDetermined:
            requestLocationAuthorisation()
        case .authorizedWhenInUse, .authorizedAlways:
            fetchLocationData()
        case .denied, .restricted:
            self.showRequestDenied()
        default:
            break
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        fetchLocationData()
    }
}

extension WeatherViewController {
    
    func requestLocationAuthorisation() {
        viewModel.locationManager = CLLocationManager()
        viewModel.locationManager?.delegate = self
        viewModel.locationManager?.requestAlwaysAuthorization()
        viewModel.locationManager?.desiredAccuracy = kCLLocationAccuracyKilometer
        viewModel.locationManager?.startUpdatingLocation()
    }
    
    func fetchLocationData() {
        guard let coordinates: CLLocationCoordinate2D = viewModel.locationManager?.location?.coordinate else { return }
        let location = Location(lon: coordinates.longitude, lat: coordinates.latitude)
        viewModel.fetchWeatherData(from: location)
        viewModel.fetchForecastData(from: location)
    }
    
    func showRequestDenied() {
        logoImageView.isHidden = false
        labelsStackView.isHidden = false
        weatherTableView.isHidden = true
        loadingIndicatorView.stopAnimating()
    }
}
