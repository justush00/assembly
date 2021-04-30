[bits 32]

video_mem equ 0xb8000
white_on_black equ 0x0f

print_string_pm:
    pusha
    mov edx, video_mem
loop_pm:
    mov al, [ebx]
    mov ah, white_on_black
    
    cmp al, 0
    je done_pm
    
    mov [edx], ax
    
    add ebx, 1
    add edx, 2
    
    jmp loop_pm
    
done_pm:
    popa
    ret
 
