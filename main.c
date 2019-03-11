#include <stdlib.h>
#include <unistd.h>
#include <stdio.h>
#include <fcntl.h>
#include <libc.h>
#include <string.h>
#include <ctype.h>

# define OK "[\033[32;1mOK\033[0;0m]"
# define KO "[\033[31;1mKO\033[0;0m]"

void *ft_memcpy(void *s, const void *s2, size_t n);
char *ft_strcat(char *s, char *s2);
void *ft_strdup(char *s);
void ft_cat(int fd);
int ft_isalpha(int c);
int ft_isdigit(int c);
int ft_isalnum(int c);
int ft_isascii(int c);
int ft_isprint(int c);
int ft_toupper(int c);
int ft_tolower(int c);
int ft_puts(const char *s);
void ft_bzero(void *s, size_t n);
size_t ft_strlen(const char *s);
void *ft_memset (void *s, int c, size_t n);
int ft_abs(int c);
void ft_putnbr(int c);

int compare(char *s1, char*s2, int n)
{
	while (n--)
		if (*s1++ != *s2++)
			return (0);
	return (1);
}

void ft_putstr(char *str)
{
	int i;

	i = -1;
	while (str[++i])
		;
	write(1, str, i);
}

void ft_putchar(char c)
{
	write(1, &c, 1);
}

void ft_putendl(char *str)
{
	int i;

	i = -1;
	while (str[++i])
		;
	write(1, str, i);
	write(1, "\n", 1);
}

void test_ft_bzero()
{
	char buf[10] = {1, 1, 1, 0, 1, 1, 1, 1, 1, 1};

	ft_putstr("test ft_bzero: ");
	ft_bzero(buf, 7);
	ft_putendl(compare(buf, "\0\0\0\0\0\0\0\1\1\1", 10) ? OK : KO);
}

void test_ft_strcat()
{
	char buf[100] = "Hello ";

	ft_putstr("test ft_strcat: ");
	ft_putendl(compare(ft_strcat(ft_strcat(buf, "world!"), " How are you ?"), "Hello world! How are you ?", 27) ? OK : KO);
}

void test_ft_isalpha()
{
	int i;

	i = -1;
	ft_putstr("test ft_isalpha: ");
	while (++i < 128)
		if (ft_isalpha(i) != isalpha(i))
			return (ft_putendl(KO));
	ft_putendl(OK);
}

void test_ft_isdigit()
{
	int i;

	i = -1;
	ft_putstr("test ft_isdigit: ");
	while (++i < 128)
		if (ft_isdigit(i) != isdigit(i))
			return (ft_putendl(KO));
	ft_putendl(OK);
}

void test_ft_isalnum()
{
	int i;

	i = -1;
	ft_putstr("test ft_isalnum: ");
	while (++i < 128)
		if (ft_isalnum(i) != isalnum(i))
			return (ft_putendl(KO));
	ft_putendl(OK);
}

void test_ft_isascii()
{
	int i;

	i = -1;
	ft_putstr("test ft_isascii: ");
	while (++i < 128)
		if (ft_isascii(i) != isascii(i))
			return (ft_putendl(KO));
	ft_putendl(OK);
}

void test_ft_isprint()
{
	int i;

	i = -1;
	ft_putstr("test ft_isprint: ");
	while (++i < 128)
		if (ft_isprint(i) != isprint(i))
			return (ft_putendl(KO));
	ft_putendl(OK);
}

void test_ft_toupper()
{
	int i;

	i = -1;
	ft_putstr("test ft_toupper: ");
	while (++i < 128)
		if (ft_toupper(i) != toupper(i))
			return (ft_putendl(KO));
	ft_putendl(OK);
}

void test_ft_tolower()
{
	int i;

	i = -1;
	ft_putstr("test ft_tolower: ");
	while (++i < 128)
		if (ft_tolower(i) != tolower(i))
			return (ft_putendl(KO));
	ft_putendl(OK);
}

void test_both_puts(char *s)
{
	ft_putstr("\t");
	int i = ft_puts(s);
	ft_putstr("\t");
	int i2 = puts(s);
	if (i != i2)
		printf("\treturn diffs: %d / %d\n", i, i2);
}

