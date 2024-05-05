package teapot.parser;

import teapot.lexer.Token;

/**
 * based on how C defines precedence
 */
function get_precedence(token: Token): Int {
    switch (token.type) {
        case or: return 1;
        case and: return 2;
        case equal2 | equal3 | bang_equal | bang_equal3: return 3;
        case greater | greater_equal | less | less_equal: return 4;
        case plus | minus: return 5;
        case star | slash | percent: return 6;
        case bang | negate: return 7;
        default: return 0;
    }
}

function is_number(token: Token): Bool {
    switch (token.type) {
        case integer_literal | float_literal: return true;
        default: return false;
    }
}

function is_operator(token: Token): Bool {
    switch (token.type) {
        // the haxe parser can't fucking handle breaking this line into 2 lines
        case plus | minus | star | slash | percent | and | or | bang | bang_equal | bang_equal3 | equal2 | equal3 | greater | greater_equal | less | less_equal | negate:
            return true;
        default: return false;
    }
}

function is_left_paren(token: Token): Bool {
    switch (token.type) {
        case left_paren: return true;
        default: return false;
    }
}

function is_right_paren(token: Token): Bool {
    switch (token.type) {
        case right_paren: return true;
        default: return false;
    }
}

function is_operand(token: Token): Bool {
    switch (token.type) {
        case integer_literal, float_literal | _true, _false:
            return true;
        default: return false;
    }
}

function is_unary(token: Token): Bool {
    switch (token.type) {
        case negate | bang: return true;
        default: return false;
    }
}

function is_binary(token: Token): Bool {
    switch (token.type) {
        // the haxe parser can't fucking handle breaking this line into 2 lines
        case plus | minus | star | slash | percent | and | or | bang_equal | bang_equal3 | equal2 | equal3 | greater | greater_equal | less | less_equal | negate:
            return true;
        default: return false;
    }
}

function is_minus(token: Token): Bool {
    switch (token.type) {
        case minus: return true;
        default: return false;
    }
}

function is_semicolon(token: Token): Bool {
    switch (token.type) {
        case semicolon: return true;
        default: return false;
    }
}

function is_newline(token: Token): Bool {
    switch (token.type) {
        case newline: return true;
        default: return false;
    }
}