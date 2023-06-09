import Foundation

public enum StringsFile: String {
    case strings = "WeatherStrings"
}

protocol LocalizableProtocol: Localizable {
    static func localized(key: String, in file: StringsFile) -> String
}

class Localizable: LocalizableProtocol {
    class func localized(key: String, in file: StringsFile = .strings) -> String {
        return NSLocalizedString(key,
                                 tableName: file.rawValue,
                                 bundle: Bundle.main,
                                 value: "",
                                 comment: "")
    }
}
