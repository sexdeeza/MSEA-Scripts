//Boss GodMode
//MSEA 185.2

[ENABLE]
0129EE36:
mov eax,1

[DISABLE]
0129EE36: // E8 ? ? ? ? 83 C4 04 C3 CC FF B1 ? ? 00 00 E8 ? ? ? FF 83 C4 04 C3 CC FF B1 ? ? 00 00
call 0098B670 // update
