//Vellum Freeze V2
//MSEA 185.2
define(CMob_ShowAffectedSkill,0173B5D0) // 55 8B EC 6A FF 68 ? ? ? ? 64 A1 00 00 00 00 50 81 EC ? ? 00 00 A1 ? ? ? ? 33 C5 89 45 ? 53 56 57 50 8D 45 F4 64 A3 00 00 00 00 8B D9 89 5D EC 8B ? ? ? 00 00 [FUNCTION START]
// 55 8B EC 6A FF 68 ? ? ? ? 64 A1 00 00 00 00 50 81 EC ? ? 00 00 A1 ? ? ? ? 33 C5 89 45 ? 53 56 57 50 8D 45 F4 64 A3 00 00 00 00 8B ? 89 ? EC 8B B7 ? ? 00 00[FUNCTION START]
[enable]
CMob_ShowAffectedSkill:
ret 0004


[disable]
CMob_ShowAffectedSkill:
db 55 8B EC
