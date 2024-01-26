Console.WriteLine("Welcome to the C# Teapot REPL\nWrite `.exit` to exit\n");

while (true) {
    Console.Write("> ");
    string input = Console.ReadLine();
    if (input == ".exit") {
        break;
    }

    Console.WriteLine("yep, that's a value lmao");
}