module Cipher where

import Data.Char

data Case = IsUpper | IsLower

caesar :: Int -> String -> String
caesar offset xs = map shift xs
    where
        lowercaseRange = (65, 90)
        uppercaseRange = (97, 122)

        shift :: Char -> Char
        shift c = (fromAlphabetIndex (getCase c)) .
            shiftAlphabetIndex .
            (toAlphabetIndex (getCase c)) $ c

        getCase :: Char -> Case
        getCase c
            | isUpper c = IsUpper
            | otherwise = IsLower

        fromAlphabetIndex :: Case -> Int -> Char
        fromAlphabetIndex IsUpper x = chr (x + (fst uppercaseRange))
        fromAlphabetIndex IsLower x = chr (x + (fst lowercaseRange))

        toAlphabetIndex :: Case -> Char -> Int
        toAlphabetIndex IsUpper c = (ord c) - (fst uppercaseRange)
        toAlphabetIndex IsLower c = (ord c) - (fst lowercaseRange)

        shiftAlphabetIndex :: Int -> Int
        shiftAlphabetIndex x = (x + offset) `mod` 26

uncaesar :: Int -> String -> String
uncaesar offset = caesar (negate offset)
