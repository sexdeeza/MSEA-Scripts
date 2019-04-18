//Mob Filter
//Msea v185.2
// E8 ? ? ? ? 89 45 ? 85 F6 0F 85 ? ? ? ? 50
define(CMobPool__SetLocalMob____CInPacket__Decode4, 01792F3D)
define(CInPacket__Decode4, 0081E9A0) //call FROM ADDRESS above
// E8 ? ? ? ? 8B F8 85 FF 74 ? 6A ? 8B CF
define(CMobPool__OnMobEnterField____CMobPool__GetMob, 01792520)
define(CMobPool__GetMob, 0178C150) //call FROM ADDRESS above

[ENABLE]

alloc(BlackListMobs, 1024)
/////////////////////////////////////////////////
alloc(ReceiveMob__StoreBlackListMobs, 1024)
label(CMobPool__SetLocalMobCompareMobs)
label(CMobPool__SetLocalMobDontSetLocalMob)
label(CMobPool__SetLocalMob____CInPacket__Decode4__Exit)
/////////////////////////////////////////////////
alloc(StoreBlackListMobs, 1024)
label(CMobPool__OnMobEnterFieldCompareMobs)
label(CMobPool__OnMobEnterFieldDontLetMobEnterField)
label(CMobPool__OnMobEnterField____CMobPool__GetMob__Exit)
/////////////////////////////////////////////////

BlackListMobs:
dd #9999999 // Invisible
dd #9101064 // Elite Bosses
dd #9101193 // Elite Bosses
dd #9101047 // Elite Bosses

dd 00000000

/////////////////////////////////////////////////

CMobPool__SetLocalMob____CInPacket__Decode4:
jmp ReceiveMob__StoreBlackListMobs

ReceiveMob__StoreBlackListMobs:
call CInPacket__Decode4
push ebx
mov ebx, BlackListMobs

CMobPool__SetLocalMobCompareMobs:
cmp eax,[ebx]
je CMobPool__SetLocalMobDontSetLocalMob
cmp [ebx], 0
je CMobPool__SetLocalMob____CInPacket__Decode4__Exit
add ebx, 4
jmp CMobPool__SetLocalMobCompareMobs

CMobPool__SetLocalMobDontSetLocalMob:
mov ecx, [ebp-0C]
mov fs:[00000000],ecx
pop ecx
pop edi
pop esi
pop ebx
mov esp,ebp
pop ebp
ret 0014

CMobPool__SetLocalMob____CInPacket__Decode4__Exit:
pop ebx
jmp CMobPool__SetLocalMob____CInPacket__Decode4+5

/////////////////////////////////////////////////

CMobPool__OnMobEnterField____CMobPool__GetMob:
jmp StoreBlackListMobs

StoreBlackListMobs:
push ebx
mov ebx, BlackListMobs

CMobPool__OnMobEnterFieldCompareMobs:
cmp eax,[ebx]
je CMobPool__OnMobEnterFieldDontLetMobEnterField
cmp [ebx], 0
je CMobPool__OnMobEnterField____CMobPool__GetMob__Exit
add ebx, 4
jmp CMobPool__OnMobEnterFieldCompareMobs

CMobPool__OnMobEnterFieldDontLetMobEnterField:
mov ecx, [ebp-0C]
mov fs:[00000000], ecx
pop ecx
pop edi
pop esi
pop ebx
mov esp, ebp
pop ebp
ret 0004

CMobPool__OnMobEnterField____CMobPool__GetMob__Exit:
pop ebx
call CMobPool__GetMob
jmp CMobPool__OnMobEnterField____CMobPool__GetMob+5

[DISABLE]
CMobPool__SetLocalMob____CInPacket__Decode4:
call CInPacket__Decode4

CMobPool__OnMobEnterField____CMobPool__GetMob:
call CMobPool__GetMob

dealloc(ReceiveMobList__StoreBlackListMobs)
dealloc(StoreBlackListMobs)
dealloc(BlackListMobs)
