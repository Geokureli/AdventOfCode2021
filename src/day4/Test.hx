package day4;

import day4.Data;

class Test
{
    public function new()
    {
        trace("test1 answer: " + test1(Bingo.callList, Bingo.cards));
        trace("test2 answer: " + test2(Bingo.callList, Bingo.cards));
    }
    
    static public function test1(callList:Array<Int>, cards:Array<Card>)
    {
        for (num in callList)
        {
            for (card in cards)
            {
                if (card.callAndCheckBingo(num))
                    return num * card.getUncalledSum();
            }
        }
        
        return -1;
    }
    
    static public function test2(callList:Array<Int>, cards:Array<Card>)
    {
        cards = cards.copy();
        for (num in callList)
        {
            var i = cards.length;
            while (i-- > 0)
            {
                if (cards[i].callAndCheckBingo(num))
                {
                    if (cards.length == 1)
                        return num * cards[0].getUncalledSum();
                    
                    cards.remove(cards[i]);
                }
            }
        }
        return 0;
    }
}