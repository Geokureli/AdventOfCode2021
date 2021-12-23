package day14;

import day14.Data;
import haxe.Int64;

class Test extends BaseTest
{
    public function new()
    {
        super();
        trace("test1 sample: " + test1(PairSet.sampleSeed, PairSet.sample, 4, logNone));
        trace("test1 answer 1: " + test1(PairSet.seed, PairSet.list, 10, logInfo));
        trace("test2 sample: " + test2(PairSet.sampleSeed, PairSet.sample, 4, logInfo));
        trace("test2 answer 1: " + test2(PairSet.seed, PairSet.list, 10, logNone));
        trace("test2 answer 2: " + test2(PairSet.seed, PairSet.list, 40, logNone));
    }
    
    function test1(seed:String, pairs:PairSet, steps:Int, log:Logger)
    {
        if (seed.length << steps > (-1:UInt))
            throw "too many steps";
        
        for (i in 0...steps)
            seed = pairs.step(seed);
        log.verbose(seed);
        
        var split = seed.split("");
        split.sort(Reflect.compare);
        seed = split.join("");
        log.verbose(seed);
        
        var most = 0;
        var least = seed.length;
        while (seed.length > 0)
        {
            var char = seed.charAt(0);
            var last = seed.lastIndexOf(char);
            seed = seed.substring(last + 1);
            
            if (least > last + 1)
                least = last + 1;
                
            if (most < last + 1)
                most = last + 1;
        }
        
        return most - least;
    }
    
    function test2(seed:String, pairs:PairSet, steps:Int, log:Logger)
    {
        var data = new SmartSeed(seed, pairs);
        log.info(data.toString());
        for (i in 0...steps)
        {
            data.step();
            log.info(data.toString());
        }
        
        // {NN=>1, NC=>1, CB=>1} NNC
        // {NC=>1, NB=>1, HB=>1, CN=>1, CH=>1, BC=>1}
        // {NB=>2, HC=>1, CN=>1, CC=>1, CB=>2, BH=>1, BC=>2, BB=>2}
        // {NC=>1, NB=>4, HN=>0, HH=>1, HC=>0, HB=>3, CN=>2, CH=>2, CC=>1, BN=>2, BH=>1, BC=>3, BB=>4}
        // {NH=>1, NC=>1, NB=>9, HN=>1, HH=>1, HC=>3, CN=>3, CC=>2, CB=>5, BN=>6, BH=>3, BC=>4, BB=>9}
        
        return data.getMostMinusLeast(log);
    }
}