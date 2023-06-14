import Foundation
@testable import Weather

final class ConvertJsonToModel {

    class func convert<Model: Codable>(fromFile file: String) -> Model? {
        do {
            let data = try fetchJsonData(inFile: file)
            let model: Model = try JSONDecoder().decode(Model.self, from: data)
            return model
        } catch let error {
            debugLog("Error Converting Json to Model: \(error)")
            return nil
        }
    }
    
    static private func fetchJsonData(inFile file: String) throws -> Data {
        let path = Bundle(for: self).path(forResource: file, ofType: "json")
        return try Data(contentsOf: URL(fileURLWithPath: path!), options: .alwaysMapped)
    }
}
