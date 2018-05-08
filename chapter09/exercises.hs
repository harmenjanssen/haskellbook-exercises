module Exercises where

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
