[org 0x7c00]

    mov bp, 0x9000
    mov sp, bp

    mov bx, MSG_REAL
    call print_string
    
    call switch_to_pm
    
    jmp $
    
%include "../include/ps.asm"
%include "../include/gdt.asm"
%include "../include/ps32.asm"
%include "./switchtopm.asm"
;%include "../debug/print_string.asm"
;%include "../debug/gdt.asm"
;%include "../debug/print_string_pm.asm"
;%include "../debug/switch_to_pm.asm"

[bits 32]
BEGIN_PM:
    mov ebx, MSG_PM
    call print_string_pm
    
    jmp $

MSG_REAL:
    db 'starting in 16bit real-mode...', 0
    
MSG_PM:
    db 'reached 32bit protected mode!', 0

times 510-($-$$) db 0
dw 0xaa55
