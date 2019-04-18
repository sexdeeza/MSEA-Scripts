[ENABLE]
alloc(skill_id_hook,128)
alloc(timer,4)
label(skill_id_return)
label(normal)
define(skill_id,#400040006) //Change #00000000 to your skillID 400010028 400011028
define(skill_delay,#30) //Change delay

timer:
dd 00

026CE65B: //[1st addy]
db 90 90 90 90 90 90

026CE667: //[2nd addy]
db 90 90 90 90 90 90

026CE654: //[3rd addy]
jmp skill_id_hook
nop
nop
skill_id_return:

skill_id_hook:
call GetTickCount
mov edx,eax
sub edx, [timer]
cmp edx,skill_delay
jl normal
mov [timer],eax
mov [esi+00014CA8],skill_id //3rd addy dword ptr
jmp skill_id_return
normal:
cmp dword ptr [esi+00014CA8],00 //3rd addy dword ptr
jmp skill_id_return

026CE6DB: //[4th addy]
db 90 E9

026CE84B: //[5th addy]
db 90 90 90 90 90 90

026CE858: //[6th addy]
jmp 026CE88B //[7th addy] 81 BE ? ? ? ? E2 FE 7E 01 8B CE 75 ? 6A 00 6A 00 6A 04 57 FF ? ? E8 ? ? ? ? 5B 5F C7 ? ? ? ? ? 00 00 00 00 5E ?
dw 90 90

[Disable]
026CE65B: //[1st addy] 0F 84 ? ? ? ? 2B BE ? ? ? ? 0F 88 ? ? ? ? 8B 0D ? ? ? ? 85 C9 74 ? 8B ? ? 83 ? ? 68 ? ? ? ? FF 50 64 85 C0
db 0F 84 18 03 00 00

026CE667: //[2nd addy] JS Below first addy^(0F 88 ? ? ? ? 8B 0D ? ? ? ? 85 C9 74 ? 8B ? ? 83 ? ? 68 ? ? ? ? FF 50 64 85 C0)
db 0F 88 0C 03 00 00

026CE654: //[3rd addy] cmp dword ptr above first addy^^ (83 BE ? ? ? ? 00 0F 84 ? ? ? ? 2B BE ? ? ? ? 0F 88 ? ? ? ? 8B 0D ? ? ? ? 85 C9 74 ? 8B ? ? 83 ? ? 68 ? ? ? ? FF 50 64 85 C0)
cmp dword ptr [esi+00014CA8],00 //update ptr in brackets here as well

026CE6DB: //[4th addy] 0F 84 ? ? ? ? 8B 06 8B CE FF 50 ? 3D 10 27 00 00 74 ? 3D 74 27 00 00 74 ? 3D 7E 27 00 00 74 ? 3D 7F 27 00 00 74 ?
db 0F 84 EF 00 00 00

026CE84B: //[5th addy] 0F 87 ? ? ? ? 0F B6 ? ? ? ? ? FF 24 ? ? ? ? ? 84 DB 74 ? 8B 8E ? ? ? ? 85 C9 0F 84 ? ? ? ? 57 FF ? ? E8 ? ? ? ? 5B
db 0F 87 1D 01 00 00

026CE858: //[6th addy] jmp dword ptr below the 5th addy ^ (FF 24 ? ? ? ? ? 84 DB 74 ? 8B 8E ? ? ? ? 85 C9 0F 84 ? ? ? ? 57 FF ? ? E8 ? ? ? ? 5B)
jmp dword ptr [ecx*4+026CE980] //update the addy in the brackets here as well

dealloc(skill_id_hook)
