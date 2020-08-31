BITS 64

SECTION .text
GLOBAL strlen

strlen:
    push rbp
    mov rbp, rsp
    xor rcx, rcx


while:
    cmp BYTE [rdi + rcx], 0
    jz end
    inc rcx
    jmp while


end:
    mov rax, rcx
    mov rsp, rbp
    pop rbp
    ret