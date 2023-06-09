import Foundation
import UIKit
import CoreLocation

extension WeatherViewController: CLLocationManagerDelegate {
    
    func requestLocationAuthorisation() {
        viewModel.locationManager = CLLocationManager()
        viewModel.locationManager?.delegate = self
        viewModel.locationManager?.requestAlwaysAuthorization()
        viewModel.locationManager?.desiredAccuracy = kCLLocationAccuracyThreeKilometers
        viewModel.locationManager?.startUpdatingLocation()
    }
    
    func showRequestDenied() {
        logoImageView.isHidden = false
        labelsStackView.isHidden = false
        weatherTableView.isHidden = true
        loadingIndicatorView.stopAnimating()
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .notDetermined:
            requestLocationAuthorisation()
        case .authorizedWhenInUse, .authorizedAlways:
            fetchWeatherData()
        case .denied, .restricted:
            self.showRequestDenied()
        default:
            break
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        fetchWeatherData()
    }
}
