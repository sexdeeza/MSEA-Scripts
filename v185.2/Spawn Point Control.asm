//Spawn Point Control
// MSEA 185.2
[Enable]
Alloc(Hook, 124)
Label(Return)
Label(Exit)

Hook:
cmp [esp], 025153C9 // address of push below call dword ptr FF 52 ?? 6A ?? 6A ?? 6A ?? ?? ?? ?? ?? ?? E8
jne Exit
mov [esp+8], #100 // X [change this]
mov [esp+C], #-185 // Y [change this]

Exit:
push ebp
mov ebp,esp
push -01
jmp Return

00D0C350:
jmp Hook
Return:

[Disable]
DeAlloc(Hook)
00D1C750: // CVecCtrl::SetActive 55 8B EC 6A FF 68 ? ? ? ? 64 A1 ? ? ? ? 50 81 EC ? ? ? ? 53 56 57 A1 ? ? ? ? 33 C5 50 8D 45 F4 64 A3 ? ? ? ? 8B D9 89 5D F0 8B 35 [FIRST]
push ebp
mov ebp,esp
push -01
