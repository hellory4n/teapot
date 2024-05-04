package teapot.tools;

using StringTools;

/**
 * gets the line from a character position in a string. if it's an invalid position then -1 is returned.
 */
function get_line(str: String, pos: Int): Int {
    // just in case
    if (pos > str.split("\n").length) {
        return -1;
    }

    if (pos < 0) {
        return -1;
    }

    var lines: Int = 0;
    
    for (index => value in str) {
        if (value == "\n".code) {
            lines++;
        }

        if (index == pos) {
            break;
        }
    }

    return lines;
}