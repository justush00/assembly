mov ah, 0x0e    ; write text in teletype mode

;mov al, the_secret
;int 0x10

;mov al, [the_secret]
;int 0x10

mov bx, the_secret ;this works -> HEX: BB 14 (when the secret has offset adress 14)
add bx, 0x7c00  ;add bx and 7c00 -> store in bx this adds the offset adress to our program start adress
;0x7c00 is believed to be the start of our program
mov al, [bx]    ;move content of bx to al
int 0x10        ;print al CD 10

mov al, [0x7c14] ;load content of adress 0x7c14 into al HEX: A0 14 7C
int 0x10    ; CD 10

jmp $   ; EB FE
; $ means current adress

the_secret: ;label
    db "X"

times 510-($-$$) db 0

dw  0xaa55
 
