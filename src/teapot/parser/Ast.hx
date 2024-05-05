// haxe fucking sucks
package teapot.parser;

interface Ast {}
interface Expr extends Ast {}
interface Stmt extends Ast {}

class PlaceholderExpr implements Expr {}

class IntegerLiteralExpr implements Expr {
    var n: Int;
    public function new(n: Int) { this.n = n; }
}

class FloatLiteralExpr implements Expr {
    var n: Float;
    public function new(n: Float) { this.n = n; }
}

class NegateExpr implements Expr {
    var n: Expr;
    public function new(n: Expr) { this.n = n; }
}

class AdditionExpr implements Expr {
    var a: Expr;
    var b: Expr;
    public function new(a: Expr, b: Expr) { this.a = a; this.b = b; }
}

class SubtractionExpr implements Expr {
    var a: Expr;
    var b: Expr;
    public function new(a: Expr, b: Expr) { this.a = a; this.b = b; }
}

class MultiplicationExpr implements Expr {
    var a: Expr;
    var b: Expr;
    public function new(a: Expr, b: Expr) { this.a = a; this.b = b; }
}

class DivisionExpr implements Expr {
    var a: Expr;
    var b: Expr;
    public function new(a: Expr, b: Expr) { this.a = a; this.b = b; }
}

class ModuloExpr implements Expr {
    var a: Expr;
    var b: Expr;
    public function new(a: Expr, b: Expr) { this.a = a; this.b = b; }
}

class TrueExpr implements Expr {
    public function new() {}
}

class FalseExpr implements Expr {
    public function new() {}
}

class NotExpr implements Expr {
    var n: Expr;
    public function new(n: Expr) { this.n = n; }
}

class AndExpr implements Expr {
    var a: Expr;
    var b: Expr;
    public function new(a: Expr, b: Expr) { this.a = a; this.b = b; }
}

class OrExpr implements Expr {
    var a: Expr;
    var b: Expr;
    public function new(a: Expr, b: Expr) { this.a = a; this.b = b; }
}

class ValueEqualExpr implements Expr {
    var a: Expr;
    var b: Expr;
    public function new(a: Expr, b: Expr) { this.a = a; this.b = b; }
}

class ValueNotEqualExpr implements Expr {
    var a: Expr;
    var b: Expr;
    public function new(a: Expr, b: Expr) { this.a = a; this.b = b; }
}

class GreaterThanExpr implements Expr {
    var a: Expr;
    var b: Expr;
    public function new(a: Expr, b: Expr) { this.a = a; this.b = b; }
}

class GreaterEqualExpr implements Expr {
    var a: Expr;
    var b: Expr;
    public function new(a: Expr, b: Expr) { this.a = a; this.b = b; }
}

class LessThanExpr implements Expr {
    var a: Expr;
    var b: Expr;
    public function new(a: Expr, b: Expr) { this.a = a; this.b = b; }
}

class LessEqualExpr implements Expr {
    var a: Expr;
    var b: Expr;
    public function new(a: Expr, b: Expr) { this.a = a; this.b = b; }
}

class VariableDefineStmt implements Stmt {
    var type: String;
    var name: String;
    var expr: Expr;
    public function new(type: String, name: String, expr: Expr){this.type = type; this.name = name; this.expr = expr;}
}

class VariableAssignStmt implements Stmt {
    var name: String;
    var expr: Expr;
    public function new(name: String, expr: Expr) { this.name = name; this.expr = expr; }
}

class PrintStmt implements Stmt {
    var expr: Expr;
    public function new(expr: Expr) { this.expr = expr; }
}