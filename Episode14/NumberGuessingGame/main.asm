includelib ucrt.lib
includelib legacy_stdio_definitions.lib

EXTERN printf: PROC
EXTERN scanf: PROC
EXTERN srand: PROC
EXTERN rand: PROC


.DATA
    StrAskNumber     DB "Guess the number (between 0 and %d): ", 0
    StrGreaterThan   DB "Nope, try a higher number!", 10, 0
    StrLessThan      DB "Nope, try a lower number!", 10, 0
    StrCorrect       DB "You guessed the number!", 10, 0
    ScanfFmtString   DB "%d", 0     ; Scanf input format string (%d reads an integer value)
    ScanfOutput      DQ 0           ; Scanf output integer value is stored here
    MaxNumber        DQ 15          ; The number to guess is between 0 and MaxNumber
                                    ; Make sure MaxNumber is: (a power of 2) - 1   (7, 15, 31, etc)
    RandomNumber     DQ 0           ; The number to be guessed


.CODE

main PROC

    call getRandomNumber

startAskNumber:
    lea rcx, StrAskNumber
    mov rdx, [MaxNumber]
    call print
    call scanfInteger
    cmp eax, 1           ; Expect 1 integer to be succesfully read by scanf
    jne exit             ; If not, simply exit program. Alternative is to flush the buffer that contains
                         ; illegal characters at this point and then jump back to startAskNumber

    ; Make sure the user input is in the valid range 0 to MaxNumber
    ; No need to check to negative values here, the values are unsigned so negative input values are seen
    ; as high positive values
    mov rax, [MaxNumber]
    cmp rax, [ScanfOutput]
    jl startAskNumber

    ; Compare the user input to the number to be guessed
    mov rax, [RandomNumber]
    cmp rax, [ScanfOutput]
    jg greaterThan
    jl lessThan
    je equal
greaterThan:
    lea rcx, StrGreaterThan    ; Number to be guessed is greater than user input
    call print
    jmp startAskNumber
lessThan:
    lea rcx, StrLessThan       ; Number to be guessed is less than user input
    call print
    jmp startAskNumber
equal:
    lea rcx, StrCorrect        ; Number was guessed, print message and exit program
    call print
exit:
    mov rax, 0
    ret
main ENDP


scanfInteger PROC
    sub rsp, 20h     ; Allocate stack space for function arguments
    lea rcx, ScanfFmtString
    lea rdx, ScanfOutput
    call scanf
    add rsp, 20h     ; Restore the stack
    ret
scanfInteger ENDP


print PROC
    sub rsp, 20h     ; Allocate stack space for function arguments
    call printf
    add rsp, 20h     ; Restore the stack
    ret
print ENDP


getRandomNumber PROC
    sub rsp, 20h     ; Allocate stack space for function arguments
    mov rcx, rsp     ; use rsp register as random seed
    call srand
    call rand        ; random number will be stored in rax
    and rax, QWORD PTR [MaxNumber]
    mov RandomNumber, rax
    add rsp, 20h     ; Restore the stack
    ret
getRandomNumber ENDP


END
