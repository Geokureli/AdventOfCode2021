package day5;

import day5.Data;

class Test extends BaseTest
{
    public function new()
    {
        super();
        trace("test1 answer: " + test1(Lines.list, Lines.columns));
        trace("test2 answer: " + test2(Lines.list, Lines.columns));
    }
    
    function test1(list:Array<Line>, columns:Int, simple = true)
    {
        var map = new Map<Int, Int>();
        var overlaps = 0;
        function plot (x, y, log = false)
        {
            if (this.plot(x, y, map, columns, log))
                overlaps++;
        }
        for (line in list)
        {
            switch line
            {
                case R(y, x1, x2): for (x in x1...x2 + 1) plot(x, y);
                case U(x, y1, y2): for (y in y1...y2 + 1) plot(x, y);
                        case _ if (simple): false;// do nothing
                case UR(x, y, len): for (i in 0...len + 1) plot(x+i, y+i);
                case DR(x, y, len): for (i in 0...len + 1) plot(x+i, y-i);
                default: throw "Unhandled case: " + line;
            }
        }
        return overlaps;
    }
    
    function test2(list, columns)
    {
        // list = list.splice(0, 10);
        return test1(list, columns, false);
    }
    
    function plot(x, y, map:Map<Int, Int>, columns, log = false)
    {
        var i = coord(x, y, columns);
        if (log) trace(x, y);
        if (map.exists(i))
        {
            map[i] = map[i] + 1;
            return map[i] == 2;
        }
        map[i] = 1;
        
        return false;
    }
    
    //610,444 -> 680,374 = DR(610,444, 70)//DR
    //540,643 -> 190,293 = UR(190,643,350)//DL - X
    // 38,101 -> 921,984 = UR( 38,101,883)//UR
    //967, 30 ->  17,980 = DR( 17, 30,950)//UL
  
    inline function coord(x:Int, y:Int, col:Int) return y * col + x;
}