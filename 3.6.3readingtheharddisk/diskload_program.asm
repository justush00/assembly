[org 0x7c00] 

    mov [boot_drive], dl
    
    mov bp, 0x8000          ;set up stack
    mov sp, bp
    
    mov bx, 0x9000
    mov dh, 2               ;load 2 sectors
    mov dl, [boot_drive]    ;load from boot drive
    
    call disk_load
    
    mov dx, [0x9000]
    call print_hex
    
    mov dx, [0x9200]
    call print_hex
    
    jmp $
    
%include "../include/ps.asm"
%include "../include/ph.asm"
%include "./diskload_function.asm"

boot_drive: db 0

times 510-($-$$) db 0
dw  0xaa55

times 256 dw 0xeeee ;write this in the second sector
times 256 dw 0xfcce ;write this in the third sector
