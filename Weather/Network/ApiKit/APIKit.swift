import Foundation

typealias Parameters = [String: Any]

final class APIKit: KasiAPIKitProtocol {
    
    static let shared = APIKit()

    func fetchAPIData<Model: Decodable>(forPath urlPath: String,
                                        parameters: Parameters = [:],
                                        headers: [HTTPHeader]? = nil,
                                        method: HTTPMethod,
                                        encodedURL: Bool = true,
                                        model: Model.Type,
                                        completion: @escaping (Model?, APIError?) -> Void)  {
    
        var url = URL(string: urlPath)
        
        if encodedURL {
            guard let encodedURL = urlPath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
                return
            }
            url = URL(string: encodedURL)
        }
        
        // Request
        guard let url = url else { return }
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        
        //  Added Headers
        if let headers = headers {
            for header in headers {
                request.addValue(header.value, forHTTPHeaderField: header.name)
            }
        }
         
        // Parameters
        if !parameters.isEmpty {
            /*
            - If the HTTPMethod is a get, adding a json body parameter will resUlt in an Error
            - [-1103] Error Domain=NSURLErrorDomain Code=-1103 "resource exceeds maximum size"
            */
            if request.httpMethod == HTTPMethod.get.rawValue {
                request.httpBody?.removeAll()
            } else {
                let jsonParameters = try? JSONSerialization.data(withJSONObject: parameters)
                if let json = jsonParameters {
                    let dataAsJson = String(data: json, encoding: .utf8) ?? ""
                    debugLog("🈶 JSON Data as Parameters for API call: \(dataAsJson).")
                }
                request.httpBody = jsonParameters
            }
        }
        
        // Session Configuration
        let sessionConfig = URLSessionConfiguration.default
        sessionConfig.timeoutIntervalForRequest = TimeInterval(25)
        sessionConfig.timeoutIntervalForResource = TimeInterval(25)
        let session = URLSession(configuration: sessionConfig)
        
        session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
            
            if let error = error {
                let errorResponse = APIError.custom(error.localizedDescription)
                debugLog("📛 Failed to process request: \(url). \n\n ---------- \nParameters: \(parameters)  \n\n ---------- \nExpected Model: \(model). \n\n ---------- Response: \(error).")
                completion(nil, errorResponse)
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse {
                if httpResponse.statusCode == 400 {
                    debugLog("📛 Failed to process request: \(url). \n\n ---------- \nParameters: \(parameters)  \n\n ---------- \nExpected Model: \(model). \n\n ---------- Response: \(String(describing: response)).")
                    
                    if let data = data {
                        let decodedResponse = try! JSONDecoder().decode(Model.self, from: data)
                        return completion(decodedResponse, nil)
                    }
                    
                    let errorResponse = APIError.custom("Error Processing your request. Please try again later")
                    return completion(nil, errorResponse)

                }
            }
            
            guard let data = data else {
                let message = "⛔️ Error fetching Data from: \(url). \n\n ---------- \nNo Data Found of expected model type: \(model)"
                debugLog(message)
                let errorResponse = APIError.custom(message)
                return completion(nil, errorResponse)
            }
            
            // Data Decoding
            do {
                let decodedResponse = try JSONDecoder().decode(Model.self, from: data)
                debugLog("✅ Data Result from: \(url). \n\n ---------- \nExpected Model: \(model). \n ---------- \nResponse: \(decodedResponse)")
                return completion(decodedResponse, nil)
            } catch let jsonError as NSError {
                
                // Return a Bool of the Model is a bool
                if Model.self == Bool.self {
                    return completion(true as? Model, nil)
                }
                
                let dataReceived = String(data: data, encoding: .utf8)
                debugLog("📛 Failed to decode data from url: \(url). \n\n ---------- \nParameters: \(parameters)  \n\n ---------- \nExpected Model: \(model). \n\n ---------- Data Package Received: \(String(describing: dataReceived)). Error: \(jsonError)")
            }
            
        }).resume()
    }
}
