//No Mob Reaction
//MSEA 185.2
define(Address,0170FEF0) //Function start push ebp: A1 ? ? ? ? 33 ? 50 8D ? ? 64 ? ? ? ? 00 8B ? 89 ? ? 8B ? ? ? ? ? C7 ? ? ? ? ? 00 85 ? 74 ? E8
[Enable]
Address:
ret 0074

[Disable]
Address:
push ebp
mov ebp,esp
