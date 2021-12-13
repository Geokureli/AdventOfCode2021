package day11;

import day11.Data;

class Test extends BaseTest
{
    public function new()
    {
        super();
        trace("test1 sample: " + test1(Cell.sample, 100, logNone));
        trace("test1 answer: " + test1(Cell.grid, 100, logNone));
        trace("test2 sample: " + test2(Cell.sample, logNone));
        trace("test2 answer: " + test2(Cell.grid, logNone));
    }
    
    function test1(grid:Grid, days:Int, log:Logger)
    {
        grid = grid.copy();
        var totalDays = days;
        var flashes = 0;
        while (days-- > 0)
        {
            grid.step();
            
            for (cell in grid.iterator())
            {
                if (cell == 0)
                    flashes++;
            }
            
            log.info('day ${totalDays - days}: flashes:$flashes');
        }
        return flashes;
    }
    
    function test2(grid:Grid, log:Logger, cap = 1000)
    {
        grid = grid.copy();
        log.info('start:\n$grid');
        var day = 1;
        var synced = false;
        while (synced == false && day < cap)
        {
            grid.step();
            
            synced = true;
            var i = grid.get(2, 5);
            var amt = 0;
            for (cell in grid.iterator())
            {
                if (cell != i)
                {
                    synced = false;
                    day++;
                    break;
                }
                amt++;
            }
            
            log.info('day:$day synced:$synced amt:$amt');
            log.verbose('\n$grid');
        }
        return day;
    }
}