using csteapot.compiler;
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

    /*List<IAstNode> haha = Parser.Parse(tokens);
    // print the tree :)
    Console.WriteLine(haha.Count);
    TreePrinter5000.DoIt(haha);

    Console.WriteLine();
    Console.WriteLine("===== Compiling project to C =====");
    Console.WriteLine();

    // duplicate the list :)
    Compiler.Compile(haha.ToList());

    Console.WriteLine("Your bullshit has been compiled.");*/
}