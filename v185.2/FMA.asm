// List of skills
//https://www.gamekiller.net/threads/ce-fma-script-178-2.3268307/

[ENABLE]
0178F146: // MsInterSectRect
db EB

02A32866: // No Level Up Damage
db EB

[DISABLE]
0178F146: // 75 ? E9 ? ? FF FF 8B ? ? E8 ? ? 00 00 8B ? ? 8B
db 75

02A32866: //  74 ? C7 87 ? ? 00 00 00 00 00 00 8B 0D
//68 EA BA C4 04 FF [2 je above]
db 74
