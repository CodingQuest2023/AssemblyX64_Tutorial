
.DATA

; single data
floatA           REAL4  1.1    ; float is a 32 bit floating point
floatB           REAL4  2.2
floatRes         REAL4  0.0
doubleA          REAL8  3.0    ; double is a 64 bit floating point
doubleB          REAL8  0.9
doubleRes        REAL8  0.0


ALIGN 16   ; the vectors must be on 16 byte aligned memory addresses

; vector of 4 fp32 elements   (SSE register is 128 bits wide, so can store 4 elements of 32 bits)
floatVectorA     REAL4  1.1, 2.2, 3.3, 4.4
floatVectorB     REAL4  4.0, 3.0, 2.0, 1.0
floatVectorRes   REAL4  0.0, 0.0, 0.0, 0.0

; vector of 2 fp64 elements   (SSE register is 128 bits wide, so can store 2 elements of 64 bits)
doubleVectorA    REAL8  2.0, 3.5
doubleVectorB    REAL8  1.0, 2.0
doubleVectorRes  REAL8  0.0, 0.0


.CODE

main PROC

    ; SISD:

    ; subtraction of fp32 (single precision)
    movss xmm0, DWORD PTR [floatB]          ; Load fp32 value into xmm0 (value 2.2)
    movss xmm1, DWORD PTR [floatA]          ; Load fp32 value into xmm1 (value 1.1)
    subss xmm0, xmm1                        ; Subtract xmm1 from xmm0
    movss DWORD PTR [floatRes], xmm0        ; Store the result

    ; division of fp64 (double precision)
    movsd xmm0, QWORD PTR [doubleA]          ; Load fp64 value into xmm0 (value 3.0)
    movsd xmm1, QWORD PTR [doubleB]          ; Load fp64 value into xmm1 (value 0.9)
    divsd xmm0, xmm1                         ; Divide xmm0 by xmm1
    movsd QWORD PTR [doubleRes], xmm0        ; Store the result


    ; SIMD:

    ; addition of two vectors of 4 fp32 elements
    movaps xmm0, XMMWORD PTR [floatVectorA]      ; Load the first vector into xmm0    (1.1, 2.2, 3.3, 4.4)
    movaps xmm1, XMMWORD PTR [floatVectorB]      ; Load the second vector into xmm1   (4.0, 3.0, 2.0, 1.0)
    addps xmm0, xmm1                             ; Add xmm1 to xmm0 (vector of 4 fp32 elements)
    movaps XMMWORD PTR [floatVectorRes], xmm0    ; Store the result

    ; multiplication of two vectors of 2 fp64 elements
    movapd xmm0, XMMWORD PTR [doubleVectorA]     ; Load the first vector into xmm0    (2.0, 3.5)
    movapd xmm1, XMMWORD PTR [doubleVectorB]     ; Load the second vector into xmm1   (1.0, 2.0)
    mulpd xmm0, xmm1                             ; Multiply xmm0 with xmm1 (vector of 2 doubles)
    movapd XMMWORD PTR [doubleVectorRes], xmm0   ; Store the result


    mov eax, 0
    ret
main ENDP


END
