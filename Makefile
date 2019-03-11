# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: gdelabro <gdelabro@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/02/15 14:35:12 by gdelabro          #+#    #+#              #
#    Updated: 2019/03/11 19:35:38 by gdelabro         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libfts.a

SRC_PATH = src/
SRC_NAME = ft_bzero.s ft_isalnum.s ft_isalpha.s ft_isascii.s ft_isdigit.s\
			ft_strcat.s ft_toupper.s ft_tolower.s ft_isprint.s ft_strlen.s ft_puts.s\
			ft_memset.s ft_memcpy.s ft_strdup.s ft_cat.s ft_abs.s ft_putnbr.s

SRC = $(addprefix $(SRC_PATH)/,$(SRC_NAME))

OBJ_PATH = obj/
OBJ_NAME = $(SRC_NAME:.s=.o)
OBJ = $(addprefix $(OBJ_PATH)/,$(OBJ_NAME))

TEST = test
MAIN = main.c
MAIN_OBJ = main.o


all: $(NAME)

$(NAME): $(OBJ)
		@printf "\n"
		@ar rc $(NAME) $(OBJ)
		@ranlib $(NAME)
		@printf "$(NAME): [\033[32;1mOK\33[0;1m]\n"

$(OBJ_PATH)/%.o: $(SRC_PATH)/%.s
	@mkdir $(OBJ_PATH) 2> /dev/null || true
	@nasm -f macho64 $< -o $@
	@printf "\033[34;1m| \033[0;1m"

$(TEST): all $(MAIN_OBJ)
	@gcc $(MAIN_OBJ) $(NAME) -o $(TEST)
	@printf "compiled main tester [\033[32;1mOK\33[0;1m]\n"

$(MAIN_OBJ): $(MAIN)
	@gcc -c $< -o $@

clean:
	@rm -rf $(OBJ_PATH)
	@rm -rf $(MAIN_OBJ)

fclean: clean
	@rm -rf $(NAME)
	@rm -fr $(TEST)

re: fclean all
