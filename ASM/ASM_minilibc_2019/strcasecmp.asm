BITS 64

SECTION .text
GLOBAL strcasecmp

strcasecmp:
    push rbp
    mov rbp, rsp
    xor rcx, rcx


while:
    mov r8b, [rdi + rcx]
    mov r9b, [rsi + rcx]
    cmp r8b, 0
    jz end
    cmp r9b, 0
    jz end
    inc rcx
    cmp r8b, r9b
    jnz diferent
    jmp while


diferent:
    cmp r8b, 90
    jle upper8
    cmp r9b, 90
    jle upper9
    cmp r8b, r9b
    jnz end
    jmp while

upper8:
    cmp r8b, 65
    jl end
    add r8b, 32
    jmp diferent

upper9:
    cmp r9b, 65
    jl end
    add r9b, 32
    jmp diferent

end:
    mov r8b, [rdi + rcx]
    sub r8b, [rsi + rcx]
    movsx rax, r8b
    mov rsp, rbp
    pop rbp
    ret