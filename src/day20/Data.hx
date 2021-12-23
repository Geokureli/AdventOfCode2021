package day20;

class Data
{
    inline static public var DATA_RAW =
"######.#..##..######.....#...#.#...#.######.#.#...#..#..#..###.#####.#.####...#.#.#...#.#.#...#####..###.....#.#.....#.#.#..###..#.#.#####..#.....####.##.##..#..##.#.##.##..##.#####.####.#.#....#...#...#...#.#########..#..#####..#.#.###....#.##.###...##.#..#....##.###...#..##.#..#...#.#.#####.####...#.##..##..#.#######...#..##.##.....#..#..#.###...###.######..##.#..##.######....#.##.##...###.##..#.#.#.#########....####.####.#.#...#.#.#..#.#.##.#...#.#..#######..###..##.#..####.###...#.#.#.##.#####.##.###.#.

.##.##...#####.#######.##.##.#####..#.#.#.##.....##...#..#..###.#....###...##.....###......#..##...#
#..#...#.##..#.#..#....#...#...#....####..#.....#.#...##.#..##.##.##...#.#..#..####...#....##.##.##.
...#.#..#..###...##..#.##########...##...#.#.#.#.#####..###..###..##.#..#####..###......##.#.##...##
#..###.##.##...#.#..#.....#.##.#..#...#..####.#.#.##.###....#.#..#..##.#....#.#.#.###...###.#.####.#
...###.....###...##...#..######.###...##.#.##.###.#.#....###.##.###.###.###....######..##.#.#...#..#
###...#.##.#.###..#..#.####.#...#..#.#.#..#.#..#....###..##..####.##.##....#..##.#.##..#.#..#.#.##..
.###.##.#.....#.#.##.##.####.#..#.#..###.##...###..##..##.#.#...#..#.#####...#.####.#....######.#..#
..##.........##.##......##..#.#.#....#..####..#.#..###.##..#.##..####.#.#.##.#.#.##.....##....#.####
#..###..#...###.##.#.#....#.#....###....###...##.#..####.#####.#.##.#...#.#.#.##..#....#..#.#...##.#
###.#..#...#.##.#.#.#..#.####.###...##.####.#.#.........#.##..####.###..#.#...###..#.##..##...####..
#....###.##.##...###...##.###...#..##....#.##.#.##.#.##..#..##..#..#..#...#.##..##.###.#..##.#..###.
.#.#......##..#..#....#.##.#..##.##....#....#..###..##.##..###..#..#.#.##.#.##..#...#.#....#.#...#.#
#.#..#....#.##.##..#.###..##..####.##...##.#.#.###.#.#..#...#.##..#..#.###.....#.##.#####..#......#.
##.##...#.....##.....###.#..##...#.#...#.##..#........#######...#.###.#.#.##..##.#...###..#...#...#.
....###...###.#.#.#.###..#..####..######....###....####..##..#..#.#.###.#.#.#####...#..#.#.####...##
....#######.#....##...#####...###...#...#...#.#...#.###.#.####.#...#.#.#.###....#..#....#.#.#..##..#
#.####.###.#..#.#.#..#####.......##....####.##.####...#..###..#......#..#.#...#....##.....#.........
#..###.#..##.##..###.#.#.#.###.#....#.####.#.###.##.##..#...#.#.#..#..###..#..##......#.####..#.#.##
###.#..##.###....##.#####.###.....#....#####.#..#.#.#.##..#...##...###.##.##...###.##..#..#...#.#..#
#.#...#..#..#.###.#..#..##.#.#.....#.#.#....#.##...##.......####..#...#..#.......###..#.#.#....#..##
.##...##..#..#..####.##.......#...#.###..#..##.#.#.#.##..#..##.###.##.#.#.#..##.##.##..#..###.#..#.#
#...#.###.#......#...#.......##..##...##...#.#....##.#.##.##....##.######..##.##.####.#####....#.#..
#.##.####....##....#..#.#..#.####.#.####.###..##..#.....##.###.#...#...#..#..##.##.###...###.###.#.#
....#.##.##.###.#...#....#...###.#.#......#..#.###.#.#.#.#...#.#..###..#.##.#...##.######..#..####..
####...#.#.###.#...#.......##..#.#######...##...##..##......###.#####.#.#.#.###.#..#.#..##.##..###.#
#.#......#.#.####..##.##...#..######..#.#..#...#..#.####.#.##.#####.#..##..##.#.###.#.#.##.#.#.##.#.
..#.#..#.#...###.#..#.#.##.#.#....###.#..###..##..#######.#.##.####.....#.####.#.##.#...#####......#
#######...##.#.#.###..###.#..##..##...####..###.#.##.##.##...#.##.##.##....#.#..#.###...###.#.#.#...
.##.##..####..#.###########....#...#.#..##......##......#.#..###.##....#..#..#.#..###########..##.##
#....##...###..#.#.###.##......###.#.###.######.#..#.###.#.#.##..#....###.###.#.....#..#..#.#####..#
.######..#.###...###.#..##..#.####.###...###.#.#.####.########.#...#.#.##....####.###.#.##.###...#.#
###..##.##.....#...#.##...#.###...#.#.####..#.##..##..#....#..##.#######.##...#####...##.#...##.##..
###.#.#..###..##.#...####.#..###....###..###..###.###..#.##...#.....#...###.##.#.###.#####.#.##.#.#.
###..######.....#..#.....##.##.##.##...#.#..####....###.#.##...####.#....##.......##.#..###......#.#
##..#.###.##.######.#.##.#...#...###......##.###....##...#.#####.#.##.....#.#..#...####...###...##..
...###..###..##.##..####...##....##.#...#.##..###.###.####...##.#.#.##.#....#.#.###.#..#..#..#.#.##.
..#.###.#.#...#.###..##..##....#.#...#.##.####....#.#.#.#..###.#.#....###.##.#.#...#...#...#..##.#..
###...#.##..##.#..###.#.###.#..#.#.##.#.###...###.#...##.#.......#.#.###....####.....###.##.##.#.#..
.#.####..##.#.#..#######..#..###.#########.#...##..#..##.#.....#.#.##.#.....#.#######..###.....##..#
####.##....#..##.....#...#.#....##.#...####..###.###..#......###.###....##.#.#....###.###.#####..#..
.#.#...##.##.#...#.#...##..###.##..####.###..#....#######..#..##...#####..##...#.#.#######.####.#...
.#.###.######...##.##.#.##...####.#.......#.####.##.#.##.##.####.#...#.#..##....#####.##.#.##..#.#..
..#.#..###.....##....#.###....####.#.##.######..###.##..############.#...#...###.##.#..##.#..####..#
.#.....#.###.#.##....#...#.#####.#.#.##..#...###..##....#..#......#####.#.###..#..####...#####......
.##..#..........##.#.######....##.#.#...###.........#.##..##.......#..#.##......###.....##....#....#
#...#..#.#.#.#.#.####.#..#...#....##.#.#.#....##..#####......##.###.##..#..##...#.##...#....#.##.#..
...#..#.##.####.###.####....##...#......###.###.##....#...##.##.#..#.##.#.....#.##.#.##.##.#.###...#
..#..##.##.#.#####...#..###.#..###..#.####...#.#.##.#...#...#.#.#.###.#.#..##.##..#.##..#....#..###.
..#.#.###...##.#...#.#.#####...###.##...#..###.....#...##.#....##...###.##.####..#..##....#####.##.#
..#.#...#.###...##.##....##.####.....##.##....###..#...#.###..##.#.#.#.##..##...##....#.###.####.#.#
#...#####.##.#.#.#.#...#..###..#.##..##....#..#.###...#.####.###.##.#.##.##......####.....#####..###
.#.#.....#.######.#..#.##..###..#.###.###.##..#.##.....#......#..##.#...###.###..#.#..#.###...#.####
####.##.##.###..#.##.##.#.###.#...##...#..#.###.....#..##..###..#.#..#...#.##.#..#.##.#..#..#.#..#.#
#####.##.####.#######.#.##..##..#.#####..#..#.###..###..#..#.##...#..##.#####...###.#..##.#.###.#..#
...##..##.#.#.###..#.##.#.###....#...###.#####.#.#.#.#......#.###..#..##..#........#.#..#.##..#....#
#.#..#####.##.###...#...###..#.###.......#.#..#..#.#...###....####.###........#.###.####..####.#..#.
........#.##....#.##...#..##...##.####.##.#.##..##......###.#..#.#####..##.#.......##....##..##..#.#
..####.##...###..#####...#..####..###.##.#.#.#.#.....##.##...#.#....###..#..#.##....#...#.####...##.
..##..#.##....##.####.#.#..####.....#.###..#...##..##.#......##...###.....##.....#....##...##.##..##
.#.##...#####..##.##.#..#...#####....#.....#.##.#.##..#...###########...###..#.##.###....#.##.#####.
####......####.#####..###...#.####..#.#..###..#...##..##..#.#.#####.###.##.##..#####.##.#.###.##..#.
##.#..#.####.##..#..#.###.....###.#####.#.#####......#...##..#....##.#.##..###.#####..#.##.#..#..###
.##..####..###....#...#..#.###.#.##..#..#.###..###.##.##...#...##.#..#...#.###..#.###.#.##..##.##.##
#.##..##.#....###.###...#.#.###..#.######..##.#....###.#.###.####..#...#.#..#.#.##.###...##...#.#...
#.#.##.#..#.##....###..###...#...#.#..##.#..##.#..#.##..#.#..####.#....###.#..##..#...#.###.###..#.#
##.##..#####..##.##.##.##..#.....###..#..###..#.##.##.##.#..##.#..#..###.####..#.#####.##.#####.#.##
...###.#...#...###......###.#....##..##.##..########..###....###.####.#..###.######.##.......####.##
##.#.#..#.##.##..#...#...#....#....#....##.#..##.#......#.#.#.#...#.#.####.#.##..#..#.##.##.####...#
##.##...#.#.#.##..#.#....##...###.#####..###..#.###.###.#..###......##.###....##.#.##.####....#####.
.#.#.#####.#......#.##.#.###.#...#.##..#.#....###.##...#...#..##.####..####..###...#..##......###...
###.....##...#######..#.####.....#...#.#...#..#.###.##..#.#....#.#####..##.#.#.#####..#.#.####.#.##.
..#..##..#.#..#...#.#.....##.#.#..##..#.#...#.##.....#...###..##..#.#.#..####..#..#.#.###...#.##.#.#
#...##..#.######.##.#.###.#....#..#.#....#...########.....#####.####....#.##.##..#.#.#...#..##..###.
.#####..####.#..#..#.##.#...#..##.#..##...#....##.#.###......#.......#.....###.....##.####...##..###
##.#...#......###.#.....#..#######.##..#.#.#####..#....##..#..##.#...#.##..#...#.#...#.#.##.#.#####.
#.###..#.####..##..#######....#######..##...###..#.#..#....#.####....#...####.#..###.####...##.#.##.
.#..##..#.#.#.#######...#.#.#.#..#.....###.##..###...#.#.##.#..#.##...#..##..#...#.#...###...####...
...#.#.#.....#.######..##..#.###.###.#.#.###..#....##...###......#.##..#####...###...#...##.#...##..
#.#.......#.##......#...######.....#.###..#####..#.###.##..##...###.##..######...##.#..###.##.#..#.#
....#..##.#.....###.###.#....###..####....#.....###..#.....##.##.##.#..#.#.##...#.##..#.#....###...#
####....#.###..########.##......###....#####.#.#..###.#.#.##.######.#...##...#.###.##.#.....####..##
#####.####....#....###...#.#.#.###.#####..##...#...#.##..#######...#......#...#..####.##......#####.
..##.##.#..#.#.##..##.##..#..#....#.....#######...#..#......#.#.##...#.#.#....###...##..##.#...#.##.
.##.##.#....##.###....#.####....####..##....######.....####.####.#..#.....#####.##.#.##.######....#.
..#...#......##...#..#.#...#.#####..###..#.#..####....#...##.....#.#.#.##.##..#.#.###.##..#.####.#..
.#..#.##.#...#....####.##..##..#####..#..#.#####...##.#.#..####.#...##....#..#####.##.##..##.#..#..#
.##..#.###...#.#..###.###.#......######..#.#.####...#...#..##.########.##..#.###......#.##.#...#.#.#
...#.#..##..#....#..#####.#..######.#..#.#.#...##.######..##..####......#.##.##.#..#..#.##.##...#.#.
#..#.###.####.#.....#...#.....#..##.......#...#..###.###.#.....#.##.#..#.###....##..#...##.#....#...
.##...#..##..##.##...##.##..#.#.#..#.#.#####.####....#....#.#..#..#.#..#...#..#....#.#.#.######....#
#..##.##..#...#....#####....#####...#..#.##.##..##.#..#####.#..####.##.#.#####.#..##.#......##.#..##
#...##.#...#..###....####.##.#.#..#.#.#.#.#..#.#..#..##.#.#.#####...##.##.##.##.##.###...##..#...#.#
#.#..###.....#..####.#.###.######...#######.####..#..##..#.....##.###..#.#.##.###.#.#..##.#.###..###
....###..###.###....####....##..##...#..#...##.#...###..#..#.##...#......###.####...#...#..#.....#.#
#.#..##.##.....####.#..##...#.##.#..#.#.....##.####.#.##.##..#.....####.###.##..##...##...##.#..##.#
######..#.###.##..#......#.###.#.#.....##.###...##..##.###....##....##.##.#.#.#...#..#..#..###..#..#
..#...#...######.##.#.##..#.#.#.#.#.#.#####.####.######.####.##.#.#.#.#....#..#....####.#.##..#.#.##
####..#.##.#..###...##...###.###.####...#.##.####.###.###.##..####.##.#....#..###..#..##.##.#.....#.
.##.##.##.....#######.#..##.#...#.#####.#....##..#...#..##...##...#..#.#..#...#.#..#.###.###.##.###.
...##.#.#.##..#..#..#.#.....##..#.##..##.#..###..#...###......#.###..##..#####..##.###.##....#.##.#.";
}
