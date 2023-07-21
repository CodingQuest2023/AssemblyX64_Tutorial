includelib ucrt.lib
includelib legacy_stdio_definitions.lib

EXTERN scanf: PROC


.DATA
    integerFmtString DB "%d", 0     ; Scanf input format string (%d reads an integer value)
    stringFmtString  DB "%16s", 0   ; Scanf input format string (%s reads a string)
    integerValue     DQ 0           ; Scanf output integer value is stored here
    stringValue      DB 17 DUP(0)   ; Scanf output buffer (duplicate 17 bytes of value 0)


.CODE

main PROC

    call scanfInteger
    call scanfString

    mov rax, 0
    ret
main ENDP


scanfInteger PROC
    sub rsp, 20h     ; Allocate stack space for function arguments

    lea rcx, integerFmtString
    lea rdx, integerValue
    call scanf

    add rsp, 20h     ; Restore the stack
    ret
scanfInteger ENDP


scanfString PROC
    sub rsp, 20h     ; Allocate stack space for function arguments

    lea rcx, stringFmtString
    lea rdx, stringValue
    call scanf

    add rsp, 20h     ; Restore the stack
    ret
scanfString ENDP


END