package day6;

using StringTools;

abstract Fish(Int) from Int to Int
{
    inline static public var CYCLE_START = 8;
    inline static public var SPAWN_RATE = 7;
    inline static var SPAWN_RESET = SPAWN_RATE - 1;
    
    static public var sample:Array<Fish>
        = Data.SAMPLE_RAW.split(",")
            .map(Std.parseInt);
    
    static public var list:Array<Fish>
        = Data.DATA_RAW.split(",")
            .map(Std.parseInt);
    
    public var cycle(get, never):Int;
    inline function get_cycle() return this;
    
    inline public function new (age = CYCLE_START) { this = age; }
}

class Data
{
	inline static public var SAMPLE_RAW = "3,4,3,1,2";
	inline static public var DATA_RAW =
"1,1,1,1,3,1,4,1,4,1,1,2,5,2,5,1,1,1,4,3,1,4,1,1,1,1,1,1,1,2,1,2,4,1,1,1,1,1,1,1,3,1,1,5,1,1,2,1,5,1,1,1,1,1,1,1,1,4,3,1,1,1,2,1,1,5,2,1,1,1,1,4,5,1,1,2,4,1,1,1,5,1,1,1,1,5,1,3,1,1,4,2,1,5,1,2,1,1,1,1,1,3,3,1,5,1,1,1,1,3,1,1,1,4,1,1,1,4,1,4,3,1,1,1,4,1,2,1,1,1,2,1,1,1,1,5,1,1,3,5,1,1,5,2,1,1,1,1,1,4,4,1,1,2,1,1,1,4,1,1,1,1,5,3,1,1,1,5,1,1,1,4,1,4,1,1,1,5,1,1,3,2,2,1,1,1,4,1,3,1,1,1,2,1,3,1,1,1,1,4,1,1,1,1,2,1,4,1,1,1,1,1,4,1,1,2,4,2,1,2,3,1,3,1,1,2,1,1,1,3,1,1,3,1,1,4,1,3,1,1,2,1,1,1,4,1,1,3,1,1,5,1,1,3,1,1,1,1,5,1,1,1,1,1,2,3,4,1,1,1,1,1,2,1,1,1,1,1,1,1,3,2,2,1,3,5,1,1,4,4,1,3,4,1,2,4,1,1,3,1";
}
