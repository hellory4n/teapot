use std::collections::HashMap;

use super::TokenType;

pub fn get_keywords() -> HashMap<String, TokenType> {
    let mut map: HashMap<String, TokenType> = HashMap::new();
    map.insert("true".to_string(), TokenType::True);
    map.insert("false".to_string(), TokenType::False);
    map.insert("print".to_string(), TokenType::Print);
    map.insert("bool".to_string(), TokenType::Bool);
    map.insert("int".to_string(), TokenType::Int);
    map.insert("int32".to_string(), TokenType::Int32);
    map.insert("int16".to_string(), TokenType::Int16);
    map.insert("int8".to_string(), TokenType::Int8);
    map.insert("uint".to_string(), TokenType::UInt);
    map.insert("uint32".to_string(), TokenType::UInt32);
    map.insert("uint16".to_string(), TokenType::UInt16);
    map.insert("uint8".to_string(), TokenType::UInt8);
    map.insert("float".to_string(), TokenType::Float);
    map.insert("float32".to_string(), TokenType::Float32);
    return map;
}