package teapot.lexer;

/**
 * we have our own implementation since only the ascii numbers are supposed to be accepted
 */
inline function is_digit(c: Char): Bool {
    return c >= char("0") && c <= char("9");
}

inline function is_letter(c: Char): Bool {
    // if you look at an ascii table you can see that there's some characters
    // between uppercase and lowercase letters
    return (c >= char("A") && c <= char("Z")) || (c >= char("a") && c <= char("z"));
}

inline function is_valid_id(c: Char): Bool {
    return is_digit(c) || is_letter(c) || c == char("_");
}

/**
 * there's no character type so i have to do (char.charCodeAt(0) ?? 0) everytime
 */
typedef Char = Int;

inline function char(str: String): Char {
    return str.charCodeAt(0) ?? 0;
}