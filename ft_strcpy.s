bits 64						; this code is for a 64bits architecture

section .text				; declaring an executable section of code
global ft_strcpy			; declaring the symbol ft_strlen visible outside of this code (for a C program to use)

; char *ft_strcpy(char *dst, const char *src);
ft_strcpy:
	xor rcx, rcx			; sets rcx to 0. Equivalent to "mov rcx, 0" but much faster
							; rcx is used as a counter to count characters

.loop:						; starts the main loop
	mov al, [rsi + rcx]		; copies the current char [rsi (src) + rcx (counter)] into a 8bytes temporary register
	mov [rdi + rcx], al		; copies the char in al into the current position in rdi (dest)
							; the temporary register is used because the instruction "mov" needs at least 1 register
	test al, al				; verifies if we reached '\0' by performing al & al
	je .return				; jumps to return if yes

	inc rcx					; increments the counter that indicates the position of the char
	jmp .loop				; restarts the loop

.return:
	mov rax, rdi			; sets rdi as the returned value
	ret						; goes back to the caller

section .note.GNU-stack