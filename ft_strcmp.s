bits 64

section .text
global ft_strcmp

; int ft_strcmp(const char *s1, const char *s2);
ft_strcmp:
	xor rcx, rcx

.loop:
	mov al, [rsi + rcx]	; copy s2[i] into volatile 8bits register al
	mov dl, [rdi + rcx]	; copy s1[i] into volatile 8bits register dl
	cmp dl, al			; compare the 2 char
	jne .return			; if different, return 

	test dl, dl			; performs s1[i] & s1[i]. Sets the processors Zero Flag at 1 is '\0'
	je .return			; return if '\0'

	inc rcx				; increments the counter
	jmp .loop			; restarts the loop

.return:
	sub dl, al			; substracts s2[i] from s1[i]
	movsx rax, dl		; expands the result to 64bits and put it into rax
	ret					; return to the caller

section .note.GNU-stack