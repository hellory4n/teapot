package teapot.parser.statements;

import teapot.parser.Ast;
import teapot.tools.Result;
import teapot.lexer.Token;

function handle_primitive(stmt: Array<Token>): Result<Stmt> {
    var errors: Array<Error> = [];
    var output: Null<Stmt> = null;
    
    if (stmt[1].type != identifier) {
        
    }

    if (errors.length == 0) {
        return out(output);
    }
    else {
        return err(errors);
    }
}