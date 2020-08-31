BITS 64

SECTION .text
GLOBAL memmove

memmove:
    push rbp
    mov rbp, rsp
    xor rcx, rcx


while:
    cmp rcx, rdx
    jz end
    mov r8b, [rsi + rcx]
    mov [rdi + rcx], r8b
    inc rcx
    jmp while


end:
    mov rax, rdi
    mov rsp, rbp
    pop rbp
    ret