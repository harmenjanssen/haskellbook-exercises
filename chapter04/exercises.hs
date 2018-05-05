module Exercises where

addTuple :: (Int, [a]) -> (Int, [a]) -> (Int, [a])
addTuple (a, b) (c, d) = ((a + c), (b ++ d))

palindrome :: (Eq a) => [a] -> Bool
palindrome x = reverse x == x

myAbs :: Int -> Int
myAbs x = if x < 0 then 0 - x else x

f :: (a, b) -> (c, d) -> ((b, d), (a, c))
f (a, b) (c, d) = ((b, d), (a, c))


x = (+)
lengthPlusOne xs = w `x` 1
         where w = length xs


g :: a -> a -> a
g x y = y


h :: a -> b -> b
h a b = b

