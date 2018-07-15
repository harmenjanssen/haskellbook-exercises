module VigenereCipher where

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


vigenere :: String -> String -> String
vigenere keyword input = encode input repeated 0
    where
        encode input mask n
            | n >= length input = ""
            | otherwise         = (caesar (toOffset mask n) [input !! n]) ++ encode input mask (n + 1)

        repeated = repeatFor keyword ((length input) - 1)

        repeatFor _ (-1)    = ""
        repeatFor keyword n = repeatFor keyword (n - 1) ++ charFromKeyword n

        toOffset xs n = length ['a'..(map toLower xs !! n)] - 1

        charFromKeyword n = [keyword !! (n `mod` (length keyword))]


