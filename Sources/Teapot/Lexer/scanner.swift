import Foundation

var i = 0

func scan(source: String, path: String) -> TeaResult<[Token]> {
    var out: [Token] = []
    var errors: [TeaError] = []
    var debugline: UInt = 1

    // so we don't have to deal with checking for the end of the file
    let source2 = source + "\0"
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

        // dumb operators (&& and ||)
        case "&":
            if s[i + 1] == "&" {
                out.append(Token.and)
            } else {
                errors.append(TeaError.init(
                    error: "Unexpected '&', do you mean &&?", severity: Severity.critical, path: path, line: debugline)
                )
            }
        
        case "|":
            if s[i + 1] == "|" {
                out.append(Token.and)
            } else {
                errors.append(TeaError.init(
                    error: "Unexpected '|', do you mean ||?", severity: Severity.critical, path: path, line: debugline)
                )
            }
        
        // the one and only =
        case "=":
            if s[i + 1] == "=" {
                out.append(Token.equal2)
            } else {
                out.append(Token.equal1)
            }
        
        // stupid operators that sometimes end with =
        case "!":
            if s[i + 1] == "=" {
                out.append(Token.bangeq)
            } else {
                out.append(Token.bang)
            }
        
        case "<":
            if s[i + 1] == "=" {
                out.append(Token.lesseq)
            } else {
                out.append(Token.less)
            }
        
        case ">":
            if s[i + 1] == ">" {
                out.append(Token.greatereq)
            } else {
                out.append(Token.greater)
            }
        
        // whitespace :)
        case " ": break
        case "\t": break
        case "\r": break
        case "\n": debugline += 1
        
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
                        errors.append(TeaError.init(
                           error: "Invalid float literal", severity: Severity.critical, path: path, line: debugline)
                        )
                    } else {
                        out.append(Token.float(num: sgjurjrgsj!))
                    }
                } else {
                    let jgjsigsdjg = Int64(result)
                    if jgjsigsdjg == nil {
                        errors.append(TeaError.init(
                           error: "Invalid int literal", severity: Severity.critical, path: path, line: debugline)
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
                    if s[i + 1] != "_" {
                        id += String(s[i + 1])
                    }
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