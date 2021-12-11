package day6;

import haxe.Int64;
import day6.Data;
import day6.Data.Fish.*;

class Test extends BaseTest
{
    public function new()
    {
        super();
        trace("brute sample: " + brute(Fish.sample, 18));
        trace("brute answer 1: " + brute(Fish.list, 80));
        trace("omptimized sample: " + optimized(Fish.sample, 18));
        trace("omptimized answer 1: " + optimized(Fish.list, 80));
        trace("omptimized answer 2: " + optimized(Fish.list, 256));
    }
    
    static function brute(fish:Array<Int>, days:Int)
    {
        fish = fish.copy();
        while (days-- > 0)
        {
            var i = fish.length;
            while (i-- > 0)
            {
                fish[i] = fish[i] - 1;
                if (fish[i] < 0)
                {
                    fish[i] += SPAWN_RATE;
                    fish.push(CYCLE_START);
                }
            }
        }
        return fish.length;
    }
    
    static function optimized(fish:Array<Fish>, days:Int)
    {
        var fishPerCycle:Array<Int64> = [for (i in 0...SPAWN_RATE) 0];
        var newFish:Array<Int64> = [0, 0];
        
        for (f in fish)
            fishPerCycle[f.cycle]++;
        
        while(days-- > 0)
        {
            newFish.push(fishPerCycle[0]);
            fishPerCycle.push(fishPerCycle.shift());
            fishPerCycle[SPAWN_RATE - 1] += newFish.shift();
        }
        
        while(fishPerCycle.length > 1)
            fishPerCycle[0] += fishPerCycle.pop();
        
        return fishPerCycle[0] + newFish[0] + newFish[1];
    }
    
    inline static function coord(x:Int, y:Int, col:Int) return y * col + x;
}