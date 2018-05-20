module Exercises where

import Data.Time

data DatabaseItem = DbString String
                  | DbNumber Integer
                  | DbDate   UTCTime
                  deriving (Eq, Ord, Show)

theDatabase :: [DatabaseItem]
theDatabase = [ DbDate (UTCTime
                        (fromGregorian 1911 5 1)
                        (secondsToDiffTime 34123)),
                DbNumber 9001,
                DbString "Hello, world!",
                DbDate (UTCTime
                        (fromGregorian 1921 5 1)
                        (secondsToDiffTime 34123))
              ]

filterDbDate :: [DatabaseItem] -> [UTCTime]
filterDbDate db = foldr mapDate [] db
    where
        mapDate (DbDate time) xs = time : xs
        mapDate _ xs = xs

filterDbNumber :: [DatabaseItem] -> [Integer]
filterDbNumber db = foldr mapInt [] db
    where
        mapInt (DbNumber x) xs = x : xs
        mapInt _ xs = xs

mostRecent :: [DatabaseItem] -> UTCTime
mostRecent = maximum . filterDbDate

sumDb :: [DatabaseItem] -> Integer
sumDb = sum . filterDbNumber

avgDb :: [DatabaseItem] -> Double
avgDb db = (fromIntegral . sumDb $ db) / (fromIntegral . length $ numbers)
    where numbers = filterDbNumber db


fibs :: [Integer]
fibs = 1 : scanl (+) 1 fibs

fibsN :: Int -> Integer
fibsN x = fibs !! x

fibs20 :: [Integer]
fibs20 = take 20 fibs

fibsBelow100 :: [Integer]
fibsBelow100 = takeWhile (<100) fibs

fact :: [Integer]
fact = scanl (*) 1 [1..]

{-fibs' :: [Integer]-}
{-fibs' = 1 : scanl (\b a -> do-}
    {-print (show b);-}
    {-b + a) 1 fibs'-}
