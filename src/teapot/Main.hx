package teapot;

import teapot.tools.OutputErrors;
import teapot.lexer.Token;
import teapot.tools.Result;
import teapot.lexer.Scanner;
import sys.io.File;

class Main {
	public static function main() {
		var path = "langtest/src.tpot";

		// haxe fucking sucks
		var src: String = "";
		try {
			src = File.getContent(path);
		}
		catch (e) {
			Console.error('Couldn\'t access $path');
			return;
		}

		var lexer_result: Result<Array<Token>> = scan(src, path);
		switch (lexer_result) {
			case out(o):
				Console.println(o.toString());
			case err(e):
				output_errors(path, src, e);
		}
	}
}