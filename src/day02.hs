module Day02 where
import Data.List

data Move = Rock | Paper | Scissors deriving (Eq, Show)
data State = Win | Draw | Lose deriving (Eq, Show)

part1 :: String -> Int
part1 = sum . fmap (uncurry score) . parseMoves

part2 :: String -> Int
part2 = sum . fmap (uncurry score') . parseMoveAndState

score :: Move -> Move -> Int
score a b = shapeScore b + winScore a b

score' :: Move -> State -> Int
score' a b = score a (predictMove a b)

shapeScore :: Move -> Int
shapeScore Rock = 1
shapeScore Paper = 2
shapeScore Scissors = 3

winScore :: Move -> Move -> Int
winScore Rock Paper = 6
winScore Scissors Rock = 6
winScore Paper Scissors = 6
winScore Rock Scissors = 0
winScore Scissors Paper = 0
winScore Paper Rock = 0
winScore _ _ = 3

predictMove :: Move -> State -> Move
predictMove Rock Win = Paper
predictMove Rock Lose = Scissors
predictMove Paper Win = Scissors
predictMove Paper Lose = Rock
predictMove Scissors Win = Rock
predictMove Scissors Lose = Paper
predictMove m Draw = m

parseMoves :: String -> [(Move, Move)]
parseMoves = fmap f . fmap (fmap parseMove) . fmap words . lines
    where f (a:b:_) = (a,b)

parseMoveAndState :: String -> [(Move, State)]
parseMoveAndState = fmap f . fmap words . lines
    where f (a:b:_) = (parseMove a, parseState b)


parseMove :: String -> Move
parseMove "A" = Rock
parseMove "X" = Rock
parseMove "B" = Paper
parseMove "Y" = Paper
parseMove "C" = Scissors
parseMove "Z" = Scissors

parseState :: String -> State
parseState "X" = Lose
parseState "Y" = Draw
parseState "Z" = Win

main :: IO ()
main = do
    input <- readFile "inputs/input02.txt"
    print (part1 input)
    print (part2 input)
