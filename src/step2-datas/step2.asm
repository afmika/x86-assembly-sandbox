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
    int 0x80        ; run the syscall (do some blackmagic with the hardware)
    ; now do the usual exit code 0 (otherwise we get seg fault)
    mov eax, 1      ; sys_exit systcall
    mov ebx, 0      ; exit code
    int 0x80        ; run the syscall