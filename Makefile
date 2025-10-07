# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: rmnina <github.com/rmnina>                 +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/10/07 12:55:28 by rmnina            #+#    #+#              #
#    Updated: 2025/10/07 12:57:20 by rmnina           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #



NAME = libasm.a

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

OBJS = ${SRCS:.c=.o}

OBJS_BONUS = ${SRC_BONUS:.c=.o}

HEADER = libasm.h

CC = nasm 

RM = rm -rfv

FLAGS = -f elf64 

all: ${NAME}

${NAME}: ${OBJS}
	${CC} ${FLAGS} -c ${SRCS}
	ar cr ${NAME} ${OBJS}

bonus: ${OBJS_BONUS}
	${CC} ${FLAGS} -c ${SRC_BONUS}
	ar cr ${NAME} ${OBJS_BONUS}

clean: 
	${RM} ${OBJS}
	${RM} ${OBJS_BONUS}
		
fclean: clean
	${RM} ${NAME}

re: fclean all