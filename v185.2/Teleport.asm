[ENABLE]
alloc(Teleport,256)
label(Teleport_End)

CreateThread(Teleport)

Teleport:
mov esi,[03646E6C] // CUserLocal: 8B 3D ? ? ? ? 8B CF F3
lea ecx,[esi+04]
mov eax,[esi+04]
mov eax,[eax+20]
call eax
test eax,eax
je Teleport_End
push #100 // Y - Change This for new Y -
push #1045 // X - Change This for new X -
push 00
mov ecx,eax
call 00D1C690 // 55 8B EC ? ? 10 ? FF ? 10 8D ? 10 FF ? 0C 56 FF 50 40 85 C0 79 0C 68 ? ? ? ? ? ? E8 ? ? ? ? 5E

Teleport_End:
ret

[DISABLE]
dealloc(Teleport)
