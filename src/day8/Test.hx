package day8;

import day8.Data;

class Test extends BaseTest
{
    public function new()
    {
        super();
        trace("answer 1: " + test1(Display.list));
        trace("answer 2: " + test2(Display.list));
        trace("answer 2 sample: " + test2(Display.samples, true));
    }
    
    var unique = [2,3,4,7];
    function test1(displays:Array<Display>)
    {
        var count = 0;
        for (display in displays)
        {
            for (digit in display.digits)
            {
                if (unique.indexOf(digit.length) != -1)
                {
                    // trace(digit);
                    count++;
                }
   	        }
        }
        return count;
    }
    
    function test2(displays:Array<Display>, log = false)
    {
        var count = 0;
        for (display in displays)
        {
            var found = 0;
            var ordered:Array<Signal> = [for (i in 0...10) null];
            var signals = display.signals.copy();
            var segments = new Map<Segment, Segment>();
            ordered[1] = signals.shift();
            ordered[7] = signals.shift();
            ordered[4] = signals.shift();
            ordered[8] = signals.pop();
            segments[A] = ordered[7].sansLone(ordered[1]);
            
            // find 6
            for (i in 3...signals.length)
            {
                var missingLetter = ordered[8].sansLone(signals[i]);
                if (ordered[1].has(missingLetter))
                {
                    ordered[6] = signals.splice(i, 1)[0];
                    segments[C] = missingLetter;
                    break;
                }
            }
            
            // find 0
            for (i in 3...signals.length)
            {
                var missingLetter = ordered[8].sansLone(signals[i]);
                if (ordered[4].has(missingLetter))
                {
                    ordered[0] = signals.splice(i, 1)[0];
                    segments[D] = missingLetter;
                    break;
                }
            }
            
            // find 9
            ordered[9] = signals.pop();
            segments[E] = ordered[8].sansLone(ordered[9]);
            
            // find 5
            for (i in 0...signals.length)
            {
                var missingLetters = ordered[6].sans(signals[i]);
                // trace(l, segments["e"], segments["c"]);
                if (missingLetters.length == 1 && missingLetters[0] == segments[E])
                {
                    ordered[5] = signals.splice(i, 1)[0];
                    break;
                }
            }
            
            if (ordered[5] == null)
                throw "couldn't find 5";
            
            //find 2
            if (signals[0].has(segments[E]) && signals[1].has(segments[E]))
                throw 'Unexpected: both remaining signals have e:${segments[E]}';
            else if (signals[0].has(segments[E]))
                ordered[2] = signals.shift();
            else
                ordered[2] = signals.pop();
            
            ordered[3] = signals.pop();
            
            if (log) trace('$ordered | ${display.digits}');
            
            var displayNum = 0;
            for (digitCode in display.digits)
            {
                var digit = ordered.indexOf(digitCode);
                if (digit == -1)
                    throw('missing code:$digitCode source:${display.signals}');
                
                displayNum *= 10;
                displayNum += digit;
            }
            count += displayNum;
            if (log) trace('+$displayNum = $count');
        }
        return count;
    }
}