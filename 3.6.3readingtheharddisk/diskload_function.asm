disk_load:
    push dx

    mov ah, 0x02        ;read sector BIOS routine
    mov al, dh           ;read dh sectors from starting point
    
    mov ch, 0x00        ;read cyl 0
    mov dh, 0x00        ;read head 0
    mov cl, 0x02        ;read from 2nd sector (1st sector is boot sector)

    int 0x13

    jc disk_error

    pop dx
    cmp dh, al          ;al holds sectors read & dh holds sectors expected
    jne disk_error
    ret
    
disk_error:
    mov bx, disk_error_msg
    call print_string
    jmp $

disk_error_msg: db "Disk read error!", 0
