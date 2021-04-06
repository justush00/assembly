mov bx, 40

cmp bx, 4
jle ala
cmp bx, 40
jl alb
jmp alc

ala:
    mov al, 'A'
    jmp out
alb:
    mov al, 'B'
    jmp out
alc:
    mov al, 'C'
    jmp out
    
out:
    mov ah, 0x0e
    int 0x10
    
jmp $

times 510-($-$$) db 0
dw 0xaa55
