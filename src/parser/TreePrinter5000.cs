namespace csteapot.parser;

static class TreePrinter5000
{
    public static void DoIt(List<IAstNode> nodes)
    {
        foreach (var node in nodes) {
            if (node is IAstExpression heheheha) {
                Console.WriteLine($"{{{heheheha}}}");
            }
        }
    }
}