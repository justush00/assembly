%include "ps.asm"

mov dx, 0xeff1
call print_hex

;print value of dx  as hex
print_hex:
    mov cx, dx
    and cx, 0xf000
    shr cx, 12
    mov [HEXOUT + 2], cx
    mov ah, 0x0e
    mov al, [HEXOUT + 2]
    int 0x10
 
 
HEXOUT:
    db '0x0000',0
    
times 510-($-$$) db 0;instruction for assembler to fill up with 0 to byte 510

dw 0xaa55 ;the MAGIC number to label this as a bootsector
