//Remove Damage
//Msea v185.2
[Enable]
0170FEF0:
ret 0074

[Disable]
0170FEF0: //Function start 55 8B EC 6A FF 68 ? ? ? ? 64 A1 00 00 00 00 50 83 EC ? 53 56 57 A1 ? ? ? ? 33 C5 50 8D 45 ? 64 A3 00 00 00 00 8B F9 89 7D F0 8B 0D ? ? ? ? C7 45 FC ? ? ? ? 85 C9
push ebp
mov ebp,esp
