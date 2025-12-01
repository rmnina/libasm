bits 64						; this code is for a 64bits architecture

section .text				; declaring an executable section of code
global ft_strlen			; declaring the symbol ft_strlen visible outside of this code (for a C program to use)

; size_t ft_strlen(const char *str);
ft_strlen:
	xor rcx, rcx			; sets rcx to 0. Equivalent to "mov rcx, 0" but much faster
							; rcx is used as a counter to count characters

.loop: 						; starts the main loop
	cmp byte [rdi + rcx], 0 ; [rdi + rcx] is the address of the current char in the string
							; rdi contains the first arg of the function, and rcx the number of characters already counted
							; it's compared to byte 0, that is, '\0', which would indicate the end of the string
	je .return				; je = jump if equal. We reach the end of the string so we jump to the end of the function
	inc rcx					; if we didn't return, we count the char and increment the counter (rcx)
	jmp .loop				; we restart the process until meeting the stopping condition

.return:
	mov rax, rcx			; put rcx into the returned value
	ret						; we go back to the caller

section .note.GNU-stack
