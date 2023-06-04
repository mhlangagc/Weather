import UIKit

class SplashViewController: OpenWeatherViewController {

    lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.image = WeatherImages.logoImage
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.addSubview(logoImageView)
        logoImageView.centerYAnchor ->> view.centerYAnchor
        logoImageView.centerXAnchor ->> view.centerXAnchor
        logoImageView.width(Layout.spacing220)
        logoImageView.height(Layout.spacing100)
    }
}

