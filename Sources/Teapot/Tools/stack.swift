public struct Stack<T> {
    private var array: [T] = []

    public mutating func push(x: T) {
        array.append(x)
    }

    public mutating func pop() -> T {
        return array.removeLast()
    }

    public func peek() -> T {
        return array.last!
    }

    public func length() -> UInt {
        return UInt(array.count)
    }
}