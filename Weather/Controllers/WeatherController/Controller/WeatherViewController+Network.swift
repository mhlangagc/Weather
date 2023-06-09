import Foundation

extension WeatherViewController {
    
    @objc func fetchData() {
        viewModel.fetchWeatherData()
        viewModel.fetchForecastData()
    }
    
    func bindToViewModel() {
        viewModel.weather.addAndNotify(observer: self) { [weak self] _ in
            Dispatch.main {
                guard let self = self else { return }
                self.hideLoadingData()
                self.setupHeaderView()
            }
        }
        
        viewModel.forecast.addAndNotify(observer: self) { [weak self] _ in
            Dispatch.main {
                guard let self = self else { return }
                self.weatherTableView.reloadData()
            }
        }
    }
    
    private func hideLoadingData() {
        logoImageView.isHidden = true
        loadingIndicatorView.stopAnimating()
        labelsStackView.isHidden = true
        weatherTableView.isHidden = false
    }
}
