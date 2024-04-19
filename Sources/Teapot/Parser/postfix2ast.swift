import Foundation

func postfix2ast(expressions: [Token]) -> Expression {
    var stack = Stack<Expression>()
    print(expressions)

    for token in expressions {
        if isOperand(token) {
            var node: Expression = PlaceholderExpr()
            switch token {
                case .integer(let num): node = ArithmeticExpr.i64_literal(n: num)
                case .float(let num): node = ArithmeticExpr.f64_literal(n: num)
                case .ktrue: node = BooleanExpr.true_
                case .kfalse: node = BooleanExpr.false_
                default: break
            }

            stack.push(x: node)
        }

        if isOperator(token) && isBinary(token) {
            let right = stack.pop()
            let left = stack.pop()

            var node: Expression = PlaceholderExpr()
            switch token {
                case .plus: node = ArithmeticExpr.add(a: left, b: right)
                case .minus: node = ArithmeticExpr.sub(a: left, b: right)
                case .slash: node = ArithmeticExpr.div(a: left, b: right)
                case .star: node = ArithmeticExpr.mul(a: left, b: right)
                case .percent: node = ArithmeticExpr.mod(a: left, b: right)
                case .and: node = BooleanExpr.and(a: left, b: right)
                case .or: node = BooleanExpr.or(a: left, b: right)
                case .bangeq: node = BooleanExpr.valueNotEqual(a: left, b: right)
                case .equal2: node = BooleanExpr.valueEqual(a: left, b: right)
                case .greater: node = BooleanExpr.greater(a: left, b: right)
                case .greatereq: node = BooleanExpr.greaterEqual(a: left, b: right)
                case .less: node = BooleanExpr.less(a: left, b: right)
                case .lesseq: node = BooleanExpr.lessEqual(a: left, b: right)
                default: break
            }
            stack.push(x: node)
        }

        if isOperator(token) && isUnary(token) {
            let val = stack.pop()

            var node: Expression = PlaceholderExpr()
            switch token {
                case .negate: node = ArithmeticExpr.negate(n: val)
                case .bang: node = BooleanExpr.not(a: val)
                default: break
            }
            stack.push(x: node)
        }
    }

    return stack.pop()
}