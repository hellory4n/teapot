mod keywords;

use std::fmt::Debug;

#[derive(Debug)]
pub enum TokenType {
    LParen,
    RParen,
    Equal1,
    Semicolon,
    Newline,

    // literals-ish
    IntegerLit,
    FloatLit,
    IdLit,

    // arithmetic operators
    Plus,
    Minus,
    Star,
    Slash,
    Percent,

    // boolean operators
    Bang,
    Or,
    And,
    Great,
    Less,
    GreatEq,
    LessEq,
    Equal2,
    Equal3,
    BangEq,
    BangEq3,

    // parser stuff
    Negate,

    // keywords
    True,
    False,
    Print,

    // primitives (also keywords)
    Bool,
    Int,
    Int32,
    Int16,
    Int8,
    UInt,
    UInt32,
    UInt16,
    UInt8,
    Float,
    Float32,

    End
}

impl TokenType {
    
}

pub struct Token<T> where T: Debug {
    token_type: TokenType,
    value: T,
    start: u64,
    end: u64,
}

impl<T> Token<T> where T: Debug {
    pub fn tostr(&self) -> String {
        return format!("({:?} = {:?}, {} - {})", self.token_type, self.value, self.start, self.end);
    }
}