module Exercises where

import Data.Char

safeTail :: [a] -> Maybe [a]
safeTail []     = Nothing
safeTail (_:[]) = Nothing
safeTail (_:xs) = Just xs

safeHead :: [a] -> Maybe a
safeHead []    = Nothing
safeHead (x:_) = Just x

-- -----------------------------------------

eftBool :: Bool -> Bool -> [Bool]
eftBool = eft'

eftOrd :: Ordering -> Ordering -> [Ordering]
eftOrd = eft'

eftInt :: Int -> Int -> [Int]
eftInt = eft'

eftChar :: Char -> Char -> [Char]
eftChar = eft'

eft' :: (Ord a, Enum a) => a -> a -> [a]
eft' a b
    | order == LT = go a b
    | order == EQ = [a]
    | otherwise   = []
    where order = compare a b
          go :: (Enum a, Ord a) => a -> a -> [a]
          go from to
            | from >= to = [to]
            | otherwise  = [from] ++ go (succ from) to

-- -----------------------------------------

explode :: Char -> String -> [String]
explode _ "" = []
explode c xs = [firstWord] ++ (explode c rest)
    where test      = (/=c)
          firstWord = takeWhile test xs
          afterWord = dropWhile test xs
          rest = if afterWord /=""
                 then tail afterWord
                 else ""

myWords :: String -> [String]
myWords = explode ' '

acronym :: String -> String
acronym xs = [x | x <- xs, elem x ['A'..'Z']]

-- -----------------------------------------

mySqr :: (Num a, Enum a) => [a]
mySqr = [x^2 | x <- [1..5]]

myCube :: (Num a, Enum a) => [a]
myCube = [y^3 | y <- [1..5]]

sqrCubeTuples :: (Num a, Enum a, Ord a) => [(a, a)]
sqrCubeTuples = [(x, y) | x <- mySqr, y <- myCube, x < 50, y < 50]

-- -----------------------------------------

multipleOf :: Integral a => a -> a -> Bool
multipleOf x y = (rem y x) == 0

-- usage: filter (multipleOf 3) [1..30]

isArticle :: String -> Bool
isArticle x = x `elem` ["a", "an", "the"]

-- usage: (filter (not . isArticle)) . myWords $ "the brown dog was a goof"

zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith' _ [] _ = []
zipWith' _ _ [] = []
zipWith' f (x:xs) (x':xs') = (f x x') : zipWith' f xs xs'

zip' :: [a] -> [b] -> [(a, b)]
zip' = zipWith' (\x y -> (x, y))

-- -----------------------------------------

strtoupper :: String -> String
strtoupper = map toUpper

strtoupper' :: String -> String
strtoupper' "" = ""
strtoupper' (x:xs) = toUpper x : strtoupper' xs

ucfirst :: String -> String
ucfirst "" = ""
ucfirst (x:xs) = toUpper x : xs

capFirst :: String -> Char
capFirst = toUpper . head

-- -----------------------------------------

myAnd :: [Bool] -> Bool
myAnd [] = True
myAnd (x:xs) = x && myAnd xs

myOr :: [Bool] -> Bool
myOr [] = False
myOr (x:xs) = x || myOr xs

myAny :: (a -> Bool) -> [a] -> Bool
myAny _ [] = False
myAny f (x:xs) = f x || myAny f xs

myElem :: Eq a => a -> [a] -> Bool
myElem _ [] = False
myElem a (x:xs) = a == x || myElem a xs

myElem' :: Eq a => a -> [a] -> Bool
myElem' a = any (==a)

myReverse :: [a] -> [a]
myReverse [] = []
myReverse (x:xs) = (myReverse xs) ++ [x]

squish :: [[a]] -> [a]
squish [] = []
squish (x:xs) = x ++ squish xs


squishMap :: (a -> [b]) -> [a] -> [b]
squishMap _ [] = []
squishMap f (x:xs) = (f x) ++ squishMap f xs

squishAgain :: [[a]] -> [a]
squishAgain = squishMap id

myMaximumBy :: (a -> a -> Ordering) -> [a] -> a
myMaximumBy _ [] = error "Empty list"
myMaximumBy f (x:[]) = x
myMaximumBy f (x:y:xs)
    | order == GT = myMaximumBy f (x : xs)
    | otherwise = myMaximumBy f (y : xs)
    where order = f x y

myMinimumBy :: (a -> a -> Ordering) -> [a] -> a
myMinimumBy _ [] = error "Empty list"
myMinimumBy f (x:[]) = x
myMinimumBy f (x:y:xs)
    | order == LT = myMinimumBy f (x : xs)
    | otherwise = myMinimumBy f (y : xs)
    where order = f x y

myMaximum :: (Ord a) => [a] -> a
myMaximum = myMaximumBy compare

myMinimum :: (Ord a) => [a] -> a
myMinimum = myMinimumBy compare



-- [1, 40, 9, 12]
--
