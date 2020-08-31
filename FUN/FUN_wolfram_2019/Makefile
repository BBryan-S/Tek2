##
## EPITECH PROJECT, 2019
## FUN_pushswap_checker_2019
## File description:
## Makefile
##

SRC	=		main.hs	\
			tool.hs	\
			check_argument.hs	\
			error.hs	\
			program.hs	\
			getParams.hs	\
			rule30.hs	\
			rule90.hs	\
			rule110.hs

NAME	=	wolfram

all:	$(NAME)

$(NAME):
	ghc $(SRC) -o $(NAME)

clean:
	rm -f *.hi
	rm -f *.o

fclean:	clean
	rm -f $(NAME)
	rm -f *#	\
	rm -f *~

re:	fclean all

.PHONY: all clean re fclean
