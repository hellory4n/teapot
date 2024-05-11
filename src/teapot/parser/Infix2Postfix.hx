package teapot.parser;

import teapot.lexer.TokenType;
import haxe.ds.GenericStack;
import teapot.parser.ParserUtils;
import teapot.tools.Result;
import teapot.lexer.Token;

function infix2postfix(tokens: Array<Token>): Result<Array<Token>> {
    var output: Array<Token> = [];
    // why isn't it just Stack<T>
    var operators = new GenericStack<Token>();
    var errors: Array<Error> = [];
    var original_tokens = tokens.copy();

    var i = 0;
    while (tokens.length > 0) {
        // why is it called shift
        var token = tokens.shift();

        if (is_operand(token)) {
            output.push(token);
        }

        if (is_operator(token)) {
            // handle negation
            // -9 negates 9, which does the same thing in practice
            if (is_minus(token)) {
                // "-9 + 1" is negating 9 since you usually don't subtract nothing
                // we have to check the index first so it doesn't die
                if (i == 0) {
                    // why is it .push on arrays & .add on stacks
                    operators.add(new Token(TokenType.negate, null, token.start - 1, token.end));
                    i++;
                    continue;
                }
                else if (is_left_paren(original_tokens[i - 1]) || is_binary(original_tokens[i - 1])) {
                    operators.add(new Token(TokenType.negate, null, token.start - 1, token.end));
                    i++;
                    continue;
                }
            }

            if (is_unary(token)) {
                operators.add(token);
                i++;
                continue;
            }

            // most operators are handled here
            if (!operators.isEmpty()) {
                // why is it .head.elt instead of .peek() & why doesn't it have a description
                while (!is_left_paren(token) && get_precedence(operators.head.elt) > get_precedence(token)) {
                    var op = operators.pop();
                    output.push(op);
                }
            }
            operators.add(token);
        }

        if (is_left_paren(token)) {
            operators.add(token);
        }

        if (is_right_paren(token)) {
            while (!is_left_paren(operators.head.elt)) {
                if (operators.isEmpty()) {
                    errors.push(new Error("Mismatched parenthesis", 2, token.start, token.start + 1));
                }
                else {
                    output.push(operators.pop());
                }
            }

            // discard left parenthesis
            operators.pop();
        }

        i++;
    }

    while (!operators.isEmpty()) {
        if (is_left_paren(operators.head.elt) || is_right_paren(operators.head.elt)) {
            errors.push(new Error("Mismatched parenthesis", 2, operators.head.elt.start, operators.head.elt.end));
        }

        output.push(operators.pop());
    }

    if (errors.length > 0) {
        return err(errors);
    }
    else {
        return out(output);
    }
}