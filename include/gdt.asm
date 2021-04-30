;base 0x0
;limit 0xfffff
;present 1
;privilige 0
;type 1 code or data
;granularity: 1
;32bit 1
;64bit 0

;size of dw 16bit/2byte
;size of db 8bit/1byte

gdt_start:

gdt_null: ;null descriptor
    dd 0x0
    dd 0x0
;8byte
; flat mode: code segment descriptor is same as data segment descriptor    
    
gdt_code: ;code segment descriptor (cs)
    dw 0xffff       ;segment limit bits 0 - 15
    dw 0x0        ;base address bits 0 - 15
    db 0x0        ;base address bits 16 - 23
    db 10011010b  ; P:1, DPL: 00, S: 1, TYPE Flags: 1010
    db 11001111b  ; G:1, D/B:1, L:0, AVL:0, Segment limit bits 16 - 19 f
    db 0x0        ;base address bits 24 - 31
;8byte
gdt_data: ;data segment descriptor
    dw 0xffff       ;segment limit bits 0 - 15
    dw 0x0        ;base address bits 0 - 15
    db 0x0        ;base address bits 16 - 23
    db 10010010b  ; P:1, DPL: 00, S: 1, TYPE Flags: 0010
    db 11001111b  ; G:1, D/B:1, L:0, AVL:0, Segment limit bits 16 - 19 f
    db 0x0        ;base address bits 24 - 31
;8byte
gdt_end:


gdt_descriptor:
    dw gdt_end - gdt_start - 1
    
    dd gdt_start    ;start address
    
CODE_SEG equ gdt_code - gdt_start ;address of cs descriptor
DATA_SEG equ gdt_data - gdt_start  
