module Params where

import Error

getParam :: [String] -> String -> IO [Char]
getParam [] cmp = do {
    return ("Error");
}
getParam (x : y : next) a = do {
    if x == a
        then return y
        else getParam next a;
}

getRule :: [String] -> IO Int
getRule args = do {
    rule <- getParam args "--rule";
    if (rule == "30")
        then return 30;
    else if (rule == "90")
        then return 90;
    else if (rule == "110")
        then return 110;
    else if (rule == "Error")
        then do {
            exitFunc "Error\nNo Rule";
            return (-84);
        }
    else do {
        exitFunc "Error\nRule Not Supported";
        return (-85);
    }
}

getStart :: [String] -> IO Int
getStart args = do {
    start <- getParam args "--start";
    if (start == "Error")
        then return 0;
    else
        return (read start::Int)
}

getLineParam :: [String] -> IO Int
getLineParam args = do {
    line <- getParam args "--lines";
    if (line == "Error")
        then return (1938282);
    else if ((read line::Int) < 0)
        then do {
            exitFunc "Error\nThe Value Must Be A Positive Number";
            return 0;
        }
    else return (read line::Int);
}

getWindow :: [String] -> IO Int
getWindow args = do {
    window <- getParam args "--window";
    if (window == "Error")
        then return 80;
    else
        return (read window::Int);
}

getMove :: [String] -> IO Int
getMove args = do {
    move <- getParam args "--move";
    if (move == "Error")
        then return 0;
    else return (read move::Int);
}