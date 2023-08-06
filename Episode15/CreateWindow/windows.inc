; windows.inc - Custom include file


; Some icons            (https://learn.microsoft.com/en-us/windows/win32/menurc/about-icons):
IDI_APPLICATION  equ  32512
IDI_HAND         equ  32513
IDI_QUESTION     equ  32514
IDI_EXCLAMATION  equ  32515
IDI_ASTERISK     equ  32516
IDI_WINLOGO      equ  32517
IDI_SHIELD       equ  32518


; Some cursors          (https://learn.microsoft.com/en-us/windows/win32/menurc/about-cursors):
IDC_ARROW        equ  32512
IDC_CROSS        equ  32515
IDC_WAIT         equ  32514


; Windows API Constants
CW_USEDEFAULT    equ  80000000h


; Window messages
WM_CREATE        equ  1
WM_DESTROY       equ  2
WM_SIZE          equ  5
WM_PAINT         equ  15


; Window Styles         (https://learn.microsoft.com/en-us/windows/win32/winmsg/window-styles)
WS_OVERLAPPEDWINDOW equ 0CF0000h


; Class Styles          (https://learn.microsoft.com/en-us/windows/win32/winmsg/window-class-styles)
CS_HREDRAW       equ  2
CS_VREDRAW       equ  1


; ShowWindow parameters (https://learn.microsoft.com/en-us/windows/win32/api/winuser/nf-winuser-showwindow)
SW_SHOWDEFAULT   equ  10


; Colors                (https://learn.microsoft.com/en-us/windows/win32/api/winuser/nf-winuser-getsyscolor)
COLOR_WINDOW     equ  5
COLOR_HOTLIGHT   equ  26



;
; Windows API Structures
;

WNDCLASSEXW STRUCT     ; (https://learn.microsoft.com/en-us/windows/win32/api/winuser/ns-winuser-wndclassexw)
  cbSize          DWORD   ?
  style           DWORD   ?
  lpfnWndProc     QWORD   ?
  cbClsExtra      DWORD   ?
  cbWndExtra      DWORD   ?
  hInstance       QWORD   ?
  hIcon           QWORD   ?
  hCursor         QWORD   ?
  hbrBackground   QWORD   ?
  lpszMenuName    QWORD   ?
  lpszClassName   QWORD   ?
  hIconSm         QWORD   ?
WNDCLASSEXW ENDS


POINT STRUCT           ; (https://learn.microsoft.com/en-us/windows/win32/api/windef/ns-windef-point)
  x               QWORD   ?
  y               QWORD   ?
POINT ENDS


MSG STRUCT             ; (https://learn.microsoft.com/en-us/windows/win32/api/winuser/ns-winuser-msg)
  hwnd            QWORD   ?
  message         DWORD   ?
  wParam          QWORD   ?
  lParam          QWORD   ?
  time            DWORD   ?
  pt              POINT   <>
  lPrivate        DWORD   ?
MSG ENDS
