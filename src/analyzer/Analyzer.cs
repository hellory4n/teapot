using csteapot.parser;

namespace csteapot.analyzer;

partial class Analyzer
{
    public int Errors { get; set; }

    public Analyzer(List<IAstNode> nodes)
    {
        foreach (var node in nodes) {
            
        }
    }
}