import Foundation

func scan(source: String, path: String) -> TeaResult<[Token]> {
    var out: [Token] = []
    var errors: [TeaError] = []
    var debugline: UInt = 1
    var i = 0

    // so we don't have to deal with checking for the end of the file
    let source2 = source + "\0\0\0"
    // i used this variable a lot so i'm not gonna give a cute name like
    // `sourceCodeConvertedToAnArrayOfCharacters`, fuck you
    let s = Array(source2)

    // C-style loops are gone lmao
    while i < source.count {
        let c = s[i]

        switch c {
        // pretty simple
        case "+": out.append(Token.plus)
        case "-": out.append(Token.minus)
        case "*": out.append(Token.star)
        case "/": out.append(Token.slash)
        case "%": out.append(Token.percent)
        case "(": out.append(Token.lparen)
        case ")": out.append(Token.rparen)
        case ";": out.append(Token.semicolon)

        // dumb operators (&& and ||)
        case "&":
            if s[i + 1] == "&" {
                out.append(Token.and)
                i += 1
            } else {
                errors.append(TeaError(
                    error: "Unexpected '&', do you mean &&?", severity: Severity.critical, line: debugline)
                )
            }
        
        case "|":
            if s[i + 1] == "|" {
                out.append(Token.or)
                i += 1
            } else {
                errors.append(TeaError(
                    error: "Unexpected '|', do you mean ||?", severity: Severity.critical, line: debugline)
                )
            }
        
        // the one and only =
        case "=":
            if s[i + 1] == "=" {
                out.append(Token.equal2)
                i += 1
            } else {
                out.append(Token.equal1)
            }
        
        // stupid operators that sometimes end with =
        case "!":
            if s[i + 1] == "=" {
                out.append(Token.bangeq)
                i += 1
            } else {
                out.append(Token.bang)
            }
        
        case "<":
            if s[i + 1] == "=" {
                out.append(Token.lesseq)
                i += 1
            } else {
                out.append(Token.less)
            }
        
        case ">":
            if s[i + 1] == "=" {
                out.append(Token.greatereq)
                i += 1
            } else {
                out.append(Token.greater)
            }
        
        // whitespace :)
        case " ": break
        case "\t": break
        case "\r": break
        case "\n":
            out.append(Token.newline)
            debugline += 1
        
        default:
            // is it a number??????????
            if isDigit(c) {
                var isfloat = false
                var result = String(c)

                while isDigit(s[i + 1]) {
                    i += 1
                    result += String(s[i])
                }

                // check if it's a float :)
                if s[i + 1] == "." {
                    isfloat = true
                    i += 1
                    result += "."

                    // and do that bullshit again
                    while isDigit(s[i + 1]) {
                        i += 1
                        result += String(s[i])
                    }
                }

                // parse the bullshit
                if isfloat {
                    let sgjurjrgsj = Double(result)
                    if sgjurjrgsj == nil {
                        errors.append(TeaError(
                           error: "Invalid float literal", severity: Severity.critical, line: debugline)
                        )
                    } else {
                        out.append(Token.float(num: sgjurjrgsj!))
                    }
                } else {
                    let jgjsigsdjg = Int64(result)
                    if jgjsigsdjg == nil {
                        errors.append(TeaError(
                           error: "Invalid int literal", severity: Severity.critical, line: debugline)
                        )
                    } else {
                        out.append(Token.integer(num: jgjsigsdjg!))
                    }
                }
            }

            // keywords and identifiers
            if isLetter(c) || c == "_" {
                var id = String(c)

                while isValidId(s[i + 1]) {
                    id += String(s[i + 1])
                    i += 1
                }

                // is it a keyword or an identifier?
                if getKeywords().keys.contains(id) {
                    out.append(getKeywords()[id]!)
                } else {
                    out.append(Token.identifier(id: id))
                }
            }
        }

        i += 1
    }

    if errors.count > 0 {
        return TeaResult.errors(e: errors)
    } else {
        return TeaResult.out(o: out)
    }
}