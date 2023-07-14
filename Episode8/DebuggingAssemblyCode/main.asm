
.DATA
string  BYTE   "This is a string.", 10, 0
data    QWORD  7


.CODE
main PROC

    call Proc1
    call Proc2

    mov rax, 0
    ret
main ENDP


Proc1 PROC
    mov rax, 6
    ret
Proc1 ENDP


Proc2 PROC
    mov rax, 7
    ret
Proc2 ENDP


END
