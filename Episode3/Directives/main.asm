;INCLUDELIB ucrt.lib
;INCLUDELIB legacy_stdio_definitions.lib


;EXTERN printf: PROC



.DATA
MyData DWORD 42


.CODE
main PROC

    call SomeProc

    mov eax, 0
    ret
main ENDP


SomeProc PROC
    mov eax, MyData
    ret
SomeProc ENDP


END
