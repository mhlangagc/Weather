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
    
    lazy var unAvailableLabel: UILabel = {
        var label = UILabel()
        label.textColor = Colour.white
        label.font = Font.sansProRegular
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        label.text = WeatherStrings.weatherUnavailable
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var goToSettingsButton: UIButton = {
        let settingsButton = UIButton()
        settingsButton.titleLabel?.font = Font.sansProRegular.withSize(16)
        settingsButton.setTitleColor(Colour.primaryColor, for: .normal)
        settingsButton.setTitle(WeatherStrings.goToSettings, for: .normal)
        settingsButton.addTarget(self, action: #selector(handleShowSettings), for: .touchUpInside)
        settingsButton.translatesAutoresizingMaskIntoConstraints = false
        return settingsButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.addSubview(logoImageView)
        view.addSubview(unAvailableLabel)
        view.addSubview(goToSettingsButton)
        
        logoImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor,
                                               constant: -Layout.spacing50).isActive = true
        logoImageView.centerXAnchor ->> view.centerXAnchor
        logoImageView.width(Layout.spacing220)
        logoImageView.height(Layout.spacing100)
        
        unAvailableLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor,
                                              constant: Layout.spacing20).isActive = true
        unAvailableLabel.leftAnchor.constraint(equalTo: view.leftAnchor,
                                               constant: Layout.spacing20).isActive = true
        unAvailableLabel.rightAnchor.constraint(equalTo: view.rightAnchor,
                                                constant: -Layout.spacing20).isActive = true
        
        goToSettingsButton.topAnchor.constraint(equalTo: unAvailableLabel.bottomAnchor,
                                              constant: Layout.spacing25).isActive = true
        goToSettingsButton.leftAnchor ->> unAvailableLabel.leftAnchor
        goToSettingsButton.rightAnchor ->> unAvailableLabel.rightAnchor
    }
    
    @objc private func handleShowSettings() {
        
    }
}

