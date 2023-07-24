
.CODE
main PROC


    ; Bitwise AND &
    mov rcx, 0FFFFh     ; CX = 1111 1111 1111 1111
    mov rdx, 5757h      ; DX = 0101 0111 0101 0111
    and cx, dx          ; CX = 0101 0111 0101 0111
    and cx, 3333h       ;      0011 0011 0011 0011 (3333h)
                        ; CX = 0001 0011 0001 0011 (1313h)

    ; Bitwise OR |
    mov rcx, 4444h      ; CX = 0100 0100 0100 0100
    mov rdx, 6767h      ; DX = 0110 0111 0110 0111
    or cx, dx           ; CX = 0110 0111 0110 0111
    or cx, 9999h        ;      1001 1001 1001 1001 (9999h)
                        ; CX = 1111 1111 1111 1111 (FFFFh)

    ; Bitwise XOR ^
    mov rcx, 7777h      ; CX = 0111 0111 0111 0111
    mov rdx, 5555h      ; DX = 0101 0101 0101 0101
    xor cx, dx          ; CX = 0010 0010 0010 0010
    xor cx, 9999h       ;      1001 1001 1001 1001 (9999h)
                        ; CX = 1011 1011 1011 1011 (BBBBh)

    ; Bitwise NOT ~
    mov rcx, 7352h      ; CX = 0111 0011 1001 0010
    not cx              ; CX = 1000 1100 0110 1101 (8CADh)


    ; Using memory operands
    mov rax, 1111111111111111b
    and rax, QWORD PTR [dataA]
    and QWORD PTR [dataB], rax
    not QWORD PTR [dataB]


    xor rax, rax        ; clear rax
    ret
main ENDP


.DATA
    dataA QWORD 7777777777777777h
    dataB QWORD 9999999999999999h


END
