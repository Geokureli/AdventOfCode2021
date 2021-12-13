package day12;

import day12.Data;

class Test extends BaseTest
{
    public function new()
    {
        super();
        trace("part 1 sample 1: " + part1(Cave.sample1, logNone));
        trace("part 1 sample 2: " + part1(Cave.sample2, logNone));
        trace("part 1 sample 3: " + part1(Cave.sample3, logNone));
        trace("part 1 answer: "   + part1(Cave.cave, logNone));
        trace("part 2 sample 1: " + part2(Cave.sample1, logNone));
        trace("part 2 sample 2: " + part2(Cave.sample2, logNone));
        trace("part 2 sample 3: " + part2(Cave.sample3, logNone));
        trace("par1 2 answer: "   + part2(Cave.cave, logNone));
    }
    
    function part1(cave:Cave, log:Logger)
    {
        return cave.getNumPaths("start", "end", Path1.new, log);
    }
    
    function part2(cave:Cave, log:Logger)
    {
        return cave.getNumPaths("start", "end", Path2.new, log);
    }
    
    function test2()
    {
        return 0;
    }
}

class Path1 extends Path
{
    public function new(path:Null<Path1>)
    {
        super(path != null ? path.nodes.copy() : null);
    }
    function canGo(node:Node, log:Logger):Bool
    {
        return node.big || isMissing(node);
    }
}

class Path2 extends Path
{
    var visitedSmallTwice = false;
    public function new(path:Null<Path2>)
    {
        var nodes:Array<Node> = null;
        if (path != null)
        {
            nodes = path.nodes.copy();
            visitedSmallTwice = path.visitedSmallTwice;
        }
        
        super(nodes);
    }
    
    function canGo(node:Node, log:Logger):Bool
    {
        return node.name != "start" 
            && (node.big || isMissing(node) || visitedSmallTwice == false);
    }
    override function go(node:Node, log:Logger)
    {
        if (node.small && contains(node))
            visitedSmallTwice = true;
        
        log.verbose('small:${node.small} contains:${contains(node)} visitedSmallTwice:$visitedSmallTwice');
        super.go(node, log);
    }
}