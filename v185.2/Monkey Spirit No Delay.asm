[ENABLE]
//Created by DBLmao
alloc(Hook,100)
alloc(timer,4)
label(Return)
label(Original)
define(delay, #350)

timer:
dd 00

Hook:
/*
push eax
mov eax,[036E07B0] //8B 0D ? ? ? ? 8D 85 ? FF FF FF 6A 00 6A 00 [FIRST] CHECK SECOND
cmp [eax+10],00
pop eax
jle Original
*/
call GetTickCount
mov edx,eax
sub edx, [timer]
cmp edx,delay
jl Original
mov [timer],eax
mov [esi+00014D08],#42120003 // [offset from below]
mov [esi+00014D08+4],#55 // [offset from below]

Original:
cmp dword ptr [esi+00014D08],00 // [offset from below]
jmp Return

026D1B4E: //83 BE ? ? ? ? 00 0F 84 ? ? 00 00 2B 86 ? ? ? ? 0F 88 ? ? 00 00 8B
jmp Hook
db 90 90
Return:

026C76FE: //74 ? 8B ? ? 3B ? ? 7C ? 8B ? ? ? ? ? 53 E8 ? ? ? ? [JL BELOW]
db 90 90

[DISABLE]
026D1B4E:
cmp dword ptr [esi+00014D08],00 //[update offset in brackets as well]

026C76FE:
db 7C 38

dealloc(Hook)
