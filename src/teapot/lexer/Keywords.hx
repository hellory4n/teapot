package teapot.lexer;

function get_keywords(): Map<String, TokenType> {
    return [
        "true" => _true,
        "false" => _false,
        "print" => _print,

        "bool" => _bool,
        "int" => _int,
        "int32" => _int32,
        "int16" => _int16,
        "int8" => _int8,
        "uint" => _uint,
        "uint32" => _uint32,
        "uint16" => _uint16,
        "uint8" => _uint8,
        "float" => _float,
        "float32" => _float32
    ];
}