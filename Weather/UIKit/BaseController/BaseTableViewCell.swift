import UIKit

class BaseTableViewCell: UITableViewCell {

    var customBackgroundColorView = UIView()
    
    override public init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: UITableViewCell.CellStyle.default, reuseIdentifier: reuseIdentifier)
        backgroundColor = UIColor.black.withAlphaComponent(0.3)
        accessoryType = .none
        setupUI()
    }
    
    func setupUI() {
    }

    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
}
