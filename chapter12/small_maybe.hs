module SmallMaybe where

isJust :: Maybe a -> Bool
isJust Nothing = False
isJust _       = True

isNothing :: Maybe a -> Bool
isNothing Nothing = True
isNothing _       = False

mayybee :: b -> (a -> b) -> Maybe a -> b
mayybee x f Nothing = x
mayybee _ f (Just y) = fy
    where
        fy = f y

fromMaybe :: a -> Maybe a -> a
fromMaybe x Nothing  = x
fromMaybe _ (Just x) = x

listToMaybe :: [a] -> Maybe a
listToMaybe [] = Nothing
listToMaybe (x:_) = Just x

maybeToList :: Maybe a -> [a]
maybeToList m = mayybee [] (\m -> [m]) m

catMaybes :: [Maybe a] -> [a]
catMaybes xs = foldr (addJust) [] xs
    where
        addJust (Just a) xs' = a:xs'
        addJust Nothing xs'  = xs'

flipMaybe :: [Maybe a] -> Maybe [a]
flipMaybe xs
    | any isNothing xs = Nothing
    | otherwise = Just (map (\(Just x) -> x) xs)
