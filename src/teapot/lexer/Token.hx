package teapot.lexer;

class Token {
    public var type: TokenType;
    public var value: Any;
    public var start: Int;
    public var end: Int;

    public function new(type: TokenType, value: Any, start: Int, end: Int) {
        this.type = type;
        this.value = value;
        this.start = start;
        this.end = end;
    }
}