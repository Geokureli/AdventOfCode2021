import haxe.PosInfos;

class Logger
{
    var level:Int;
    
    public function new (level)
    {
        this.level = level;
    }
    
    inline function log(level:Int, msg:Dynamic, ?pos)
    {
        if (this.level >= level)
            haxe.Log.trace(msg, pos);
    }
    
    public function warn   (msg:Dynamic, ?pos) log(1, msg, pos);
    public function info   (msg:Dynamic, ?pos) log(2, msg, pos);
    public function verbose(msg:Dynamic, ?pos) log(3, msg, pos);
}