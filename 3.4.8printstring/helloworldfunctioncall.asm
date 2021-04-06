 mov bp, 0x8000 ;base of stack -> distance from bootsector to not overwrite
 mov sp, bp     ;top op stack

push '0'
push 'O'
push 'L'
push 'L'
push 'E'
push 'H'
mov ah, 0x0e

check:
    pop bx
    mov al, bl
    cmp al, '0'
    jne print
    jmp end
    
print:
    int 0x10
    jmp check
    
end:
    jmp $
    
times 510-($-$$) db 0
dw 0xaa55
