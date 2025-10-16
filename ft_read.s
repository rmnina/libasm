bits 64

section .text
global _ft_read
extern ___error			; TODO : modify for linux arch

; ssize_t   read(int fildes, void *buf, size_t nbyte);
_ft_read:
	mov rax, 0x2000003	; syscall checks the value of rax to know which function to call. code for read is 1
; TODO : change value for 0. currently coding on macos and every syscall has a 0x2000000 offset
	syscall

	jc .error_handler	; on macOS, error goes in the carry flag, rax keeps a positive value
	; TODO To use for linux : cmp rax, 0			; read puts the nb or bytes written or its error value in rax
	; TODO To use for linux : jl .error_handler	; jl = jump if less. if error, value in rax is negative
	ret

.error_handler:
	mov rdi, rax
	; LINUX : neg rdi
	call ___error
	mov [rax], rdi
	mov rax, -1
; TODO : put error code in errno. macos doesn't let me lmao (or skill issue maybe)
	ret