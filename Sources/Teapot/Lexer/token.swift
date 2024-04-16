import Foundation

enum Token {
    case lparen    // (
    case rparen    // )
    case equal1    // =
    case semicolon // ;
    case newline // purely for debugging (for users)

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
    case equal3    // ===
    case bangeq    // !=
    case bangeq3   // !==

    // used by the parser
    case negate

    // keywords
    // we start them with k so swift doesn't get mad
    case ktrue
    case kfalse

    // primitives
    case kbool
    case kint
    case kint32
    case kint16
    case kint8
    case kuint
    case kuint32
    case kuint16
    case kuint8
    case kfloat
    case kfloat32

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
        case .semicolon: return "[  ;  ]"
        case .equal3: return "[  === ]"
        case .bangeq3: return "[  !== ]"
        case .kbool: return "[bool type]"
        case .kint: return "[int type]"
        case .kint32: return "[int32 type]"
        case .kint16: return "[int16 type]"
        case .kint8: return "[int8 type]"
        case .kuint: return "[uint type]"
        case .kuint32: return "[uint32 type]"
        case .kuint16: return "[uint16 type]"
        case .kuint8: return "[uint8 type]"
        case .kfloat: return "[float type]"
        case .kfloat32: return "[float32 type]"
}
    }
}