package day14;

import haxe.Int64;

class SmartSeed
{
    var data = new Map<String, Int64>();
    var last:String;
    var pairs:PairSet;
    
    public function new (seed:String, pairs:PairSet)
    {
        this.pairs = pairs;
        for (pair in pairs.keys())
            data[pair] = 0;
        
        for (i in 0...seed.length - 1)
        {
            var pair = seed.substr(i, 2);
            data[pair] = data[pair] + 1;
        }
        
        last = seed.charAt(seed.length - 1);
    }
    
    public function step()
    {
        var newData = new Map<String, Int64>();
        for (pair in data.keys())
            newData[pair] = 0;
        
        for (pair in data.keys())
        {
            if (pairs.exists(pair) == false)
                throw 'invalid pair:$pair';
            var insert = pairs[pair];
            newData[pair.charAt(0) + insert] += data[pair];
            newData[insert + pair.charAt(1)] += data[pair];
        }
        data = newData;
    }
    
    public function getMostMinusLeast(log:Logger)
    {
        var count = new Map<String, Int64>();
        count[last] = 1;
        for (pair in data.keys())
        {
            var char = pair.charAt(0);
            if (count.exists(char) == false)
                count[char] = 0;
            
            count[char] += data[pair];
        }
        
        var most:Int64 = 0;
        var least:Int64 = -1;
        for (num in count)
        {
            if (least > num || least == -1)
                least = num;
                
            if (most < num)
                most = num;
        }
        
        return most - least;
    }
    
    public function toString()
    {
        var list = new Array<String>();
        for (pair in data.keys())
            list.push('$pair=>${data[pair]}');
        
        return '{' + list.join(", ") + '}';
    }
}

@:forward
abstract PairSet(Map<String, String>) from Map<String, String>
{
    static public var seed = "PBFNVFFPCPCPFPHKBONB";
    static public var list = fromString(Data.PAIRS_RAW);
    static public var sampleSeed = "NNCB";
    static public var sample = fromString(Data.SAMPLE_PAIRS_RAW);
    
    public function new ()
    {
        this = new Map<String, String>();
    }
    
    public function add(pair:String, insert:String)
    {
        this[pair] = insert;
    }
    
    @:arrayAccess
    inline public function get(pair:String):String return this[pair];
    
    public function step(input:String):String
    {
        var output = input.charAt(0);
        for (i in 0...input.length - 1)
            output += this[input.substr(i, 2)] + input.charAt(i+1);
        
        return output;
    }
    
    public function getChars()
    {
        var chars = new Array<String>();
        for (char in this)
        {
            if(chars.indexOf(char) == -1)
                chars.push(char);
        }
        return chars;
    }
    
    static public function fromString(data:String)
    {
        var set = new PairSet();
        for (str in data.split("\n"))
        {
            var split = str.split(" -> ");
            set.add(split[0], split[1]);
        }
        return set;
    }
}

class Data
{
    inline static public var SAMPLE_PAIRS_RAW =
"CH -> B
HH -> N
CB -> H
NH -> C
HB -> C
HC -> B
HN -> C
NN -> C
BH -> H
NC -> B
NB -> B
BN -> B
BB -> N
BC -> B
CC -> N
CN -> C";
    
    inline static public var PAIRS_RAW =
"KK -> S
FO -> B
PP -> O
HN -> S
CN -> H
VH -> P
BK -> B
VC -> N
CB -> H
OC -> K
BF -> P
FV -> K
SP -> F
OP -> K
SS -> B
NN -> O
CS -> K
CF -> K
FF -> S
SV -> P
OK -> S
CO -> F
OB -> K
BH -> B
HH -> S
VB -> V
KV -> H
CK -> V
NV -> N
SF -> V
PK -> H
PV -> N
FB -> O
BO -> K
FP -> N
OF -> N
FK -> O
VK -> V
NO -> V
NS -> C
KC -> S
VF -> V
BV -> N
CP -> K
PB -> V
CC -> S
NH -> B
CV -> P
SO -> V
NC -> O
HK -> K
SB -> H
OO -> V
HO -> P
PS -> B
BC -> P
KO -> C
KB -> C
VV -> F
BS -> F
HB -> B
KN -> S
FC -> C
SN -> S
HC -> O
HP -> F
BP -> V
ON -> K
BB -> K
KH -> O
NP -> H
KS -> N
SH -> K
VP -> O
PF -> O
HF -> S
BN -> S
NK -> C
FH -> O
CH -> B
KP -> B
FN -> K
OV -> P
VS -> K
OH -> V
PC -> F
VO -> H
SK -> S
PO -> O
KF -> N
NF -> V
NB -> C
PN -> O
FS -> C
PH -> F
VN -> S
OS -> V
HV -> H
HS -> B
SC -> C";
}
