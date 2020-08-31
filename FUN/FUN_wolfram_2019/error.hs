module Error where

import System.Exit


checkError :: Int -> IO ()
checkError code | code == -1 = exitFunc "Error\nInvalid Argument"
                | code == -2 = exitFunc "Error\nNo Value for Argument"
                | code == -3 = exitFunc "Error\nInvalid Value"
checkError code = do {
    return ();
}

exitFunc :: [Char] -> IO ()
exitFunc str = do {
    putStrLn str;
    exitWith (ExitFailure 84);
}