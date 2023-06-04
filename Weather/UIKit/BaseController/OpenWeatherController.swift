import Foundation
import UIKit

class OpenWeatherViewController: UIViewController {

    var screenWidth: CGFloat {
        UIScreen.main.bounds.width
    }
    
    var screenHeight: CGFloat {
        UIScreen.main.bounds.height
    }
    
    lazy var refresher: UIRefreshControl = {
        let refresher = UIRefreshControl()
        refresher.tintColor = Colour.white
        return refresher
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupGradient()
    }
    
    private func setupGradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = CGRect(origin: .zero,
                                     size: CGSize(width: screenWidth,
                                                  height: screenHeight))
        let topColour = Colour.darkBlue.cgColor
        let bottomColour = Colour.lightBlue.cgColor
        gradientLayer.colors = [topColour,
                                bottomColour]
        gradientLayer.locations = [0.0, 1.0]
        view.layer.addSublayer(gradientLayer)
    }

}

