
.CODE

main PROC

; if (a == b)     ; Check for A equals B

    mov rcx, 7
    mov rdx, 7
    call testEqual

    mov rcx, 7
    mov rdx, 5
    call testEqual

; if (a < b)      ; Check for A is less than B

    mov rcx, 4
    mov rdx, 5
    call testLess

    mov rcx, 5
    mov rdx, 5
    call testLess

; if (a <= b)      ; Check for A is less than or equal to B

    mov rcx, 5
    mov rdx, 5
    call testLessEqual

    mov rcx, 6
    mov rdx, 5
    call testLessEqual

; if (a > b)      ; Check for A is greater than B

    mov rcx, 7
    mov rdx, 4
    call testGreater

    mov rcx, 4
    mov rdx, 7
    call testGreater

; if (a >= b)      ; Check for A is greater than or equal to B

    mov rcx, 9
    mov rdx, 8
    call testGreaterEqual

    mov rcx, 8
    mov rdx, 9
    call testGreaterEqual


    mov rax, 0
    ret
main ENDP


testEqual PROC
    cmp rcx, rdx     ; Zero flag (ZR) = 1 when Equal, else ZR = 0
    je Equal
    jne NotEqual     ; these 2 lines are obsolete, just for demonstrating jne instruction
    ret              ; these 2 lines are obsolete, just for demonstrating jne instruction
NotEqual:
    ret
Equal:
    ret
testEqual ENDP


testLess PROC
    cmp rcx, rdx     ; Carry flag CY = 1 and Zero flag ZR = 0 when Less, else not Less (CY = 0 or ZR = 1)
    jl Less
    jnl NotLess      ; these 2 lines are obsolete, just for demonstrating jnl instruction
    ret              ; these 2 lines are obsolete, just for demonstrating jnl instruction
NotLess:
    ret
Less:
    ret
testLess ENDP


testLessEqual PROC
    cmp rcx, rdx     ; Carry flag CY = 1 or Zero flag ZR = 1 (LessOrEqual), else Greater (CY and ZR flags are 0)
    jle LessEqual
    jg NotLessEqual  ; these 2 lines are obsolete, just for demonstrating jg instruction
    ret              ; these 2 lines are obsolete, just for demonstrating jg instruction
NotLessEqual:
    ret
LessEqual:
    ret
testLessEqual ENDP


testGreater PROC
    cmp rcx, rdx     ; Carry flag CY = 0 and Zero flag ZR = 0 when Greater, else not Greater (CY = 1 or ZR = 1)
    jg Greater
    jng NotGreater   ; these 2 lines are obsolete, just for demonstrating jng instruction
    ret              ; these 2 lines are obsolete, just for demonstrating jng instruction
NotGreater:
    ret
Greater:
    ret
testGreater ENDP


testGreaterEqual PROC
    cmp rcx, rdx     ; Carry flag CY = 0 or Zero flag ZR = 1 when GreaterOrEqual, else Less (CY = 1 and ZR = 0)
    jge GreaterEqual
    jl NotGreaterEqual ; these 2 lines are obsolete, just for demonstrating jl instruction
    ret                ; these 2 lines are obsolete, just for demonstrating jl instruction
NotGreaterEqual:
    ret
GreaterEqual:
    ret
testGreaterEqual ENDP


END
