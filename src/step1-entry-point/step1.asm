global _start

; in nasm, the 'main' == _start

; status code 0 == we are good
; mov eax, 1 <- sys_exit syscall
; mov ebx, 0 <- status code
; int 0x80

_start:
    mov eax, 1 ; sys_exit syscall
    ; let's prepare the code
    ; return with exit code ebx = 42
    mov ebx, 2 ; 2
    add ebx, 4 ; 2 + 4
    sub ebx, eax ; 6 - 1
    ; exit code should be 5 now 
    int 0x80