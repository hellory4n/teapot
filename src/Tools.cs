static class Tools
{
    public static void Throw(string error, int line)
    {
        Console.ForegroundColor = ConsoleColor.Red;
        Console.WriteLine($"Critical error at line {line}: {error}");
        Console.ForegroundColor = ConsoleColor.White;
    }
}