//Mac GND
//MSEA 185.2

define(MachGND,025CC069)//75 ? 83 BD ? ? FF FF 00 75 ? 8B [4th result]
//75 31 83 BD 04 ED FF FF 00 75 28 8B 53 0C 52 8B 85 C0 ED FF FF 50
[enable]
MachGND://Mach GND (Melee/Basic attacks)
db EB

[disable]
MachGND:
db 75
