module Exercises where

f' :: (a, b, c)
    -> (d, e, f)
    -> ((a, d), (c, f))
f' (a, _, c) (d, _, f) = ((a, d), (c, f))

funcZ :: (Eq x, Num x) => x -> String
funcZ x =
    case x + 1 == 1 of
        True -> "AWESOME"
        False -> "wut"

pal xs =
    case xs == reverse xs of
        True -> "yes"
        False -> "no"

functionC x y = case (x > y) of
                    True -> x
                    False -> y


ifEvenAdd2 n = case (even n) of
                    True -> (n+2)
                    False -> n

nums x =
    case compare x 0 of
        LT -> -1
        GT -> 1
        EQ -> 0

dodgy :: Num a => a -> a -> a
dodgy x y = x + y * 10

oneIsOne :: Num a => a -> a
oneIsOne = dodgy 1

oneIsTwo :: Num a => a -> a
oneIsTwo = (flip dodgy) 2

myAbs :: Integer -> Integer
myAbs x
    | x < 0 = (-x)
    | otherwise = x

avgGrade :: (Fractional a, Ord a) => a -> Char
avgGrade x
    | y >= 0.9 = 'A'
    | y >= 0.8 ='B'
    | y >= 0.7 ='C'
    | y >= 0.59 = 'D'
    -- | y < 0.59 = 'F'
    | otherwise = 'F'
    where y = x / 100

pal' xs
    | xs == reverse xs = True
    | otherwise = False
