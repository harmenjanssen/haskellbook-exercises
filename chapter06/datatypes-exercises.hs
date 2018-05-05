module DataTypesExercises where

import Data.List (sort)


data Person = Person Bool deriving Show

printPerson :: Person -> IO ()
printPerson person = putStrLn (show person)


data Mood = Blah
          | Woot deriving (Show,Eq)

settleDown :: Mood -> Mood
settleDown x = if x == Woot
               then Blah
               else x


type Subject = String
type Verb = String
type Object = String
data Sentence = Sentence Subject Verb Object deriving (Eq, Show)

s1 = Sentence "dogs" "drool"
s2 = Sentence "Julie" "loves" "dogs"


data Rocks = Rocks String deriving (Eq, Show, Ord)
data Yeah = Yeah Bool deriving (Eq, Show, Ord)
data Papu = Papu Rocks Yeah deriving (Eq, Show, Ord)

phew = Papu (Rocks "chases") (Yeah True)

truth = Papu (Rocks "chomskydoz") (Yeah True)

equalityForall :: Papu -> Papu -> Bool
equalityForall p p' = p == p'

comparePapus :: Papu -> Papu -> Bool
comparePapus p p' = p > p'


i :: Num a => a
i = 1

f :: Fractional f => f
f = 1.0

g :: RealFrac g => g
g = 1.0

{-freud :: a -> a-}
{-freud :: Ord a => a -> a-}
freud :: Int -> Int
freud x = x

mySort :: [Char] -> [Char]
mySort = sort

signifier :: [Char] -> Char
{-signifier :: Ord a => [a] -> a-}
signifier xs = head (mySort xs)



