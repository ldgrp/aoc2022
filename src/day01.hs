module Day01 where
import Data.List

part1 :: String -> Int
part1 = head . reverse . sort . fmap sum . parse

part2 :: String -> Int
part2 = sum . take 3 . reverse . sort . fmap sum . parse

parse :: String -> [[Int]]
parse = fmap (fmap read) . filter (/=[""]) . groupBy (\a b -> a /= "" && b /= "") . lines

main :: IO ()
main = do
    nums <- readFile "inputs/input01.txt"
    print (part1 nums)
    print (part2 nums)
