class Main
{
    static public function main():Void
    {
        #if (!day) #error "You did not specify a day";
        #elseif (day ==  -1)
            // test all days 
            new  day3.Test();
            new  day4.Test();
            new  day5.Test();
            new  day6.Test();
            new  day7.Test();
            new  day8.Test();
            new  day9.Test();
            new day10.Test();
            new day11.Test();
            new day12.Test();
            new day13.Test();
            // new day14.Test();
            // new day15.Test();
            // new day16.Test();
            // new day17.Test();
            // new day18.Test();
            // new day19.Test();
            // new day20.Test();
            // new day21.Test();
            // new day22.Test();
            // new day23.Test();
            // new day24.Test();
            // new day25.Test();
        #elseif (day ==  3) new  day3.Test();
        #elseif (day ==  4) new  day4.Test();
        #elseif (day ==  5) new  day5.Test();
        #elseif (day ==  6) new  day6.Test();
        #elseif (day ==  7) new  day7.Test();
        #elseif (day ==  8) new  day8.Test();
        #elseif (day ==  9) new  day9.Test();
        #elseif (day == 10) new day10.Test();
        #elseif (day == 11) new day11.Test();
        #elseif (day == 12) new day12.Test();
        #elseif (day == 13) new day13.Test();
        #elseif (day == 14) new day14.Test();
        #elseif (day == 15) new day15.Test();
        #elseif (day == 16) new day16.Test();
        #elseif (day == 17) new day17.Test();
        #elseif (day == 18) new day18.Test();
        #elseif (day == 19) new day19.Test();
        #elseif (day == 20) new day20.Test();
        #elseif (day == 21) new day21.Test();
        #elseif (day == 22) new day22.Test();
        #elseif (day == 23) new day23.Test();
        #elseif (day == 24) new day24.Test();
        #elseif (day == 25) new day25.Test();
        #else #error "Invalid day";
        #end
    }
}