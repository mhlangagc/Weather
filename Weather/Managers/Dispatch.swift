import Foundation

typealias Dispatch = DispatchQueue

extension Dispatch {

    static func background(_ task: @escaping () -> ()) {
        Dispatch.global(qos: .background).async {
            task()
        }
    }

    static func main(_ task: @escaping () -> ()) {
        Dispatch.main.async {
            task()
        }
    }
}

final class KasiDispatch {
    static func mainAfter(_ seconds: Int, _ action: @escaping () -> Void) {
        Dispatch.main.asyncAfter(deadline: DispatchTime.now() + .seconds(seconds)) {
            action()
        }
    }

}
