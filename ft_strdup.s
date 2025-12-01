bits 64

extern __errno_location
extern ft_strlen
extern ft_strcpy
extern malloc

section .text
global ft_strdup

; char *strdup(const char *s1);
ft_strdup:
	push rbx				; save on stack callee-saved register rbx
	mov rbx, rdi			; save s1 in rbx
	call ft_strlen			; takes rdi as a param, so s1
	add rax, 1				; add 1 to strlen result for '\0'
	mov rdi, rax			; pass len as param for malloc
;	imul rdi, 1				; multiplies by size of char. Useless here but needs to be done for other types
	call malloc wrt ..plt	; takes rdi as param
	test rax, rax			; verifies if malloc succedeed
	je .error_handler		; goes to error if it failed
	mov rdi, rax			; pass malloc'ed pointer as dest param for copy
	mov rsi, rbx			; pass s1 as source param
	call ft_strcpy			; performs copy in allocated space
	pop rbx					; restores callee-saved resgister rbx
	ret

.error_handler:
	mov edi, 12				; code ENONEM on MacOS. TODO : modify for linux
	call __errno_location wrt ..plt
	mov [rax], edi
	xor rax, rax
	pop rbx
	ret

section .note.GNU-stack