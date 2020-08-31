BITS 64

SECTION .text
GLOBAL memset

memset:
    push rbp
    mov rbp, rsp
    xor rcx, rcx


while:
    cmp rcx, rdx
    jz end
    mov [rdi + rcx], sil
    inc rcx
    jmp while


end:
    mov rax, rdi
    mov rsp, rbp
    pop rbp
    ret