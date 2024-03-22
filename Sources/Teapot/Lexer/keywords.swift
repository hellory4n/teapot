import Foundation

func getKeywords() -> [String: Token] {
    return [
        "true": Token.ktrue,
        "false": Token.kfalse,
        "and": Token.and,
        "or": Token.or,
        "not": Token.bang
    ]
}