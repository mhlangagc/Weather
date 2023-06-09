import Foundation
protocol KasiAPIKitProtocol {
    
    func fetchAPIData<Model: Decodable>(forPath path: String,
                                        parameters: Parameters,
                                        headers: [HTTPHeader]?,
                                        method: HTTPMethod,
                                        baseURL: BaseURL,
                                        encodedURL: Bool,
                                        model: Model.Type,
                                        completion: @escaping (Model?, APIError?) -> Void)
}
