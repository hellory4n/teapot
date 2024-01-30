namespace csteapot.lexer;

static partial class Scanner
{
    /// <summary>
    /// Looks at the next character
    /// </summary>
    static char Next() => source[i + 1];

    /// <summary>
    /// Consumes the next character
    /// </summary>
    static char Continue()
    {
        i++;
        return source[i + 1];
    }

    /// <summary>
    /// Consumes the next character if it's what we want
    /// </summary>
    static bool Expect(char expected)
    {
        if (Next() == expected) {
            Continue();
            return true;
        }
        else {
            return false;
        }
    }

    public static void Add(TokenType type, object literal = null)
    {
        tokens.Add(new Token {
            Type = type,
            Literal = literal
        });
        Continue();
    }

    public static bool IsDigit(char c) => c == '0' || c == '1' || c == '2' || c == '3' || c == '4' ||
                                          c == '5' || c == '6' || c == '7' || c == '8' || c == '9';
}