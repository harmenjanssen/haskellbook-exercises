module SignalingAdversity where

import Data.Char
import Data.List

vowels :: String
vowels = "aeoiuy"

consonants :: String
consonants = "bcdfghjklmnpqrstvwxz"

replaceThe :: String -> String
replaceThe = unwords . map replaceThe' . words
    where
        replaceThe' "the" = "a"
        replaceThe' x = x


countTheBeforeVowel :: String -> Integer
countTheBeforeVowel xs = go' (words xs) 0
    where
        go' xss@("the":y:xs) n
            | startsWithVowel y = go' xs (n + 1)
            | otherwise         = go' (tail xss) n
        go' (x:xs) n = go' xs n
        go' [] n = n

        startsWithVowel (x:xs) = elem x vowels

countVowels :: String -> Integer
countVowels = fromIntegral . length . filter (\x -> elem x vowels)

countConsonants :: String -> Integer
countConsonants = fromIntegral . length . filter (\x -> elem x consonants)

newtype Word' =
    Word' String
    deriving (Eq, Show)

mkword :: String -> Maybe Word'
mkword xs
    | numVowels > numConsonants = Nothing
    | otherwise = Just (Word' xs)
    where
        numVowels = countVowels xs
        numConsonants = countConsonants xs
