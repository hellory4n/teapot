package teapot.tools;

import teapot.tools.MoreStringTools;
import teapot.tools.Result;
using StringTools;

function output_errors(path: String, src: String, errors: Array<Error>) {
    var lines = src.split("\n");
    for (error in errors) {
        var line = get_line(src, error.start);

        switch (error.severity) {
            case 2: Console.printlnFormatted('$path:$line: <red>${error.error}</red>');
            case 1: Console.printlnFormatted('$path:$line: <yellow>${error.error}</yellow>');
            case 0: Console.println('$path:$line: ${error.error}');
        }

        // the extra line is intentional
        Console.println('> ${lines[line]}\n');
    }
    
}