[Enable]
Alloc(InGameRush, 128)
Alloc(TeleportToPortal, 128)
Alloc(Delay, 8)
Label(Exit)
Label(Return)
Label(End)

02524E2F: //89 87 ? ? ? ? 81 bf 94 43 01 00
jmp InGameRush
db 90
Return:

Delay:
dd 0

InGameRush:
inc [Delay]
cmp [Delay], #20
jl Exit
mov [Delay], 0
push eax
call TeleportToPortal
Exit:
mov [edi+000144A0],eax //Original Opcode
jmp Return

TeleportToPortal:
push ebp
mov ebp, esp
push esi
mov esi,[ebp+08]
test esi, esi
js End
mov ecx,[03646E6C] // CUserLocal 8B 3D ? ? ? ? 8B CF F3
mov [ecx+00015224],1 // AutoPortal E8 ? ? ? ? 8B B3 ? ? ? ? 8B CB 6A 00 89 BB ? ? ? ? [Follow Call]

mov ecx,[0366E060] // PortalBase 8B 3D ?? ?? ?? ?? 8B 47 ?? 85 C0
mov eax,01903160 //CPortalList::GetPortal() E8 ? ? ? ? 89 85 ? ? ? ? 85 C0 0F 84 ? ? ? ? 8B 48 08 [First-Follow Call]
push esi
xor edx, edx
call eax
test eax, eax
je End
push [eax+4]
mov ecx,[03646E6C] // CUserLocal 8B 3D ? ? ? ? 8B CF F3
mov [ecx+00015224],1 // AutoPortal 75 07 8B CE E8 ? ? ? ? 6A 00 8B CE E8 ? ? ? ? 5E
mov eax,02624270 //CUserLocal::MoveToPortal() Search gm01 - Follow Call below
xor edx, edx
call eax
End:
mov eax, esi
pop esi
pop ebp
ret 0004

//Fix to Maprusher getting "stuck" i.e quest requirement map like T.O.T or Cygnus Garden
02524E06: //0f 84 ? ? ? ? 89 87 ? ? ? ? 85 ?
db 90 90 90 90 90 90

//Another fix for getting "stuck"
02524E14: //75 ? 8B 0D ? ? ? ? 8D 87 [2nd]
db 90 90

025A06A1: // 1st result 6A ?? E8 ?? ?? ?? ?? 8B ?? E8 ?? ?? ?? ?? C7 ?? ?? ?? ?? ?? ?? 8D ?? ??
db 90 90
db 90 90 90 90 90
db 90 90
db 90 90 90 90 90

00D49010: // 1st result 75 ? E8 ? ? ? ? 85 C0 74 ? 6A 01
db 90 90

[Disable]
DeAlloc(InGameRush)
DeAlloc(TeleportToPortal)

02524E2F:
mov [edi+000144A0],eax

02524E06:
db 0F 84 E5 05 00 00

02524E14:
db 75 1F

025A06A1:
push 00
call 00D4EEC0
mov ecx,eax
call 0296C6B0

00D49010:
db 75 2C
