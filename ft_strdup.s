bits 64

section .text
global _ft_strdup
extern _ft_strlen
extern _ft_strcpy
extern _malloc
extern _error

; char *strdup(const char *s1);
_ft_strdup:
	push rbx				; save on stack callee-saved register rbx
	mov rbx, rdi			; save s1 in rbx
	call _ft_strlen			; takes rdi as a param, so s1
	add rax, 1				; add 1 to strlen result for '\0'
	mov rdi, rax			; pass len as param for malloc
;	imul rdi, 1				; multiplies by size of char. Useless here but needs to be done for other types
	call _malloc			; takes rdi as param
	test rax, rax			; verifies if malloc succedeed
	je .error_handler		; goes to error if it failed
	mov rdi, rax			; pass malloc'ed pointer as dest param for copy
	mov rsi, rbx			; pass s1 as source param
	call _ft_strcpy			; performs copy in allocated space
	pop rbx					; restores callee-saved resgister rbx
	ret

.error_handler:
	mov rdi, 12				; code ENONEM on MacOS. TODO : modify for linux
	call _error
	mov [rax], rdi
	mov rax, 0
	pop rbx
	ret