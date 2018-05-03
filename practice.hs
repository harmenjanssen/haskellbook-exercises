
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
