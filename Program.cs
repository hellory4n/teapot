using csteapot.lexer;

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
}