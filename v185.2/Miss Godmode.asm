//Miss God Mode
// MSEA 185.2
[ENABLE]
alloc(CUserLocal__SetDamaged_Hook,128)
label(CUserLocal__SetDamaged_Normal)
label(return)

CUserLocal__SetDamaged_Hook:
push 00
push 00
push 00
push 00
push 00
push 00
push 00
push 00
push 00
push 00
push 00
push 00
xor edx,edx
call CUserLocal__SetDamaged_Normal
ret 0030

CUserLocal__SetDamaged_Normal:
push ebp
mov ebp,esp
push -01
jmp return

025A8450: // CUserLocal::SetDamaged
jmp CUserLocal__SetDamaged_Hook
return:

[DISABLE]
025A8450: //E8 ? ? ? ? EB ? 6A 00 6A 01 6A 00 6A 01 [Follow call]
db 55 8B EC 6A FF
