package day9;

import day9.Data;

class Test extends BaseTest
{
    public function new()
    {
        super();
        trace("lowest answer: " + lowest(HeightMap.data));
        trace("lowest sample: " + lowest(HeightMap.sample));
        trace("basins answer: " + basins(HeightMap.data));
        trace("basins sample: " + basins(HeightMap.sample));
    }
    
    static function lowest(heightMap:Array<Array<Int>>)
    {
        var rows = heightMap.length;
        var cols = heightMap[0].length;
        
        inline function getHeight(x, y)
            return heightMap[y][x];
        
        inline function isLower(height, x, y)
            return x < 0 || y < 0
                || x >= cols || y >= rows
                || getHeight(x, y) > height;
        
        var count = 0;
        for (y in 0...heightMap.length)
        {
            for (x in 0...heightMap[y].length)
            {
                var height = getHeight(x, y);
                if (isLower(height, x+1, y+0)
                &&  isLower(height, x-1, y+0)
                &&  isLower(height, x-0, y+1)
                &&  isLower(height, x-0, y-1))
                    count += height + 1;
            }
        }
        return count;
    }
    
    static function basins(heightMap:Array<Array<Int>>)
    {
        heightMap.copy();// so i can edit
        var rows = heightMap.length;
        var cols = heightMap[0].length;
        
        inline function getHeight(x, y)
            return heightMap[y][x];
        
        inline function setHeight(x, y, value)
            return heightMap[y][x] = value;
        
        function isBasin(x, y)
            return x >= 0 && y >= 0
                && x < cols && y < rows
                && getHeight(x, y) < 9;
        
        function getBasinSize(x, y)
        {
            if (isBasin(x, y) == false)
                return 0;
            
            // hide from further checks
            setHeight(x, y, 9);
            
            // recursive! D: is that legal?
            return 1
                + getBasinSize(x+1, y+0)
                + getBasinSize(x-1, y+0)
                + getBasinSize(x+0, y+1)
                + getBasinSize(x+0, y-1);
        }
        
        var basins:Array<Int> = [];
        
        for (y in 0...heightMap.length)
        {
            for (x in 0...heightMap[y].length)
            {
                var basinSize = getBasinSize(x, y);
                if (basinSize > 0)
                    basins.push(basinSize);
            }
        }
        basins.sort((a,b)->a-b);
        return basins.pop() * basins.pop() * basins.pop();
    }
}