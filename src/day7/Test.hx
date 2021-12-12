package day7;

import day7.Data;

class Test extends BaseTest
{
    public function new()
    {
        super();
        Crab.runTests();
        // Crabs.list.sort((a,b)->a-b);
        trace("brute answer 1: "     + brute    (Crab.list.copy(), true));
        trace("brute answer 2: "     + brute    (Crab.list.copy(), false));
        trace("optimized answer 1: " + optimized(Crab.list.copy(), true));
        trace("optimized answer 2: " + optimized(Crab.list.copy(), false));
    }
    
    function brute(crabs:Array<Crab>, linear:Bool, log = false)
    {
        var numChecks = 0;
        crabs.sort((a,b)-> { numChecks++; return a-b; });
        var min = crabs[0];
        var max = crabs[crabs.length - 1];
        var byPos = CrabMap.fromList(crabs);
        numChecks += crabs.length;
        var uniquePositions = 0;
        for (i in byPos.keys())
            uniquePositions++;

        var minFuel = Math.POSITIVE_INFINITY;
        for (i in min...max + 1)
        {
            var fuel = byPos.fuelUsageTo(i, linear);
            numChecks += crabs.length;
            if (log) trace('$i: $fuel');
            if (fuel < minFuel)
                minFuel = fuel;
        }
        if (log) trace('length: ${crabs.length} brute checks: $numChecks');
        
        return minFuel;
    }
    
    function optimized(crabs:Array<Crab>, linear:Bool, log = false)
    {
        final byPos = CrabMap.fromList(crabs);
        var sum = 0;
        var uniquePositions = 0;//for logging
        for (pos in byPos.keys())
        {
            uniquePositions++;
            sum += byPos.get(pos);
        }
        
        var i = Math.floor(sum / crabs.length);// mean
        var numChecks = crabs.length + uniquePositions;
        var minFuel = byPos.fuelUsageTo(i, linear);
        var fuel = byPos.fuelUsageTo(++i, linear);
        var inc = 0;
        if (fuel < minFuel)
            inc = 1; // check higher
        else
        {
            inc = -1; // check lower
            i -= 2;
            fuel = byPos.fuelUsageTo(i, linear);
            numChecks += uniquePositions;
        }
        
        while (fuel < minFuel)
        {
            // if (log) trace('$i: $fuel');
            minFuel = fuel;
            i += inc;
            fuel = byPos.fuelUsageTo(i, linear);
            numChecks += uniquePositions;
        }
        if (log) trace('length: ${crabs.length} optimized checks: $numChecks');
        
        return minFuel;
    }
}