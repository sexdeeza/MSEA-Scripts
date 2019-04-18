// credits SunCat for updated aob
[ENABLE]
alloc(ItemFilter,256)
alloc(ItemList,2048)
alloc(Mesos,4)
alloc(Mode,4)
label(Return)
label(End)
label(FilterMesos)
label(RejectOrAccept)
label(AcceptFilter)
label(RejectFilter)
label(Ignore)

Mesos:
dd #0 // Minimum meso

Mode:
dd #0 // 0 = Accept, 1 = reject

ItemList:
//Add filter like below
//dd #itemID

dd #4000999 // Spell Trace
dd #4001832 // Spell Trace
dd #4021033 // Low Spell Essence
dd #4021034 // Mid Spell Essence
dd #4021035 // High Spell Essence
dd #4032056 // Magic Crystal
dd #4021031 // Twisted Essence of time
dd #2000005 // Power Elixir
dd #2000019 // Power Elixir
dd #2002012 // Elixir
dd #4310018 // Crusader Coins
dd #4310029 // Crusader Coins
dd #4031160 // Medal of Honor
dd #2710000 // Suspicious Cube
dd #2711000 // Suspicious Cube
dd #2711001 // Suspicious Cube
dd #2711009 // Suspicious Cube
dd #4310064 // Yggdrasil Stone Rune (Green)
dd #4310065 // Chaos Yggdrasil Stone Rune (Blue)
dd #1004230 // Fensalir Mage Hat
dd #4001886 // Glowing Soul Crystal (Drop From Bosses)
dd #2434589 // Black Shard Of Protection
dd #2434585 // Shard Of Mockery
dd #2434586 // Shard Of Anguish
dd #2434588 // Black Shard Of Protection
dd #2048406 // Cygnus's Soul Shard
dd #2433591 // Crimson Queen's Soul Shard
dd #2435899 // Magnus's Soul Shard
dd #4031160 // Medal Of Honor
dd #4033068 // Exp Accumulator Potion
dd #1372084 // Dragon Tail Arc Wand
dd #1382104 // Dragon Tail War Staff
dd #2438889 // Beyond Fashion Coupon (Event)
dd #1122076 // Chaos Horntail Neck
dd #1032241 // Dea Sidus Earings
dd #4034285 // Haven Daily Quest Item
dd #4034282 // Haven Daily Quest Item
dd #4034288 // Haven Daily Quest Item
dd #4034877 // Fallen World Quest Item
dd #4034878 // Fallen World Quest Item
dd #4034876 // Fallen World Quest Item
dd #4034875 // Fallen World Quest Item

dd 00 // End of list

ItemFilter:
push edx
mov edx,[Mesos]
cmp eax,edx
jle FilterMesos
mov edx,ItemList
jmp RejectOrAccept

FilterMesos:
mov eax,0
jmp End

RejectOrAccept:
cmp byte ptr [Mode],0
je AcceptFilter
cmp byte ptr [Mode],1
je RejectFilter

AcceptFilter:
cmp eax,[edx](Mesos)
je End
cmp dword ptr [edx],0
je Ignore
add edx,4
jmp AcceptFilter

RejectFilter:
cmp eax,[edx]
je Ignore
cmp dword ptr [edx],0
je End
add edx,4
jmp RejectFilter

Ignore:
cmp eax,#50000 // Added this code otherwise mesos is dropped but not shown in accept mode
jle End
mov eax,0

End:
pop edx
mov [ebp-3C],eax
inc ecx
mov eax,939A85C5
jmp Return

0081E9A0:
jmp ItemFilter
nop
nop
nop
nop
Return:

[DISABLE]
0081E9A0: // F3 ? ? ? ? ? ? ? F3 ? ? ? ? ? ? ? E8 ? ? ? ? 8B 0D ? ? ? ? 89 ? ? ? B8 below
mov [ebp-3C],eax
inc ecx
mov eax,939A85C5

dealloc(ItemFilter)
dealloc(ItemList)
dealloc(Mesos)
dealloc(Mode)
