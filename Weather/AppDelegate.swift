import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = setupBaseRouting()
        return true
    }
    
    func setupBaseRouting() -> UIWindow {
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.makeKeyAndVisible()
        window.tintColor = UIColor.systemGreen
        window.rootViewController = UINavigationController(rootViewController: WeatherViewController())
        return window
    }
}
