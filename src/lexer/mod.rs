use self::types::Token;
use super::tools::Error;

mod keywords;
mod utils;
mod types;

pub fn scan() -> Lexer<'static> {
    let lexer = Lexer { tokens: &[], errors: &[] };
    return lexer;
}

pub struct Lexer<'a> {
    tokens: &'a [Token],
    errors: &'a [Error<'a>],
}