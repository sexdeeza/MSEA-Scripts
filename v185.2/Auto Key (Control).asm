[enable]
define(VK_CONTROL,001D0000)
define(VK_RSHIFT,002A0000)
define(VK_INSERT,01520000)
define(VK_DELETE,01530000)
define(VK_HOME,01470000)
define(VK_END,014F0000)
define(VK_PRIOR,01490000) //PageUp
define(VK_NEXT,01510000) //PageDown
define(VK_Z,002C0000)

alloc(hook,128)
alloc(PressKey,128)
label(return)

hook:
push 02F0A58B
pushad
mov edx,VK_CONTROL //Define Key Here
call PressKey
popad
jmp return

PressKey:
mov esi,[03646EA0] // TSingletonCWvsContext 02F91448 026512D0 55 8B EC 56 8B F1 E8 ? ? F6 FF F6 45 08 01 74 0E 68 ? ? 00 00 56 E8 ? ? ? 00 83 C4 08 8B C6 5E 5D C2 04 00
/*
Mem Search Addy 55 8B EC 56 8B F1 E8 ? ? F7 FF F6 45 08 01 74 0E 68 ? ? 00 00 56 E8 ? ? ? 00 83 C4 08 8B C6 5E 5D C2 0400
Mem Search Result Addy
4 Byte Scan Result Addy. Green Result
Too lazy to wait for asmscan to find a "proper" aob
*/
mov ecx,[esi+A4]
push edx
push 00
call 028F0530 // CWndMan::OnKey 55 8B EC 8B 0D ?? ?? ?? ?? 85 C9 74 ?? 83 C1 ?? [First]
ret

02816685:
jmp hook
return:

[disable]
02816685:
push 02F0A58B
db 64 A1 00 00 00 00

dealloc(hook)
dealloc(PressKey)
