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
        
    lazy var gradientLayer: CAGradientLayer = {
        let gradient = CAGradientLayer()
        gradient.frame = CGRect(origin: .zero,
                                size: CGSize(width: screenWidth,
                                             height: screenHeight))
        gradient.colors = [Colour.darkBlue.cgColor, Colour.lightBlue.cgColor]
        gradient.startPoint = CGPoint(x: 0.5, y: 0.0)
        gradient.endPoint = CGPoint(x: 0.5, y: 0.5)
        gradient.locations = [0.0, 1.0]
        return gradient
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

