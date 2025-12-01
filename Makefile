# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: rmnina <github.com/rmnina>                 +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/10/07 12:55:28 by rmnina            #+#    #+#              #
#    Updated: 2025/12/01 17:57:10 by rmnina           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libasm.a
TEST_NAME = main

SRCS = ft_read.s\
	ft_strcmp.s\
	ft_strcpy.s\
	ft_strdup.s\
	ft_strlen.s\
	ft_write.s\


TEST = main.c\

OBJS = ${SRCS:.s=.o}

HEADER = libasm.h

CC = nasm 
CTEST = gcc

RM = rm -rfv

FLAGS = -f elf64 
TEST_FLAGS = -Wall -Wextra -Werror

all: ${NAME}

%.o: %.s
	${CC} ${FLAGS} $< -o $@

${NAME}: ${OBJS}
	ar rcs ${NAME} ${OBJS}

test: ${TEST_NAME}

${TEST_NAME}: ${TEST}
	${CTEST} ${TEST_FLAGS} ${TEST} -L. -lasm -o ${TEST_NAME}

clean: 
	${RM} ${OBJS}
	${RM} ${OBJS_BONUS}

mclean:
	${RM} ${TEST_NAME}
		
fclean: clean mclean
	${RM} ${NAME}

re: fclean mclean all

.PHONY: all test clean fclean mclean re