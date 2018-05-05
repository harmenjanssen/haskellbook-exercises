module Print3 where

myGreeting :: String
myGreeting = "hello" ++ " world!"

hello :: String
hello = "hello"

world :: String
world = "world!"

main :: IO ()
main = do
  putStrLn myGreeting
  putStrLn secondGreeting
  where secondGreeting = concat [hello, " ", world]

thirdChar :: String -> Char
thirdChar s = s !! 2

charAt :: Int -> String -> Char
charAt x s = s !! x

rvrs :: String -> String
rvrs _ = awesome ++ " is " ++ curry
  where curryIsAwesome = "Curry is awesome";
        awesome = drop 9 curryIsAwesome;
        curry = take 5 curryIsAwesome
