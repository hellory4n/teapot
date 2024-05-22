use std::borrow::Borrow;

pub enum Result<'a, T> {
    Out(T),
    Err(&'a [Error<'a>]),
}

#[derive(Clone, Copy, Borrow)]
pub struct Error<'a> {
    pub message: &'a str,
    /** it's a number for conciseness - 0 = critical, 1 = warning, 2 = suggestion */
    pub error: u8,
    pub start: u64,
    pub end: u64,
    pub quick_fixes: &'a [QuickFix<'a>],
}

pub struct QuickFix<'a> {
    code: &'a str,
    replace_start: u64,
    replace_end: u64,
}

pub fn get_char(str: &String, idx: u64) -> char {
    return str.char_indices().nth(idx.try_into().unwrap()).unwrap().1;
}