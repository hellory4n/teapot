using csteapot.lexer;

namespace csteapot.parser;

static class ParserLists
{
    public static TokenType[] NumberOperators = [
        TokenType.Plus,
        TokenType.Minus,
        TokenType.Slash,
        TokenType.Star,
        TokenType.Percent
    ];
}