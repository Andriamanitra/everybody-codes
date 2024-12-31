module Solve (part1, part2, part3) where

import Data.List (sort)

part1 s = sum $ distToTargetDepth <$> nums
  where
    nums = read <$> lines s
    targetDepth = minimum nums
    distToTargetDepth depth = depth - targetDepth

part2 = part1

part3 s = sum $ distToTargetDepth <$> nums
  where
    nums = read <$> lines s
    targetDepth = sort nums !! (length nums `div` 2)
    distToTargetDepth depth = abs $ depth - targetDepth
