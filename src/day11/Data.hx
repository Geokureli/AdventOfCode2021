package day11;

abstract Cell(Int) from Int
{
    static public var sample:Grid
        = Data.SAMPLE_RAW.split("\n")
        .map(s->s.split("").map(Std.parseInt));
    
    static public var grid:Grid
        = Data.DATA_RAW.split("\n")
        .map(s->s.split("").map(Std.parseInt));
}

@:forward
abstract Grid(Array<Array<Int>>) from Array<Array<Int>>
{
    public var columns(get, never):Int;
    public function get_columns() return this[0].length;
    public var rows(get, never):Int;
    public function get_rows() return this.length;
    
    public function new(columns:Int, rows:Int)
    {
        this = [for (i in 0...rows) [for (i in 0...columns) 0]];
    }
    
    public function copy()
    {
        return this.map(a->a.copy());
    }
    
    public function step()
    {
        for (x in 0...columns)
            for (y in 0...rows)
                increment(x, y);
        
        resetFlashes();
    }
    
    inline public function get(x, y)
        return this[y][x];
    
    inline public function set(x, y, value)
        return this[y][x] = value;
    
    public function addToNeighbors(x, y)
    {
        final l = x > 0;
        final u = y > 0;
        final r = x < columns - 1;
        final d = y < rows - 1;
        
        if (l) increment(x-1, y);
        if (u) increment(x, y-1);
        if (r) increment(x+1, y);
        if (d) increment(x, y+1);
        if (l && u) increment(x-1, y-1);
        if (l && d) increment(x-1, y+1);
        if (r && u) increment(x+1, y-1);
        if (r && d) increment(x+1, y+1);
    }
    
    public function increment(x, y)
    {
        var value = get(x, y);
        if (value == 9)
        {
            set(x, y, -1);
            addToNeighbors(x, y);
        }
        else if (value > -1)
            set(x, y, value + 1);
    }
    
    public function resetFlashes()
    {
        for (x in 0...columns)
        {
            for (y in 0...rows)
            {
                if (get(x, y) == -1)
                    set(x, y, 0);
            }
        }
    }
    
    public function iterator() return new GridIterator(this);
    
    public function toString()
    {
        return this.map(a->a.join("")).join("\n");
    }
}

class GridIterator
{
    var grid:Grid;
    var i:Int;
    
    public function new(grid:Grid)
    {
        this.grid = grid;
        i = 0;
    }
    
    public function hasNext()
    {
        return i < grid.rows * grid.columns;
    }
    
    public function next()
    {
        var cell = grid.get(i % grid.columns, Std.int(i / grid.columns));
        i++;
        return cell;
    }
}

class Data
{
    inline static public var SAMPLE_RAW =
"5483143223
2745854711
5264556173
6141336146
6357385478
4167524645
2176841721
6882881134
4846848554
5283751526";

    inline static public var DATA_RAW =
"3113284886
2851876144
2774664484
6715112578
7146272153
6256656367
3148666245
3857446528
7322422833
8152175168";
}
