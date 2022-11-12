global _start

section .data
    some_addr db "ABC", 0xa



section .text
_start:
    ; jmp stack_from_scratch
    ; jmp basic_stack
    jmp stack_with_data


stack_with_data:
    mov eax, [some_addr] ; eax <- *some_addr
    push eax
    jmp do_print_four_bytes_top_stack_and_exit

basic_stack:
    ; '\n' C B A
    ; 0xa << 24 | 67 << 16 | 66 << 8 | 65
    push 172180033 ; push and substract 4 bytes from the stack pointer
    jmp do_print_four_bytes_top_stack_and_exit

stack_from_scratch:
    ; To illustrate the fact that the stack
    ; push and pop move the pointer -4, +4 offset
    ; equiv to
    ; 0xa << 24 | 67 << 16 | 66 << 8 | 65
    sub esp, 4
    mov [esp], byte 'A'
    mov [esp+1], byte 'B'
    mov [esp+2], byte 'C'
    mov [esp+3], byte 0x0a ; \n
    jmp do_print_four_bytes_top_stack_and_exit



do_print_four_bytes_top_stack_and_exit:
    ; usual print top stack
    mov eax, 4   ; sycall : syswrite flag
    mov ebx, 1   ; stdout file descriptor
    mov ecx, esp ; pointer to the start of the string
    mov edx, 4   ; 4 bytes to write
    int 0x80
    ; usual exit code
    mov eax, 1
    mov ebx, 0
    int 0x80
