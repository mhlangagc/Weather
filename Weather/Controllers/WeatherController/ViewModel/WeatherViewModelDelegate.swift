import Combine
import CoreLocation

protocol WeatherViewModelDelegate: AnyObject {
    func showLoader()
    func hideLoader()
    func showTableView()
    func showApiError(_ error: APIError)
    func weatherFetchComplete()
    func forecastFetchComplete()
}
