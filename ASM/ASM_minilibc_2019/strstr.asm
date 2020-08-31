BITS 64

SECTION .text
GLOBAL strstr

strstr:
    push rbp
    mov rbp, rsp
    xor rcx, rcx


start_while:
    mov rax, rcx
    xor rdx, rdx

    mov r8b, [rdi + rcx]
    mov r9b, [rsi + rdx]

    cmp r8b, 0
    jz not_found

    cmp r8b, r9b
    jz while

    inc rcx
    jmp start_while


while:
    inc rdx
    inc rcx

    mov r8b, [rdi + rcx]
    mov r9b, [rsi + rdx]
    
    cmp r9b, 0
    jz found
    
    cmp r8b, 0
    jz not_found

    cmp r8b, r9b
    jz while
    
    jmp start_while


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