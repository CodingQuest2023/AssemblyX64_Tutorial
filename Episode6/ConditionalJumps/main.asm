.CODE

main PROC
    mov eax, 0

    ; Carry flag conditional jumps

    call CarryFlagSet
    call CarryFlagNotSet

    ; Zero flag conditional jumps

    call ZeroFlagSet
    call ZeroFlagNotSet

    ; Sign flag conditional jumps

    call SignFlagSet
    call SignFlagNotSet

    ; Overflow flag conditional jumps

    call OverflowFlagSet
    call OverflowFlagNotSet

    ; unconditional jump

    call UnconditionalJump

    mov eax, 0
    ret
main ENDP


CarryFlagSet PROC
    mov al, 255
    add al, 1
    jc Carry1
    jnc NoCarry1
Carry1:
    ret
NoCarry1:
    ret
CarryFlagSet ENDP


CarryFlagNotSet PROC
    mov al, 200
    add al, 1
    jc Carry2
    jnc NoCarry2
Carry2:
    ret
NoCarry2:
    ret
CarryFlagNotSet ENDP


ZeroFlagSet PROC
    mov rax, 1
    dec rax
    jz Zero1
    jnz NoZero1
Zero1:
    ret
NoZero1:
    ret
ZeroFlagSet ENDP


ZeroFlagNotSet PROC
    mov rax, 5
    dec rax
    jz Zero2
    jnz NoZero2
Zero2:
    ret
NoZero2:
    ret
ZeroFlagNotSet ENDP


SignFlagSet PROC
    mov rax, 1
    sub rax, 3
    js Sign1
    jns NoSign1
Sign1:
    ret
NoSign1:
    ret
SignFlagSet ENDP


SignFlagNotSet PROC
    mov rax, 6
    sub rax, 3
    js Sign2
    jns NoSign2
Sign2:
    ret
NoSign2:
    ret
SignFlagNotSet ENDP


OverflowFlagSet PROC
    mov al, 127
    add al, 1
    jo Overflow1
    jno NoOverflow1
Overflow1:
    ret
NoOverflow1:
    ret
OverflowFlagSet ENDP


OverflowFlagNotSet PROC
    mov al, 120
    add al, 1
    jo Overflow2
    jno NoOverflow2
Overflow2:
    ret
NoOverflow2:
    ret
OverflowFlagNotSet ENDP


UnconditionalJump PROC
    mov rax, 3
decrement:
    dec rax
    jz exit
    jmp decrement
;    jnz decrement    ; this would better (instead of jz + jmp)
exit:
    ret
UnconditionalJump ENDP


END
