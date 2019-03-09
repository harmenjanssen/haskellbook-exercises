module ChapterExercises where

import Test.QuickCheck

type Associativity x = x -> x -> x -> Bool

-- Types to check
data Trivial = Trivial deriving (Eq, Show)

instance Semigroup Trivial where
    _ <> _ = Trivial

instance Arbitrary Trivial where
    arbitrary = return Trivial

newtype Identity a = Identity a deriving (Eq, Show)

instance (Semigroup a) => Semigroup (Identity a) where
    Identity a <> Identity b = Identity (a <> b)

instance (Arbitrary a) => Arbitrary (Identity a) where
    arbitrary = do
        x <- arbitrary
        return $ Identity x

-- Checking code
semigroupAssoc :: (Eq m, Semigroup m) => m -> m -> m -> Bool
semigroupAssoc a b c = (a <> (b <> c)) == ((a <> b) <> c)

main :: IO ()
main = do
    quickCheck (semigroupAssoc :: Associativity (Trivial))
    quickCheck (semigroupAssoc :: Associativity (Identity String))
