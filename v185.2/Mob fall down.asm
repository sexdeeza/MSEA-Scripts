/*
  CMob::FallDown -   55 8B EC 83 EC 18 56 8B F1 E8 ? ? ? ? 85 C0 [First]
  CMob::DragDown -   55 8B EC 83 EC 2C A1 ? ? ? ? 33 ? 89 ? ? 53 56 57 8B D9 E8 [0166DB50]
  CMob::ForcedDown - 55 8B EC 83 EC 28 A1 ? ? ? ? 33 ? 89 ? ? 53 56 57 8B D9 E8 [0166D950]
*/

[Enable]
Alloc(Hook,128)
Label(Return)
Label(Original)
Label(Exit)

01714070:
jmp Hook
Return:

Hook:
pushad
mov edi,ecx
call 01709B80 //e8 ? ? ? ? 8b ce 89 45 ? e8 ? ? ? ? 8b 57 [Follow Call]
cmp eax,0098967F // Invisible Mob
je Exit
mov ecx,edi
call 0175D490 //CMob::FallDown

Exit:
popad
Original:
push ebp
mov ebp,esp
push -01
jmp Return



[Disable]
01714070: //CMob::Update
push ebp
mov ebp,esp
push -01
