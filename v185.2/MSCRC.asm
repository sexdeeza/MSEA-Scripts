/*
Credits to DBLmao & mapler for sharing the base script.
Credits to SouthernEmblem for updating the script.
Special thanks to the GameKiller team for making the GMS public bypass compatible with other versions of MS too.
If you are banned while using this, YOU are the one responsible.
Using a disposable account is advised.
 
 
MSEA v185.1 MSCRC Bypass for mem-editing
v4.0
*/
define(CRC1,03B05CCD) //03B05CCD
define(CRC2,039125F0) //039125F0
define(CRC1Reg,ecx)
define(CRC2Reg,edx)
define(CRC1CHANGE,8) // 5 + NOP needed in hexadecimal
define(CRC2CHANGE,8) // 5 + NOP needed in hexadecimal 32 38 44
 
define(CRC1START,00401000)
define(CRC1END,031CE138) //Get via script or search for 320 bytes of 0
//0428F000
define(CRC2START,CRC1-800)
define(CRC2END,CRC1+800)
define(CRC2ENDCHECK,CRC1+7FC)
[ENABLE]
globalalloc(DisableCRCBypass,200)
alloc(CRCHook,1024)
alloc(MemCopy,100663296)
registersymbol(MemCopy)
label(MemCopier)
registersymbol(MemCopier)
label(Hook1)
label(Hook2)
label(Hook1End)
label(Hook2End)
label(Hook1Ret)
label(Hook2Ret)
label(Copy1)
label(Copy2)
label(CopyExit)
label(Hook2Ending)
label(Hook1Ending)
label(Counter)
createthread(MemCopier)
 
///////////////////////////////////////////////////////////////////////////
 
MemCopy+5FFF000:
MemCopier:
cmp [MemCopier+200],1
je CopyExit
mov eax,CRC1START
 
Copy1:
mov ebx,[eax]
mov [MemCopy+eax],ebx
add eax, 4
cmp eax,CRC1END
jle Copy1
mov eax,CRC2START
 
Copy2:
mov ebx,[eax]
mov [MemCopy+eax],ebx
add eax, 4
cmp eax,CRC2END
jle Copy2
 
CopyExit:
Hook1Ending:
mov eax,[Counter]
mov bh, [CRC1+eax]
mov BYTE PTR [Hook1End+eax],bh
mov BYTE PTR [DisableCRCBypass+150+eax],bh
inc [Counter]
cmp [Counter],CRC1CHANGE
jl Hook1Ending
mov [Counter],0
 
Hook2Ending:
mov eax,[Counter]
mov bh, [CRC2+eax]
mov BYTE PTR [Hook2End+eax],bh
mov BYTE PTR [DisableCRCBypass+160+eax],bh
inc [Counter]
cmp [Counter],CRC2CHANGE
jl Hook2Ending
mov [Counter],0
 
mov eax,Hook1
sub eax,CRC1+5
mov byte ptr [CRC1],E9
mov [CRC1+1],eax
 
mov eax,Hook2
sub eax,CRC2+5
mov byte ptr [CRC2],E9
mov [CRC2+1],eax
 
mov [MemCopier+200],1
jmp terminatethread
 
 
Counter:
dd 0
 
///////////////////////////////////////////////////////////////////////////
 
CRCHook:
Hook1:
cmp CRC1Reg,CRC1START
jb Hook1End
cmp CRC1Reg,CRC1END
ja Hook1End
add CRC1Reg,MemCopy
jmp Hook1End
 
Hook1End:
db 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90
jmp Hook1Ret
 
Hook2:
cmp CRC2Reg,CRC2START
jb Hook2End
cmp CRC2Reg,CRC2ENDCHECK
ja Hook2End
add CRC2Reg,MemCopy
jmp Hook2End
 
Hook2End:
db 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90
jmp Hook2Ret
 
CRC1+CRC1CHANGE:
Hook1Ret:
 
CRC2+CRC2CHANGE:
Hook2Ret:
 
/////////////////////////////////////////////////////////////////////////
DisableCRCBypass:
mov eax,[DisableCRCBypass+150]
mov bh, [DisableCRCBypass+154]
mov [CRC1],eax
mov BYTE PTR [CRC1+4],bh
 
mov eax,[DisableCRCBypass+160]
mov bh, [DisableCRCBypass+164]
mov [CRC2],eax
mov BYTE PTR [CRC2+4],bh
 
jmp terminatethread
///////////////////////////////////////////////////////////////////////////
 
[DISABLE]
createthread(DisableCRCBypass)
dealloc(CRCHook)
dealloc(MemCopy)
unregistersymbol(MemCopy)
unregistersymbol(MemCopier)
