
.CODE
main PROC

    mov rax, 0

    ; Carry flag

    mov al, 255
    add al, 1    ; overflow, carry flag set

    mov al, 20
    add al, 1    ; carry flag not set

    stc          ; set carry flag
    clc          ; clear carry flag


    ; Zero flag

    mov rax, 1
    dec rax      ; zero flag set

    mov rax, 5
    dec rax      ; zero flag not set


    ; Sign flag

    mov rax, 2
    sub rax, 3   ; sign flag set

    mov rax, 5
    sub rax, 3   ; sign flag not set


    ; Overflow flag

    mov al, 127
    add al, 1    ; overflow flag set

    mov al, -127
    sub al, 1    ; overflow flag cleared
    sub al, 1    ; overflow flag set


    mov rax, 0
    ret
main ENDP


END
