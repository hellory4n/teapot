import Foundation

func postfix2ast(expressions: [Token]) -> Expression {
    /*var stack = Stack<Expression>()

    for token in expressions {
        if isOperand(token) {
            if isNumber(token) {
                let node = ArithmeticExpr.literal(n: token.self.description.addingPercentEncoding(withAllowedCharacters: .alphanumerics))
            }
        }
    }*/
    return ArithmeticExpr.i64_literal(n: 6)
}