module WordNumber where

import Data.List (intersperse)

digitToWord :: Int -> String
digitToWord 0 = "zero"
digitToWord 1 = "one"
digitToWord 2 = "two"
digitToWord 3 = "three"
digitToWord 4 = "four"
digitToWord 5 = "five"
digitToWord 6 = "six"
digitToWord 7 = "seven"
digitToWord 8 = "eight"
digitToWord 9 = "nine"
digitToWord n = wordNumber n

digits :: Int -> [Int]
digits n = go n []
    where
        go 0 xs = xs
        go x xs = go (div x 10) ((mod x 10) : xs)

wordNumber :: Int -> String
wordNumber n = concat wordlist
    where wordlist = intersperse "-" numWords
          numWords = map digitToWord . digits $ n