void test_ft_puts()
{
	ft_putendl("test ft_puts: /* if you see a diff below, its KO*/");
	test_both_puts(NULL);
	test_both_puts("Hello World!");
	test_both_puts("Another test");
}

int test_both_strlen(char *s)
{
	int i = ft_strlen(s);
	int i2 = strlen(s);
	return (i == i2 ? 1 : 0);
}

void test_ft_strlen()
{
	ft_putstr("test ft_strlen: ");
	ft_putendl(test_both_strlen("Hello World!") && test_both_strlen("Another test") && test_both_strlen("") ? OK : KO);
}

void test_ft_memset()
{
	char t[100] = "Hello World!";

	ft_memset(t + 2, 1, 6);
	ft_putstr("test ft_memset: ");
	ft_putendl(compare(t, "He\1\1\1\1\1\1rld!", strlen(t)) ? OK : KO);
}

void test_ft_memcpy()
{
	char *t = ft_strdup("Admettons que ceci est une longue chaine de caractere.");
	char *s = ft_strdup("dwqdwqdqdwqdwqdgywuqygdywydgrandenbroiemkdwjwkldwofjhi");

	ft_putstr("test ft_memcpy: ");
	ft_memcpy(t + 27, s + 27, 6);
	ft_putendl(compare(t, "Admettons que ceci est une grande chaine de caractere.", strlen(t)) ? OK : KO);
}

void test_ft_strdup()
{
	char t[100] = "Bonjour Je suis une phrase quelconque.";
	char *s;

	s = ft_strdup(t);
	ft_putstr("test ft_strdup: ");
	ft_putendl(s != t && compare(s, t, strlen(t)) && !ft_strdup(NULL) ? OK : KO);
}

void test_ft_cat(int ac, char **av)
{
	ft_putstr("test error on ft_cat: ");
	ft_cat(4);
	ft_putendl(OK);
	ac == 1 ? ft_putendl("if you want to try ft_cat on a file, put it in argument.") : 0;
	while (*++av)
	{
		int fd = open(*av, O_RDONLY);
		ft_cat(fd);
		close(fd);
	}
}

void test_ft_abs()
{
	ft_putstr("test ft_abs: ");
	ft_putendl(ft_abs(-10) == 10 && ft_abs(0) == 0 && ft_abs(2147483647) == 2147483647 && ft_abs(-2147483647) == 2147483647 && ft_abs(10) == 10 ? OK : KO);
}

void	real_putnbr(int n)
{
	long long int		lli;

	lli = n;
	if (lli < 0)
	{
		ft_putchar('-');
		lli = lli * -1;
	}
	if (lli > 9)
	{
		real_putnbr(lli / 10);
		ft_putchar((lli % 10) + '0');
	}
	else
		ft_putchar(lli + '0');
}

void test_number(int c)
{
	real_putnbr(c);
	ft_putstr(" : ");
	ft_putnbr(c);
	ft_putendl("");
}

void test_ft_putnbr()
{
	ft_putendl("test ft_putnbr: /* if you see a diff below, its KO */");
	test_number(-2147483648);
	test_number(2147483647);
	test_number(5);
	test_number(0);
	test_number(10);
	test_number(-10);
	test_number(-9);
	test_number(254);
	test_number(-214);
}

void test_bonus()
{
	ft_putendl("\033[33;1mBonus functions:\033[0;0m");
	test_ft_abs();
	test_ft_putnbr();
}

int main(int ac, char **av)
{
	char t[13] = "Hello world!";
	test_ft_bzero();
	test_ft_strcat();
	test_ft_isalpha();
	test_ft_isdigit();
	test_ft_isalnum();
	test_ft_isascii();
	test_ft_isprint();
	test_ft_toupper();
	test_ft_tolower();
	test_ft_puts();
	test_ft_strlen();
	test_ft_memset();
	test_ft_memcpy();
	test_ft_strdup();
	test_ft_cat(ac, av);
	test_bonus();
	!compare(t, "Hello world!", 13) ? ft_putendl("stack moved: "KO) : 0;
	return (1);
}
