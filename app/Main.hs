module Main where
import System.IO

import Day01
import Day02
import Day03
import Day04
import Day05
import Day06

days :: [IO ()]
days = [Day01.main, Day02.main, Day03.main, Day04.main, Day05.main, Day06.main]

main :: IO ()
main = do
    putStr "Day: "
    hFlush stdout
    day <- getLine
    days !! (read day - 1)
