import Foundation
import UIKit
import Combine

final class WeatherNetworkController: WeatherNetworkProtocol, APIResponseProtocol {
    
    static let shared = WeatherNetworkController()
    var defaultError = APIError.default
    
    /*
    func fetchBusiness(with managerID: String) -> Future<Business, APIError> {
        return Future<Business, KasiAPIError> { [weak self] promise in
            
            let path = BusinessURLCenter.business.build()
            let parameters = ["manager_id": managerID] as [String : Any]
            
            KasiAPIKit.shared.fetchAPIData(forPath: path,
                                           parameters: parameters,
                                           method: .post,
                                           baseURL: .kasi,
                                           model: Business.self) { (response, error) in
                self?.handleResponse(response: response, error: error) { (result) in
                    switch result {
                    case .failure(let error):
                        promise(.failure(error))
                    case .success(let business):
                        promise(.success(business))
                    }
                }
            }
        }
    }
    */
}
