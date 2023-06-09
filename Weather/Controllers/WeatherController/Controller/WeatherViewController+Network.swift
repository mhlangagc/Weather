import Foundation

extension WeatherViewController {
    
    @objc func fetchData() {
        viewModel.fetchWeatherData()
    }
    
    func bindToViewModel() {
        viewModel.weather.addAndNotify(observer: self) { [weak self] _ in
            Dispatch.main {
                guard let self = self else { return }
                self.setupHeaderView()
            }
        }
    }
}
