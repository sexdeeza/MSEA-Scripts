/Moopler - OuterHaven
define(delay,#70)
[Enable]
Alloc(Hook,128)
Label(Return)
label(Exit)

Alloc(timer,4)
timer:
dd 00

// CDropPool::TryPickUpDropByPet
011F1310: //2B 81 ? ? 00 00 3D B8 0B 00 00 0F 8C call below
jmp Hook
Return:

Hook:
call 011E6A60 //original
push esi
mov esi,eax
pushad
call 0274FEF0 //get update time 74 ? E8 ? ? ? ? 50 FF ? ? E8 ? ? ? ? 83 C4 08 84 C0 74 ? call below
mov edx,eax
sub edx,[timer]
cmp edx,delay
jl Exit
mov [timer],eax

mov edi,[ebp+08] //pet pointer
lea ecx,[edi+04]
mov ebx,[edi+04]
mov ebx,[ebx+20]
call ebx // CPet::GetVecCtrl
push [esi+04] // Item Y
push [esi] // Item X
mov ecx,eax
call 027DB4C0 //E8 ? ? ? ? 83 ? 10 77 CVecCtrlDragon::WarpPoint
popad
pop esi
jmp Return

Exit:
popad
pop esi
jmp Return


[Disable]
dealloc(Hook)
dealloc(timer)

011F1310:
call 011E6A60
