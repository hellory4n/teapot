using csteapot.lexer;

namespace csteapot.parser;

interface IAstNode {}
interface IAstExpression : IAstNode {}
interface IAstStatement : IAstNode {}

// expressions
class AstLiteral : IAstExpression
{
    public object Value { get; set; }

    public override string ToString()
    {
        return $"Literal ({Value})";
    }
}

class AstBinaryExpression : IAstExpression
{
    public IAstExpression Left { get; set; }
    public IAstExpression Right { get; set; }
    public TokenType Operator { get; set; }

    public override string ToString()
    {
        return $"Binary expression ({Left}, {Operator:g}, {Right})";
    }
}