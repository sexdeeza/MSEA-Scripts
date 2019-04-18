//Remove Lvl Up Dmg
//MSEA 185.2
[ENABLE]
02A32866: // Removes Level Up Damage
db EB

[DISABLE]
02A32866: // 74 ? C7 87 ? ? 00 00 00 00 00 00 8B 0D
db 74
