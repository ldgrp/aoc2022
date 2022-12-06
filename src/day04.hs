module Day04 where
import Data.Char
import Data.List

data Line = Line Int Int deriving (Show)

part1 :: String -> Int
part1 = length . filter (== True) . fmap (uncurry overlapsCompletely) . parse

part2 :: String -> Int
part2 = length . filter (== True) . fmap (uncurry overlaps) . parse

parse :: String -> [(Line, Line)]
parse = fmap parse' . lines 
    where parse' = parse'' . fmap read . filter (and . fmap isDigit). groupBy (\a b -> isDigit a && isDigit b)
          parse'' (a:b:c:d:_) = (Line a b, Line c d)

overlapsCompletely :: Line -> Line -> Bool
overlapsCompletely (Line startA endA) (Line startB endB) = 
    startA >= startB && endA <= endB || startB >= startA && endB <= endA

overlaps :: Line -> Line -> Bool
overlaps (Line startA endA) (Line startB endB) = 
    startA <= endB && endA >= startB

main :: IO ()
main = do
    input <- readFile "inputs/input04.txt"
    print (part1 input)
    print (part2 input)
