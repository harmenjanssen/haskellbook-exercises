module DataTypes where

data Trivial = Trivial'

instance Eq Trivial where
  Trivial' == Trivial' = True


data DayOfWeek = Mon | Tue | Wed | Thu | Fri | Sat | Sun deriving Show

-- day of week and numerical day of month
data Date = Date DayOfWeek Int deriving Show

instance Eq DayOfWeek where
    (==) Mon Mon = True
    (==) Tue Tue = True
    (==) Wed Wed = True
    (==) Thu Thu = True
    (==) Fri Fri = True
    (==) Sat Sat = True
    (==) Sun Sun = True
    (==) _   _   = False

instance Ord DayOfWeek where
    compare Fri Fri = EQ
    compare Fri _   = GT
    compare _   Fri = LT
    compare _   _   = EQ

instance Eq Date where
    (==) (Date weekday dayOfMonth)
         (Date weekday' dayOfMonth') = weekday == weekday'
                                    && dayOfMonth == dayOfMonth'


data TisAnInteger = TisAn Integer

instance Eq TisAnInteger where
    (==) (TisAn x) (TisAn y) = x == y


data TwoIntegers =
       Two Integer Integer

instance Eq TwoIntegers where
    (==) (Two x y) (Two x' y') = x == x' && y == y' || y == x' && x == y'


data StringOrInt = TisAnInt Int
    | TisAString String

instance Eq StringOrInt where
    (==) (TisAnInt x) (TisAnInt y) = x == y
    (==) (TisAString x) (TisAString y) = x == y
    (==) _ _ = False


data Pair a =
    Pair a a

instance Eq a => Eq (Pair a) where
    (==) (Pair x y) (Pair x' y') = x == x' && y == y'


data Tuple a b =
    Tuple a b

instance (Eq a, Eq b) => Eq (Tuple a b) where
    (==) (Tuple a b) (Tuple a' b') = a == a' && b == b'


data Which a = ThisOne a | ThatOne a

instance Eq a => Eq (Which a) where
    (==) (ThisOne a) (ThisOne b) = a == b
    (==) (ThatOne a) (ThatOne b) = a == b
    (==) (ThisOne a) (ThatOne b) = a == b
    (==) (ThatOne a) (ThisOne b) = a == b


data EitherOr a b = Hello a
    | Goodbye b

instance (Eq a, Eq b) => Eq (EitherOr a b) where
    (==) (Hello _) (Goodbye _) = False
    (==) (Goodbye _) (Hello _) = False
    (==) (Hello a) (Hello a') = a == a'
    (==) (Goodbye b) (Goodbye b') = b == b'


data Element = Air | Earth | Fire | Water

instance Show Element where
    show Air   = "💨"
    show Earth = "⛰"
    show Fire  = "🔥"
    show Water = "💧"
