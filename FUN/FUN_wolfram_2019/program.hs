module Program where

import Params
import Rule30
import Rule90
import Rule110
import Error

program :: [String] -> IO ()
program args = do {
    rule <- getRule args;
    start <- getStart args;
    line <- getLineParam args;
    window <- getWindow args;
    move <- getMove args;
    if (start < 0 || window < 0)
        then exitFunc "Error\nThe Value Must Be A Positive Number";
    else if rule == 30
        then rule30 start line window move;
    else if rule == 90
        then rule90 start line window move;
    else rule110 start line window move;
}