[Enable]
Alloc(Aggro, 128)
Label(return)

Aggro:
mov eax,[03646E6C] //Char Base 8B 3D ? ? ? ? 8B CF F3
lea eax,[eax+04]
mov [ecx+000004E8],eax //Aggro offset 83 BE ? ? ? ? 00 0F 85 ? ? 00 00 8B CE E8 ? ? ? ? 85 C0 74 [Offset+0x08]

push ebp
mov ebp,esp
push -01
jmp return

02816680:
jmp Aggro
return:


[DISABLE]
02816680:// CVecCtrlMob::WorkUpdateActive: E9 ? ? ? ? 8B ? ? ? 00 00 83 ? ? 0F ? ? ? ? ? FF [FUNCTION START]
push ebp
mov ebp,esp
push -01


dealloc(Aggro)
