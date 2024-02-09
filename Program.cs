using System.Text;
using csteapot.compiler;
using csteapot.lexer;
using csteapot.parser;

string contents;
using StreamReader streamReader = new(args[0], Encoding.UTF8);
contents = streamReader.ReadToEnd();

List<Token> tokens = Scanner.Scan(contents);
// for now just print the tokens
/*foreach (var token in tokens) {
    Console.WriteLine(token);
}*/

List<IAstNode> haha = Parser.Parse(tokens);
// print the tree :)
Console.WriteLine(haha.Count);
TreePrinter5000.DoIt(haha);

// duplicate the list :)
Compiler.Compile(haha.ToList());

Console.WriteLine("Your bullshit has been compiled.");
