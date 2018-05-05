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

