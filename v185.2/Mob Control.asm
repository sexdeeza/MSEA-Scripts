//Mob Control
//MSEA 185.2

// 01 Normal Mobs
// 02 Jump mob
// 03 Fly Mobs
// 04 Stationary Mobs
// 05 Mob Walk Right
// 06-07-08 Lemmings
// 09 and above crash MapleStory with "error code: -2147467259 (Unspecified error)"

define(action,04) // change action here

[ENABLE]
alloc(MobControl,128)

MobControl:
mov [edi+000004E0],action
mov eax,[edi+000004E0]
jmp 0281BFF8+6

0281BFF8:
jmp MobControl
db 90

[DISABLE]
0281BFF8: // CVecCtrlMob::WorkUpdateActive: E9 ? ? ? ? 8B ? ? ? 00 00 83 ? ? 0F ? ? ? ? ? FF [Address below]
mov eax,[edi+000004E0]

dealloc(MobControl)
