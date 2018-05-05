module TypesExercises where

{-bigNum = (^) 5 10-}
{-wahoo = bigNum $ 10-}


i :: a -> a
i a = a

c :: a -> b -> a
c a b = a


r :: [a] -> [a]
{-r a = a-}
{-r a = a ++ a-}
r = take 4

co :: (b -> c) -> (a -> b) -> a -> c
co b2c a2b a = b2c $ a2b a

a :: (a -> c) -> a -> a
a _ a = a

a' :: (a -> b) -> a -> b
a' f a = f a
