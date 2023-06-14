import Foundation
import UIKit

extension WeatherViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.forecastData?.list?.count ?? 0 + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            guard let focastCell = tableView.dequeueReusableCell(withIdentifier: FocastTableViewCell.identifier,
                                                                 for: indexPath) as? FocastTableViewCell else {
                 return UITableViewCell()
            }
            return focastCell
        default:
            guard let weatherCell = tableView.dequeueReusableCell(withIdentifier: WeatherTableCell.identifier,
                                                                  for: indexPath) as? WeatherTableCell,
                  let forecastList = viewModel.forecastData?.list else {
                 return UITableViewCell()
            }
            weatherCell.forecast = forecastList[indexPath.row - 1]
            return weatherCell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath.row {
        case 0:
            return FocastTableViewCell.height
        default:
            return WeatherTableCell.height
        }
    }
    
}

