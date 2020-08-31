##
## EPITECH PROJECT, 2019
## ASM_minilibc_2019
## File description:
## Makefile
##

SRC	=	strlen.asm	\
		memcpy.asm	\
		memset.asm	\
		rindex.asm	\
		strcasecmp.asm	\
		strchr.asm	\
		strcmp.asm	\
		strncmp.asm	\
		strstr.asm	\
		strpbrk.asm	\
		memmove.asm

NAME	=	libasm.so

CFLAGS	=	-shared -nostdlib

OBJ	=	$(SRC:.asm=.o)

%.o: %.asm
	nasm -o $@ $< -f elf64

all:	$(NAME)

$(NAME):	$(OBJ)
		ld $(CFLAGS) -o $(NAME) $(OBJ)

clean:
	rm -rf $(OBJ)

fclean: clean
	rm -rf $(NAME)
	rm -rf *#	\
	rm -rf *~

re: fclean all

.PHONY: all clean re fclean