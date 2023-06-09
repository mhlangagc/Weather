import Foundation
import UIKit
import CoreLocation

class WeatherViewController: OpenWeatherViewController {

    lazy var viewModel = WeatherViewModel()
    lazy var headerView = WeatherHeaderView()
    
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
    
    // MARK: Weather Table View
    lazy var weatherTableView: UITableView = {
         let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.backgroundColor = UIColor.clear
        tableView.backgroundView = nil
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.allowsSelection = false
        tableView.refreshControl = refresher
        tableView.isHidden = true
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupGradient()
        setupSplashUI()
        setupTableUI()
        setupHeaderView()
        registerCells()
        requestLocationAuthorisation()
        loadingIndicatorView.startAnimating()
        fetchData()
        bindToViewModel()
    }
    
    private func setupGradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = CGRect(origin: .zero,
                                     size: CGSize(width: screenWidth,
                                                  height: screenHeight))
        // let topColour = Colour.darkBlue.cgColor
        // let bottomColour = Colour.lightBlue.cgColor
        let topColour = Colour.black.cgColor
        let bottomColour = Colour.darkBlue.cgColor
        gradientLayer.colors = [topColour,
                                bottomColour]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 0.5)
        gradientLayer.locations = [0.0, 1.0]
        view.layer.addSublayer(gradientLayer)
    }
    
    func setupTableUI() {
        view.addSubview(weatherTableView)
        weatherTableView.constrain(to: view)
    }
    
    func registerCells() {
        weatherTableView.register(FocastTableViewCell.self, forCellReuseIdentifier: FocastTableViewCell.identifier)
        weatherTableView.register(WeatherTableCell.self, forCellReuseIdentifier: WeatherTableCell.identifier)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        sizeHeaderToFit()
    }
}

// MARK: SetupUI
extension WeatherViewController {
    private func setupSplashUI() {
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
}

// MARK: HeaderView
extension WeatherViewController {
    func sizeHeaderToFit() {
        headerView.setNeedsLayout()
        headerView.layoutIfNeeded()
        headerView.frame = headerFrame
    }

    func setupHeaderView() {
        headerView.frame = headerFrame
        headerView.weather = self.viewModel.weather.value
        weatherTableView.tableHeaderView = headerView
    }
}

// MARK: Dimensions
extension WeatherViewController {
    var headerFrame: CGRect {
        CGRect(origin: .zero,
               size: CGSize(width: screenWidth, height: WeatherHeaderView.height))
    }
}

