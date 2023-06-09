import Foundation

func debugLog(_ message: Any...) {
    #if DEV
        debugLog(message)
    #endif
}

func debugLog(_ className: String, message: String) {
    #if DEV
        debugLog(className + " | " + message)
    #endif
}
