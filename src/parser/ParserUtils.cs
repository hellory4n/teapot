using csteapot.lexer;

namespace csteapot.parser;

static partial class Parser
{
    // i know, terrible name
    /// <summary>
    /// Parses a mathematical expression :))))))
    /// </summary>
    static IAstExpression ToRpnThenAst()
    {
        // first we need to convert it to postfix (reverse polish notation)
        // https://en.wikipedia.org/wiki/Shunting_yard_algorithm
        Stack<Token> operators = [];
        Stack<Token> output = [];

        while (i < tokens.Count) {
            Token t = tokens[i];
            if (t.Type == TokenType.End) break;

            switch (t.Type) {
                case TokenType.Integer:
                case TokenType.Float:
                    output.Push(t);
                    break;
                
                case TokenType.LParen:
                    operators.Push(t);
                    break;
                
                case TokenType.RParen:
                    while (operators.Count > 0 && operators.Peek().Type != TokenType.LParen) {
                        output.Push(operators.Pop());
                    }
                    operators.Pop(); // remove the (
                    break;
                
                case TokenType.Plus:
                case TokenType.Star:
                case TokenType.Slash:
                case TokenType.Percent:
                    while (operators.Count > 0 && GetPrecedence(operators.Peek().Type) >= GetPrecedence(t.Type)) {
                        output.Push(operators.Pop());
                    }
                    operators.Push(t);
                    break;
                
                // the minus operator needs special handling since it might also be an unary operator
                // for negating stuff
                case TokenType.Minus:
                    // 
                    if (i == 0 || tokens[i - 1].Type == TokenType.LParen || tokens[i - 1].Type == TokenType.Plus || tokens[i - 1].Type == TokenType.Minus) {
                        operators.Push(new Token { Type = TokenType.Negate });
                    } else {
                        // Binary minus
                        while (operators.Count > 0 && GetPrecedence(operators.Peek().Type) >= GetPrecedence(t.Type)) {
                            output.Push(operators.Pop());
                        }
                        operators.Push(t);
                    }
                    break;
            }

            //Console.WriteLine($"i: {i}, token: {t}, operators: [{string.Join(", ", operators)}], output: [{string.Join(", ", output)}]");

            i++;
        }

        //Console.WriteLine();

        while (operators.Count > 0) {
            // shit doesn't work
            try {
                output.Push(operators.Pop());
            }
            catch (InvalidOperationException) {
                //Console.WriteLine($"operators: [{string.Join(", ", operators)}], output: [{string.Join(", ", output)}]");
                break;
            }
            //Console.WriteLine($"operators: [{string.Join(", ", operators)}], output: [{string.Join(", ", output)}]");
        }

        // the first step generates results backwards
        Token[] newOutput = output.Reverse().ToArray();
        //Console.WriteLine($"new output: [{string.Join(", ", newOutput.ToList())}]");

        //Console.WriteLine();

        // now that we converted it to postfix, we need to convert it to ast
        Stack<IAstExpression> expression = [];
        foreach (var token in newOutput) {
            Console.WriteLine($"token: {token}, expression: [{string.Join(", ", expression)}]");
            switch (token.Type) {
                case TokenType.Integer:
                case TokenType.Float:
                    expression.Push(new AstLiteral { Value = token.Literal });
                    //Console.WriteLine($"token: {token}, expression: [{string.Join(", ", expression)}]");
                    break;
                
                case TokenType.Plus:
                case TokenType.Minus:
                case TokenType.Star:
                case TokenType.Slash:
                case TokenType.Percent:
                    //Console.WriteLine($"token: {token}, expression: [{string.Join(", ", expression)}]");
                    IAstExpression right = expression.Pop();
                    //Console.WriteLine($"token: {token}, expression: [{string.Join(", ", expression)}]");
                    IAstExpression left = expression.Pop();
                    //Console.WriteLine($"token: {token}, expression: [{string.Join(", ", expression)}]");

                    expression.Push(new AstBinaryExpression {
                        Left = left,
                        Right = right,
                        Operator = token.Type
                    });
                    break;

                case TokenType.Negate:
                    IAstExpression operand = expression.Pop();

                    expression.Push(new AstUnaryExpression {
                        Operand = operand,
                        Operator = TokenType.Negate
                    });
                    break;
            }
        }

        // finally return the expression :)))))))))
        return expression.Pop();
    }

    static int GetPrecedence(TokenType tokenType)
    {
        if (tokenType == TokenType.Plus || tokenType == TokenType.Minus) return 1;
        if (tokenType == TokenType.Star || tokenType == TokenType.Slash || tokenType == TokenType.Percent) return 2;
        if (tokenType == TokenType.Negate) return 3;
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