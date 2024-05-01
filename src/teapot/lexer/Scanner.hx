package teapot.lexer;

import teapot.lexer.ScannerUtils;
import teapot.tools.Result;

var i = 0;

function scan(src: String, path: String): Result<Array<Token>> {
    var output: Array<Token> = [];
    var errors: Array<Error> = [];

    // so we don't have to deal with checking the end of the string
    src += "\u0000\u0000\u0000";

    // if i had a dollar for every time i used a language that deleted
    // C-style for loops for no reason, i would have $3
    i = 0;
    while (i < src.length) {
        var c = src.charAt(i);
        var c2 = src.charAt(i + 1);

        switch (c) {
            // simple stuff
            case "+": output.push(new Token(TokenType.plus,        null, i, i));
            case "-": output.push(new Token(TokenType.minus,       null, i, i));
            case "*": output.push(new Token(TokenType.star,        null, i, i));
            case "/": output.push(new Token(TokenType.slash,       null, i, i));
            case "%": output.push(new Token(TokenType.percent,     null, i, i));
            case "(": output.push(new Token(TokenType.left_paren,  null, i, i));
            case ")": output.push(new Token(TokenType.right_paren, null, i, i));
            case ";": output.push(new Token(TokenType.semicolon,   null, i, i));

            // && and ||
            case "&":
                if (c2 == "&") {
                    output.push(new Token(TokenType.and, null, i, i + 1));
                    i++;
                }
                else {
                    errors.push(new Error("Unexpected '&', do you mean &&?", 2, i, i + 1));
                }
            
            case "|":
                if (c2 == "|") {
                    output.push(new Token(TokenType.or, null, i, i + 1));
                    i++;
                }
                else {
                    errors.push(new Error("Unexpected '|', do you mean ||?", 2, i, i + 1));
                }
            
            // operators that sometimes end with =
            case "=":
                if (c2 == "=") {
                    output.push(new Token(TokenType.equal2, null, i, i + 1));
                }
                else {
                    output.push(new Token(TokenType.equal1, null, i, i));
                }
            
            case "!":
                if (c2 == "=") {
                    output.push(new Token(TokenType.bang_equal, null, i, i + 1));
                }
                else {
                    output.push(new Token(TokenType.bang, null, i, i));
                }
            
            case "<":
                if (c2 == "=") {
                    output.push(new Token(TokenType.less_equal, null, i, i + 1));
                }
                else {
                    output.push(new Token(TokenType.less, null, i, i));
                }
            
            case ">":
                if (c2 == "=") {
                    output.push(new Token(TokenType.greater_equal, null, i, i + 1));
                }
                else {
                    output.push(new Token(TokenType.greater, null, i, i));
                }
            
            case " " | "\t" | "\r":
                i++;
                continue;
            
            case "\n":
                output.push(new Token(TokenType.newline, null, i, i));
            
            default:
                if (is_digit(char(c))) {
                    var gsgsfhyd: Result<Token> = parse_numbers(src);
                    switch (gsgsfhyd) {
                        case out(o):
                            output.push(o);
                        case err(e):
                            errors.concat(e);
                    }
                }
                else if (is_valid_id(char(c))) {

                }
        }

        i++;
    }

    if (errors.length > 0) {
        return Result.err(errors);
    }
    else {
        return Result.out(output);
    }
}

function parse_numbers(src: String): Result<Token> {
    var is_float: Bool = false;
    var result: String = src.charAt(i);
    var i_start = i;

    // we accept _ so that you can type 100_000 instead of 100000 for example
    // however you can put _ anywhere, so 1_0_0_0_0_0 is also valid
    while (is_digit(char(src.charAt(i + 1))) || src.charAt(i + 1) == "_") {
        i++;
        if (src.charAt(i) != "") {
            result += src.charAt(i);
        }
    }

    // is it a float?
    if (src.charAt(i + 1) == ".") {
        is_float = true;
        i++;
        result += ".";

        // do that bullshit again
        while (is_digit(char(src.charAt(i + 1))) || src.charAt(i + 1) == "_") {
            i++;
            if (src.charAt(i) != "") {
                result += src.charAt(i);
            }
        }
    }

    // parse
    if (is_float) {
        var val = Std.parseFloat(result);
        if (val == null) {
            return err([new Error("Invalid float literal", 2, i_start, i)]);
        }
        else {
            return out(new Token(TokenType.float_literal, val, i_start, i));
        }
    }
    else {
        var val = Std.parseInt(result);
        if (val == null) {
            return err([new Error("Invalid integer literal", 2, i_start, i)]);
        }
        else {
            return out(new Token(TokenType.integer_literal, val, i_start, i));
        }
    }
}

function parse_ids_and_keywords(src: String): Token {
    var id: String = src.charAt(i);

    while (is_valid_id(char(src.charAt(i + 1)))) {
        
    }
}