import Foundation

public func resolve<Protocol>(_ aProtocol: Protocol.Type) -> Protocol {
    return DependencyContainer.shared.resolve(aProtocol)
}

@objc final public class DependencyContainer: NSObject {
    private var registrations = [String: () -> Any]()
    @objc(sharedInstance)
    static public var shared = DependencyContainer()

    public func register<Implementation>(_ implementation: @escaping () -> Implementation, for aProtocol: Implementation.Type) {
        registrations[String(describing: aProtocol)] = implementation
    }

    func resolve<Protocol>(_ aProtocol: Protocol.Type) -> Protocol {
        DependencyContainer.registerDefaults()
        let protocolDescription = String(describing: aProtocol)
        guard let aProtocol = registrations[protocolDescription]?() as? Protocol else {
            fatalError("Failed to find registration for \(protocolDescription)")
        }
        return aProtocol
    }
    
    static func reset() {
        DependencyContainer.shared.registrations.removeAll()
        registerDefaults()
    }
    
    public static func registerDefaults() {
        registerNetworkControllers()
    }
    
    static func registerNetworkControllers() {
        DependencyContainer.shared.register( { WeatherNetworkController.shared },
                                             for: WeatherNetworkProtocol.self)
    }
    
}
