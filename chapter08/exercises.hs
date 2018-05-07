module Exercises where

sumTo :: (Eq a, Num a) => a -> a
sumTo 1 = 1
sumTo n = n + (sumTo (n - 1))


multiply :: (Integral a) => a -> a -> a
multiply x 1 = x
multiply x y = x + (multiply x (y - 1))


data DividedResult a =
    Result a
  | DividedByZero deriving (Show, Eq)

dividedBy :: Integral a => a -> a -> DividedResult (a, a)
dividedBy _ 0 = DividedByZero
dividedBy num denom
    | num < 0 = negateResult (dividedBy (negate num) denom)
    | denom < 0 = negateResult (dividedBy num (negate denom))
    | otherwise = Result (go num denom 0)
    where go n d count
            | n < d = (count, n)
            | otherwise =
                go (n - d) d (count + 1)
          negateResult (Result (a, b)) = Result (negate a, negate b)
          negateResult DividedByZero = DividedByZero

mc91 :: Integral a => a -> a
mc91 x
    | x > 100 = x - 10
    | otherwise = mc91 (mc91 (x + 11))
