includelib ucrt.lib
includelib legacy_stdio_definitions.lib


EXTERN printf: PROC



.DATA
fmtStr byte 'The sum is %d', 10, 0


.CODE
main PROC
    mov rcx, 3
    mov rdx, 2

    call Sum
    call Print

    xor rax, rax
    ret
main ENDP


Sum Proc
    mov rax, rcx
    add rax, rdx
    ret
Sum ENDP


Print PROC
    sub rsp, 20h
    lea rcx, fmtStr
    mov rdx, rax
    call printf
    add rsp, 20h
    ret
Print ENDP


END
