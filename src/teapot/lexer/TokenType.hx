package teapot.lexer;

enum TokenType {
    left_paren;  // (
    right_paren; // )
    equal1;      // =
    semicolon;   // ;
    newline;     // for reporting errors

    // identifiers-ish
    integer;
    float;
    identifier;

    // arithmetic operators
    plus;    // +
    minus;   // -
    star;    // *
    slash;   // /
    percent; // %

    bang;          // !
    or;            // ||
    and;           // &&
    greater;       // >
    greater_equal; // >=
    less;          // <
    less_equal;    // <=
    equal2;        // ==
    equal3;        // ===
    bang_equal;    // !=
    bang_equal3;   // !==

    // parser stuff
    negate;

    // keywords
    _true;
    _false;
    _print;

    // primitives (also keywords)
    _bool;
    _int;
    _int32;
    _int16;
    _int8;
    _uint;
    _uint32;
    _uint16;
    _uint8;
    _float;
    _float32;
}