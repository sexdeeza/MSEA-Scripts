//Credit to BonSalsa/stapled

[ENABLE]
alloc(GetMobXY,128)
alloc(MobX,4)
alloc(MobY,4)
alloc(Teleport,256)
alloc(timer,4)
registersymbol(MobX)
registersymbol(MobY)
label(RestoreStack)
label(GetMobXY_Return)
label(Return)
label(Teleport_End)

timer:
dd 00

Teleport:
mov esi,[03646E6C] // CUserLocal: 8B 3D ? ? ? ? 8B CF F3 [address inside brackets]
lea ecx,[esi+04]
mov eax,[esi+04]
mov eax,[eax+20]
call eax
test eax,eax
je Teleport_End
push [MobY]
push [MobX]
push 00
mov ecx,eax
call 00D1C690 // 55 8B EC ? ? 10 ? FF ? 10 8D ? 10 FF ? 0C 56 FF 50 40 85 C0 79 0C 68 ? ? ? ? ? ? E8 ? ? ? ? 5E [first]
jmp Return

Teleport_End:
ret

GetMobXY:
pushad
call GetTickCount
mov edx,eax
sub edx,[timer]
cmp edx,#300//DELAY
jl RestoreStack
mov [timer],eax
popad
push eax
mov eax,[ecx+910] // 89 87 ? ? ? ? 8D ? ? ? ? ? 8B ? ? 89 ? ? 89 ? ? 8A
mov [MobX],eax
add [MobX], #0
mov eax,[ecx+910+4] // OFFSET ABOVE + 0x4
mov [MobY],eax
add [MobY], #0
pop eax

//Original
push ebp
mov ebp,esp
push -01
jmp GetMobXY_Return

RestoreStack:
popad
push ebp
mov ebp,esp
push -01
jmp GetMobXY_Return

02816680: // CVecCtrlMob::WorkUpdateActive 55 8B EC 6A FF 68 A2 2B F5 02 64 A1 00 00 00 00 (temp AoB)
jmp GetMobXY
GetMobXY_Return:

0128BFC5:
jmp Teleport
Return:

[DISABLE]
02816680:
push ebp
mov ebp,esp
push -01

0128BFC5: //[some call above] 3D B8 0B 00 00 76 ? 6A 0128BFC5
call 012CD040

dealloc(GetMobXY,128)
dealloc(MobX,4)
dealloc(MobY,4)
dealloc(Teleport)
dealloc(timer,4)
unregistersymbol(MobX)
unregistersymbol(MobY)
