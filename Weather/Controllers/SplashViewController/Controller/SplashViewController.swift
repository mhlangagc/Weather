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
    
    lazy var labelsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [unAvailableLabel, goToSettingsButton])
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.alignment = .center
        stackView.spacing = Layout.spacing25
        stackView.isHidden = true
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var loadingIndicatorView: UIActivityIndicatorView = {
        let loader = UIActivityIndicatorView()
        loader.style = UIActivityIndicatorView.Style.large
        loader.hidesWhenStopped = true
        loader.tintColor = Colour.white
        loader.translatesAutoresizingMaskIntoConstraints = false
        return loader
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        fetchLocationData()
    }
    
    private func setupUI() {
        view.addSubview(logoImageView)
        view.addSubview(loadingIndicatorView)
        view.addSubview(labelsStackView)
        
        logoImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor,
                                               constant: -Layout.spacing50).isActive = true
        logoImageView.centerXAnchor ->> view.centerXAnchor
        logoImageView.width(Layout.spacing220)
        logoImageView.height(Layout.spacing100)
        
        loadingIndicatorView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor,
                                                  constant: Layout.spacing20).isActive = true
        loadingIndicatorView.centerXAnchor ->> view.centerXAnchor
        loadingIndicatorView.height(Layout.spacing25)
        loadingIndicatorView.width(Layout.spacing25)
        
        labelsStackView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor,
                                             constant: Layout.spacing20).isActive = true
        labelsStackView.leftAnchor.constraint(equalTo: view.leftAnchor,
                                              constant: Layout.spacing20).isActive = true
        labelsStackView.rightAnchor.constraint(equalTo: view.rightAnchor,
                                               constant: -Layout.spacing20).isActive = true
    }
    
    private func fetchLocationData() {
        loadingIndicatorView.startAnimating()
    }
    
    @objc private func handleShowSettings() {
        
    }
}

