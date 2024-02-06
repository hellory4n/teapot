using csteapot.parser;
using csteapot.lexer;

namespace csteapot.compiler;

static class Compiler
{
    public static void Compile(List<IAstNode> nodes)
    {
        // currently we don't have a whole lot to compile
        string output = """
        #include <stdio.h>

        int main() {
        """;

        foreach (IAstNode node in nodes) {
            if (node is AstBinaryExpression binary) {
                output += $"printf(\"%f\\n\", {binary.ToC()});\n";
            }
        }

        output += "}";

        // ok now we can save shit
        File.WriteAllLines(".tpotexport/output.c", [output]);
    }
}