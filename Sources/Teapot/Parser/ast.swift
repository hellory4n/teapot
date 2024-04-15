import Foundation

protocol Ast {}
protocol Expression: Ast {}

indirect enum ArithmeticExpr: Expression {
    // all the literals
    case i64_literal(n: Int64)
    case f64_literal(n: Float64)

    // -9
    case negate(n: ArithmeticExpr)

    // 9 + 10
    case add(a: ArithmeticExpr, b: ArithmeticExpr)
    // 9 - 10
    case sub(a: ArithmeticExpr, b: ArithmeticExpr)
    // 9 * 10
    case mul(a: ArithmeticExpr, b: ArithmeticExpr)
    // 9 / 10
    case div(a: ArithmeticExpr, b: ArithmeticExpr)
    // 9 % 10
    case mod(a: ArithmeticExpr, b: ArithmeticExpr)
}

extension ArithmeticExpr: CustomStringConvertible {
    var description: String {
        switch self {
        case .i64_literal(let n):
            return "(integer 64 \(n))"
        case .f64_literal(let n):
            return "(float 64 \(n))"
        
        case .negate(let n):
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