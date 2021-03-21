loop:

    jmp loop
    
times 510-($-$$) db 1 ;instruction for assembler to fill up with 0 to byte 510

dw 0xaa55 ;the MAGIC number to label this as a bootsector
