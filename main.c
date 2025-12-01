#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <fcntl.h>
#include <unistd.h>
#include <errno.h>
#include "libasm.h"

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
		free (dest2);
		free (PROOF_dest2);
	}
	else if (!strcmp(argv[1], "COMPARE"))
	{
		if (argc != 4)
			return (printf("Wrong number of argument. Expected : 3 (COMMAND, arg1, arg2)\n"), 1);

		printf("Compare on two args gives %d\n", ft_strcmp(argv[2], argv[3]));
		printf("STD compare on two args gives %d\n", strcmp(argv[2], argv[3]));
	}
	else if (!strcmp(argv[1], "WRITE"))
	{
		if (argc < 4)
		{
			printf("\nFunction write on stdout just above: %lu bytes\n", ft_write(1, argv[2], ft_strlen(argv[2])));
			printf("Errno with write is %d\n", errno);
			printf("\nSTD write on stdout just above:  %lu bytes\n", write(1, argv[2], ft_strlen(argv[2])));
			printf("Errno with STD write is %d\n", errno);
			printf("\n(You can use a filename as a third argument to write in a file).\n");
		}
		else if (argc == 4)
		{
			char	*filename = argv[3];
			int fd = open(filename, O_RDWR | O_CREAT, 0644);

			printf("Function write in file : %lu bytes\n", ft_write(fd, argv[2], ft_strlen(argv[2])));
			printf("Errno with write is %d\n", errno);

			char	tmp[256] = "LIBC_";
			char	*TEST_file = strcat(tmp, filename);
			int fd2 = open(TEST_file, O_RDWR | O_CREAT, 0644);

			printf("STD write in file: %lu bytes\n", write(fd2, argv[2], ft_strlen(argv[2])));
			printf("Errno with STD write is %d\n", errno);
			close (fd);
			close (fd2);
		}
	}
	else if (!strcmp(argv[1], "READ"))
	{
		int 		fd = open(argv[2], O_RDONLY);
		ssize_t		bytes = 0;
		ssize_t		TEST_bytes = 0;
		char		buffer[1024];
		char		TEST_buffer[1024];

		bzero(buffer, sizeof(buffer));
		bzero(TEST_buffer, sizeof(TEST_buffer));

		bytes = ft_read(fd, &buffer, 1024);
		printf("Content of file is %s. TOTAL: %lu bytes.\n", buffer, bytes);
		printf("Errno with read is %d\n", errno);

		close(fd);
		fd = open(argv[2], O_RDONLY);		
		TEST_bytes = read(fd, &TEST_buffer, 1024);
		printf("Content of file with STD read is %s. TOTAL: %lu bytes. \n", TEST_buffer, TEST_bytes);
		printf("Errno with STD read is %d\n", errno);
	}
	else if (!strcmp(argv[1], "DUP"))
	{
		char	*dup = ft_strdup(argv[2]);
		if (!dup)
		{
			printf("Malloc failed!\n");
			printf("Errno with strdup is %d\n", errno);
			errno = 0;
		}
		else
		{
			printf("DUP is %s\n", dup);
			printf("Errno with strdup is %d\n", errno);
			errno = 0;
			free(dup);
		}
		char	*TEST_dup = strdup(argv[2]);
		if (!TEST_dup)
		{
			printf ("Malloc STD dup failed!\n");
			printf("Errno with STD strdup is %d\n", errno);
		}
		else
		{
			printf("STD DUP is %s\n", dup);
			printf("Errno with STD strdup is %d\n", errno);
			free(TEST_dup);
		}
	}
	return (0);
}