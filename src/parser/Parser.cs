using csteapot.lexer;

namespace csteapot.parser;

static class Parser
{
    public static List<IAstNode> Parse(List<Token> tokens)
    {
        List<IAstNode> nodes = [];
        // so it doesn't crash when looking ahead
        // change the limit if we ever need more looking ahead than 3 tokens
        for (int i = 0; i < 3; i++) {
            tokens.Add(new Token {
                Type = TokenType.End
            });
        }

        // similarly to the lexer, we use a normal for loop since it allows changing the index
        // and looking at the next character
        for (int i = 0; i < tokens.Count; i++) {
            Token t = tokens[i];
            
            switch (t.Type) {
                case TokenType.Float:
                case TokenType.Integer:
                    // check the next 2 tokens for binary expressions
                    if (ParserLists.NumberOperators.Contains(tokens[i + 1].Type)) {
                        i++;

                        if (tokens[i + 1].Type == TokenType.Integer || tokens[i + 1].Type == TokenType.Float) {
                            nodes.Add(new AstBinaryExpression {
                                Left = new AstLiteral { Value = t.Literal },
                                Operator = tokens[i].Type,
                                Right = new AstLiteral { Value = tokens[i + 1].Literal}
                            });
                        }
                    }
                    break;
            }
        }

        return nodes;
    }
}