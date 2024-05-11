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

function get_keywords_reverse(): Map<TokenType, String> {
    return [
        _true => "true",
        _false => "false",
        _print => "print",

        _bool => "bool",
        _int => "int",
        _int32 => "int32",
        _int16 => "int16",
        _int8 => "int8",
        _uint => "uint",
        _uint32 => "uint32",
        _uint16 => "uint16",
        _uint8 => "uint8",
        _float => "float",
        _float32 => "float32"
    ];
}