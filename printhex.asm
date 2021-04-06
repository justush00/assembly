[org 0x7c00]

mov dx, 0xa123
call print_hex
jmp $

;print value of dx  as hex
print_hex:
    
    mov cx, dx
    and cx, 0xf000  ;filter first byte
    shr cx, 12  ;shift to rightmost position
    call compare ;goto compare
    mov [HEXOUT + 2], cx
    
    mov cx, dx
    and cx, 0x0f00  ;filter second byte
    shr cx, 8  ;shift to rightmost position
    call compare
    mov [HEXOUT + 3], cx
    
    mov cx, dx
    and cx, 0x00f0  ;filter third byte
    shr cx, 4  ;shift to rightmost position
    call compare
    mov [HEXOUT + 4], cx
    
    mov cx, dx
    and cx, 0x000f  ;filter third byte
    call compare
    mov [HEXOUT + 5], cx

    mov bx, HEXOUT
    call print_string
    ;clear HEXOUT
    mov byte [HEXOUT + 2], '0'
    mov byte [HEXOUT + 3], '0'
    mov byte [HEXOUT + 4], '0'
    mov byte [HEXOUT + 5], '0'
    ret
    
compare:
    cmp cx, 0xa ;if byte is a-f go to printchar
    jl printnum
    sub cx, 0xa
    add cx, 'A'
    ret
    
printnum:
    add cx, '0' ;refer to ascii table
    ret

%include "ps.asm"
    
HEXOUT:
    db '0x0000',0
    
times 510-($-$$) db 0;instruction for assembler to fill up with 0 to byte 510

dw 0xaa55 ;the MAGIC number to label this as a bootsector
