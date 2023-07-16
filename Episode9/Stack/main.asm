
.CODE
main PROC

    mov rcx, 4444444444444444h
    mov rdx, 5555555555555555h

    ; push register values
    push rcx
    push rdx
    pop rcx     ; last-in-first-out (LIFO) -> this swaps the data in rcx and rdx!!
    pop rdx


    ; push immediate values (But no 64 bit values allowed! You can first move those into a register)
    push 33333333h
    push 22222222h
    pop rcx
    pop rdx


    ; Can push 16/64 bit registers only (pushing 32bit registers is not supported)
    mov cx, 7777h
    mov rdx, 8888888888888888h
    push cx
    push rdx
    pop rdx
    pop cx

    call myProc

    call myPrint

    mov rax, 0
    ret
main ENDP


myProc PROC
   ret
myProc ENDP


myPrint PROC

   sub rsp, 20h         ; 16-byte align the stack pointer, and reserve stack space for parameters
                        ; 32 bytes (shadow space)

;    lea rcx, fmtStr    ; printf argument 1
;    mov rdx, rax       ; printf argument 2
;    call printf

   add rsp, 20h         ; restore stack pointer

   ret
myPrint ENDP


END
