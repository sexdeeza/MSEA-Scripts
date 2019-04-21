//warning: combining this with certain CPU hacks (e.g. no skill animations, ..) may cause auto bans!
[enable]
00CC6C80:
db F2 0F 59

[disable]
00CC6C80: // F2 0F 5E ? ? ? ? ? 66 0F 2E C1 F2 0F 11 ? ? ? ? ? F2 0F 11 ? ? ? ? ? 9F
db F2 0F 5E
