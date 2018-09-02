module Phone where

import Data.List
import Data.Char

data Phone = Phone [Button] deriving (Eq, Show)

data Option = Digit Char | Capitalize deriving (Eq, Show)

data ButtonId = One  | Two  | Three | Four
              | Five | Six  | Seven | Eight
              | Nine | Star | Zero  | Pound deriving (Eq, Show)

data Button = Button ButtonId [Option] deriving (Eq, Show)

phonePad :: Phone
phonePad = Phone [one, two, three,
                  four, five, six,
                  seven, eight, nine,
                  star, zero, pound]
    where
        one   = Button One (buildDigitList ['1'])
        two   = Button Two (buildDigitList ['a', 'b', 'c', '2'])
        three = Button Three (buildDigitList ['d', 'e', 'f', '3'])
        four  = Button Four (buildDigitList ['g', 'h', 'i', '4'])
        five  = Button Five (buildDigitList ['j', 'k', 'l', '5'])
        six   = Button Six (buildDigitList ['m', 'n', 'o', '6'])
        seven = Button Seven (buildDigitList ['p', 'q', 'r', 's', '7'])
        eight = Button Eight (buildDigitList ['t', 'u', 'v', '8'])
        nine  = Button Nine (buildDigitList ['w', 'x', 'y', 'z', '9'])
        star  = Button Star [Capitalize]
        zero  = Button Zero (buildDigitList ['+', ' ', '0'])
        pound = Button Pound (buildDigitList ['.', ',', '\n'])
        buildDigitList :: [Char] -> [Option]
        buildDigitList = map Digit

charToTaps :: Phone -> Char -> Maybe (Button, Int)
charToTaps (Phone buttons) x = fmap btnWithPresses button
    where
        btnWithPresses button@(Button _ options) = (button, fmap (+1) ((Digit x) `elemIndex` options))
        button = find (buttonProducesChar x) buttons

buttonProducesChar :: Char -> Button -> Bool
buttonProducesChar x (Button _ options) = Digit x `elem` options

convo :: [String]
convo =
  ["Wanna play 20 questions",
   "Ya",
   "U 1st haha",
   "Lol ok. Have u ever tasted alcohol",
   "Lol ya",
   "Wow ur cool haha. Ur turn",
   "Ok. Do u think I am pretty Lol",
   "Lol ya",
   "Just making sure rofl ur turn"]

