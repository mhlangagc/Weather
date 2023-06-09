import UIKit

extension WeatherViewController {
    @objc func handleShowSettings() {
        if let appSettings = URL(string: UIApplication.openSettingsURLString) {
            UIApplication.shared.open(appSettings as URL)
        }
    }
}
