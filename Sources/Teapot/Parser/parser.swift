import Foundation

func parse(tokens: [Token], path: String) -> TeaResult<[Statement]> {
    var newTokens = tokens
    var currentStatement: [Token] = []
    var result: [Statement] = []
    var errors: [TeaError] = []
    var debugline: UInt = 1

    while newTokens.count > 0 {
        let token = newTokens.removeFirst()
        print("processing \(token)")

        if isNewline(token) { debugline += 1 }

        // build whatever statement is here, handle it in handleStatement
        if isSemicolon(token) {
            print("statement time")
            let s = handleStatement(stmt: currentStatement, debugline: debugline)
            switch s {
            case .out(o: let o):
                print("statement is success")
                result.append(o)
            case .errors(e: let e):
                errors.append(contentsOf: e)
                print("shit (parser)")
            }

            currentStatement.removeAll()
        } else {
            currentStatement.append(token)
        }
    }
    
    if errors.count == 0 {
        return .out(o: result)
    } else {
        return .errors(e: errors)
    }
}