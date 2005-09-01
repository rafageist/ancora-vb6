Attribute VB_Name = "APIDeclarations"

'**************** API DECLARATIONS ****************
Public Declare Function RoundRect Lib "gdi32" (ByVal hdc As Long, ByVal X1 As Long, _
                        ByVal Y1 As Long, ByVal X2 As Long, ByVal Y2 As Long, _
                        ByVal X3 As Long, ByVal Y3 As Long) As Long
                        
Public Declare Function CreateRoundRectRgn Lib "gdi32" (ByVal X1 As Long, ByVal Y1 As Long, _
                        ByVal X2 As Long, ByVal Y2 As Long, ByVal X3 As Long, ByVal Y3 As Long) As Long

Public Declare Function CreateRectRgn Lib "gdi32" (ByVal X1 As Long, ByVal Y1 As Long, _
                        ByVal X2 As Long, ByVal Y2 As Long) As Long
                        
Public Declare Function CreateEllipticRgn Lib "gdi32" (ByVal X1 As Long, ByVal Y1 As Long, _
                        ByVal X2 As Long, ByVal Y2 As Long) As Long
                        
Public Declare Function CombineRgn Lib "gdi32" (ByVal hDestRgn As Long, ByVal hSrcRgn1 As Long, _
                        ByVal hSrcRgn2 As Long, ByVal nCombineMode As Long) As Long
                        
Public Declare Function SetWindowRgn Lib "user32" (ByVal hWnd As Long, ByVal hRgn As Long, _
                        ByVal bRedraw As Long) As Long

Public Declare Function SetPixel Lib "gdi32" Alias "SetPixelV" (ByVal hdc As Long, ByVal X As Long, _
                        ByVal Y As Long, ByVal crColor As Long) As Long
    
Public Declare Function GetPixel Lib "gdi32" (ByVal hdc As Long, ByVal X As Long, ByVal Y As Long) As Long

Public Declare Function WindowFromPoint Lib "user32" (ByVal xPoint As Long, ByVal yPoint As Long) As Long
Public Declare Function GetCursorPos Lib "user32" (lpPoint As POINTAPI) As Long

Public Declare Function sndPlaySound Lib "winmm" Alias "sndPlaySoundA" _
                        (ByVal lpszSoundName As String, ByVal uFlags As Long) As Long

Public Declare Function CallWindowProc Lib "user32" Alias "CallWindowProcA" _
                        (ByVal lpPrevWndFunc As Long, ByVal hWnd As Long, _
                        ByVal Msg As Long, ByVal wParam As Long, _
                        ByVal lParam As Long) As Long

Public Declare Function SetWindowLong Lib "user32" Alias "SetWindowLongA" _
                        (ByVal hWnd As Long, ByVal nIndex As Long, _
                        ByVal dwNewLong As Long) As Long

Public Declare Function DrawFocusRect Lib "user32" _
                        (ByVal hdc As Long, lpRect As RECT) As Long

Public Declare Function DrawFrameControl Lib "user32" _
                        (ByVal hdc As Long, lpRect As RECT, _
                        ByVal un1 As Long, ByVal un2 As Long) As Long

    Public Const DFC_CAPTION = 1            'Title bar
    Public Const DFC_MENU = 2               'Menu
    Public Const DFC_SCROLL = 3             'Scroll bar
    Public Const DFC_BUTTON = 4             'Standard button

    Public Const DFCS_CAPTIONCLOSE = &H0    'Close button
    Public Const DFCS_CAPTIONMIN = &H1      'Minimize button
    Public Const DFCS_CAPTIONMAX = &H2      'Maximize button
    Public Const DFCS_CAPTIONRESTORE = &H3  'Restore button
    Public Const DFCS_CAPTIONHELP = &H4     'Windows 95 only:
                                            'Help button

    Public Const DFCS_MENUARROW = &H0       'Submenu arrow
    Public Const DFCS_MENUCHECK = &H1       'Check mark
    Public Const DFCS_MENUBULLET = &H2      'Bullet
    Public Const DFCS_MENUARROWRIGHT = &H4

    Public Const DFCS_SCROLLUP = &H0               'Up arrow of scroll
                                                   'bar
    Public Const DFCS_SCROLLDOWN = &H1             'Down arrow of
                                                   'scroll bar
    Public Const DFCS_SCROLLLEFT = &H2             'Left arrow of
                                                   'scroll bar
    Public Const DFCS_SCROLLRIGHT = &H3            'Right arrow of
                                                   'scroll bar
    Public Const DFCS_SCROLLCOMBOBOX = &H5         'Combo box scroll
                                                   'bar
    Public Const DFCS_SCROLLSIZEGRIP = &H8         'Size grip
    Public Const DFCS_SCROLLSIZEGRIPRIGHT = &H10   'Size grip in
                                                   'bottom-right
                                                   'corner of window

    Public Const DFCS_BUTTONCHECK = &H0      'Check box

    Public Const DFCS_BUTTONRADIO = &H4     'Radio button
    Public Const DFCS_BUTTON3STATE = &H8    'Three-state button
    Public Const DFCS_BUTTONPUSH = &H10     'Push button

    Public Const DFCS_INACTIVE = &H100      'Button is inactive
                                            '(grayed)
    Public Const DFCS_PUSHED = &H200        'Button is pushed
    Public Const DFCS_CHECKED = &H400       'Button is checked

    Public Const DFCS_ADJUSTRECT = &H2000   'Bounding rectangle is
                                            'adjusted to exclude the
                                            'surrounding edge of the
                                            'push button

    Public Const DFCS_FLAT = &H4000         'Button has a flat border
    Public Const DFCS_MONO = &H8000         'Button has a monochrome
                                            'border

