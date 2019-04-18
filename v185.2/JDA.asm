//Jump Down Anywhere
//MSEA 183.2
[ENABLE]
02579E584:
db 90 90

[DISABLE]
// inside CUserLocal::FallDown
02579E584: // 74 ? 8B CB C7 83 ? ? ? ? 01 00 00 00 E8
db 74 5A
