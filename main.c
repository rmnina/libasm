#include <stdio.h>
#include <string.h>
#include <stdlib.h>

size_t	ft_strlen(const char *str);
char	*ft_strcpy(char *dst, const char *src);
int		ft_strcmp(const char *s1, const char *s2);

int	main(int argc, char **argv)
{
	if (argc < 3)
		return (printf("Wrong number of argument. Expected : two (COMMAND, arg)\n"), 1);
	if (!strcmp(argv[1], "LEN"))
	{
		printf("Calculated length of %s is %zu\n", argv[2], ft_strlen(argv[2]));
		printf("Actual length of %s is %lu\n", argv[2], strlen(argv[2]));
	}
	else if (!strcmp(argv[1], "COPY"))
	{
		char	*src = argv[2];
		char	dest[strlen(argv[2])];
	
		char	PROOF_dest[strlen(argv[2])];

		bzero(dest, strlen(argv[2]));
		bzero(PROOF_dest, strlen(argv[2]));

		printf("Copy with std function... Dest is %s\n", strcpy(PROOF_dest, src));	
		printf("Copy of src into dest... Dest is %s\n\n", ft_strcpy(dest, src));

		printf("Copy with dest not clear with std function... Dest is %s\n", strcpy(PROOF_dest, src));	
		printf("Copy with dest not clear of src into dest... Dest is %s\n\n", ft_strcpy(dest, src));

		char	*dest2 = malloc(sizeof(char)* strlen(argv[2]) - 3);
		if (!dest2)
			return (printf("ERROR ALLOCATION\n"), 1);
		char	*PROOF_dest2 = malloc(sizeof(char)* strlen(argv[2]) - 3);
		if (!PROOF_dest2)
		{
			free (dest2);
			return (printf("ERROR ALLOCATION\n"), 1);
		}

		printf("Copy with dest too small with std function... Dest is %s\n", strcpy(PROOF_dest2, src));	
		printf("Copy with dest too small of src into dest... Dest is %s\n", ft_strcpy(dest2, src));
	}
	else if (!strcmp(argv[1], "COMPARE"))
	{
		if (argc != 4)
			return (printf("Wrong number of argument. Expected : 3 (COMMAND, arg1, arg2)\n"), 1);

		printf("Compare on two args gives %d\n", ft_strcmp(argv[2], argv[3]));
		printf("STD compare on two args gives %d\n", strcmp(argv[2], argv[3]));
	}

	return (0);
}