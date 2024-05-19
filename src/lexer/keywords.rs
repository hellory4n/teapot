use std::collections::HashMap;
use maplit::hashmap;
use super::types::TokenType;

pub fn get_keywords() -> HashMap<&'static str, TokenType> {
    return hashmap! {
        "true" => TokenType::True,
        "false" => TokenType::False,
        "print" => TokenType::Print,
        "bool" => TokenType::Bool,
        "int" => TokenType::Int,
        "int32" => TokenType::Int32,
        "int16" => TokenType::Int16,
        "int8" => TokenType::Int8,
        "uint" => TokenType::UInt,
        "uint32" => TokenType::UInt32,
        "uint16" => TokenType::UInt16,
        "uint8" => TokenType::UInt8,
        "float" => TokenType::Float,
        "float32" => TokenType::Float32
    };
}