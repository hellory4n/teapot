import Foundation

func handleStatement(stmt: [Token], debugline: UInt) -> TeaResult<Statement> {
    var errors: [TeaError] = []

    switch stmt[0] {
    // variables with primitive types
    case .kbool, .kint, .kint32, .kint16, .kint8, .kuint, .kuint32, .kuint16, .kuint8, .kfloat, .kfloat32:
        switch stmt[1] {
        case .identifier(id: let id):
            // process the expression
            var exprTokens = stmt
            exprTokens.removeFirst(3)
            let postfixExpr = infix2postfix(tokens: exprTokens, debugline: debugline)
            
            // more stupid switch cases ;)
            switch postfixExpr {
            case .out(o: let o):
                let expr = postfix2ast(expressions: o)

                // convert the keyword to a string
                let keywordstr = getKeywords()[stmt[0]]

                return .out(o: BasicStatement.varDefine(type: keywordstr, name: id, expr: expr))

            case .errors(e: let e):
                errors.append(contentsOf: e)
            }
        default: break
        }
    
    default: break
    }
}