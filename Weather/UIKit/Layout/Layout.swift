import Foundation

protocol LayoutProtocol {
    static var spacing0: CGFloat { get set }
    static var spacing8: CGFloat { get set }
    static var spacing20: CGFloat { get set }
    static var spacing25: CGFloat { get set }
    static var spacing32: CGFloat { get set }
    static var spacing40: CGFloat { get set }
    static var spacing100: CGFloat { get set }
    static var spacing150: CGFloat { get set }
    static var spacing220: CGFloat { get set }
    static var spacing300: CGFloat { get set }
}

public enum Layout: LayoutProtocol {
    static var spacing0: CGFloat = 0
    static var spacing8: CGFloat = 8
    static var spacing20: CGFloat = 20
    static var spacing25: CGFloat = 25
    static var spacing32: CGFloat = 32
    static var spacing40: CGFloat = 40
    static var spacing50: CGFloat = 50
    static var spacing100: CGFloat = 100
    static var spacing150: CGFloat = 150
    static var spacing220: CGFloat = 220
    static var spacing300: CGFloat = 300
}
