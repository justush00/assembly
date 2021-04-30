[bits 16]

switch_to_pm:
    cli
    lgdt [gdt_descriptor]

    mov eax, cr0 ;modify cr0 through eax
    or eax, 0x1
    mov cr0, eax
    
    jmp CODE_SEG:initpm
    
[bits 32]

initpm:

    mov ax, DATA_SEG
    ;jmp $
    mov ds, ax
    mov ss, ax
    mov es, ax
    mov fs, ax
    mov gs, ax
    
    mov ebp, 0x90000    ;update base pointer of stack
    mov esp, ebp        ;update stack pointer to point at base of stack
    
    
    call BEGIN_PM
