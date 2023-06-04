import Foundation
import UIKit

final class WeatherHeaderView: BaseView {
    
    static var height: CGFloat = 300
    
    lazy var locationLabel: UILabel = {
        var label = UILabel()
        label.textColor = Colour.white
        label.font = Font.sansProRegular.withSize(36)
        label.text = "Cape Town"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var weatherImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.image = WeatherImages.partlyCloudyImage
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var temperatureLabel: UILabel = {
        var label = UILabel()
        label.textColor = Colour.white
        label.font = Font.sansProRegular.withSize(72)
        label.text = "16º"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var weatherConditionsLabel: UILabel = {
        var label = UILabel()
        label.textColor = Colour.white
        label.font = Font.sansProRegular.withSize(16)
        label.text = "Partly cloudy 22º/16º"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var temperatureLabelStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [locationLabel, weatherImageView, temperatureLabel, weatherConditionsLabel])
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.alignment = .center
        stackView.spacing = Layout.spacing0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override func setupUI() {
        super.setupUI()
        addSubview(temperatureLabelStackView)
        
        temperatureLabelStackView.topAnchor.constraint(equalTo: topAnchor,
                                                       constant: Layout.spacing0).isActive = true
        temperatureLabelStackView.leftAnchor ->> leftAnchor
        temperatureLabelStackView.rightAnchor ->> rightAnchor
        
        weatherConditionsLabel.height(Layout.spacing25)
        
        weatherImageView.height(Layout.spacing150)
        weatherImageView.width(Layout.spacing150)
    }
    
}
