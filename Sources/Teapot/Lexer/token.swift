import Foundation

enum Token {
    case lparen // (
    case rparen // )
    case equal1 // =

    // literals-ish
    case integer(num: Int64)
    case float(num: Double)
    case identifier(id: String)

    // arithmetic operators
    case plus    // +
    case minus   // -
    case star    // *
    case slash   // /
    case percent // %

    // boolean operators
    case bang      // !
    case or        // ||, or
    case and       // &&, and
    case greater   // >
    case less      // <
    case greatereq // >=
    case lesseq    // <=
    case equal2    // ==
    case bangeq    // !=

    // used by the parser
    case negate

    // keywords
    // we start them with k so swift doesn't get mad
    case ktrue
    case kfalse

    case end
}

extension Token: CustomStringConvertible {
    var description: String {
        switch self {
        case .integer(let num):
            return "[integer = \(num)]"
        case .float(let num):
            return "[float = \(num)]"
        case .identifier(let id):
            return "[identifier = \(id)]"
        
        // there doesn't seem to be a better way to do this :(
        // i'm probably just stupid
        case .lparen: return "[  (  ]"
        case .rparen: return "[  )  ]"
        case .and: return "[  &&  ]"
        case .bang: return "[  !  ]"
        case .bangeq: return "[  !=  ]"
        case .end: return "[end]"
        case .equal1: return "[  =  ]"
        case .equal2: return "[  ==  ]"
        case .greater: return "[  >  ]"
        case .greatereq: return "[  >=  ]"
        case .kfalse: return "[false]"
        case .ktrue: return "[true]"
        case .less: return "[  <  ]"
        case .lesseq: return "[  <=  ]"
        case .minus: return "[  -  ]"
        case .negate: return "[negate]"
        case .or: return "[  ||  ]"
        case .percent: return "[  %  ]"
        case .plus: return "[  +  ]"
        case .slash: return "[  /  ]"
        case .star: return "[  *  ]"
        }
    }
}