module Reverse where

rvrs :: String -> String
rvrs x = awesome ++ " is " ++ curry
  where awesome = drop 9 x;
        curry = take 5 x

main :: IO ()
main = print $ rvrs "Curry is awesome"
