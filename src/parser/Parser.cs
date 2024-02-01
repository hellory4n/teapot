using csteapot.lexer;

namespace csteapot.parser;

// this parser uses the shunting yard algorithm to parse expressions, more info at https://en.wikipedia.org/wiki/Shunting_yard_algorithm
static partial class Parser
{
    public static List<IAstNode> Nodes = [];
    static int i = 0;
    static List<Token> tokens = [];
    static Stack<Token> operators = [];
    static Stack<Token> output = [];

    public static List<IAstNode> Parse(List<Token> tokens_)
    {
        // we add this so we don't have to deal with checking the end of the thing all the time
        // c# doesn't have explicit reference stuff so we need .ToList() to copy the list
        tokens = tokens_.ToList();
        tokens.Add(new Token { Type = TokenType.End });
        tokens.Add(new Token { Type = TokenType.End });

        while (i < tokens.Count) {
            Token t = tokens[i];

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
                case TokenType.Minus:
                case TokenType.Star:
                case TokenType.Slash:
                case TokenType.Percent:
                    while (operators.Count > 0 && GetPrecedence(operators.Peek().Type) >= GetPrecedence(t.Type)) {
                        output.Push(operators.Pop());
                    }
                    operators.Push(t);
                    break;
            }

            i++;
        }

        Console.WriteLine("PARSING TIME\noperator stack");
        foreach (var item in operators) {
            Console.WriteLine(item);
        }
        Console.WriteLine("output stack");
        foreach (var item in output) {
            Console.WriteLine(item);
        }

        return Nodes;
    }
}