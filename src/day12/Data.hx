package day12;

import haxe.ds.ReadOnlyArray;
import haxe.Constraints.Constructible;

class Node
{
    public var name(default, null):String;
    public var big(get, null):Bool;
    public var small(get, never):Bool;
    public var links(get, never):ReadOnlyArray<Node>;
    var _links = new Array<Node>();
    
    
    public function new(name:String)
    {
        this.name = name;
    }
    
    public function add(node:Node)
    {
        _links.push(node);
        node._links.push(this);
    }
    
    inline public function get_links() return _links;
    inline public function get_big() return name == name.toUpperCase();
    inline public function get_small() return name == name.toLowerCase();
    
    public function toString() return name;
}

abstract Cave(Map<String, Node>)
{
    static public var sample1 = fromString(Data.SAMPLE_1_RAW);
    static public var sample2 = fromString(Data.SAMPLE_2_RAW);
    static public var sample3 = fromString(Data.SAMPLE_3_RAW);
    static public var cave = fromString(Data.PART_1_RAW);
    
    inline public function new() { this = new Map<String, Node>(); }
    
    public function addLink(link:String)
    {
        var nodes = link.split("-");
        var from = nodes[0];
        var to = nodes[1];
        
        if (this.exists(from) == false)
            this[from] = new Node(from);
        
        if (this.exists(to) == false)
            this[to] = new Node(to);
        
        this[from].add(this[to]);
    }
    
    public function getNumPaths<T:Path>(from:String, to:String, pathFactory:(Null<T>)->T, log:Logger):Int
    {
        if (this.exists(from) == false) throw "Invalid from: " + from;
        if (this.exists(to  ) == false) throw "Invalid to: "   + to;
        var path = pathFactory(null);
        path.start(this[from]);
        return getNumPathsRecursive(path, this[to], pathFactory, log);
    }
    
    function getNumPathsRecursive<T:Path>(path:T, to:Node, pathFactory:(Null<T>)->T, log:Logger):Int
    {
        var num = 0;
        log.verbose('$path to ${path.last.links}');
        var next = new Array<Path>();
        for (node in path.last.links)
        {
            var canGo = path.canGo(node, log);
            log.verbose('$path->${node.name} $canGo');
            if (canGo)
            {
                if (node == to)
                {
                    log.info('ending reached ${path.toString()}->$to');
                    num++;
                }
                else
                {
                    log.info('continuing ${path.toString()}->${node.name}');
                    var newPath = pathFactory(path);
                    newPath.go(node, log);
                    num += getNumPathsRecursive(newPath, to, pathFactory, log);
                }
            }
        }
        return num;
    }
    
    static public function fromString(data:String)
    {
        var cave = new Cave();
        for (path in data.split("\n"))
            cave.addLink(path);
        return cave;
    }
}

abstract class Path
{
    public var length(get, never):Int;
    public var first(get, never):Node;
    public var last(get, never):Node;
    
    public var nodes:Array<Node>;
    public function new(?nodes:Array<Node>)
    {
        this.nodes = nodes;
    }
    
    public function start(node:Node) nodes = [node];
    public abstract function canGo(node:Node, log:Logger):Bool;
    public function go(node:Node, log:Logger) nodes.push(node);
    
    inline public function contains(node:Node) return nodes.contains(node);
    inline public function isMissing(node:Node) return contains(node) == false;
    
    inline public function get_length() return nodes.length;
    inline public function get_first() return nodes[0];
    inline public function get_last() return nodes[nodes.length - 1];
    
    inline public function toString() return nodes.join(",");
}

class Data
{
    inline static public var SAMPLE_1_RAW =
"start-A
start-b
A-c
A-b
b-d
A-end
b-end";
    inline static public var SAMPLE_2_RAW =
"dc-end
HN-start
start-kj
dc-start
dc-HN
LN-dc
HN-end
kj-sa
kj-HN
kj-dc";
    
    inline static public var SAMPLE_3_RAW =
"fs-end
he-DX
fs-he
start-DX
pj-DX
end-zg
zg-sl
zg-pj
pj-he
RW-he
fs-DX
pj-RW
zg-RW
start-pj
he-WI
zg-he
pj-fs
start-RW";
    
    inline static public var PART_1_RAW =
"qi-UD
jt-br
wb-TF
VO-aa
UD-aa
br-end
end-HA
qi-br
br-HA
UD-start
TF-qi
br-hf
VO-hf
start-qi
end-aa
hf-HA
hf-UD
aa-hf
TF-hf
VO-start
wb-aa
UD-wb
KX-wb
qi-VO
br-TF";
    
    inline static public var DATA_RAW =
"";
}
