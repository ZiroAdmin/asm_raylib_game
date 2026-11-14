#rdi, rsi, rdx, rcx, r8, r9
.intel_syntax  noprefix
.globl process
.data
floppy_attribute:
  .long  -60 # jamp_power
  .long -1 # forword speed 


falling_speed:
  .long -4
.text

falling:
  push rdx  
# add DWORD ptr [rip+falling_speed] , -1
  mov edi , DWORD ptr [rip+falling_speed]
  sub DWORD ptr [rip+floppy_circle+4],edi
  pop rdx
  ret

fix_postion_in_bottom:
  push rdx
  mov edi ,DWORD ptr [rip+window+4]
  mov DWORD ptr [rip+floppy_circle+4], edi
  pop rdx
  ret 
jamp:
  push rdx
  mov edi, DWORD ptr [rip+floppy_attribute]
  add DWORD ptr [rip+floppy_circle+4], edi
  pop rdx
  ret

process:
  push rdx
  mov edi , 32 # Key: Space 
  call IsKeyPressed@PLT
  cmp eax , 1
  jnz skip_jamp
  call jamp
skip_jamp:
  # _if floppy_circle Y center < window Y -> fall _if not goto skip falling 
  mov edi ,DWORD ptr [rip+window+4]
  cmp DWORD ptr [rip+floppy_circle+4], edi 
  jge skip_falling
  call falling
  jmp we_dont_need_fix
skip_falling:
  call fix_postion_in_bottom
we_dont_need_fix:
  mov edi ,DWORD ptr [rip+window+4]
  cmp DWORD ptr [rip+floppy_circle+4], edi 

  pop rdx
  ret
