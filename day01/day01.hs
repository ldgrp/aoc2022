import Data.List

part1 :: [[Int]] -> Int
part1 = head . reverse . sort . fmap sum 

part2 :: [[Int]] -> Int
part2 = sum . take 3 . reverse . sort . fmap sum 

main = do
    nums <- fmap (fmap read) <$> filter (/=[""]) <$> groupBy (\a b -> a /= "" && b /= "") <$> lines <$> readFile "input01.txt"
    print (part1 nums)
    print (part2 nums)
