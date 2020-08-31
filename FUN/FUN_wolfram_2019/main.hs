import System.Environment
import Tool
import CheckArgument
import Error
import Program

main = do {
    args <- getArgs;
    if ((checkArgs args) == False)
        then exitFunc "Error\nNot Enough Argument";
        else return ();
    checkError (checkOption args);
    program args;
    return (0);
}