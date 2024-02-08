namespace csteapot.lexer;

class Token
{
    public TokenType Type { get; set; }
    public object Literal { get; set; }

    public override string ToString()
    {
        return $"[{Type} = {Literal}]";
    }
}