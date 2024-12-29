(use judge)

(import "./solve")

(def example
"..........\n
..###.##..\n
...####...\n
..######..\n
..######..\n
...####...\n
.........."
)
(def edge-case
    (solve/parse-grid
        (string
            "..#######..\n"
            "#..#####..#\n"
            "##..###..##\n"
            "###..#..###\n"
            "####...####\n"
            "###..#..###\n"
            "##..###..##\n"
            "#..#####..#\n"
            "..#######.."
        )
    )
)

(test (solve/part1 example) 35)
(test (solve/part2 example) 35)
(test (solve/part3 example) 29)

(test (solve/part1 "###\n###\n###") 10)
(test (solve/mine edge-case solve/cardinal-neighbors)
  @[@[0 0 1 1 1 1 1 1 1 0 0]
    @[1 0 0 1 2 2 2 1 0 0 1]
    @[1 1 0 0 1 2 1 0 0 1 1]
    @[1 2 1 0 0 1 0 0 1 2 1]
    @[1 2 2 1 0 0 0 1 2 2 1]
    @[1 2 1 0 0 1 0 0 1 2 1]
    @[1 1 0 0 1 2 1 0 0 1 1]
    @[1 0 0 1 2 2 2 1 0 0 1]
    @[0 0 1 1 1 1 1 1 1 0 0]]
)
(test (solve/mine edge-case solve/cardinal-and-diagonal-neighbors)
  @[@[0 0 1 1 1 1 1 1 1 0 0]
    @[1 0 0 1 1 2 1 1 0 0 1]
    @[1 1 0 0 1 1 1 0 0 1 1]
    @[1 1 1 0 0 1 0 0 1 1 1]
    @[1 2 1 1 0 0 0 1 1 2 1]
    @[1 1 1 0 0 1 0 0 1 1 1]
    @[1 1 0 0 1 1 1 0 0 1 1]
    @[1 0 0 1 1 2 1 1 0 0 1]
    @[0 0 1 1 1 1 1 1 1 0 0]]
)
