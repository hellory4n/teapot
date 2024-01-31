namespace csteapot.lexer;

static class ScannerUtils {
    public static bool IsDigit(char c) => c == '0' || c == '1' || c == '2' || c == '3' || c == '4' ||
                                          c == '5' || c == '6' || c == '7' || c == '8' || c == '9';
}