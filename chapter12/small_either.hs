module SmallEither where

isLeft :: (Either a b) -> Bool
isLeft (Left _) = True
isLeft _ = False

isRight :: (Either a b) -> Bool
isRight (Right _) = True
isRight _ = False

lefts' :: [Either a b] -> [a]
lefts' = foldr takeLeft []
    where
        takeLeft (Left x) xs = x:xs
        takeLeft _ xs = xs

rights' :: [Either a b] -> [b]
rights' = foldr takeRight []
    where
        takeRight (Right x) xs = x:xs
        takeRight _ xs = xs

partitionEithers' :: [Either a b] -> ([a], [b])
partitionEithers' xs = (lefts, rights)
    where
        lefts = [a | e@(Left a) <- xs, isLeft e == True]
        rights = [b | e@(Right b) <- xs, isRight e == True]

eitherMaybe' :: (b -> c)
             -> Either a b
             -> Maybe c
eitherMaybe' f (Right b) = Just $ f b
eitherMaybe' f (Left a) = Nothing

either' :: (a -> c)
        -> (b -> c)
        -> Either a b
        -> c
either' f _ (Left a) = f a
either' _ g (Right b) = g b

eitherMaybe'' :: (b -> c)
              -> Either a b
              -> Maybe c
eitherMaybe'' f = either' (const Nothing) (Just . f)
