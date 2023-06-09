import Foundation

struct Weather: Codable {
    var id: Int?
    var main, description, icon: String?
}
