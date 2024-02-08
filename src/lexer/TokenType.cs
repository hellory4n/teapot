namespace csteapot.lexer;

enum TokenType
{
    // brackets and shit
    // (    )       [         ]         {       }
    LParen, RParen, LBracket, RBracket, LBrace, RBrace,

    // literals & shit
    Integer, Float, Identifier,

    // operators
    // +  -      *     /      %
    Plus, Minus, Star, Slash, Percent,

    // !  ||  &&
    Bang, Or, And,

    //    >  <     >=            <=         =      ==          !=
    Greater, Less, GreaterEqual, LessEqual, Equal, EqualEqual, BangEqual,

    // exclusively used by the parser
    Negate,

    // keywords
    True, False,

    End
}