includelib user32.lib

extern GetModuleHandleW:PROC
extern LoadCursorW:PROC
extern LoadIconW:PROC
extern RegisterClassExW:PROC
extern CreateWindowExW:PROC
extern ShowWindow:PROC
extern UpdateWindow:PROC
extern DefWindowProcW:PROC
extern PostQuitMessage:PROC
extern GetMessageW:PROC
extern TranslateMessage:PROC
extern DispatchMessageW:PROC


include windows.inc


.DATA
className    DW 'M','y',' ','C','l','a','s','s', 0
windowName   DW 'M','y',' ','W','i','n','d','o','w', 0
hInstance    QWORD 0
hWndClass    QWORD 0
hWindow      QWORD 0
message      MSG<>
wc           WNDCLASSEXW<>


; window size
windowWidth  equ 1024
windowHeight equ 768


.CODE
main PROC

    call RegisterWindowClass
    cmp rax, 0
    je exit

    call CreateWindow
    cmp rax, 0
    je exit

    call ShowAndUpdateWindow

    sub rsp, 28h
messageLoop:

    ; retrieve a message (https://learn.microsoft.com/en-us/windows/win32/api/winuser/nf-winuser-getmessage)
    lea rcx, message
    mov rdx, 0
    mov r8, 0
    mov r9, 0
    call GetMessageW
    cmp eax, 0
    je exit

    ; translate the message (https://learn.microsoft.com/en-us/windows/win32/api/winuser/nf-winuser-translatemessage)
    lea rcx, message
    call TranslateMessage

    ; dispatch message  (https://learn.microsoft.com/en-us/windows/win32/api/winuser/nf-winuser-dispatchmessage)
    lea rcx, message
    call DispatchMessageW

    jmp messageLoop

exit:
    add rsp, 28h
    xor rax, rax
    ret
main ENDP


RegisterWindowClass PROC
    sub rsp, 20h

    ; Get ModuleHandle (https://learn.microsoft.com/en-us/windows/win32/api/libloaderapi/nf-libloaderapi-getmodulehandlew)
    mov  rcx, 0
    call GetModuleHandleW
    mov hInstance, rax

    ; Load cursor (https://learn.microsoft.com/en-us/windows/win32/api/winuser/nf-winuser-loadcursorw)
    xor   ecx, ecx              ; set hInstance to 0
    mov   edx, IDC_ARROW        ; to allow passing of predefined system cursor to load here
    call  LoadCursorW
    mov   wc.hCursor, rax

    ; Load icon (https://learn.microsoft.com/en-us/windows/win32/api/winuser/nf-winuser-loadiconw)
    xor   ecx, ecx              ; set hInstance to 0
    mov   edx, IDI_SHIELD       ; to allow passing of predefined system cursor to load here
    call  LoadIconW
    mov   wc.hIconSm, rax
    mov   wc.hIcon, rax

    ; Register the windows class (https://learn.microsoft.com/en-us/windows/win32/api/winuser/nf-winuser-registerclassexw)
    mov   wc.cbSize, sizeof WNDCLASSEXW
    mov   wc.style, CS_HREDRAW or CS_VREDRAW
    lea   rax, WinProc
    mov   wc.lpfnWndProc, rax
    mov   wc.cbClsExtra, 0
    mov   wc.cbWndExtra, 0
    mov   rax, [hInstance]
    mov   wc.hInstance, rax
    mov   wc.hbrBackground, COLOR_HOTLIGHT + 1
    mov   wc.lpszMenuName, 0
    lea   rax, className
    mov   wc.lpszClassName, rax
    lea   rcx, wc
    call  RegisterClassExW
    mov   hWndClass, rax

    add   rsp, 20h
    ret
RegisterWindowClass ENDP



CreateWindow PROC

    ; Create the window (https://learn.microsoft.com/en-us/windows/win32/api/winuser/nf-winuser-createwindowexa)
    push  0
    push  hInstance
    push  0
    push  0
    push  windowHeight
    push  windowWidth
    push  CW_USEDEFAULT
    push  CW_USEDEFAULT

    sub   rsp, 20h
    xor   ecx, ecx
    lea   rdx, className
    lea   r8, windowName
    mov   r9d, WS_OVERLAPPEDWINDOW
    call  CreateWindowExW
    cmp   rax, 0
    je    exit
    mov   hWindow, rax

exit:
    add   rsp, 60h
    ret
CreateWindow ENDP


ShowAndUpdateWindow PROC
    sub rsp, 20h

    ; Show the window (https://learn.microsoft.com/en-us/windows/win32/api/winuser/nf-winuser-showwindow)
    mov rcx, [hWindow]
    mov rdx, SW_SHOWDEFAULT
    call ShowWindow

    ; Update the window (https://learn.microsoft.com/en-us/windows/win32/api/winuser/nf-winuser-updatewindow)
    mov rcx, [hWindow]
    call UpdateWindow

    add rsp, 20h
ShowAndUpdateWindow ENDP


; Window procedure
WinProc PROC hWin:QWORD, uMsg:DWORD, wParam:QWORD, lParam:QWORD

; hWin in RCX
; uMsg in EDX
; wParam in R8
; lParam in R9

    ; Check the message uMsg (is in edx)
    cmp     edx, WM_CREATE
    je      handleCreateMsg
    cmp     edx, WM_PAINT
    je      handlePaintMsg
    cmp     edx, WM_DESTROY
    je      handleDestroyMsg
    cmp     edx, WM_SIZE
    je      handleResizeMsg

    ; default handler   (called with input params hWin,uMsg,wParam and lParam still in registers rcx,edx,r8 and r9)
    sub     rsp, 20h
    call    DefWindowProcW    ; (https://learn.microsoft.com/en-us/windows/win32/api/winuser/nf-winuser-defwindowprocw)
    add     rsp, 20h
    ret

handleCreateMsg:
    xor     rax, rax
    ret

handlePaintMsg:
    xor     rax, rax
    ret

handleDestroyMsg:    ;(https://learn.microsoft.com/en-us/windows/win32/api/winuser/nf-winuser-postquitmessage)
    sub     rsp, 20h
    mov     rcx, 0          ; exit with exitcode 0
    call    PostQuitMessage
    add     rsp, 20h
    xor     rax, rax
    ret

handleResizeMsg:
    xor     rax, rax
    ret

WinProc ENDP


END
