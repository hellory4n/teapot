using csteapot.lexer;

namespace csteapot.parser;

static partial class Parser
{
    static IAstExpression ParseExpression()
    {
        IAstExpression left = ParseTerm();

        if (tokens[i].Type == TokenType.Plus || tokens[i].Type == TokenType.Minus) {
            TokenType op = tokens[i].Type;
            Continue();
            IAstExpression right = ParseTerm();

            return new AstBinaryExpression {
                Left = left,
                Operator = op,
                Right = right
            };
        }

        return left;
    }

    static IAstExpression ParseTerm()
    {
        IAstExpression left = ParseFactor();

        // if only there was a language that let me express this more concisely
        if (tokens[i].Type == TokenType.Star || tokens[i].Type == TokenType.Slash || tokens[i].Type == TokenType.Percent) {
            TokenType op = tokens[i].Type;
            Continue();
            IAstExpression right = ParseFactor();

            return new AstBinaryExpression {
                Left = left,
                Operator = op,
                Right = right
            };
        }

        return left;
    }

    /// <summary>
    /// You might be wondering what a "term" or "factor" is, and those are brilliant questions.
    /// </summary>
    static IAstExpression ParseFactor()
    {
        if (tokens[i].Type == TokenType.Integer || tokens[i].Type == TokenType.Float) {
            AstLiteral gjjdf = new() { Value = tokens[i].Literal };
            Continue();
            return gjjdf;
        }
        else if (tokens[i].Type == TokenType.LParen) {
            Continue(); // consume the (
            IAstExpression expression = ParseExpression();
            Continue(); // consume the )
            return expression;
        }
        else {
            Console.WriteLine("Fatal error: What the fuck?");
            Continue();
            return default;
        }
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