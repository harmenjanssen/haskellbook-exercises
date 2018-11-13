import Data.Char (toLower)
import Control.Monad
import System.Exit (exitSuccess)

isAlpha :: Char -> Bool
isAlpha x = elem x "abcdefghijklmnopqrstuvwxyz"

normalize :: String -> String
normalize = (filter isAlpha) . (map toLower)

palindrome :: IO ()
palindrome = forever $ do
    line1 <- getLine
    case ((normalize line1) == (normalize $ reverse line1)) of
        True -> putStrLn "It's a palindrome!"
        False -> do
            putStrLn "Nope!"
            exitSuccess

