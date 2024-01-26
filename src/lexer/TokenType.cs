namespace csteapot.lexer;

enum TokenType {
    // brackets and shit
    // (    )       [         ]         {       }
    LParen, RParen, LBracket, RBracket, LBrace, RBrace,

    // literals
    Integer, Float,

    // operators
    // +  -      *     /      %
    Plus, Minus, Star, Slash, Percent
}