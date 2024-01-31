using System.Globalization;

namespace csteapot.lexer;

static partial class Scanner
{
    static void ProcessNumber(char c)
    {
        bool isFloat = false;
        string thing = c.ToString();

        while (IsDigit(source[i + 1])) {
            thing += source[i];
            Continue();
        }

        // now check if it's actually a float
        if (source[i + 1] == '.') {
            isFloat = true;
            Continue();
            thing += '.';

            // and do that shit again
            while (IsDigit(source[i + 1])) {
                thing += source[i];
                Continue();
            }
        }

        // then we actually add the token
        if (isFloat) {
            Add(TokenType.Float, double.Parse(thing, CultureInfo.InvariantCulture));
        }
        else {
            Add(TokenType.Integer, int.Parse(thing, CultureInfo.InvariantCulture));
        }
    }
}