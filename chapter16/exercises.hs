module Exercises where

import Test.QuickCheck

a = fmap (+1) $ read "[1]" :: [Int]

b = (fmap . fmap) (++ "lol") (Just ["Hi,", "Hello"])

c = fmap (*2) (\x -> x - 2)
c' = (*2) . (\x -> x - 2)

d = fmap ((return '1' ++) . show)
    (\x -> [x, 1..3])

e :: IO Integer
e = let ioi = readIO "1" :: IO Integer
        changed = fmap (fmap read (fmap ("123"++) show)) ioi
    in fmap (*3) changed



functorIdentity :: (Functor f, Eq (f a)) => f a -> Bool
functorIdentity f = fmap id f == f

functorCompose :: (Eq (f c), Functor f) =>
                    (a -> b) ->
                    (b -> c) ->
                    f a ->
                    Bool
functorCompose f g x =
    (fmap g (fmap f x)) == (fmap (g . f) x)

functorCompose' = functorCompose (+1) (*2)

main :: IO ()
main = do
    --   I CAN'T SEEM TO GET THIS WORKING.
    --   After declaring the type signature once for Identity I cannot change it to Pair?!
    --
    --let fci = functorCompose' :: Identity Int -> Bool
    --quickCheck (functorIdentity :: Identity Int -> Bool)
    --quickCheck fci

    --let fcp = functorCompose' :: Pair Int -> Bool
    --quickCheck (functorIdentity :: Pair Int -> Bool)
    --quickCheck fcp


-- Identity
newtype Identity a = Identity a deriving (Eq, Show)

instance Arbitrary a => Arbitrary (Identity a) where
    arbitrary = fmap Identity arbitrary

instance Functor Identity where
    fmap f (Identity a) = Identity $ f a


-- Pair
data Pair a = Pair a a deriving (Eq, Show)

instance Arbitrary a => Arbitrary (Pair a) where
    arbitrary = Pair <$> arbitrary <*> arbitrary

instance Functor Pair where
    fmap f (Pair a b) = Pair (f a) (f b)


-- Two
data Two a b = Two a b deriving (Eq, Show)

twoGen :: (Arbitrary a, Arbitrary b) => Gen (Two a b)
twoGen = do
    a <- arbitrary
    b <- arbitrary
    return (Two a b)

instance (Arbitrary a, Arbitrary b) => Arbitrary (Two a b) where
    arbitrary = twoGen
