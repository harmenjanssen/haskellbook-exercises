module Addition where

import Test.Hspec

main :: IO ()
main = hspec $ do
    describe "dividedBy" $ do
        it "15 divided by 3 is 5" $ do
            dividedBy 15 3 `shouldBe` (5, 0)
        it "22 divided by 5 is 4 remainder 2" $ do
            dividedBy 22 5 `shouldBe` (4, 2)
    describe "multiply" $ do
        it "10 multiplied by 24 is 240" $ do
            multiply 10 24 `shouldBe` 240
        it "3 multiplied by 3 is 9" $ do
            multiply 3 3 `shouldBe` 9


dividedBy :: Integral a => a -> a -> (a, a)
dividedBy num denom = go num denom 0
    where
        go n d count
         | n < d = (count, n)
         | otherwise = go (n - d) d (count + 1)

multiply :: (Integral a) => a -> a -> a
multiply x 1 = x
multiply x y = x + (multiply x (y - 1))



