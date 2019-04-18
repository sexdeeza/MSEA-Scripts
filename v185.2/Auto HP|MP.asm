//Auto Hp and MP
//Msea v185.2
[enable]
define(CTRL,001D0000)
define(SHIFT,002A0000)
define(INSERT,01520000)
define(DEL,01530000)
define(HOME,01470000)
define(END,014F0000)
define(PAGEUP,01490000)
define(PAGEDOWN,01510000)
define(ALT,00380000)
define(Z,002C0000))
alloc(HP,4)
alloc(MP,4)
alloc(CheckHP,128)
alloc(CheckMP,128)
alloc(PressKey,128)
label(HPReturn)
label(MPReturn)

//HP
define(HP_Value,#1000) //Define HP Trigger Here (Do not remove # tag)
define(HealthKey, PAGEUP) //HP Key
//MP
define(MP_Value,#1000) //Define MP Trigger Here (Do not remove # tag)
define(ManaKey, PAGEDOWN) //MP Key

HP:
dd HP_Value
MP:
dd MP_Value

CheckHP:
mov [ebx+00000214],edi
cmp edi,[HP]
jg HPReturn
pushad
mov edx,HealthKey
call PressKey
popad
jmp HPReturn

CheckMP:
mov [ebx+00000214],edi
cmp edi,[MP]
jg MPReturn
pushad
mov edx,ManaKey
call PressKey
popad
jmp MPReturn

022C1B3F:
jmp CheckHP
db 90
HPReturn:

022C2279:
jmp CheckMP
db 90
MPReturn:

PressKey:
mov esi,[03646EA0] // TSingletonCWvsContext
/*
Mem Search Addy 55 8B EC 56 8B F1 E8 ? ? F7 FF F6 45 08 01 74 0E 68 ? ? 00 00 56 E8 ? ? ? 00 83 C4 08 8B C6 5E 5D C2 0400
4 Byte Scan Result Addy. Green Result
4 Byte Scan Result Addy. Black Result
4 Byte Scan Result Addy. Green Result
*/
mov ecx,[esi+A4]
push edx
push 00
call 028F0530 // CWndMan::OnKey 55 8B EC 8B 0D ?? ?? ?? ?? 85 C9 74 ?? 83 C1 ?? [First]
ret
[disable]
022C1B3F: // Addy that accesses UI HP Value 022C1B3F
mov [ebx+00000214],edi
022C2279: // Addy that accesses UI MP Value 022C2279
mov [ebx+00000214],edi
dealloc(HP)
dealloc(MP)
dealloc(CheckHP)
dealloc(CheckMP)
dealloc(UseHP)
dealloc(UseMP)
dealloc(PressKey)
