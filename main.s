#rdi, rsi, rdx, rcx, r8, r9
.intel_syntax  noprefix
.globl main
.globl floppy_circle
.globl window

.data
window:
    .long 800  
    .long 600   
    .asciz "floppy game"
floppy_circle:
    .long 50 # centerX
    .long 300 # centerY
    .float 20.0 # radius

.text
main:
    push rbx
    mov edi , DWORD ptr [rip+window]
    mov esi, DWORD ptr [rip+window+4]
    lea rdx, [rip+window+8]
    call InitWindow@PLT
# void SetTargetFPS(int fps = 60);
    mov  edi , 60 
    call SetTargetFPS@PLT
main_loop:
    call BeginDrawing@PLT
    call fram
    call process
    call EndDrawing@PLT
    call WindowShouldClose@PLT
    cmp al , 0
    jz main_loop
    call CloseWindow@PLT
    mov eax , 1
    pop rbx
    ret
