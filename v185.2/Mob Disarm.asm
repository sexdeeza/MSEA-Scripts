[ENABLE]
01714C24: //75 ? 8D ? ? 8B ? E8 ? ? ? ? 8B ? E8 ? ? ? ? 85 ? 0F 84 ? ? ? ? 8B
jmp 0171538A //8B ? ? ? ? ? 85 C0 0F 84 ? ? 00 00 2B ? 0F 89 ? ? ? ? C7 ? ? 00 00 00 00 8D
//backtrack from jmp above

[DISABLE]
01714C24:
db 75 0A 8D 50 FA
mov ecx, ebx
call 017841D0 //update call as well
