//
//  OpenWeatherController.swift
//  Weather
//
//  Created by Gugulethu Mhlanga on 2023/06/04.
//

import Foundation
import UIKit

class OpenWeatherViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupGradient()
    }
    
    private func setupGradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = CGRect(origin: .zero,
                                     size: CGSize(width: UIScreen.main.bounds.width,
                                                  height: UIScreen.main.bounds.height))
        let topColour = Colour.darkBlue.withAlphaComponent(1.0).cgColor
        let bottomColour = Colour.lightBlue.withAlphaComponent(0.8).cgColor
        gradientLayer.colors = [topColour,
                                bottomColour]
        gradientLayer.locations = [0.0, 0.5]
        view.layer.addSublayer(gradientLayer)
    }

}

