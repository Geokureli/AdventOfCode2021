package day3;

import day3.Data;

class Test extends BaseTest
{
    public function new()
    {
        super();
        var bits = Bits.list;
        trace("test1 answer: " + test1(bits));
        trace("test2 answer: " + test2(bits));
    }
    
    static public function test1(list:Array<Bits>)
    {
        var count = [for (i in 0...12) 0];
        for (bits in list)
        {
            for (i in bits.keys())
                if (bits[i]) count[i]++;
        }
        
        var gamma = new Bits();
        for (i in gamma.keys())
            gamma[i] = count[i] * 2 > list.length;
        
        return gamma.int * gamma.getFlipped();
    }
    
    static public function test2(list:Array<Bits>)
    {
        var commonList = list;
        for (i in 0...12)
        {
            final r = 12 - i - 1;
            var count = 0;
            for (bits in commonList)
            {
                if (bits[r]) count++;
            }
            
            final moreOnes = count * 2 >= commonList.length;
            commonList = commonList.filter(b->b[r] == moreOnes);
            if (commonList.length == 1)
                break;
        }
        
        var common = commonList[0];
        // trace("common:" + common);
        
        var uncommonList = list;
        for (i in 0...12)
        {
            final r = 12 - i - 1;
            var count = 0;
            for (bits in uncommonList)
            {
                if (bits[r]) count++;
            }
            
            final moreOnes = count * 2 >= uncommonList.length;
            uncommonList = uncommonList.filter(b->b[r] != moreOnes);
            if (uncommonList.length == 1)
                break;
        }
        
        var uncommon = uncommonList[0];
        // trace("uncommon:" + uncommon);
        
        return common.int * uncommon.int;
	}
}