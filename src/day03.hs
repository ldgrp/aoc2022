module Day03 where
import Data.List
import Data.Char
import Data.List.Split

part1 :: String -> Int
part1 = sum . fmap (score . head . uncurry intersect) . parse
    where parse = fmap (splitAt =<< flip div 2 . length) . lines 

part2 :: String -> Int
part2 = sum . fmap (score . head) . parse
    where 
        parse = fmap f . chunksOf 3 . lines
        f (a:b:c:_) = intersect (intersect a b) c
        f _ = []


score :: Char -> Int
score c 
    | isAsciiLower c = ord c - ord 'a' + 1
    | otherwise = ord c - ord 'A' + 27

main :: IO ()
main = do
    input <- readFile "inputs/input03.txt"
    print (part1 input)
    print (part2 input)

