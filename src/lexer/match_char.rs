use std::{borrow::Borrow, rc::{Rc, Weak}};

use crate::tools::{Error, Result};

use super::{handle_letters_and_numbers::{self, handle_letters_and_numbers}, types::{Token, TokenType, TokenValue}, Lexer};

fn match_char(lexer: &mut Lexer) -> Result<Token> {
    let mut err: Option<Error> = Option::None;

    let token = match lexer.c0 {
        // simple stuff
        '+' => Token { token_type: TokenType::Plus, value: TokenValue::None, start: lexer.i, end: lexer.i + 1  },
        '-' => Token { token_type: TokenType::Minus, value: TokenValue::None, start: lexer.i, end: lexer.i + 1  },
        '*' => Token { token_type: TokenType::Star, value: TokenValue::None, start: lexer.i, end: lexer.i + 1  },
        '/' => Token { token_type: TokenType::Slash, value: TokenValue::None, start: lexer.i, end: lexer.i + 1  },
        '%' => Token { token_type: TokenType::Percent, value: TokenValue::None, start: lexer.i, end: lexer.i + 1  },
        '(' => Token { token_type: TokenType::LParen, value: TokenValue::None, start: lexer.i, end: lexer.i + 1  },
        ')' => Token { token_type: TokenType::RParen, value: TokenValue::None, start: lexer.i, end: lexer.i + 1  },
        ';' => Token { token_type: TokenType::Semicolon, value: TokenValue::None, start: lexer.i, end: lexer.i + 1  },

        // && and ||
        '&' => {
            if lexer.c1 == '&' {
                lexer.i += 1;
                Token { token_type: TokenType::And, value: TokenValue::None, start: lexer.i - 1, end: lexer.i + 1 }
            }
            else {
                err = Some(Error {
                    message: "Unexpected '&', do you mean &&?", error: 0, start: lexer.i, end: lexer.i + 1,
                    quick_fixes: &[] });
                Token { token_type: TokenType::End, value: TokenValue::None, start: lexer.i, end: lexer.i + 1 }
            }
        },

        '|' => {
            if lexer.c1 == '|' {
                lexer.i += 1;
                Token { token_type: TokenType::Or, value: TokenValue::None, start: lexer.i - 1, end: lexer.i + 1 }
            }
            else {
                err = Some(Error {
                    message: "Unexpected '&', do you mean &&?", error: 0, start: lexer.i, end: lexer.i + 1,
                    quick_fixes: &[] });
                Token { token_type: TokenType::End, value: TokenValue::None, start: lexer.i, end: lexer.i + 1 }
            }
        },

        // operators that sometimes end with with =
        '=' => {
            if lexer.c1 == '=' {
                lexer.i += 1;
                Token { token_type: TokenType::EqualEqual, value: TokenValue::None, start: lexer.i - 1,
                    end: lexer.i + 1 }
            }
            else {
                Token { token_type: TokenType::Equal, value: TokenValue::None, start: lexer.i, end: lexer.i + 1 }
            }
        },

        '!' => {
            if lexer.c1 == '=' {
                lexer.i += 1;
                Token { token_type: TokenType::BangEq, value: TokenValue::None, start: lexer.i - 1,
                    end: lexer.i + 1 }
            }
            else {
                Token { token_type: TokenType::Bang, value: TokenValue::None, start: lexer.i, end: lexer.i + 1 }
            }
        },

        '<' => {
            if lexer.c1 == '=' {
                lexer.i += 1;
                Token { token_type: TokenType::LessEq, value: TokenValue::None, start: lexer.i - 1,
                    end: lexer.i + 1 }
            }
            else {
                Token { token_type: TokenType::Less, value: TokenValue::None, start: lexer.i, end: lexer.i + 1 }
            }
        },

        '>' => {
            if lexer.c1 == '=' {
                lexer.i += 1;
                Token { token_type: TokenType::GreatEq, value: TokenValue::None, start: lexer.i - 1,
                    end: lexer.i + 1 }
            }
            else {
                Token { token_type: TokenType::Great, value: TokenValue::None, start: lexer.i, end: lexer.i + 1 }
            }
        },

        // whitespace :)
        ' ' | '\t' | '\r' => Token { token_type: TokenType::Newline, value: TokenValue::None, start: lexer.i,
            end: lexer.i + 1 },
        
        '\n' => Token { token_type: TokenType::Newline, value: TokenValue::None, start: lexer.i, end: lexer.i + 1 },

        _ => {
            let result = handle_letters_and_numbers(lexer);
            match result {
                Result::Out(o) => o,
                Result::Err(e) => {
                    err = Some(Error {
                    message: "Unexpected '&', do you mean &&?", error: 0, start: lexer.i, end: lexer.i + 1,
                    quick_fixes: &[] });
                    Token { token_type: TokenType::End, value: TokenValue::None, start: lexer.i, end: lexer.i + 1 }
                    }
            }
        }
    };

    return match err {
        // at least it's memory-safe
        Some(m) => Result::Err(&(Box::new([m.clone()])).get(0).unwrap().upgrade().into(),.gsjjfhaufgdhuifbgafg*32984i*($u3895uj*(%u4mji5o9u94))),
        None => Result::Out(token),
    }
}