public struct Event<T> {
    let oldValue: T
    let newValue: T
}

public class Subscription<T>: Hashable {
    public typealias EventHandler = (Event<T>) -> Void

    let handler: EventHandler
    private let UUID = NSUUID().UUIDString

    init(handler: EventHandler) {
        self.handler = handler
    }

    public var hashValue: Int {
        return UUID.hashValue
    }
}

public func ==<T>(lhs: Subscription<T>, rhs: Subscription<T>) -> Bool {
    return lhs.UUID == rhs.UUID
}