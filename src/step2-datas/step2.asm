global _start

; we have 2 SECTIONS (data and text) which captures how the program layout will
; look like in machine code

; data section
; addr <- "command" raw data 
section .data
    ; the address is hold in msg as an integer
    ; 0x0a == \n
    msg db "Hello, world!", 0x0a
    ; current address - start string address = length 
    len equ $ - msg

    ; other datas types
    addr0 db 64   ; 1 byte
    addr1 dw 1003 ; 2 bytes (16 bits)
    addr2 dd 1000000 ; 4 bytes (32 bits)


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