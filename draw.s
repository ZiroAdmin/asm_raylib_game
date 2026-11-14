#rdi, rsi, rdx, rcx, r8, r9
.intel_syntax  noprefix
.globl fram


.data
background_color:
    #       a b g r
    .long 0xFFa9a900  # color
floppy_circle:
    .long 50 # centerX
    .long 300 # centerY
    .float 20.0 # radius
    #       a b g r
    .long 0xff00bdff  # color

.text

fram:
    push rbx
    #Clear Background
    mov edi , DWORD PTR [rip+background_color]
    call ClearBackground@PLT
    #Darw floppy_circle
    mov edi , DWORD PTR [rip+floppy_circle]
    mov esi , DWORD PTR [rip+floppy_circle+4]
    movss xmm0 , DWORD PTR [rip+floppy_circle+8]
    mov edx , DWORD PTR [rip+floppy_circle+12]   
    call DrawCircle@PLT
    pop rbx
    ret
