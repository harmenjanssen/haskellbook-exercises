module Exercises where

testA = x * 3 + y
  where x = 3; y = 1000

testB = x * 5
  where y = 10; x = 10 * 5 + y

testC = z / x + y
  where x = 7; y = negate 8; z = y * 10

waxOn = x * 5
  where z = 7;
        y = z + 8;
        x = y ^ 2

triple x = x * 3

{-waxOff x = triple x-}

waxOff = triple


