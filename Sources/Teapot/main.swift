import Foundation

let lol = try String(contentsOfFile: "langtest/help.tpot")
let hbjknhjhn = scan(source: lol, path: "langtest/help.tpot")

switch hbjknhjhn {
case .out(let o):
    print(o)
    let houhynohnio = infix2postfix(tokens: o, path: "langtest/help.tpot", debugline: 1)
    switch houhynohnio {
    case .out(let o):
        print(o)
    case .errors(let e):
        for error in e {
            switch error.severity {
            case .critical:
                print("\u{001B}[31mError at \(error.path) line \(error.line): \(error.error)\u{001B}[0m\n")
            case .warning:
                print("\u{001B}[33mWarning about \(error.path) line \(error.line): \(error.error)u{001B}[0m\n")
            case .suggestion:
                print("Suggestion about \(error.path) line \(error.line): \(error.error)\n")
            }
        }
    }
    
case .errors(let e):
    for error in e {
        switch error.severity {
        case .critical:
            print("\u{001B}[31mError at \(error.path) line \(error.line): \(error.error)\u{001B}[0m\n")
        case .warning:
            print("\u{001B}[33mWarning about \(error.path) line \(error.line): \(error.error)u{001B}[0m\n")
        case .suggestion:
            print("Suggestion about \(error.path) line \(error.line): \(error.error)\n")
        }
    }
}