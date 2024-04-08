import Foundation

func getPrecedence(token: Token) -> UInt {
    switch token {
    case .plus, .minus:
        return 1
    case .star, .slash, .percent:
        return 2
    default:
        return 0
    }
}