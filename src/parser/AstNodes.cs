namespace csteapot.parser;

interface IAstNode {}
interface IAstExpression : IAstNode {}
interface IAstStatement : IAstNode {}

// expressions
class AstLiteral : IAstExpression {
    public object Value { get; set; }
}

class AstBinaryExpression : IAstExpression {
    public IAstExpression Left { get; set; }
    public IAstExpression Right { get; set; }
    public string Operator { get; set; }
}

