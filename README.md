# x86-assembly-sandbox
x86 assembly sandbox

# TL;DR
In x86 NASM, it works like this
1. Mention the entrypoint, and it should be `_start`
2. To perform some black magic with the OS and the Hardware (exit or write for example), we need to do a syscall

```asm
mov eax, YOUR_SYS_CALL_CODE     ; start the syscall (example : 1 for exit, 4 for write to the stdout)
; ... 
; operations, register setup
; ...
int 0x80                        ; commit the syscall
```

* Example :
```asm
global _start
_start:
    mov eax, 1 ; start sys_call : mode write
    mov ebx, 0 ; ebx will be used to store the exit code 0
    int 0x80   ; run the sys_call (commit)
```