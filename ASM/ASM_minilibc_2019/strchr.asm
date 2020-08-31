BITS 64

SECTION .text
GLOBAL strchr

strchr:
    push rbp
    mov rbp, rsp
    xor rcx, rcx
    cmp rdi, 0
    jz is_null


while:
    cmp [rdi + rcx], sil
    jz end
    cmp BYTE [rdi + rcx], 0
    jz is_null
    inc rcx
    jmp while


is_null:
    mov rax, 0
    mov rsp, rbp
    pop rbp
    ret


end:
    add rdi, rcx
    mov rax, rdi
    mov rsp, rbp
    pop rbp
    ret