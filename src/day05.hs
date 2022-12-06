module Day05 where

type Moves = [String]
type Drawing = String

part1 :: String -> Int
part1 = _

part2 :: String -> Int
part2 = _

parse :: String -> (Moves, Drawing)
parse = _

main :: IO ()
main = do
    input <- readFile "inputs/input05.txt"
    print (part1 input)
    print (part2 input)