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
    
    lazy var lineView: UIView = {
        let view = UIView()
        view.backgroundColor = Colour.white.withAlphaComponent(0.4)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func setupUI() {
        super.setupUI()
        addSubview(fiveDayLabel)
        addSubview(lineView)
        
        fiveDayLabel.leftAnchor.constraint(equalTo: leftAnchor,
                                           constant: Layout.spacing20).isActive = true
        fiveDayLabel.centerYAnchor ->> centerYAnchor
        
        lineView.leftAnchor.constraint(equalTo: leftAnchor,
                                       constant: Layout.spacing20).isActive = true
        lineView.rightAnchor.constraint(equalTo: rightAnchor,
                                        constant: -Layout.spacing20).isActive = true
        lineView.bottomAnchor ->> bottomAnchor
        lineView.height(0.8)
    }
}
