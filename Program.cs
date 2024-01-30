using csteapot.lexer;
using csteapot.parser;

Console.WriteLine("Welcome to Teapot (C# version)\nWrite `.exit` to exit\n");

while (true) {
    Console.Write("> ");
    string input = Console.ReadLine();
    if (input == ".exit") {
        break;
    }

    List<Token> tokens = Scanner.Scan(input);
    // for now just print the tokens
    foreach (var token in tokens) {
        Console.WriteLine(token);
    }
    Scanner.Tokens.Clear();

    List<IAstNode> haha = Parser.Parse(tokens);
    // print the tree :)
    TreePrinter5000.DoIt(haha);
    Parser.Nodes.Clear();
}