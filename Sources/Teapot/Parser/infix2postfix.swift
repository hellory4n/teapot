import Foundation

func infix2postfix(tokens: [Token], path: String, debugline: UInt) -> TeaResult<[Token]> {
    var output: [Token] = []
    var operators: Stack<Token> = Stack()
    var token_ = tokens

    while token_.count > 0 {
        let token = token_.removeFirst()

        if isNumber(token) {
            output.append(token)
        }

        if isOperator(token) {
            if operators.length() > 0 {
                while !isLparen(token) && getPrecedence(operators.peek()) > getPrecedence(token) {
                    let op = operators.pop()
                    output.append(op)
                }
            }
            operators.push(x: token)
        }

        if isLparen(token) {
            operators.push(x: token)
        }

        if isRparen(token) {
            while !isLparen(operators.peek()) {
                // if the stack runs out without finding a left parenthesis, then there are mismatched parenthesis
                if operators.length() == 0 {
                    return .errors(e: [
                        TeaError(error: "Mismatched parenthesis 1", severity: .critical, path: path, line: debugline)
                    ])
                }
                output.append(operators.pop())
            }

            // discard left parenthesis
            _ = operators.pop()
        }
    }

    while operators.length() > 0 {
        // if the operator on the top of the stack is a parenthesis, then there are mismatched parentheses
        if isLparen(operators.peek()) || isRparen(operators.peek()) {
            return .errors(e: [
                TeaError(error: "Mismatched parenthesis 2", severity: .critical, path: path, line: debugline)
            ])
        }

        print(operators)
        output.append(operators.pop())
    }

    return .out(o: output)
}