import Foundation

let lol = try String(contentsOfFile: "langtest/help.tpot")
let hbjknhjhn = scan(source: lol, path: "langtest/help.tpot")

switch hbjknhjhn {
case .out(let o):
    print(o)
    let houhynohnio = infix2postfix(tokens: o, debugline: 1)
    switch houhynohnio {
    case .out(let o):
        print(o)
        let jgjg = postfix2ast(expressions: o)
        print(jgjg)

    case .errors(let e):
        for error in e {
            switch error.severity {
            case .critical:
                print("\u{001B}[31mError at 'langtest/help.tpot' line \(error.line): \(error.error)\u{001B}[0m\n")
            case .warning:
                print("\u{001B}[33mWarning about 'langtest/help.tpot' line \(error.line): \(error.error)u{001B}[0m\n")
            case .suggestion:
                print("Suggestion about 'langtest/help.tpot' line \(error.line): \(error.error)\n")
            }
        }
    }
    
case .errors(let e):
    for error in e {
        switch error.severity {
        case .critical:
            print("\u{001B}[31mError at 'langtest/help.tpot' line \(error.line): \(error.error)\u{001B}[0m\n")
        case .warning:
            print("\u{001B}[33mWarning about 'langtest/help.tpot' line \(error.line): \(error.error)u{001B}[0m\n")
        case .suggestion:
            print("Suggestion about 'langtest/help.tpot' line \(error.line): \(error.error)\n")
        }
    }
}