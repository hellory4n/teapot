package teapot.parser;

import teapot.parser.ParserUtils;
import teapot.parser.Ast;
import teapot.tools.Result;
import teapot.lexer.Token;

function parse(tokens: Array<Token>, path: String): Result<Array<Stmt>> {
    var result: Array<Stmt> = [];
    var errors: Array<Error> = [];
    var current_statement: Array<Token> = [];
    var line: Int = 1;
    var original_tokens = tokens.copy();

    while (original_tokens.length > 0) {
        // pretend it's .remove_first
        // this language fucking sucks lmao
        var token = tokens.shift();

        if (is_newline(token)) line++;

        // build whatever statement is here :)
        if (is_semicolon(token)) {
            
        }
        else {
            current_statement.push(token);
        }
    }

    if (errors.length > 0) {
        return err(errors);
    }
    else {
        return out(result);
    }
}