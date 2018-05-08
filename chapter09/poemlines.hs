module PoemLines where

firstSen = "Tyger Tyger, burning bright\n"
secondSen = "In the forests of the night\n"
thirdSen = "What immortal hand or eye\n"
fourthSen = "Could frame thy fearful\
           \ symmetry?"
sentences = firstSen ++ secondSen ++ thirdSen ++ fourthSen

     -- putStrLn sentences -- should print
     -- Tyger Tyger, burning bright
     -- In the forests of the night
     -- What immortal hand or eye
     -- Could frame thy fearful symmetry?

explode :: Char -> String -> [String]
explode _ "" = []
explode c xs = [firstWord] ++ (explode c rest)
    where test      = (/=c)
          firstWord = takeWhile test xs
          afterWord = dropWhile test xs
          rest = if afterWord /=""
                 then tail afterWord
                 else ""

-- Implement this
myLines :: String -> [String]
myLines = explode '\n'

-- What we want 'myLines sentences' -- to equal
shouldEqual =
     [ "Tyger Tyger, burning bright"
     , "In the forests of the night"
     , "What immortal hand or eye"
     , "Could frame thy fearful symmetry?"
     ]

-- The main function here is a small test -- to ensure you've written your function -- correctly.
main :: IO ()
main = print $
     "Are they equal? "
     ++ show (myLines sentences
              == shouldEqual)
