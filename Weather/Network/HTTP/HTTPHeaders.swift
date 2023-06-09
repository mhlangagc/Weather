import Foundation

struct HTTPHeader: Hashable {
    let name: String
    let value: String
    init(name: String, value: String) {
        self.name = name
        self.value = value
    }
}
