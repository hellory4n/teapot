import Foundation

func getPrecedence(_ token: Token) -> UInt {
    // based on how C defines those
    switch token {
        case .or: return 1
        case .and: return 2
        case .equal2, .equal3, .bangeq, .bangeq3: return 3
        case .greater, .greatereq, .less, .lesseq: return 4
        case .plus, .minus: return 5
        case .star, .slash, .percent: return 6
        case .bang: return 7
        default: return 0
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
    case .plus, .minus, .slash, .star, .percent, .and, .or, .bangeq, .bangeq3, .equal2, .equal3,
    .greater, .greatereq, .less, .lesseq:
        return true;
    default:
        return false
    }
}

func isSemicolon(_ token: Token) -> Bool {
    switch token {
        case .semicolon: return true
        default: return false
    }
}

func isNewline(_ token: Token) -> Bool {
    switch token {
        case .newline: return true
        default: return false
    }
}