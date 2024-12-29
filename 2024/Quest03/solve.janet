(defn parse-grid [s]
    (peg/match
        ~{
            :main (sequence :row (any (sequence "\n" :row)))
            :row (group (some (choice :mine :outside)))
            :mine (/ "#" 9001)
            :outside (/ "." 0)
        }
        s
    )
)
(defn cardinal-neighbors [i j depth]
    (def d (inc depth))
    @[[(inc i) j d] [(dec i) j d] [i (inc j) d] [i (dec j) d]]
)

(defn cardinal-and-diagonal-neighbors [i j depth]
    (def d (inc depth))
    (seq
        [
            ni :range-to [(dec i) (inc i)]
            nj :range-to [(dec j) (inc j)]
            :when (not= [ni nj] [i j])
        ]
        [ni nj d]
    )
)

(defn mine [grid neighbors]
    (defn fill-from [i j depth]
        (def q (neighbors i j depth))
        (each [i j d] q
            (def v (get-in grid [i j]))
            (when (and (not (nil? v)) (> v d))
                (put-in grid [i j] d)
                (array/push q ;(neighbors i j d))
            )
        )
    )

    # handle edges of the map
    (loop [[i row] :pairs grid]
        (fill-from i -1 0)
        (fill-from i (length row) 0)
    )
    (loop [j :keys (first grid)]
        (fill-from -1 j 0)
    )
    (loop [j :keys (last grid)]
        (fill-from (length grid) j 0)
    )

    (loop [[i row] :pairs grid [j sq] :pairs row :when (= sq 0)]
        (fill-from i j 0)
    )
    grid
)


(defn part1 [s]
    (-> s
        (parse-grid)
        (mine cardinal-neighbors)
        (flatten)
        (sum)
    )
)

(def part2 part1)

(defn part3 [s]
    (-> s
        (parse-grid)
        (mine cardinal-and-diagonal-neighbors)
        (flatten)
        (sum)
    )
)
