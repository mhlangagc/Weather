import Foundation

enum APIError: Error {
    case `default`
    case noNetwork
    case custom(String)
}
