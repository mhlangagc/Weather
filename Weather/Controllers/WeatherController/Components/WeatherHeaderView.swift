import Foundation
import UIKit

final class WeatherHeaderView: BaseView {
    
    static var height: CGFloat = 350
    
    var weather: OpenWeather? {
        didSet {
            guard let weather = weather, let mainWeather = weather.main else { return }
            locationLabel.text = weather.name
            temperatureLabel.text = mainWeather.averageTemp
            weatherConditionsLabel.text = weather.weatherDescription
            
            if let icon = weather.weather?.first?.icon {
                weatherImageView.image = UIImage(named: icon)
            }
        }
    }
    
    lazy var locationLabel: UILabel = {
        var label = UILabel()
        label.textColor = Colour.white
        label.font = Font.sansProRegular.withSize(36)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var weatherImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var temperatureLabel: UILabel = {
        var label = UILabel()
        label.textColor = Colour.white
        label.font = Font.sansProRegular.withSize(72)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var weatherConditionsLabel: UILabel = {
        var label = UILabel()
        label.textColor = Colour.white
        label.font = Font.sansProRegular.withSize(16)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var temperatureLabelStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [locationLabel, weatherImageView, temperatureLabel, weatherConditionsLabel])
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.alignment = .center
        stackView.spacing = Layout.spacing8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override func setupUI() {
        super.setupUI()
        addSubview(temperatureLabelStackView)
        
        locationLabel.height(Layout.spacing40)
        
        temperatureLabelStackView.topAnchor.constraint(equalTo: topAnchor,
                                                       constant: Layout.spacing0).isActive = true
        temperatureLabelStackView.leftAnchor ->> leftAnchor
        temperatureLabelStackView.rightAnchor ->> rightAnchor
        
        temperatureLabel.height(Layout.spacing80)
        weatherConditionsLabel.height(Layout.spacing32)
        
        weatherImageView.height(Layout.spacing150)
        weatherImageView.width(Layout.spacing150)
    }
    
}
