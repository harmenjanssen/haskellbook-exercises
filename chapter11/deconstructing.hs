data GuessWhat =
    Chickenbutt deriving (Eq, Show)

data Id a =
    MkId a deriving (Eq, Show)

data Product a b =
    Product a b deriving (Eq, Show)

data Sum a b = First a
             | Second b
                deriving (Eq, Show)

data RecordProduct a b = RecordProduct {
    pfirst :: a,
    psecond :: b
  }
  deriving (Eq, Show)

newtype NumCow =
    NumCow Int
    deriving (Eq, Show)

newtype NumPig =
    NumPig Int
    deriving (Eq, Show)

data Farmhouse =
    Farmhouse NumCow NumPig
    deriving (Eq, Show)

type Farmhouse' = Product NumCow NumPig

newtype NumSheep =
    NumSheep Int
    deriving (Eq, Show)

data BigFarmhouse =
    BigFarmhouse NumCow NumPig NumSheep
    deriving (Eq, Show)

type BigFarmhouse' =
    Product NumCow (Product NumPig NumSheep)
