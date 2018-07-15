module AsPatterns where

import Data.Char
import Data.List

isSubseqOf :: (Eq a) => [a] -> [a] -> Bool
isSubseqOf [] _ = True
isSubseqOf _ [] = False
isSubseqOf xss@(x:xs) (y:ys)
    | x == y    = isSubseqOf xs ys
    | otherwise = isSubseqOf xss ys

capitalizeWords :: String -> [(String, String)]
capitalizeWords = map (\x -> (capitalizeWord x, x)) . words

capitalizeWord :: String -> String
capitalizeWord "" = ""
capitalizeWord (x:xs) = [toUpper(x)] ++ xs

capitalizeParagraph :: String -> String
capitalizeParagraph = intercalate ". " . map capitalizeWord . splitOn ". "

splitOn :: Eq a => [a] -> [a] -> [[a]]
splitOn []    _  = error "splitOn: empty delimiter"
splitOn delim xs = loop xs
    where loop [] = [[]]
          loop xs | delim `isPrefixOf` xs = [] : splitOn delim (drop len xs)
          loop (x:xs) = let (y:ys) = splitOn delim xs
                         in (x:y) : ys
          len = length delim
