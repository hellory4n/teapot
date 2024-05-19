pub enum Result<'a, T> {
    Out(T),
    Err(&'a [Error<'a>]),
}

pub struct Error<'a> {
    message: &'a str,
    /** it's a number for conciseness - 0 = critical, 1 = warning, 2 = suggestion */
    error: u8,
    start: u64,
    end: u64,
    quick_fixes: &'a [QuickFix<'a>],
}

pub struct QuickFix<'a> {
    code: &'a str,
    replace_start: u64,
    replace_end: u64,
}