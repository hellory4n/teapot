import Foundation

func handleStatement(stmt: [Token], debugline: UInt) -> TeaResult<Statement> {
    // don't want to add that case on every switch statement under the sun
    var newStmt = stmt
    newStmt.removeAll(where: { $0 == Token.newline })
    
    print("statement is \(newStmt)")
    var errors: [TeaError] = []
    var out: Statement?

    switch newStmt[0] {
    // variables with primitive types
    case .kbool, .kint, .kint32, .kint16, .kint8, .kuint, .kuint32, .kuint16, .kuint8, .kfloat, .kfloat32:
        switch newStmt[1] {
        case .identifier(id: let id):
            // process the expression
            var exprTokens = newStmt
            exprTokens.removeFirst(3)
            let postfixExpr = infix2postfix(tokens: exprTokens, debugline: debugline)
            
            // more stupid switch cases ;)
            switch postfixExpr {
            case .out(o: let o):
                let expr = postfix2ast(expressions: o)

                // convert the keyword to a string in a confusing way
                let keywords = getKeywords().reduce(into: [Token: String]()) { (result, entry) in
                    result[entry.value] = entry.key
                }
                let keywordstr: String = keywords[newStmt[0]]!

                out = FunctionStatement.varDefine(type: keywordstr, name: id, expr: expr)
                print(out!)

            case .errors(e: let e):
                errors.append(contentsOf: e)
            }

        default: errors.append(TeaError(error: "Unexpected token: \(newStmt[1])", severity: Severity.critical, line: debugline))
        }

    default: errors.append(TeaError(error: "Invalid statement", severity: Severity.critical, line: debugline))
    }

    if errors.count == 0 {
        return .out(o: out!)
    } else {
        return .errors(e: errors)
    }
}