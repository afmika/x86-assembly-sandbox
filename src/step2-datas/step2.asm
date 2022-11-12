global _start


; data section
; addr <- "command" raw data 
section .data
    ; the address is hold in msg as an integer
    ; 0x0a == \n
    msg db "Hello, world!", 0x0a
    ; current address - start string address = length 
    len equ $ - msg

section .text
_start:
    mov eax, 4      ; sys_write syst call
    mov ebx, 1      ; stdout file descriptor
    mov ecx, msg    ; bytes to write (the start address)
    mov edx, len    ; number of bytes
    int 0x80        ; interrupt (do some black magic in the cpu <-> hardware components to print)
    ; now do the usual exit code 0 (otherwise we get seg fault)
    mov eax, 1      
    mov ebx, 0
    int 0x80