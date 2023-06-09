import Foundation
import UIKit

class WeatherViewController: OpenWeatherViewController {

    lazy var viewModel = WeatherViewModel()
    lazy var headerView = WeatherHeaderView()
    
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
        refresher.addTarget(self, action: #selector(fetchData), for: .valueChanged)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupHeaderView()
        registerCells()
        fetchData()
        bindToViewModel()
    }
    
    func setupUI() {
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

