bits 64

section .text
global _ft_write

; ssize_t ft_write(int filedes, const void *buf, size_t nbyte);
_ft_write:
	mov rax, 0x2000004  ; syscall checks the value of rax to know which function to call. code for write is 1
; TODO : change value for 1. currently coding on macos and every syscall has a 0x2000000 offset
	syscall     		; calls write with code in rax, filedes in rdi, buff in rsi and size in rdx
	cmp rax, 0			; write puts the nb or bytes written or its error value in rax
	jl .error_handler	; jl = jump if less. if error, value in rax is negative
	ret

.error_handler:
	neg rax				; converts error into positive value
; TODO : put error code in errno. macos doesn't let me lmao (or skill issue maybe)
	ret


