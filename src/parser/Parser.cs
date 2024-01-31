using csteapot.lexer;

namespace csteapot.parser;

static partial class Parser
{
    public static List<IAstNode> Nodes = [];
    static int i = 0;
    static List<Token> tokens = [];

    public static List<IAstNode> Parse(List<Token> tokens_)
    {
        // we add this so we don't have to deal with checking the end of the thing all the time
        // we need .ToList() to copy the list
        tokens = tokens_.ToList();
        tokens.Add(new Token { Type = TokenType.End });
        tokens.Add(new Token { Type = TokenType.End });

        while (i < tokens.Count) {
            Token t = tokens[i];

            switch (t.Type) {
                case TokenType.Integer:
                case TokenType.Float:
                    ParseExpression();
                    break;
            }

            i++;
        }

        return Nodes;
    }
}