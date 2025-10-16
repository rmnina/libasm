bits 64

section .text
global _ft_write
extern ___error 		; TODO : modify for linux arch

; ssize_t ft_write(int filedes, const void *buf, size_t nbyte);
_ft_write:
	mov rax, 0x2000004  ; syscall checks the value of rax to know which function to call. code for write is 1
; TODO : change value for 1. currently coding on macos and every syscall has a 0x2000000 offset
	syscall     		; calls write with code in rax, filedes in rdi, buff in rsi and size in rdx
	jc	.error_handler	; on macOS, error goes in the carry flag, rax keeps a positive value
	; TODO for linux : cmp rax, 0			; write puts the nb or bytes written or its error value in rax
	; TODO for linux : jl .error_handler	; jl = jump if less. if error, value in rax is negative
	ret

.error_handler:
	mov rdi, rax				; save error value in rdi
	; LINUX neg rdi				; converts error into positive value
	call ___error				; call error to get location of erno in rax
	mov [rax], rdi				; write errno in the location contained in rax ([] is the accessor)
	mov rax, -1					; sets rax to -1
	ret
