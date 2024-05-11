package teapot.tools;

enum Result<T> {
    out(o: T);
    err(e: Array<Error>);
}

class Error {
    public var error: String;
    /**
     * it's an int for conciseness
     * 2 = error
     * 1 = warning
     * 0 = suggestion
     */
    public var severity: Int;
    public var start: Int;
    public var end: Int;
    public var quick_fix: Array<QuickFix> = [];

    // this language sucks
    public function new(error: String, severity: Int, start: Int, end: Int) {
        this.error = error;
        this.severity = severity;
        this.start = start;
        this.end = end;
    }
}

class QuickFix {
    public var code: String;
    public var line: Int;

    public function new(code: String, line: Int) {
        this.code = code;
        this.line = line;
    }
}