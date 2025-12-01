bits 64

extern __errno_location

section .text
global ft_read

; ssize_t   read(int fildes, void *buf, size_t nbyte);
ft_read:
	mov rax, 0			; syscall checks the value of rax to know which function to call. code for read is 1
	syscall

	;jc .error_handler	: on macOS, error goes in the carry flag, rax keeps a positive value
	cmp rax, 0			; read puts the nb or bytes written or its error value in rax
	jl .error_handler	; jl = jump if less. if error, value in rax is negative
	ret

.error_handler:
	mov rdi, rax					; save error value in rdi
	neg rdi							; converts error into positive value
	call __errno_location wrt ..plt	; call error to get location of erno in rax. wrt..plt asks the linker to use the Procedure Linkage Table
	mov [rax], rdi					; write errno in the location contained in rax ([] is the accessor)
	mov rax, -1						; sets rax to -1
	ret

; tells the linker the stack doesnt need to be executable
section .note.GNU-stack