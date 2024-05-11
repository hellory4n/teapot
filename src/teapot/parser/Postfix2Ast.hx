package teapot.parser;

import teapot.parser.ParserUtils;
import teapot.tools.ToolsToolsTools;
import haxe.ds.GenericStack;
import teapot.parser.Ast;
import teapot.lexer.Token;

function postfix2ast(exprs: Array<Token>): Expr {
    var stack = new GenericStack<Expr>();

    for (token in exprs) {
        if (is_operand(token)) {
            var node: Expr = new PlaceholderExpr();
            switch (token.type) {
                case integer_literal: node = new IntegerLiteralExpr(cast(token.value, Int));
                case float_literal: node = new FloatLiteralExpr(cast(token.value, Float));
                case _true: node = new TrueExpr();
                case _false: node = new FalseExpr();
                // not sure if you can do `default: break;` like in swift
                default: do_nothing();
            }
            stack.add(node);
        }

        if (is_operator(token) && is_binary(token)) {
            var right = stack.pop();
            var left = stack.pop();

            var node: Expr = new PlaceholderExpr();
            switch (token.type) {
                case plus: node = new AdditionExpr(left, right);
                case minus: node = new SubtractionExpr(left, right);
                case slash: node = new DivisionExpr(left, right);
                case star: node = new MultiplicationExpr(left, right);
                case percent: node = new ModuloExpr(left, right);
                case and: node = new AndExpr(left, right);
                case or: node = new OrExpr(left, right);
                case bang_equal: node = new ValueNotEqualExpr(left, right);
                case equal2: node = new ValueEqualExpr(left, right);
                case greater: node = new GreaterThanExpr(left, right);
                case greater_equal: node = new GreaterEqualExpr(left, right);
                case less: node = new LessThanExpr(left, right);
                case less_equal: node = new LessEqualExpr(left, right);
                // not sure if you can do `default: break;` like in swift
                default: do_nothing();
            }
            stack.add(node);
        }

        if (is_operator(token) && is_unary(token)) {
            var val = stack.pop();

            var node: Expr = new PlaceholderExpr();
            switch (token.type) {
                case negate: node = new NegateExpr(val);
                case bang: node = new NotExpr(val);
                default: break;
            }
            stack.add(node);
        }
    }

    return stack.pop();
}