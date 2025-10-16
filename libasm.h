#ifndef LIBASM_H
# define LIBASM_H

# include <unistd.h>

size_t	ft_strlen(const char *str);
char	*ft_strcpy(char *dst, const char *src);
int		ft_strcmp(const char *s1, const char *s2);
ssize_t	ft_write(int filedes, const void *buff, size_t nbytes);
ssize_t	ft_read(int filedes, const void *buff, size_t nbytes);
char	*ft_strdup(const char *s1);

#endif