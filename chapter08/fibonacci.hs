module Fibonacci where

fibonacci :: Integral a => a -> a
fibonacci 0 = 0
fibonacci 1 = 1
fibonacci x = y + z
    where y = fibonacci (x - 1)
          z = fibonacci (x - 2)


