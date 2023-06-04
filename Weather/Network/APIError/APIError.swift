import Foundation

enum APIError: Error {
    case `default`
    case invalidURL
    case invalidCredentials
    case noData
    case network
    case custom(String)
}
