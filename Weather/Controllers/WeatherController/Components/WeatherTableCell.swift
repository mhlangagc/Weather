import UIKit

final class WeatherTableCell: BaseTableViewCell {
    
    static var height: CGFloat = Layout.spacing50
    
    
    var forecast: ForecastList? {
        didSet {
            guard let forecast = forecast else { return }
            weekDayLabel.text = forecast.date
            
            if let weatherDescription = forecast.weather?.first?.main {
                weatherDataLabel.text = weatherDescription + " " + forecast.temperature
            }
            
            if let icon = forecast.weather?.first?.icon {
                weatherImageView.image = UIImage(named: icon)
            }
            
        }
    }
    
    lazy var weatherImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var weekDayLabel: UILabel = {
        var label = UILabel()
        label.textColor = Colour.white
        label.font = Font.sansProRegular
        label.text = WeatherStrings.fiveDayForecast
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var weatherDataLabel: UILabel = {
        var label = UILabel()
        label.textColor = Colour.white
        label.font = Font.sansProRegular
        label.text = WeatherStrings.fiveDayForecast
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func setupUI() {
        super.setupUI()
        addSubview(weatherImageView)
        addSubview(weekDayLabel)
        addSubview(weatherDataLabel)
        
        weatherImageView.leftAnchor.constraint(equalTo: leftAnchor,
                                           constant: Layout.spacing20).isActive = true
        weatherImageView.centerYAnchor ->> centerYAnchor
        weatherImageView.width(Layout.spacing32)
        weatherImageView.height(Layout.spacing32)
        
        weekDayLabel.leftAnchor.constraint(equalTo: weatherImageView.rightAnchor,
                                           constant: Layout.spacing12).isActive = true
        weekDayLabel.centerYAnchor ->> centerYAnchor
        
        weatherDataLabel.rightAnchor.constraint(equalTo: rightAnchor,
                                                constant: -Layout.spacing20).isActive = true
        weatherDataLabel.centerYAnchor ->> centerYAnchor
    }
}

