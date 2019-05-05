//Auto Key V2
//Msea v181.1
// v2 won't crash for Win7 64bit OS. Uses Auto Attack delay system

[Enable]
alloc(hook,128)
alloc(PressKey,128)
alloc(timer,4)
label(update)
label(return)
define(CTRL,001D0000)
define(SHIFT,002A0000)
define(INSERT,01520000)
define(DEL,01530000)
define(HOME,01470000)
define(END,014F0000)
define(PAGEUP,01490000)
define(PAGEDOWN,01510000)
define(ALT,00380000)
define(Z,002C0000)
define(E,00120000)
define(Autokey, Z)
define(delay, #1)

timer:
dd 0

hook:
/* call GetTickCount //call windows and windows returns a value into eax
mov edx,eax // moves eax into edx
sub edx, [timer] //edx -= timer
cmp edx, delay // change delay here //compares edx to delay
jl return //if edx < delay , return
mov [timer], eax */ // move eax into timer
inc [timer] //increment the value of timer
cmp [timer], delay // comparison
jne return //jump if timer!= delay
mov [timer], 0 //move 0 into timer
pushad //pushes in order of EAX, ECX, EDX, EBX, ESP, EBP, ESI, EDI
mov edx,Autokey // change key here
call PressKey
popad //restores from pushad
jmp return //jump to return

PressKey:
mov esi,[03646EA0] // TSingletonCWvsContext 8B 0D ?? ?? ?? ?? 50 E8 ?? ?? ?? ?? 8D 4D ?? E8 ?? ?? ?? ?? 8B 4D ?? 64 89 0D ?? ?? ?? ?? 59
mov ecx,[esi+A4]
push edx
push 00
call 028F0530
ret

update:
push 02F0A58B // Original opcode
jmp return

02816685: // CMob::Update (only calls when in maps with mobs, useful if you get stuck in town while map rushing) //start!
jmp hook //jump to hook
return:

[Disable]
02816685:
push 02F0A58B
db 64 A1 00 00 00 00

dealloc(hook)
dealloc(PressKey)
