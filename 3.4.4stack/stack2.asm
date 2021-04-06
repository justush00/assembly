 mov ah, 0x0e ;for interrupt call
 
 mov bp, 0x8000 ;base of stack -> distance from bootsector to not overwrite
 mov sp, bp     ;top op stack
 
 push 'A'   ;-> stack is 16bit so: stack hold 0x0041
 push 'B'   ;0x0042
 push 'C'   ;0x0043
 
 ;LIFO principle in Stack
 
 ; stack grows to smaller memory/downwards: adresses
 
 mov al, [0x7ffe]
 int 0x10   ;prints A
 
 mov al, [0x7ffc]
 int 0x10   ;prints B
 
 mov al, [0x7ffa]
 int 0x10   ;prints C
 
 ;one adress is 8 byte long... stack is 16 byte wide-> one stack push is 2 adresses
 
 ;  TIL: stackoverflow comes from, when the stack gets to big and interferes with program code
 
 jmp $
 
 times 510-($-$$) db 0
 dw 0xaa55 
