//7E 35 83 F8 06 7D 30 8B 41 04 2B C2 3D 6A FF FF FF 7E 24 3D 96 00 00 00 7D 1D 8B 41 08 3B 41 0C 7C 07
define(UnlimitedAttack, 02696551) // 1st jle from int CAntiRepeat::TryRepeat(long,long)
[Enable]
UnlimitedAttack:
db EB

[Disable]
UnlimitedAttack:
db 7E
