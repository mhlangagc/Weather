import Foundation
import UIKit

struct AlertManager {
    static func show(_ style: UIAlertController.Style = .alert,
                     title: String?,
                     message: String?,
                     actions: [UIAlertAction],
                     on viewController: UIViewController) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: style)
        
        actions.forEach { (action) in
            alert.addAction(action)
        }
        
        alert.popoverPresentationController?.sourceRect = CGRect(x: UIScreen.main.bounds.midX, y: UIScreen.main.bounds.midY, width: 0, height: 0)
        viewController.present(alert, animated: true, completion: nil)
    }
    
    static func showError(_ style: UIAlertController.Style = .alert,
                          error: Error,
                          on viewController: UIViewController) {
        
        let okAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        show(style, title: "Error", message: error.localizedDescription, actions: [okAction], on: viewController)
    }
    
    static func showAlertMessage(_ style: UIAlertController.Style = .alert,
                                 title: String,
                                 message: String,
                                 on viewController: UIViewController) {
        
        let okAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        show(style, title: title, message: message, actions: [okAction], on: viewController)
    }
}
