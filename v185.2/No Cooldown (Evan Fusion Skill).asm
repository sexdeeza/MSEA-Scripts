define(IgnoreSkillCooldowns,026321A0)
// 81 ? 53 24 14 00 75 08 [function start and breakpoint]
// FF 75 0C E8 ? ? 08 00 5E 5D C2 08 00 FF 75 0C E8 [Second Result] [Follow Call]
// 55 8b ec 83 ? ? 53 56 57 89 ? ? e9 ? ? ? ? 50 29 ? ? 93
// 55 8B EC 83 EC 18 53 56 57 89 4D ? ? ? ? ? ? 50 ? ? ? [Third Result]
[enable]
IgnoreSkillCooldowns: //Ignore Skill Cooldown (Some Skills)
ret 04

[disable]
IgnoreSkillCooldowns:
push ebp
mov ebp,esp
