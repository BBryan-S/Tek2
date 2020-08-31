BITS 64

SECTION .text
GLOBAL strpbrk

strpbrk:
    push rbp
    mov rbp, rsp
    xor rcx, rcx


start_while:
    mov rax, rcx
    xor rdx, rdx

    mov r8b, [rdi + rcx]

    inc rcx

    cmp r8b, 0
    jz not_found


while:
    mov r9b, [rsi + rdx]

    cmp r9b, 0
    jz start_while

    cmp r8b, 0
    jz not_found

    cmp r8b, r9b
    jz found

    inc rdx

    jmp while


found:
    mov rcx, rax
    mov rax, rdi
    add rax, rcx
    jmp end

not_found:
    mov rax, 0

end:
    mov rsp, rbp
    pop rbp
    ret