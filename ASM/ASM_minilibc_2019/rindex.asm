BITS 64

SECTION .text
GLOBAL rindex

rindex:
    push rbp
    mov rbp, rsp
    xor rcx, rcx

go_to_end:
    cmp BYTE [rdi + rcx], 0
    jz while
    inc rcx
    jmp go_to_end

while:
    cmp [rdi + rcx], sil
    jz end
    cmp rcx, 0
    jz is_null
    dec rcx
    jmp while

is_null:
    mov rax, 0
    mov rsp, rbp
    pop rbp
    ret

end:
    mov rax, rdi
    add rax, rcx
    mov rsp, rbp
    pop rbp
    ret