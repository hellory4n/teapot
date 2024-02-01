using csteapot.lexer;

namespace csteapot.parser;

static partial class Parser
{
    static int GetPrecedence(TokenType tokenType)
    {
        if (tokenType == TokenType.Plus || tokenType == TokenType.Minus) return 1;
        if (tokenType == TokenType.Star || tokenType == TokenType.Slash || tokenType == TokenType.Percent) return 2;
        return 0;
    }

    /// <summary>
    /// Looks at the next token
    /// </summary>
    static Token Next() => tokens[i + 1];

    /// <summary>
    /// Consumes the next token
    /// </summary>
    static Token Continue()
    {
        i++;
        return tokens[i + 1];
    }

    /// <summary>
    /// Consumes the next token if it's what we want
    /// </summary>
    static bool Expect(TokenType expected)
    {
        if (Next().Type == expected) {
            Continue();
            return true;
        }
        else {
            return false;
        }
    }
}