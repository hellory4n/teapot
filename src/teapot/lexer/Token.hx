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

    // it's not in snake_case so it's implicitly converted & stuff :)
    public function toString(): String {
        return '($type = $value, $start - $end)';
    }
}