[ENABLE]
alloc(Hook,128)
alloc(GetMobXY,128)
alloc(MobX,4)
alloc(MobY,4)
registersymbol(MobX)
registersymbol(MobY)
label(GetMobXY_Return)
label(Return)

GetMobXY:
push eax
mov eax,[ecx+910] // 89 87 ? ? ? ? 8D ? ? ? ? ? 8B ? ? 89 ? ? 89 ? ? 8A
mov [MobX],eax
mov eax,[ecx+910+4] // OFFSET ABOVE + 0x4
mov [MobY],eax
pop eax

//Original
push ebp
mov ebp,esp
push -01
jmp GetMobXY_Return

02816680: // CVecCtrlMob::WorkUpdateActive
jmp GetMobXY
GetMobXY_Return:

Hook:
mov edi,esi
push [MobY]
push [MobX]
lea ecx,[edi+10]
call 00EDDCD0 // IWzShape2D::Move 55 8B EC 56 57 FF 75 ? 8B ? FF 75 ? 57 8B 07 FF ? ? 8B F0 [FIRST]
mov ecx,esi
// Original Opcode
call 00D1A890 // CVecCtrl::UpdateActive
//56 8B F1 57 8B ? FF ? ? 8B ? 85 FF
jmp Return

0157233E:
jmp Hook
Return:

[DISABLE]
02816680:
push ebp
mov ebp,esp
push -01

0157233E: //E8 ? ? ? ? FF B3 ? ? 00 00 E8 ? ? ? ? 83 C4 04 85 C0 0F 84
call 00D1A890

dealloc(Hook,128)
dealloc(GetMobXY,128)
dealloc(MobX,4)
dealloc(MobY,4)
unregistersymbol(MobX)
unregistersymbol(MobY)
