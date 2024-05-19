use crate::tools::get_char;

use self::types::Token;
use super::tools::Error;

mod keywords;
mod utils;
mod types;
mod match_char;
mod handle_letters_and_numbers;

pub fn scan(mut src: String) -> Lexer<'static> {
    let mut lexer = Lexer { i: 0, tokens: &[], errors: &[] };

    // so we don't have to deal with checking the end of the string :)
    for _ in 1..3 {
        src.push('\0');
    }

    while lexer.i < src.len().try_into().unwrap() {
        lexer.c0 = get_char(&src, lexer.i);
        lexer.c1 = get_char(&src, lexer.i + 1);

        let token = match_char()

        lexer.i += 1;
    }

    return lexer;
}

pub struct Lexer<'a> {
    i: u64,
    /** the current character */
    c0: char,
    /** the next character */
    c1: char,
    tokens: &'a [Token],
    errors: &'a [Error<'a>],
}