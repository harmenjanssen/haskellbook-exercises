module Unfolds where

myIterate :: (a -> a) -> a -> [a]
myIterate f x = x : myIterate f (f x)

{- take 10 $ unfoldr (\b -> Just (b, b+1)) 0 -}
myUnfoldr :: (b -> Maybe (a, b))
          -> b
          -> [a]
myUnfoldr f x = case f x of
    Just (y, z) -> y : myUnfoldr f z
    Nothing -> []

betterIterate :: (a -> a) -> a -> [a]
betterIterate f = myUnfoldr (\x' -> Just (x', f x'))
