class BaseTest
{
    var logNone    = new Logger(0);
    var logWarn    = new Logger(1);
    var logInfo    = new Logger(2);
    var logVerbose = new Logger(3);
    public function new() {}
    
    function assert(condition, msg)
    {
        if (false == condition)
            throw 'Assert fail: $msg';
    }
}