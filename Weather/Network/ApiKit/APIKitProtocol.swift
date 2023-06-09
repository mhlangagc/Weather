import Foundation
protocol KasiAPIKitProtocol {
    
    func fetchAPIData<Model: Decodable>(forPath urlPath: String,
                                        parameters: Parameters,
                                        headers: [HTTPHeader]?,
                                        method: HTTPMethod,
                                        encodedURL: Bool,
                                        model: Model.Type,
                                        completion: @escaping (Model?, APIError?) -> Void)
}
