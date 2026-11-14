#rdi, rsi, rdx, rcx, r8, r9
.intel_syntax  noprefix
.globl main

.data
window:
    .long 800  
    .long 600   
    .asciz "floppy game"

.text
main:
    push rbx
    mov edi , DWORD PTR [rip+window]
    mov esi, DWORD PTR [rip+window+4]
    lea rdx, [rip+window+8]
    call InitWindow@PLT
main_loop:
    call BeginDrawing@PLT
    call fram
    call EndDrawing@PLT
    call WindowShouldClose@PLT
    cmp al , 0
    jz main_loop
    call CloseWindow@PLT
    mov eax , 1
    pop rbx
    ret
