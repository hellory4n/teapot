import Foundation

let lol = try String(contentsOfFile: "langtest/help.tpot")
let hbjknhjhn = scan(source: lol, path: "langtest/help.tpot")

switch hbjknhjhn {
case .out(let o):
    print(o)
    let houhynohnio = parse(tokens: o, path: "langtest/help.tpot")
    switch houhynohnio {
    case .out(let o):
        print("yippee")
        print(o)

    case .errors(let e):
        print("uh oh")
        for error in e {
            switch error.severity {
            case .critical:
                print("Error at 'langtest/help.tpot' line \(error.line): \(error.error)\n")
            case .warning:
                print("Warning about 'langtest/help.tpot' line \(error.line): \(error.error)\n")
            case .suggestion:
                print("Suggestion about 'langtest/help.tpot' line \(error.line): \(error.error)\n")
            }
        }
    }
    
case .errors(let e):
    for error in e {
        switch error.severity {
        case .critical:
            print("Error at 'langtest/help.tpot' line \(error.line): \(error.error)\n")
        case .warning:
            print("Warning about 'langtest/help.tpot' line \(error.line): \(error.error)\n")
        case .suggestion:
            print("Suggestion about 'langtest/help.tpot' line \(error.line): \(error.error)\n")
        }
    }
}