using System.Globalization;
using csteapot.lexer;

namespace csteapot.parser;

interface IAstNode {}
interface IAstExpression : IAstNode
{
    string ToC();
}
interface IAstStatement : IAstNode {}

// expressions
class AstLiteral : IAstExpression
{
    public object Value { get; set; }

    public string ToC()
    {
        if (Value is double b) {
            return b.ToString(CultureInfo.InvariantCulture);
        }
        else if (Value is int v) {
            return $"(double){v.ToString(CultureInfo.InvariantCulture)}";
        }
        else if (Value is bool ean) {
            return ean ? "1" : "0";
        }
        else {
            return Value.ToString();
        }
    }

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

    public string ToC()
    {
        string op = Operator switch {
            TokenType.Plus => "+",
            TokenType.Minus => "-",
            TokenType.Star => "*",
            TokenType.Slash => "/",
            TokenType.Percent => "%",
            TokenType.And => "&&",
            TokenType.Or => "||",
            TokenType.Less => "<",
            TokenType.Greater => ">",
            TokenType.LessEqual => "<=",
            TokenType.GreaterEqual => ">=",
            TokenType.EqualEqual => "==",
            TokenType.BangEqual => "!=",
            _ => "",
        };
        return $"({Left.ToC()} {op} {Right.ToC()})";
    }

    public override string ToString()
    {
        return $"Binary expression ({Left}, {Operator:g}, {Right})";
    }
}

class AstUnaryExpression : IAstExpression
{
    public IAstExpression Operand { get; set; }
    public TokenType Operator { get; set; }

    public string ToC()
    {
        string op = Operator switch {
            TokenType.Negate => "-",
            TokenType.Bang => "!",
            _ => "",
        };
        return $"({op}{Operand.ToC()})";
    }

    public override string ToString()
    {
        return $"Unary expression ({Operator:g}, {Operand})";
    }
}