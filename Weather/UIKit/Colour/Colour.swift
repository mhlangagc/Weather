//
//  Colour.swift
//  Weather
//
//  Created by Gugulethu Mhlanga on 2023/06/04.
//

import Foundation
import UIKit

struct Colour {

    private init() {}
    
    private static let `defaultColor` = UIColor()
    
    static let darkBlue  = hexToUIColor("154F9E")
    static let lightBlue = hexToUIColor("7BBAE7")
    
    // MARK: HexToUIColor
    static func hexToUIColor(_ hex: String) -> UIColor {
        var hexString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (hexString.hasPrefix("#")) {
            hexString.remove(at: hexString.startIndex)
        }

        if ((hexString.count) != 6) {
            return UIColor.gray
        }

        var rgbValue:UInt64 = 0
        Scanner(string: hexString).scanHexInt64(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}
