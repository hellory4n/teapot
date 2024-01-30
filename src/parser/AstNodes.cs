using csteapot.lexer;

namespace csteapot.parser;

interface IAstNode {}
interface IAstExpression : IAstNode
{
    public string GetDebugStuff();
}

interface IAstStatement : IAstNode
{
    public string GetDebugStuff();
}

// expressions
class AstLiteral : IAstExpression
{
    public object Value { get; set; }

    public string GetDebugStuff()
    {
        return $"Literal ({Value})";
    }
}

class AstBinaryExpression : IAstExpression
{
    public IAstExpression Left { get; set; }
    public IAstExpression Right { get; set; }
    public TokenType Operator { get; set; }

    public string GetDebugStuff()
    {
        return $"Binary expression ({Left.GetDebugStuff()}, {Operator:g}, {Right.GetDebugStuff()})";
    }
}

