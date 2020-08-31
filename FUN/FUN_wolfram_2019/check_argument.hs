module CheckArgument where

import Tool


listOption :: [Char] -> Int
listOption str | str == "--rule" = 0
               | str == "--start" = 0
               | str == "--lines" = 0
               | str == "--window" = 0
               | str == "--move" = 0
               | otherwise = -1

checkOption :: [String] -> Int
checkOption [] = 0
checkOption (a : b) | listOption a == -1 = -1
                    | myLength b == 0 = -2
checkOption (a : b : next) | myIsNbr b == False = -3
                           | otherwise = checkOption next

checkArgs :: [String] -> Bool
checkArgs [] = False
checkArgs str = True
