import Foundation

protocol LayoutProtocol {
    static var spacing100: CGFloat { get set }
    static var spacing220: CGFloat { get set }
}

public enum Layout: LayoutProtocol {
    static var spacing100: CGFloat = 100
    static var spacing220: CGFloat = 220
}
