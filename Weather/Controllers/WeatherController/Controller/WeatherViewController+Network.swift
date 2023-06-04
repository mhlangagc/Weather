import Foundation

extension WeatherViewController {
    
    @objc func fetchData() {
        viewModel.fetchWeatherData()
    }
    
    func bindToViewModel() {
        
    }
}
