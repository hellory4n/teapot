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

#[derive(Debug)]
pub struct Token {
    token_type: TokenType,
    value: TokenValue,
    start: u64,
    end: u64,
}

#[derive(Debug)]
pub enum TokenValue {
    Int(i64),
    Float(f64),
    String(String),
    None,
}