Public Declare Function DrawText Lib "user32" Alias "DrawTextA" _
                (ByVal hdc As Long, ByVal lpStr As String, ByVal nCount As Long, _
                lpRect As RECT, ByVal wFormat As Long) As Long

    Public Const DT_TOP = &H0
    Public Const DT_LEFT = &H0
    Public Const DT_CENTER = &H1
    Public Const DT_RIGHT = &H2
    Public Const DT_VCENTER = &H4
    Public Const DT_BOTTOM = &H8
    Public Const DT_WORDBREAK = &H10
    Public Const DT_SINGLELINE = &H20
    Public Const DT_EXPANDTABS = &H40
    Public Const DT_TABSTOP = &H80
    Public Const DT_NOCLIP = &H100
    Public Const DT_EXTERNALLEADING = &H200
    Public Const DT_CALCRECT = &H400
    Public Const DT_NOPREFIX = &H800
    Public Const DT_INTERNAL = &H1000
    Public Const DT_EDITCONTROL = &H2000
    Public Const DT_PATH_ELLIPSIS = &H4000
    Public Const DT_END_ELLIPSIS = &H8000
    Public Const DT_MODIFYSTRING = &H10000
    Public Const DT_RTLREADING = &H20000
    Public Const DT_WORD_ELLIPSIS = &H40000

Public Type RECT
     Left As Long
     Top As Long
     Right As Long
     Bottom As Long
End Type

Public Type POINTAPI
    X As Long
    Y As Long
End Type

Public Const WM_THEMECHANGED = &H31A
Public Const GWL_WNDPROC = -4

Private Declare Function GetVersionExA Lib "kernel32" (lpVersionInformation As OSVERSIONINFO) As Long
Private Type OSVERSIONINFO
    dwOSVersionInfoSize As Long
    dwMajorVersion As Long
    dwMinorVersion As Long
    dwBuildNumber As Long
    dwPlatformId As Long
    szCSDVersion As String * 128
End Type

Public Enum Enum_OperatingPlatform
  Platform_Windows_32 = 0
  Platform_Windows_95_98_ME = 1
  Platform_Windows_NT_2K_XP = 2
End Enum

Public Enum Enum_OperatingSystem
  System_Windows_32 = 0
  System_Windows_95 = 1
  System_Windows_98 = 2
  System_Windows_ME = 3
  System_Windows_NT = 4
  System_Windows_2K = 5
  System_Windows_XP = 6
End Enum

'**************************************************

Public Function OperatingSystem() As Enum_OperatingSystem
    Dim lpVersionInformation As OSVERSIONINFO
    lpVersionInformation.dwOSVersionInfoSize = Len(lpVersionInformation)
    Call GetVersionExA(lpVersionInformation)
    If (lpVersionInformation.dwPlatformId = Platform_Windows_32) Then
        OperatingSystem = System_Windows_32
    ElseIf (lpVersionInformation.dwPlatformId = Platform_Windows_95_98_ME) And (lpVersionInformation.dwMinorVersion = 0) Then
        OperatingSystem = System_Windows_95
    ElseIf (lpVersionInformation.dwPlatformId = Platform_Windows_95_98_ME) And (lpVersionInformation.dwMinorVersion = 10) Then
        OperatingSystem = System_Windows_98
    ElseIf (lpVersionInformation.dwPlatformId = Platform_Windows_95_98_ME) And (lpVersionInformation.dwMinorVersion = 90) Then
        OperatingSystem = System_Windows_ME
    ElseIf (lpVersionInformation.dwPlatformId = Platform_Windows_NT_2K_XP) And (lpVersionInformation.dwMajorVersion < 5) Then
        OperatingSystem = System_Windows_NT
    ElseIf (lpVersionInformation.dwPlatformId = Platform_Windows_NT_2K_XP) And (lpVersionInformation.dwMajorVersion = 5) And (lpVersionInformation.dwMinorVersion = 0) Then
        OperatingSystem = System_Windows_2K
    ElseIf (lpVersionInformation.dwPlatformId = Platform_Windows_NT_2K_XP) And (lpVersionInformation.dwMajorVersion = 5) And (lpVersionInformation.dwMinorVersion = 1) Then
        OperatingSystem = System_Windows_XP
    End If
End Function

Sub PlaySound(ByVal ResourceId)
    Dim SoundBuffer As Variant
    Const SND_ASYNC = &H1
    Const SND_NODEFAULT = &H2
    Const SND_MEMORY = &H4
    Const RESType = "SOUND"
    
    SoundBuffer = StrConv(LoadResData(CInt(ResourceId), RESType), vbUnicode)
    Call sndPlaySound(CStr(SoundBuffer), _
        SND_ASYNC Or SND_NODEFAULT Or SND_MEMORY)
    
    SoundBuffer = ""
    DoEvents
End Sub

Function WindowProc(ByVal hw As Long, ByVal uMsg As Long, _
ByVal wParam As Long, ByVal lParam As Long) As Long

If uMsg = WM_THEMECHANGED Then
    If wParam <> 0 Then
        MsgBox "Cambiato!" ' qui ci va il codice per il ridisegno del controllo
    End If
End If

WindowProc = CallWindowProc(lpPrevWndProc, hw, uMsg, wParam, _
lParam)

End Function

