package day10;

import haxe.Int64;

import day10.Data;

class Test extends BaseTest
{
    public function new()
    {
        super();
        trace("test1 answer: " + test1(Line.list  , logNone));
        trace("test1 sample: " + test1(Line.sample, logNone));
        trace("test2 answer: " + test2(Line.list  , logInfo));
        trace("test2 sample: " + test2(Line.sample, logNone));
    }
    
    function test1(lines:Array<Line>, log:Logger)
    {
        var total = 0;
        for (line in lines)
        {
            line = line.reduce();
            log.info('reduced:$line');
            var index = line.length;
            var points = 0;
            inline function minIndex(char, award)
            {
                var i = line.indexOf(char);
                if (i != -1 && i < index)
                {
                    index = i;
                    points = award;
                    log.verbose('char:$char i:$i');
                }
            }
            minIndex(")", 3);
            minIndex("]", 57);
            minIndex("}", 1197);
            minIndex(">", 25137);
            total += points;
        }
        
        return total;
    }
    
    function test2(lines:Array<Line>, log:Logger)
    {
        var scores = new Array<Int64>();
        for (line in lines)
        {
            line = line.reduce();
            log.info('reduced:$line');
            
            if (line.isUnfinished())
            {
                var i = line.length;
                var msg = "";
                var points:Int64 = 0;
                while(i-- > 0)
                {
                    points *= 5;
                    points += switch(line.charAt(i))
                    {
                        case "(": msg += ")"; 1;
                        case "[": msg += "]"; 2;
                        case "{": msg += "}"; 3;
                        case "<": msg += ">"; 4;
                        case char: throw 'Unexpected case:$char';
                    }
                }
                log.info('$msg - $points');
                scores.push(points);
            }
        }
        
        assert(scores.length % 2 == 1, 'Expected odd number of scores:$scores');
        scores.sort((a,b)->a < b ? 1 : -1);
        // show high/low because Int64 doesn't display right
        log.info(scores.map((i)->i.high == 0 ? '${i.low}' : 'h:${i.high} l:${i.low}'));
        return scores[Math.floor(scores.length / 2)];
    }
}