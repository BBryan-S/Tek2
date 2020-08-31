BITS 64

SECTION .text
GLOBAL strncmp

strncmp:
    push rbp
    mov rbp, rsp
    xor rcx, rcx


while:
    mov r8b, [rdi + rcx]
    mov r9b, [rsi + rcx]
    cmp rcx, rdx
    jz size_end
    cmp r8b, 0
    jz end
    cmp r9b, 0
    jz end
    cmp r8b, r9b
    jnz end
    inc rcx
    jmp while


size_end:
    mov rax, 0
    mov rsp, rbp
    pop rbp
    ret


end:
    sub r8b, r9b
    movsx rax, r8b
    mov rsp, rbp
    pop rbp
    ret