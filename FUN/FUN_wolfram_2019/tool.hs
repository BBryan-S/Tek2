module Tool where

isNbr :: [Char] -> Bool
isNbr [] = True
isNbr (a : as) | a >= '0' && a <= '9' = isNbr as
               | otherwise = False

myIsNbr :: [Char] -> Bool
myIsNbr (a : as) | a == '-' = isNbr as
                 | a >= '0' && a <= '9' = isNbr as
                 | otherwise = False

myLength :: [a] -> Int
myLength [] = 0
myLength (_:l) = 1 + myLength l

addStr :: [String] -> String -> IO [String]
addStr tab str = do {
    return (tab ++ [str]);
}

addSpace :: String -> String -> IO String
addSpace tab str = do {
    return (tab ++ str);
}

lineCreate :: Int -> Int -> IO Int
lineCreate start line = do {
    return (start + line);
}

divTwo :: Int -> Int
divTwo a | a `mod` 2 == 0 = (a `div` 2)
         | otherwise = (a `div` 2) + 1

divOtherTwo :: Int -> Int
divOtherTwo a = a `div` 2

printSp :: Int -> IO ()
printSp nb = do {
    if (nb > 0)
        then do {
            putChar ' ';
            printSp (nb - 1);
        }
    else return ();
}

printString :: String -> Int -> Int -> Int -> IO ()
printString (a : next) window limit len = do {
    if (limit > 0)
        then printString next window (limit - 1) (len - 1);
    else if (window > 0)
        then do {
            putChar a;
            if len > 1
                then printString next (window - 1) limit (len - 1);
            else return ();
        }
    else return ();
}

printLine :: String -> Int -> Int -> Int -> IO ()
printLine str window move len = do {
    if (window >= len)
        then do {
            printSp (move + (divTwo (window - len)));
            putStr str;
            printSp (divOtherTwo (window - len));
            putChar '\n';
        }
    else do {
        printSp (move);
        printString str window (divOtherTwo(len - window)) len;
        putChar '\n';
    }
}


getCaracter :: String -> Int -> IO Int
getCaracter (a : next) len = do {
    if (len < 0)
        then return 0;
    else if (len == 0)
        then do {
            if (a == '*')
                then return 1;
            else return 0;
        }
    else do {
        if (myLength next == 0)
            then return 0;
        else do {
            result <- getCaracter next (len - 1);
            return (result);
        }
    }
}