.CODE


;           <------
;    mov <dest>, <src>
;
;    mov <register>, <memory>
;    mov <register>, <immediate value>
;    mov <register>, <register>
;    mov <memory>, <register>



Example PROC

    mov r8, 0                   ; clear
    mov r8b, 11h                ; move 8 bits
    mov r8w, 2222h              ; move 16 bits
    mov r8d, 33333333h          ; move 32 bits
    mov r8, 4444444444444444h   ; move 64 bits
    mov rax, r8                 ; move from register to register

    mov rax, 0                  ; clear
    mov al, 11h                 ; move into lower 8 bits of 16 bit register
    mov ah, 22h                 ; move into higher 8 bits of 16 bit register
    mov ax, 3333h               ; move 16 bits
    mov eax, 44444444h          ; move 32 bits
    mov rax, 5555555555555555h  ; move 64 bits

    mov r8, 0FFFFFFFFFFFFFFFFh  ; initialize
    mov r8b, 11h                ; move 8 bits
    mov r8w, 2222h              ; move 16 bits
    mov r8d, 33333333h          ; !!! storing in the lower 32 bits will clear the top 32 bits !!!

    ret
Example ENDP


END
