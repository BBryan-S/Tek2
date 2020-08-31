BITS 64

SECTION .text
GLOBAL strcmp

strcmp:
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
    cmp r8b, r9b
    jnz end
    inc rcx
    jmp while


end:
    sub r8b, r9b
    movsx rax, r8b
    mov rsp, rbp
    pop rbp
    ret