{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE FlexibleInstances #-}

class TooMany a where
    tooMany :: a -> Bool

instance TooMany Int
    where tooMany n = n > 42

instance TooMany (Int, String)
    where tooMany (n, _) = tooMany n

instance TooMany (Int, Int)
    where tooMany (x, y) = tooMany $ x + y

instance (Num a, TooMany a) => TooMany (a, a)
    where tooMany (x, y) = tooMany $ x + y

newtype Goats = Goats Int
    deriving (Eq, Show, TooMany)


