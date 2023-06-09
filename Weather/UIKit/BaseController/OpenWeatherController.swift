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
    }
}

