includelib ucrt.lib
includelib legacy_stdio_definitions.lib

EXTERN printf: PROC


.DATA
    fmtStr1 DB "Hello World!", 10, 0
    fmtStr2 DB "%s are %d and %d", 10, 0
    fmtStr3 DB "%s are %d, %d, %d and %d", 10, 0
    string  DB "The numbers", 0


.CODE

main PROC

    call printString1
    call printString2
    call printString3

    mov rax, 0
    ret
main ENDP


printString1 PROC
    sub rsp, 20h     ; Allocate stack space for function parameters (32 bytes shadow space)

    lea rcx, fmtStr1 ; param 1: format string
    call printf

    add rsp, 20h     ; Restore the stack
    ret
printString1 ENDP


printString2 PROC
    sub rsp, 20h     ; Allocate stack space for function parameters (32 bytes shadow space)

    lea rcx, fmtStr2 ; param 1: format string
    lea rdx, string  ; param 2: the string format specifier (%s in format string)
    mov r8, 5        ; param 3: the 1st integer specifier (1st %d in the format string)
    mov r9, 6        ; param 4: the 2nd integer specifier (2nd %d in the format string)
    call printf

    add rsp, 20h     ; Restore the stack
    ret
printString2 ENDP


printString3 PROC

    push 4           ; stack param (in reverse order): the 4th integer specifier (4th %d in the format string)
    push 3           ; stack param (in reverse order): the 3rd integer specifier (3rd %d in the format string)

    sub rsp, 20h     ; Allocate stack space for function parameters (32 bytes shadow space)

    lea rcx, fmtStr3 ; param 1: format string
    lea rdx, string  ; param 2: the string format specifier (%s in format string)
    mov r8, 1        ; param 3: the 1st integer specifier (1st %d in the format string)
    mov r9, 2        ; param 4: the 2nd integer specifier (2nd %d in the format string)

    call printf

    add rsp, 30h     ; Restore the stack
    ret
printString3 ENDP


END