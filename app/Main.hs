module Main where
import System.IO

import Day01
import Day02
import Day03

days :: [IO ()]
days = [Day01.main, Day02.main, Day03.main]

main :: IO ()
main = do
    putStr "Day: "
    hFlush stdout
    day <- getLine
    days !! (read day - 1)
