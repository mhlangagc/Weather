import UIKit

final class FocastTableViewCell: BaseTableViewCell {
    
    static var height: CGFloat = Layout.spacing40
    
    lazy var fiveDayLabel: UILabel = {
        var label = UILabel()
        label.textColor = Colour.white
        label.font = Font.sansProSemibold.withSize(14)
        label.text = WeatherStrings.fiveDayForecast
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func setupUI() {
        super.setupUI()
        addSubview(fiveDayLabel)
        fiveDayLabel.leftAnchor.constraint(equalTo: leftAnchor,
                                           constant: Layout.spacing20).isActive = true
        fiveDayLabel.centerYAnchor ->> centerYAnchor
    }
}
