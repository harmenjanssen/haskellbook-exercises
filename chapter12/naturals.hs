module Naturals where

-- As natural as any
-- competitive bodybuilder
data Nat =
    Zero
  | Succ Nat
  deriving (Eq, Show)


natToInteger :: Nat -> Integer
natToInteger Zero = 0
natToInteger (Succ n) = 1 + natToInteger n

integerToNat :: Integer -> Maybe Nat
integerToNat 0 = Just Zero
integerToNat x
    | x < 0     = Nothing
    | otherwise = fmap Succ . integerToNat $ (x - 1)
