import Foundation

func getKeywords() -> [String: Token] {
    return [
        "true": Token.ktrue,
        "false": Token.kfalse,
        "bool": Token.kbool,
        "int": Token.kint,
        "int32": Token.kint32,
        "int16": Token.kint16,
        "int8": Token.kint8,
        "uint": Token.kuint,
        "uint32": Token.kuint32,
        "uint16": Token.kuint16,
        "uint8": Token.kuint8,
        "float": Token.kfloat,
        "float32": Token.kfloat32
    ]
}