import Foundation

func getPrecedence(_ token: Token) -> UInt {
    switch token {
    case .plus, .minus:
        return 1
    case .star, .slash, .percent:
        return 2
    default:
        return 0
    }
}

// will be useful when i add 8639539 number primitives
func isNumber(_ token: Token) -> Bool {
    switch token {
    case .integer(_), .float(_):
        return true
    default:
        return false
    }
}

func isOperator(_ token: Token) -> Bool {
    switch token {
    case .plus, .minus, .slash, .star, .percent, .and, .or, .bang, .bangeq, .bangeq3, .equal2, .equal3,
    .greater, .greatereq, .less, .lesseq, .negate:
        return true;
    default:
        return false
    }
}

func isLparen(_ token: Token) -> Bool {
    switch token {
        case .lparen: return true
        default: return false
    }
}

func isRparen(_ token: Token) -> Bool {
    switch token {
        case .rparen: return true
        default: return false
    }
}

func isOperand(_ token: Token) -> Bool {
    switch token {
    case .integer(_), .float(_), .kfalse, .ktrue:
        return true
    default:
        return false
    }
}

func isUnary(_ token: Token) -> Bool {
    switch token {
    case .negate, .bang:
        return true
    default:
        return false
    }
}

func isMinus(_ token: Token) -> Bool {
    switch token {
        case .minus: return true
        default: return false
    }
}

func isBinary(_ token: Token) -> Bool {
    switch token {
    case .plus, .minus, .slash, .star, .percent, .and, .bangeq, .bangeq3, .equal2, .equal3,
    .greater, .greatereq, .less, .lesseq:
        return true;
    default:
        return false
    }
}