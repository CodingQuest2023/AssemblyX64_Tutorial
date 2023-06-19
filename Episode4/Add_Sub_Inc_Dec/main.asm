
.DATA
MyData QWORD 42


.CODE
main PROC

    mov rax, 0

;   add/sub <register>, <immediate values>

    add rax, 5
    add rax, 2
    sub rax, 3
    sub rax, 4

;   add/sub <register>, <register>

    mov rax, 5
    mov rbx, 2
    add rax, rbx
    sub rax, rbx

;   add <register>, <memory>
;   add <memory>, <register>

    add rax, MyData
    sub MyData, 2

;   overflow

    mov al, 255
    add al, 1       ; overflow, carry flag set

    mov al, 255
    add ax, 1

    mov ax, 2
    sub al, 1
    sub al, 1
    sub al, 1       ; underflow, carry flag set

;   inc / dec

    mov rax, 7
    inc rax
    inc rax
    dec rax
    dec rax

;   inc <memory>
;   dec <memory>

    inc MyData
    dec MyData

; inc / dec do not set (or clear) the carry flag (overflow is not detected)

    mov al, 252
    add al, 1
    inc al
    inc al
    inc al      ; no carry flag set, add would have set the flag
    dec al      ; no carry flag set, sub would have set the flag

    mov eax, 0
    ret
main ENDP


END
