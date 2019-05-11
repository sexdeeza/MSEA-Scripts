// works well only with jumping mob / flying mob
// https://www.gamekiller.net/threads/an-medium-guide-of-maplestory-fma-and-non-fma.3253450/

//script updated by BreadKiller
[ENABLE]
alloc(hook,128)
label(return)

hook:
mov [esp+4],#9//nAction
mov [esp+28],#17 //nMoveType
mov [esp+4C],#1 //bAirhit

//Vac to Char X
mov edi,[03646E6C] //CUserLocal: 8B 3D ? ? ? ? 8B CF F3
mov eax,[esi+15144] //Character X Location Offset: 8d 86 ? ? ? ? 8b cf 50 e8 ? ? ? ? 5f 5e 5b
add eax,#100 //Adjust X
mov [esp+2C],eax //nMoveEndingX

//Vac to Char Y
mov edi,[03646E6C] //CUserLocal: 8B 3D ? ? ? ? 8B CF F3
mov eax,[esi+15144+4] //Character X Location Offset+4: 8d 86 ? ? ? ? 8b cf 50 e8 ? ? ? ? 5f 5e 5b
add eax,#0 //Adjust Y
mov [esp+30],eax //nMoveEndingY
//Original Opcodes
push ebp
mov ebp,esp
push -01
jmp return

01746220: //55 8B EC 6A FF 68 ? ? ? ? 64 A1 00 00 00 00 50 81 EC ? ? ? ? A1 ? ? ? ? 33 C5 89 45 ? 53 ? ? 50 8D 45 F4 64 A3 00 00 00 00 8B D9 89 9D 1C FF FF FF
jmp hook
return:

[DISABLE]
01746220:
push ebp
mov ebp,esp
push -01
