 mov ah, 0x0e ;for interrupt call
 
 mov bp, 0x8000 ;base of stack -> distance from bootsector to not overwrite
 mov sp, bp     ;top op stack
 
 push 'A'   ;-> stack is 16bit so: stack hold 0x0041
 push 'B'   ;0x0042
 push 'C'   ;0x0043
 
 ;LIFO principle in Stack
 
 pop bx     ;load top of stack (last added) to bx
 mov al, bl ;load LSB of BX to AX (0x0043)
 int 0x10

 pop bx     ;load top of stack (last added) to bx
 mov al, bl ;load LSB of BX to AX (0x0042)
 int 0x10
 
 ; stack grows to smaller memory: adresses
 
 mov al, [0x7ffe]
 int 0x10
 
 ;  stackoverflow comes from, when the stack gets to big and interferes with program code
 
 jmp $
 
 times 510-($-$$) db 0
 dw 0xaa55
