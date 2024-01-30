using System.Globalization;

namespace csteapot.lexer;

static partial class Scanner
{
    static int i = 0;
    static string source = "";
    static List<Token> tokens = [];

    public static List<Token> Scan(string text)
    {
        // we add \0 so we don't have to deal with checking the end of the thing all the time
        source = text + "\0\0\0";

        while (i < source.Length) {
            char c = source[i];

            switch (c) {
                // pretty easy to parse those
                case '+': Add(TokenType.Plus); break;
                case '-': Add(TokenType.Minus); break;
                case '*': Add(TokenType.Star); break;
                case '/': Add(TokenType.Slash); break;
                case '%': Add(TokenType.Percent); break;
                case '(': Add(TokenType.LParen); break;
                case ')': Add(TokenType.RParen); break;

                default:
                    // is it a number??????????
                    if (IsDigit(c)) {
                        ProcessNumber(c);
                    }
                    break;
            }

            i++;
        }

        return tokens;
    }
}