import Foundation

func parse(tokens: [Token], path: String) -> [Statement] {
    var newTokens = tokens
    var currentStatement: [Token] = []
    var result: [Statement] = []
    var debugline: UInt = 1

    while newTokens.count > 0 {
        let token = newTokens.removeFirst()

        if isNewline(token) { debugline += 1 }

        // build whatever statement is here, handle it in handleStatement
        if isSemicolon(token) {
            let s = handleStatement(stmt: currentStatement, debugline: debugline)
            result.append(s)
        }
        currentStatement.append(token)
    }
    
    return result
}