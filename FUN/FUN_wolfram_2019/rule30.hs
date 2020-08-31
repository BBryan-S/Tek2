module Rule30 where

import Tool
import Error

getC30 :: String -> String -> Int -> Int -> Int -> IO Int
getC30 str next left middle right = do {
    if (left == 1 && middle == 0 && right == 0)
        then return 1;
    else if (left == 0 && (middle == 1 || right == 1))
        then return 1;
    else return 0;

}

nextLine30 :: String -> String -> Int -> Int -> Int -> Int -> IO String
nextLine30 str next left middle right len = do {
    if myLength next == len
        then do {
            return next;
        }
        else do {
            cresult <- getC30 str next left middle right;
            if (cresult == 1)
                then do {
                    add <- addSpace next "*";
                    newright <- getCaracter str (myLength add);
                    result <- nextLine30 str add middle right newright len;
                    return result;
                }
            else do {
                    add <- addSpace next " ";
                    newright <- getCaracter str (myLength add);
                    result <- nextLine30 str add middle right newright len;
                    return result;
                }
        }
}

next30 :: String -> IO String
next30 str = do {
    next <- nextLine30 str "" 0 0 1 ((myLength str) + 2);
    return (next);
}

createTab30 :: String -> Int -> Int -> Int -> Int -> IO ()
createTab30 str linecreate start window move = do {

    if start == 0
        then printLine str window move (myLength str);
    else return ();

    if linecreate > 1
        then do {
            next <- next30 str;
            if (start == 0)
                then createTab30 next (linecreate - 1) start window move;
            else createTab30 next (linecreate - 1) (start - 1) window move;
        }
    else return ();
}

rule30 :: Int -> Int -> Int -> Int -> IO ()
rule30 start line window move = do {
    linecreate <- lineCreate start line;
    if (linecreate > 150)
        then exitFunc "Error\nPrevent Timed Out";
    else createTab30 "*" linecreate start window move;
}