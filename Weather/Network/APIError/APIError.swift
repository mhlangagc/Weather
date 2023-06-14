import Foundation

enum APIError: Error {
    case `default`
    case invalidURL
    case invalidCredentials
    case noData
    case noNetwork
    case custom(String)
}
