import Foundation

protocol Ast {}
protocol Expression: Ast {}

struct PlaceholderExpr: Expression {}

enum ArithmeticExpr: Expression {
    // all the literals
    case i64_literal(n: Int64)
    case f64_literal(n: Float64)

    // -9
    case negate(n: Expression)

    // 9 + 10
    case add(a: Expression, b: Expression)
    // 9 - 10
    case sub(a: Expression, b: Expression)
    // 9 * 10
    case mul(a: Expression, b: Expression)
    // 9 / 10
    case div(a: Expression, b: Expression)
    // 9 % 10
    case mod(a: Expression, b: Expression)
}

enum BooleanExpr: Expression {
    // literals
    case true_
    case false_

    // !true
    case not(a: Expression)

    // true && false
    case and(a: Expression, b: Expression)
    // true || false
    case or(a: Expression, b: Expression)
    // 1 == false
    case valueEqual(a: Expression, b: Expression)
    // 1 != false
    case valueNotEqual(a: Expression, b: Expression)

    // 1 > 2
    case greater(a: Expression, b: Expression)
    // 1 < 2
    case less(a: Expression, b: Expression)
    // 1 >= 2
    case greaterEqual(a: Expression, b: Expression)
    // 1 <= 2
    case lessEqual(a: Expression, b: Expression)
}

extension ArithmeticExpr: CustomStringConvertible {
    var description: String {
        switch self {
        case .i64_literal(let n):
            return "(integer-64 \(n))"
        case .f64_literal(let n):
            return "(float-64 \(n))"
        
        case .negate(n: let n):
            return "(negate \(n))"
        
        case .add(a: let a, b: let b):
            return "(\(a) + \(b))"
        case .sub(a: let a, b: let b):
            return "(\(a) - \(b))"
        case .mul(a: let a, b: let b):
            return "(\(a) * \(b))"
        case .div(a: let a, b: let b):
            return "(\(a) / \(b))"
        case .mod(a: let a, b: let b):
            return "(\(a) % \(b))"
        }
    }
}

extension BooleanExpr: CustomStringConvertible {
    var description: String {
        switch self {
        case .true_:
            return "(true)"
        case .false_:
            return "(false)"
        case .not(a: let a):
            return "(not \(a))"
        case .and(a: let a, b: let b):
            return "(\(a) and \(b))"
        case .or(a: let a, b: let b):
            return "(\(a) or \(b))"
        case .valueEqual(a: let a, b: let b):
            return "(\(a) val equal \(b))"
        case .valueNotEqual(a: let a, b: let b):
            return "(\(a) val not equal \(b))"
        case .greater(a: let a, b: let b):
            return "(\(a) > \(b))"
        case .less(a: let a, b: let b):
            return "(\(a)) < \(b)"
        case .greaterEqual(a: let a, b: let b):
            return "(\(a) >= \(b))"
        case .lessEqual(a: let a, b: let b):
            return "(\(a) <= \(b))"
}
    }
}