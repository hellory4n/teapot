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
                case TokenType.True:
                case TokenType.False:
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
                case TokenType.And:
                case TokenType.Or:
                case TokenType.Greater:
                case TokenType.GreaterEqual:
                case TokenType.Less:
                case TokenType.LessEqual:
                case TokenType.EqualEqual:
                case TokenType.BangEqual:
                    while (operators.Count > 0 && GetPrecedence(operators.Peek().Type) >= GetPrecedence(t.Type)) {
                        output.Push(operators.Pop());
                    }
                    operators.Push(t);
                    break;
                
                // the minus operator needs special handling since it might also be an unary operator
                // for negating stuff
                case TokenType.Minus:
                    // unary -
                    if (i == 0 || tokens[i - 1].Type == TokenType.LParen || tokens[i - 1].Type == TokenType.Plus || tokens[i - 1].Type == TokenType.Minus) {
                        operators.Push(new Token { Type = TokenType.Negate });
                    }
                    // binary -
                    else {
                        while (operators.Count > 0 && GetPrecedence(operators.Peek().Type) >= GetPrecedence(t.Type)) {
                            output.Push(operators.Pop());
                        }
                        operators.Push(t);
                    }
                    break;
                
                // the not operator also needs special handling
                case TokenType.Bang:
                    operators.Push(new Token { Type = TokenType.Bang });
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
            //Console.WriteLine($"token: {token}, expression: [{string.Join(", ", expression)}]");
            switch (token.Type) {
                case TokenType.Integer:
                case TokenType.Float:
                    expression.Push(new AstLiteral { Value = token.Literal });
                    //Console.WriteLine($"token: {token}, expression: [{string.Join(", ", expression)}]");
                    break;
                
                case TokenType.True:
                    expression.Push(new AstLiteral { Value = true });
                    break;
                
                case TokenType.False:
                    expression.Push(new AstLiteral { Value = false });
                    break;
                
                case TokenType.Plus:
                case TokenType.Minus:
                case TokenType.Star:
                case TokenType.Slash:
                case TokenType.Percent:
                case TokenType.And:
                case TokenType.Or:
                case TokenType.Greater:
                case TokenType.GreaterEqual:
                case TokenType.Less:
                case TokenType.LessEqual:
                case TokenType.EqualEqual:
                case TokenType.BangEqual:
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
                case TokenType.Bang:
                    IAstExpression operand = expression.Pop();

                    expression.Push(new AstUnaryExpression {
                        Operand = operand,
                        Operator = token.Type
                    });
                    break;
            }
        }

        // finally return the expression :)))))))))
        return expression.Pop();
    }

    static int GetPrecedence(TokenType t)
    {
        if (t == TokenType.Or) return 1;
        if (t == TokenType.Plus || t == TokenType.Minus || t == TokenType.And) return 2;
        if (t == TokenType.Star || t == TokenType.Slash || t == TokenType.Percent || t == TokenType.Less ||
        t == TokenType.Greater || t == TokenType.LessEqual || t == TokenType.GreaterEqual ||
        t == TokenType.EqualEqual || t == TokenType.BangEqual) return 3;
        if (t == TokenType.Negate || t == TokenType.Bang) return 4;
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