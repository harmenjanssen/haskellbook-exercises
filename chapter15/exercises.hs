module Optional where

data Optional a =
    Nada
  | Only a
  deriving (Eq, Show)

instance Monoid a => Monoid (Optional a) where
    mempty = Nada

instance Semigroup a => Semigroup (Optional a) where
    Only a <> Nada = Only a
    Nada <> Only a = Only a
    Only a <> Only b = Only (a <> b)
