#rdi, rsi, rdx, rcx, r8, r9
.intel_syntax  noprefix
.globl fram


.data
background_color:
  .long 0xFFa9a900
#         a b g r
floppy_circle_color:
  .long 0xff00bdff
#         a b g r

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
    mov edx , DWORD PTR [rip+floppy_circle_color]   
    call DrawCircle@PLT
    pop rbx
    ret
