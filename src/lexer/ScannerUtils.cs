namespace csteapot.lexer;

static class ScannerUtils {
    // i'm sorry
    public static bool IsDigit(char c) => c == '0' || c == '1' || c == '2' || c == '3' || c == '4' ||
                                          c == '5' || c == '6' || c == '7' || c == '8' || c == '9';

    public static bool IsLetter(char c) => c == 'A' || c == 'B' || c == 'C' || c == 'D' || c == 'E' ||
                                           c == 'F' || c == 'G' || c == 'H' || c == 'I' || c == 'J' ||
                                           c == 'K' || c == 'L' || c == 'M' || c == 'N' || c == 'O' ||
                                           c == 'P' || c == 'Q' || c == 'R' || c == 'S' || c == 'T' ||
                                           c == 'U' || c == 'V' || c == 'W' || c == 'X' || c == 'Y' ||
                                           c == 'Z' || c == 'a' || c == 'b' || c == 'c' || c == 'd' ||
                                           c == 'e' || c == 'f' || c == 'g' || c == 'h' || c == 'i' ||
                                           c == 'j' || c == 'k' || c == 'l' || c == 'm' || c == 'n' ||
                                           c == 'o' || c == 'p' || c == 'q' || c == 'r' || c == 's' ||
                                           c == 't' || c == 'u' || c == 'v' || c == 'w' || c == 'x' ||
                                           c == 'y' || c == 'z';
    
    public static bool IsValidId(char c) => IsDigit(c) || IsLetter(c) || c == '_';
}