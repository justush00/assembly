[org 0x7c00]
mov dx, 0x12ab
call print_hex
jmp $

print_hex:
    ; manipulate chars at HEX_OUT to reflect DX
    mov cx, dx
    and cx, 0xf000
    shr cx, 12
    call to_char
    mov [HEX_OUT + 2], cx

    mov cx, dx
    and cx, 0x0f00
    shr cx, 8
    call to_char
    mov [HEX_OUT + 3], cx

    mov cx, dx
    and cx, 0x00f0
    shr cx, 4
    call to_char
    mov [HEX_OUT + 4], cx

    mov cx, dx
    and cx, 0x000f
    call to_char
    mov [HEX_OUT + 5], cx
    
    mov bx, HEX_OUT
    
    call print_string
    mov byte [HEX_OUT + 2], '0'
    mov byte [HEX_OUT + 3], '0'
    mov byte [HEX_OUT + 4], '0'
    mov byte [HEX_OUT + 5], '0'
    ret

to_char:
    cmp cx, 0xa
    jl digits
    sub cx, 0xa
    add cx, 'a'
    ret
    
digits:
    add cx, '0'
    ret
    
print_string:
    pusha
    mov ah, 0x0e
loops:
    mov al, [bx]
    int 0x10
    add bx, 1
    cmp al, 0
    jne loops
    popa
    ret
    
HEX_OUT: db '0x0000', 0

times 510-($-$$) db 0;instruction for assembler to fill up with 0 to byte 510

dw 0xaa55 ;the MAGIC number to label this as a bootsector
