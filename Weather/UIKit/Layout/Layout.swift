import Foundation

protocol LayoutProtocol {
    static var spacing20: CGFloat { get set }
    static var spacing25: CGFloat { get set }
    static var spacing100: CGFloat { get set }
    static var spacing220: CGFloat { get set }
}

public enum Layout: LayoutProtocol {
    static var spacing20: CGFloat = 20
    static var spacing25: CGFloat = 25
    static var spacing50: CGFloat = 50
    static var spacing100: CGFloat = 100
    static var spacing220: CGFloat = 220
}
