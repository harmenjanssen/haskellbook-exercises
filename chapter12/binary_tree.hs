module BinaryTree where

data BinaryTree a =
                Leaf
                | Node (BinaryTree a) a (BinaryTree a)
                deriving (Eq, Ord, Show)

unfold :: (a -> Maybe (a, b, a))
        -> a
        -> BinaryTree b
unfold f a = case f a of
    Just (left, nodeValue, right) -> Node (unfold f left) nodeValue (unfold f right)
    Nothing -> Leaf

treeBuild :: Integer -> BinaryTree Integer
treeBuild x = unfold buildCond 0
    where
        buildCond b = if b < x then Just (b + 1, b, b + 1) else Nothing
