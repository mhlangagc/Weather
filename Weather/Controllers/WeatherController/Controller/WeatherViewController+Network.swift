import Foundation

extension WeatherViewController {
    
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
        
        viewModel.error.addAndNotify(observer: self) { [weak self] _ in
            Dispatch.main {
                guard let self = self else { return }
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
