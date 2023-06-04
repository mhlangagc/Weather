import Foundation

protocol APIResponseProtocol: AnyObject {
    var defaultError: APIError { get }
}

extension APIResponseProtocol {
    
    func handleResponse<T: Codable, Error>(response: T?,
                                           error: Error?,
                                           completion: @escaping(Result<T, APIError>) -> Void) {
        if error != nil || response == nil {
            completion(.failure(error as? KasiAPIError ?? self.defaultError))
        } else if let response = response {
            completion(.success(response))
        } else {
            completion(.failure(self.defaultError))
        }
    }
    
    func handleResponse<T: Codable, Error>(response: T?,
                                           error: Error?,
                                           onSuccess: @escaping (T) -> Void,
                                           onError: @escaping (APIError) -> Void) {
        
        if error != nil || response == nil {
            onError(error as? KasiAPIError ?? self.defaultError)
        } else if let response = response {
            onSuccess(response)
        } else {
            onError(self.defaultError)
        }
    }
}
