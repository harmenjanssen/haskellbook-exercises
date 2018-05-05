module TypeKwonDo where

{-
 - exercise 1
 -}

data Woot
data Blah

f :: Woot -> Blah
f = undefined

g :: (Blah, Woot) -> (Blah, Blah)
g (b, w) = (b, f w)


{-
 - exercise 2
 -}

f' :: Int -> String
f' = show

g' :: String -> Char
g' = head

h' :: Int -> Char
h' = g . f

{-
 - exercise 3
 -}

data A
data B
data C

q :: A -> B
q = undefined

w :: B -> C
w = undefined

e :: A -> C
e = w . q

{-
 - exercise 4
 -}

data X
data Y
data Z

xz :: X -> Z
xz = undefined

yz :: Y -> Z
yz = undefined

xform :: (X, Y) -> (Z, Z)
xform (x, y) = (xz x, yz y)


{-
 - exercise 5
 -}

munge :: (x -> y)
    -> (y -> (w, z))
    -> x
    -> w
munge xy ywz x = fst $ ywz $ xy x
