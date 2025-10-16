# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: rmnina <https://github.com/rmnina>         +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/10/07 12:55:28 by rmnina            #+#    #+#              #
#    Updated: 2025/10/16 18:48:11 by rmnina           ###   ########.fr        #
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

SRC_BONUS = ft_atoi_base.s\
	ft_list_push_front.s\
	ft_list_remove_if.s\
	ft_list_size.s\
	ft_list_sort.s\

TEST = main.c\

OBJS = ${SRCS:.s=.o}

OBJS_BONUS = ${SRC_BONUS:.s=.o}

HEADER = libasm.h

CC = nasm 
CTEST = gcc

RM = rm -rfv

FLAGS = -f macho64 
# TODO : -f elf64 for LINUX
TEST_FLAGS = -Wall -Wextra -Werror

all: ${NAME}

%.o: %.s
	${CC} ${FLAGS} $< -o $@
# ${CC} ${FLAGS} -c $< -o $@ for LINUX

${NAME}: ${OBJS}
	ar cr ${NAME} ${OBJS}

bonus: ${OBJS_BONUS}
	ar cr ${NAME} ${OBJS_BONUS}

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