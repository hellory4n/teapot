/** we have our own implementation to make sure it only accepts ascii numbers */
pub fn is_digit(c: char) -> bool {
    return c >= '0' && c <= '9';
}

pub fn is_letter(c: char) -> bool {
    return (c >= 'A' && c <= 'Z') || (c >= 'a' && c <= 'z');
}