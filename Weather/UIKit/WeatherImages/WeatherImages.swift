//
//  WeatherImagesProtocol.swift
//  Weather
//
//  Created by Gugulethu Mhlanga on 2023/06/04.
//

import Foundation
import UIKit

protocol WeatherImagesProtocol {
    static var logoImage: UIImage { get set }
}

public enum WeatherImages: WeatherImagesProtocol {
    static var logoImage = UIImage(named: "logo_white") ?? UIImage()
}
