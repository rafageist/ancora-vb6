VERSION 5.00
Begin VB.UserControl XPButton 
   ClientHeight    =   900
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   3225
   KeyPreview      =   -1  'True
   ScaleHeight     =   900
   ScaleWidth      =   3225
   ToolboxBitmap   =   "XPButton.ctx":0000
   Begin VB.PictureBox imgIcon 
      AutoSize        =   -1  'True
      BorderStyle     =   0  'None
      Height          =   510
      Left            =   195
      ScaleHeight     =   510
      ScaleWidth      =   540
      TabIndex        =   1
      TabStop         =   0   'False
      Top             =   195
      Visible         =   0   'False
      Width           =   540
   End
   Begin VB.Timer overTimer 
      Interval        =   1
      Left            =   2625
      Top             =   240
   End
   Begin VB.PictureBox DisPic 
      BorderStyle     =   0  'None
      Height          =   645
      Left            =   1710
      ScaleHeight     =   645
      ScaleWidth      =   675
      TabIndex        =   0
      Top             =   135
      Visible         =   0   'False
      Width           =   675
   End
   Begin VB.Label lblCaption 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Label1"
      Height          =   195
      Left            =   975
      TabIndex        =   2
      Top             =   360
      Visible         =   0   'False
      Width           =   480
   End
End
Attribute VB_Name = "XPButton"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

'***************** VARIABLES **********************

Dim ReadingProps As Boolean
Dim ActualSize As Integer
Dim OldStyle As Integer

Dim MouseEnterRaised As Boolean
Dim isOver As Boolean
Dim ByKey As Boolean
Dim HasFocus As Boolean
Dim PressStatus As Boolean

Const HYMETRIC = 1.76458333333333

Const classLIGHTCOL1 = &H80000014
Const classLIGHTCOL2 = &H80000016
Const classDARKCOL1 = &H80000015
Const classDARKCOL2 = &H80000010

Const normColBegin = &H80000014
Const normColEnd = &H8000000F
Const pressColBegin = &H80000010
Const pressColEnd = &H8000000F

Const btFocusColor = &HEFC5A9 'HFF7750     'RGB(0, 128, 255)
Const btHoverColor = &H89D8FD
Const BorderColor = &H984E00
Const def_ForeColor = &H80000012

Const DisableText = &H759797
Const DisableBorder = &H759797
Const DisableBack = &HE0E7E7

Dim ActForeColor As OLE_COLOR

Dim PicX As Integer, PicY As Integer
Dim PicW As Integer, PicH As Integer
Dim LabelX As Integer, LabelY As Integer
Dim LabelW As Integer, LabelH As Integer
Dim LargTot As Integer, AltTot As Integer

#If False Then
    Public Left
    Public Right
    Public Top
    Public Bottom
    Public Center
#End If
Public Enum PicAlignConst
    Left = 0
    Right = 1
    Top = 2
    Bottom = 3
    Center = 4
End Enum

#If False Then
  Public sndNone
  Public sndDefault
  Public sndCustom
#End If
Public Enum SoundConst
    sndNone = 0
    sndDefault = 1
    sndCustom = 2
End Enum


#If False Then
  Public csDefault
  Public csCustom
#End If
Public Enum SchemeConst
    csDefault = 0
    csCustom = 1
End Enum

#If False Then
    Public WindowsXP
    Public Classic
#End If
Public Enum btStyleConst
    WindowsXP = 0
    Classic = 1
End Enum

Dim ActAlignment As PicAlignConst
Dim ActSoundStatus As SoundConst
Dim ActSoundFile As String
Dim ActColorScheme As SchemeConst
Dim ActColorBegin As Long
Dim ActColorEnd As Long
Dim ActBtStyle As btStyleConst
Dim ActFocusRectStatus
Dim ActHoverEffect As Boolean
Dim ActChkStatus As Boolean
Dim ActValue As Boolean

'**************************************************

'******************** EVENTS **********************
Public Event Click()
Public Event MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
Public Event MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
Public Event MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
Public Event MouseEnter()
Public Event MouseExit()
Public Event KeyDown(KeyCode As Integer, Shift As Integer)
Public Event KeyUp(KeyCode As Integer, Shift As Integer)
Public Event KeyPress(KeyAscii As Integer)
'**************************************************


'*************** USERCONTROL EVENTS ***************
Private Sub UserControl_GotFocus()
HasFocus = True
If Not CheckboxBehaviour Then
    DrawButton isMouseOver, PressStatus
Else
    DrawButton isMouseOver, Value
End If
End Sub

Private Sub UserControl_InitProperties()
Style = 0
Set Font = Ambient.Font
Caption = Ambient.DisplayName
PictureAlignment = 0
ShowFocusRect = True
ActColorBegin = normColBegin
ActColorEnd = normColEnd
ColorScheme = 0
End Sub

Private Sub UserControl_LostFocus()
HasFocus = False
If Not CheckboxBehaviour Then
    DrawButton isMouseOver, PressStatus
Else
    DrawButton isMouseOver, Value
End If

End Sub
Private Sub UserControl_KeyDown(KeyCode As Integer, Shift As Integer)

If Not HasFocus Then Exit Sub
ByKey = True
RaiseEvent KeyDown(KeyCode, Shift)
    If Not Enabled Then Exit Sub
    Select Case KeyCode
        Case vbKeySpace
            DrawButton False, True
        Case vbKeyRight, vbKeyDown
            SendKeys "{TAB}"
        Case vbKeyLeft, vbKeyUp
            SendKeys "+({TAB})"
    End Select

End Sub

Private Sub UserControl_KeyPress(KeyAscii As Integer)
If Not HasFocus Then Exit Sub
RaiseEvent KeyPress(KeyAscii)
End Sub

Private Sub UserControl_KeyUp(KeyCode As Integer, Shift As Integer)

If Not HasFocus Then Exit Sub
ByKey = True
RaiseEvent KeyUp(KeyCode, Shift)
    If KeyCode <> vbKeySpace Then Exit Sub
    
    Value = Not Value
    
    If isMouseOver Then
        DrawButton True, IIf(Not CheckboxBehaviour, True, Value)
    Else
        DrawButton False, IIf(Not CheckboxBehaviour, True, Value)
    End If
    
    Select Case SoundOnClick
        Case 1
            PlaySound (101)
        Case 2
            On Error Resume Next
            Call sndPlaySound(ByVal SoundFile, 1) 'suona quello che vuoi
            On Error GoTo 0
    End Select

RaiseEvent Click

End Sub

Private Sub UserControl_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    
    RaiseEvent MouseDown(Button, Shift, X, Y)
   
    If Button < 2 Then
        DrawButton False, True
        PressStatus = True
    End If


End Sub

Private Sub UserControl_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)

    If Not MouseEnterRaised Then
        RaiseEvent MouseEnter
        MouseEnterRaised = True
    End If

RaiseEvent MouseMove(Button, Shift, X, Y)

    If Button < 2 Then
        If Not isMouseOver Then
            DrawButton False, Value
        Else
            If Button = 0 And Not isOver Then
                overTimer.Enabled = True
                isOver = True
                DrawButton IIf(CheckboxBehaviour And Value, False, True), Value
            ElseIf Button = 1 Then
                isOver = True
                DrawButton False, True
                isOver = False
            End If
        End If
    End If
End Sub

Private Sub UserControl_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)

If Button <> 1 Then Exit Sub

PressStatus = False
If isMouseOver Then
    If CheckboxBehaviour Then
        If Value = False Then
            Value = True
        Else
            Value = False
            DrawButton True, False
        End If
    Else
        DrawButton True, False
    End If
    'DrawButton True, False
    RaiseEvent MouseUp(Button, Shift, X, Y)
       
    Select Case SoundOnClick
        Case 1
            PlaySound (101)
        Case 2
            On Error Resume Next
            Call sndPlaySound(ByVal SoundFile, 1) 'suona quello che vuoi
            On Error GoTo 0
    End Select
    
    RaiseEvent Click
Else
    DrawButton False, Value
End If

End Sub


Private Sub UserControl_Resize()

If ReadingProps Then Exit Sub

Set UserControl.Font = Font
    
If Style = 0 Then
    If ActualSize <> UserControl.Width + UserControl.Height Or OldStyle <> ActBtStyle Then
        SetWindowRgn UserControl.hWnd, &H0, False
        Dim lParam(1 To 6) As Long
        lParam(1) = 0
        lParam(2) = 0
        lParam(3) = ScaleWidth / 15
        lParam(4) = ScaleHeight / 15
        lParam(5) = 5
        lParam(6) = 5
        Call fMakeATranspArea(lParam())
    End If
Else
    SetWindowRgn UserControl.hWnd, &H0, False
End If

DoEvents
        
    ActualSize = UserControl.Width + UserControl.Height
    OldStyle = ActBtStyle

UserControl.AutoRedraw = True
UserControl.Cls

DrawButton False, False

End Sub
'**********************************************************************

'********************** PROPERTIES EXPOSITION *************************
Property Let Value(ByVal NewValue As Boolean)

If Not CheckboxBehaviour Then Exit Property

ActValue = NewValue
PropertyChanged "Value"
If CheckboxBehaviour Then
    DrawButton False, ActValue
    'RaiseEvent Click
End If

End Property

Property Get Value() As Boolean
Value = ActValue
End Property

Property Let CheckboxBehaviour(ByVal NewStatus As Boolean)
ActChkStatus = NewStatus
PropertyChanged "ChekboxBehaviour"
End Property

Property Get CheckboxBehaviour() As Boolean
CheckboxBehaviour = ActChkStatus
End Property

Property Let HoverEffect(ByVal NewStatus As Boolean)
ActHoverEffect = NewStatus
DrawButton False, False
PropertyChanged "HoverEffect"
End Property

Property Get HoverEffect() As Boolean
HoverEffect = ActHoverEffect
End Property

Property Let ShowFocusRect(ByVal NewStatus As Boolean)
ActFocusRectStatus = NewStatus
DrawButton False, False
PropertyChanged "ShowFocusRect"
End Property

Property Get ShowFocusRect() As Boolean
ShowFocusRect = ActFocusRectStatus
End Property

Property Let Style(ByVal NewStyle As btStyleConst)
ActBtStyle = NewStyle

UserControl_Resize

PropertyChanged "Style"

End Property

Property Get Style() As btStyleConst
Style = ActBtStyle
End Property


Property Let ColorScheme(ByVal NewScheme As SchemeConst)
  ActColorScheme = NewScheme
  
  If NewScheme = -1 Then
      ColorBegin = normColBegin
      ColorEnd = normColEnd
  End If
  
  DrawButton False, False
  PropertyChanged "ColorScheme"

End Property

Property Get ColorScheme() As SchemeConst
ColorScheme = ActColorScheme
End Property

Property Let ColorBegin(ByVal NewColor As OLE_COLOR)

    ActColorBegin = NewColor
    If ColorScheme = 1 Then DrawButton False, False
    PropertyChanged "ColorBegin"

End Property

Property Get ColorBegin() As OLE_COLOR
ColorBegin = ActColorBegin
End Property

Property Let ColorEnd(ByVal NewColor As OLE_COLOR)

    ActColorEnd = NewColor
    If ColorScheme = 1 Then DrawButton False, False
    PropertyChanged "ColorEnd"

End Property

Property Get ColorEnd() As OLE_COLOR
ColorEnd = ActColorEnd
End Property


Property Let SoundFile(ByVal NewFile As String)
ActSoundFile = NewFile
PropertyChanged "SoundFile"
End Property

Property Get SoundFile() As String
Attribute SoundFile.VB_ProcData.VB_Invoke_Property = "SelectSound"
SoundFile = ActSoundFile
End Property

Property Let SoundOnClick(ByVal NewStatus As SoundConst)
ActSoundStatus = NewStatus
PropertyChanged "SoundOnClick"
End Property

Property Get SoundOnClick() As SoundConst
SoundOnClick = ActSoundStatus
End Property

Property Let PictureAlignment(ByVal NewAlignment As PicAlignConst)
ActAlignment = NewAlignment
PropertyChanged "PictureAlignment"
DrawButton False, False
End Property

Property Get PictureAlignment() As PicAlignConst
PictureAlignment = ActAlignment
End Property

Property Let Enabled(ByVal NewValue As Boolean)

UserControl.Enabled = NewValue
PropertyChanged "Enabled"
DrawButton False, False

End Property

Property Get Enabled() As Boolean
Enabled = UserControl.Enabled
End Property

Property Set Picture(ByVal NewPicture As StdPicture)
imgIcon.Picture = NewPicture
UserControl_Resize
PropertyChanged "Picture"

End Property

Property Get Picture() As StdPicture
Set Picture = imgIcon.Picture
End Property

Property Let Caption(ByVal NewCaption As String)
lblCaption.Caption = NewCaption
If Ambient.UserMode = True Then
    DrawButton isMouseOver, PressStatus
Else
    UserControl_Resize
End If
PropertyChanged "Caption"
End Property

Property Get Caption() As String
Caption = lblCaption.Caption
End Property

Property Set Font(ByVal NewFont As StdFont)

Set lblCaption.Font = NewFont
Set UserControl.Font = NewFont

UserControl_Resize

PropertyChanged "Font"

End Property

Property Get Font() As StdFont
Set Font = UserControl.Font
End Property

Property Let ForeColor(ByVal NewColor As OLE_COLOR)
lblCaption.ForeColor = NewColor
UserControl_Resize
PropertyChanged "ForeColor"
End Property

Property Get ForeColor() As OLE_COLOR
ForeColor = lblCaption.ForeColor
End Property
'******************************************************************

'*********************** VARIOUS ROUTINES *************************

Private Sub DrawClassicButton(Pressed As Boolean)

Dim FPx As Integer
Dim A
FPx = IIf(HasFocus, Screen.TwipsPerPixelX, IIf(CheckboxBehaviour And Value, Screen.TwipsPerPixelX, 0))

With UserControl
    Cls
    .BackColor = ColorEnd
    
    .FillStyle = vbFSTransparent
    .DrawStyle = 0
    A = .ScaleMode
    If Not Pressed Then
        Line (15 + FPx, 15 + FPx)-(.ScaleWidth - FPx, .ScaleHeight - FPx), classLIGHTCOL2, B
        Line (0 + FPx, 0 + FPx)-(.ScaleWidth - 30 - FPx, .ScaleHeight - 30 - FPx), classDARKCOL2, B
        Line (0 + FPx, 0 + FPx)-(.ScaleWidth + 15, .ScaleHeight + 15), classLIGHTCOL1, B
        Line (-15, -15)-(.ScaleWidth - 15 - FPx, .ScaleHeight - 15 - FPx), classDARKCOL1, B
    Else
        Line (0 + FPx, 0 + FPx)-(.ScaleWidth - 15 - FPx, .ScaleHeight - 15 - FPx), classDARKCOL2, B
        
        If ShowFocusRect And HasFocus Then DrawClassicFocusRect
    End If
        
        If HasFocus Or (CheckboxBehaviour And Value) Then Line (0, 0)-(.ScaleWidth - 15, .ScaleHeight - 15), vbBlack, B

End With

End Sub

Private Sub DrawClassicFocusRect()
        
Dim lpRect As RECT
        
With lpRect
    .Left = 4
    .Top = 4
    .Right = (ScaleWidth / Screen.TwipsPerPixelX) - 4
    .Bottom = (ScaleHeight / Screen.TwipsPerPixelY) - 4
End With
    
DrawFocusRect UserControl.hdc, lpRect
        
Exit Sub

Dim K As Integer
        
With UserControl
    For K = 45 To .ScaleWidth - 60 Step 30
        UserControl.PSet (K, 45)
        UserControl.PSet (K, .ScaleHeight - 60)
    Next
    For K = 45 To .ScaleHeight - 60 Step 30
        UserControl.PSet (45, K)
        UserControl.PSet (.ScaleWidth - 60, K)
    Next
End With

End Sub

Private Sub DrawButton(Hover As Boolean, Pressed As Boolean)

Dim Pixel As Byte
Dim PicGap As Integer
Dim Col1 As Long, Col2 As Long
Dim ColP1 As Long, ColP2 As Long
Dim RP1 As Integer, GP1 As Integer, BP1 As Integer
Dim RD As Integer, GD As Integer, BD As Integer
Dim RectX As Integer, RectY As Integer
Dim RectW As Integer, RectH As Integer
Dim SpazioDispX
Dim rct As RECT

If imgIcon.Picture = 0 Then
    PicW = 0
    PicH = 0
Else
    PicW = imgIcon.ScaleWidth
    PicH = imgIcon.ScaleHeight
End If

LabelW = IIf(lblCaption.Caption <> "", UserControl.TextWidth(lblCaption.Caption), 0)
LabelH = IIf(lblCaption.Caption <> "", UserControl.TextHeight(lblCaption.Caption), 0)

PicGap = IIf(lblCaption.Caption <> "", 90, 0)

Select Case PictureAlignment
    Case 0, 1
        SpazioDispX = IIf(LabelW > ScaleWidth - PicW - PicGap * 3, ScaleWidth - PicW - PicGap * 3, LabelW)
    Case Else
        SpazioDispX = ScaleWidth
End Select

With rct
    .Left = 0
    .Top = 0
    Select Case PictureAlignment
        Case 0, 1
            .Right = (ScaleWidth - PicW - IIf(PicW > 0, PicGap * 3, 0)) / Screen.TwipsPerPixelX
            .Bottom = ScaleHeight / Screen.TwipsPerPixelY
        Case 2, 3, 4
            .Right = (ScaleWidth - (PicGap * 2)) / Screen.TwipsPerPixelX
            .Bottom = (ScaleHeight - PicH - IIf(PicH > 0, PicGap * 3, 0)) / Screen.TwipsPerPixelY
    End Select
    
End With

RectH = DrawText(UserControl.hdc, Caption, Len(Caption), rct, DT_WORDBREAK Or DT_CENTER Or DT_CALCRECT)

Col1 = IIf(ColorScheme = 0, normColBegin, ColorBegin)
Col2 = IIf(ColorScheme = 0, normColEnd, ColorEnd)

UserControl.PSet (15, 15), Col1
Col1 = UserControl.Point(15, 15)
UserControl.PSet (30, 30), Col2
Col2 = UserControl.Point(30, 30)

RP1 = IIf((Col2 And &HFF&) / 2 < 0, 0, (Col2 And &HFF&) / 2)
GP1 = IIf(((Col2 And &HFF00&) / 256) / 2 < 0, 0, ((Col2 And &HFF00&) / 256) / 2)
BP1 = IIf(((Col2 And &HFF0000) / 65536) / 2 < 0, 0, ((Col2 And &HFF0000) / 65536) / 2)

ColP1 = IIf(ColorScheme = 0, pressColBegin, RGB(RP1, GP1, BP1))
ColP2 = IIf(ColorScheme = 0, pressColEnd, ColorEnd) 'ColorBegin)

If Not Pressed Then
    If Enabled Then
        If Style = 0 Then MakeGradient Col1, Col2
    End If
Else
    If Enabled Then
        If Style = 0 Then MakeGradient ColP1, ColP2
    End If
End If

RD = Col2 And &HFF&
GD = (Col2 And &HFF00&) / 256
BD = (Col2 And &HFF0000) / 65536

RD = (RD + ((255 - RD) / 2)) / 10 * 9.5
GD = (GD + ((255 - GD) / 2)) / 10 * 9.5
BD = (BD + ((255 - BD) / 2)) / 10 * 9.5

If Not Enabled Then
    UserControl.Cls
    If ColorScheme = 0 Then
        UserControl.BackColor = DisableBack
    Else
        UserControl.BackColor = RGB(RD, GD, BD)
    End If
End If

On Error Resume Next

If imgIcon.Picture = 0 Then
    RectX = 0
    RectY = ((ScaleHeight / 15) - RectH) / 2
    RectW = ScaleWidth / 15
Else
    Select Case PictureAlignment
        Case 0
            PicX = (ScaleWidth - (SpazioDispX + PicW + PicGap)) / 2
            PicY = (ScaleHeight - PicH) / 2
            RectX = (PicX + PicW + PicGap) / 15
            RectY = ((ScaleHeight / 15) - RectH) / 2
            RectW = SpazioDispX / 15
        Case 1
            PicX = PicGap + SpazioDispX + ((ScaleWidth - (SpazioDispX + PicW + PicGap)) / 2)
            PicY = (ScaleHeight - PicH) / 2
            RectY = (((ScaleHeight / 15) - RectH) / 2)
            RectW = SpazioDispX / 15
            RectX = (PicX - PicGap) / 15 - RectW
        Case 2
            AltTot = PicH + PicGap + (RectH * 15)
            PicX = (ScaleWidth - PicW) / 2
            PicY = (ScaleHeight - AltTot) / 2
            RectY = (PicY + PicH + PicGap) / 15
            RectX = PicGap / 15
            RectW = (ScaleWidth - PicGap * 2) / 15
        Case 3
            AltTot = PicH + PicGap + (RectH * 15)
            RectY = ((ScaleHeight - AltTot) / 2) / 15
            RectX = PicGap / 15
            RectW = (ScaleWidth - PicGap * 2) / 15
            PicX = (ScaleWidth - PicW) / 2
            PicY = ScaleHeight - ((ScaleHeight - AltTot) / 2) - PicH
        Case 4
            RectX = PicGap / 15
            RectY = ((ScaleHeight / 15) - RectH) / 2
            RectW = (ScaleWidth - PicGap * 2) / 15
            PicX = (ScaleWidth - PicW) / 2
            PicY = (ScaleHeight - PicH) / 2
    End Select

    PicY = PicY - Screen.TwipsPerPixelY
    RectY = RectY - 1

End If

If Style = 1 Then
    DrawClassicButton Pressed
End If

Pixel = IIf(Pressed, Screen.TwipsPerPixelX, 0)

    If imgIcon.Picture <> 0 Then
        If Enabled Then
            If HoverEffect And Not (Hover Or Pressed) Then
                PictureGrey PicX, PicY
            Else
                UserControl.PaintPicture imgIcon.Picture, PicX + Pixel, PicY + Pixel, PicW, PicH
            End If
        Else
            If Style = 0 Then PictureGrey PicX, PicY
        End If
    End If

    If Enabled Then
        UserControl.ForeColor = ForeColor
    Else
        If ColorScheme = 0 Then
            UserControl.ForeColor = DisableText
        Else
            UserControl.ForeColor = RGB(RD / 2, GD / 2, BD / 2)
        End If
    End If
    
    With rct
        .Left = RectX + IIf(Pressed, 1, 0)
        .Top = RectY + IIf(Pressed, 1, 0)
        .Right = RectX + RectW + IIf(Pressed, 1, 0)
        .Bottom = RectY + RectH + IIf(Pressed, 1, 0)
    End With
    
    DrawText UserControl.hdc, Caption, Len(Caption), rct, DT_CENTER Or DT_WORDBREAK
    
On Error GoTo 0

If Hover And Not PressStatus And Style = 0 Then
    With UserControl
        .ForeColor = btHoverColor
        .DrawWidth = 3
        .DrawMode = 9 ' 9
        
        RoundRect .hdc, 1, 1, .ScaleWidth / 15 - 2, .ScaleHeight / 15 - 2, 2, 1
        
        .DrawWidth = 1
        .DrawMode = 13

   End With
    Exit Sub
End If

If ShowFocusRect Then
    If HasFocus And Not Pressed Then
        If Style = 0 Then
             With UserControl
                 .ForeColor = btFocusColor
                 .DrawWidth = 3
                 .DrawMode = 9 ' 9
                 
                 RoundRect .hdc, 1, 1, .ScaleWidth / 15 - 2, .ScaleHeight / 15 - 2, 2, 1
                 RoundRect .hdc, 1, 1, .ScaleWidth / 15 - 2, .ScaleHeight / 15 - 2, 2, 1
                
                .DrawWidth = 1
                .DrawMode = 13
         
            End With
        Else
            With UserControl
                .ForeColor = vbBlack
                .DrawWidth = 1
                .DrawStyle = 2
                .DrawMode = 13
                DrawClassicFocusRect
            End With
        End If
    End If
End If

If Not Enabled Then
    If Style = 0 Then
        UserControl.ForeColor = DisableBorder
        RoundRect UserControl.hdc, 0, 0, ScaleWidth / 15 - 1, ScaleHeight / 15 - 1, 5, 5
    Else
        DrawClassicButton (False)
        PictureGrey PicX, PicY
        
        With rct
            .Left = RectX + 1
            .Top = RectY + 1
            .Right = RectX + RectW + 1
            .Bottom = RectY + RectH + 1
        End With
        UserControl.ForeColor = classLIGHTCOL1
        DrawText UserControl.hdc, Caption, Len(Caption), rct, DT_CENTER Or DT_WORDBREAK
        
        'UserControl.Print lblCaption
        'UserControl.CurrentX = LabelX
        'UserControl.CurrentY = LabelY
        With rct
            .Left = RectX
            .Top = RectY
            .Right = RectX + RectW
            .Bottom = RectY + RectH
        End With
        UserControl.ForeColor = classDARKCOL2
        DrawText UserControl.hdc, Caption, Len(Caption), rct, DT_CENTER Or DT_WORDBREAK
        'UserControl.Print lblCaption
    End If
End If
        
If Style = 0 And Enabled Then
    With UserControl
        .DrawWidth = 1
        .DrawMode = 13
        .ForeColor = BorderColor
        RoundRect .hdc, 0, 0, ScaleWidth / 15 - 1, ScaleHeight / 15 - 1, 5, 5
    End With
End If

End Sub

Private Sub MakeGradient(StartCol As Long, EndCol As Long)

Dim CR As Double, CG As Double, CB As Double
Dim Col_1 As Long
Dim Col_2 As Long
Dim CS_R As Integer
Dim CS_G As Integer
Dim CS_B As Integer
Dim CE_R As Integer
Dim CE_G As Integer
Dim CE_B As Integer
Dim Col As Long
Dim ValRif As Integer
Dim K As Integer

UserControl.AutoRedraw = True
UserControl.DrawWidth = 1 '5
UserControl.DrawStyle = 0

UserControl.PSet (15, 15), StartCol
Col_1 = UserControl.Point(15, 15)

UserControl.PSet (30, 30), EndCol
Col_2 = UserControl.Point(30, 30)

CS_R = Col_1 And &HFF
CS_G = (Col_1 And &HFF00&) / 256
CS_B = (Col_1 And &HFF0000) / 65536

CE_R = Col_2 And &HFF
CE_G = (Col_2 And &HFF00&) / 256
CE_B = (Col_2 And &HFF0000) / 65536

CR = CS_R
CG = CS_G
CB = CS_B

ValRif = UserControl.ScaleHeight

On Error Resume Next

For K = 0 To ValRif Step 15
    CR = CR + (CE_R - CS_R) / (ValRif / 15)
    CG = CG + (CE_G - CS_G) / (ValRif / 15)
    CB = CB + (CE_B - CS_B) / (ValRif / 15)
    
    Col = RGB(CR, CG, CB)
    
    UserControl.Line (0, K)-(UserControl.ScaleWidth, K), Col
Next

On Error GoTo 0
    
    UserControl.DrawWidth = 1

    UserControl.ForeColor = BorderColor
    RoundRect UserControl.hdc, 0, 0, ScaleWidth / 15 - 1, ScaleHeight / 15 - 1, 5, 5

End Sub


Private Function fMakeATranspArea(pCordinate() As Long) As Boolean
    
    Const RGN_DIFF = 4
    Dim lOriginalForm As Long
    Dim ltheHole As Long
    Dim lNewForm As Long
    Dim lFwidth As Single
    Dim lFHeight As Single
    Dim lborder_width As Single
    Dim ltitle_height As Single
    On Error GoTo Trap
    lFwidth = ScaleX(Width, vbTwips, vbPixels)
    lFHeight = ScaleY(Height, vbTwips, vbPixels)
    lOriginalForm = CreateRectRgn(0, 0, lFwidth, lFHeight)
    lborder_width = (lFHeight - ScaleWidth) / 2
    ltitle_height = lFHeight - lborder_width - ScaleHeight
            
    ltheHole = CreateRoundRectRgn(pCordinate(1), pCordinate(2), pCordinate(3), _
                pCordinate(4), pCordinate(5), pCordinate(6))
    
    lNewForm = CreateRectRgn(0, 0, 0, 0)

    CombineRgn lNewForm, lOriginalForm, ltheHole, 1 'RGN_DIFF
    SetWindowRgn hWnd, lNewForm, True

    fMakeATranspArea = True
    Exit Function

Trap:
    MsgBox "error Occurred. Error # " & Err.Number & ", " & Err.Description
End Function

Private Function isMouseOver() As Boolean
Dim pt As POINTAPI
    GetCursorPos pt
    isMouseOver = (WindowFromPoint(pt.X, pt.Y) = UserControl.hWnd)
End Function

Private Sub OverTimer_Timer()

    If Not isMouseOver Then
        overTimer.Enabled = False
        DrawButton False, Value
        isOver = False
        RaiseEvent MouseExit
        MouseEnterRaised = False
    End If

DoEvents

End Sub

Private Sub PictureGrey(StartX, StartY)
    
    Dim SX As Integer, SY As Integer
    Dim BackCol As Long
    Dim Col As Long
    Dim X As Long
    Dim Y As Long
    Dim R As Integer, G As Integer, B As Integer
    Dim Grey As Integer, GreyCol As Long
    
    SX = StartX / Screen.TwipsPerPixelX
    SY = StartY / Screen.TwipsPerPixelY
       
    DisPic.AutoRedraw = True
    DisPic.Width = imgIcon.Picture.Width / HYMETRIC
    DisPic.Height = imgIcon.Picture.Height / HYMETRIC + 15
    
    UserControl.PSet (15, 15), DisPic.BackColor
    BackCol = DisPic.Point(15, 15)

    DisPic.Picture = imgIcon.Image
    For X = 0 To Int((DisPic.Picture.Width / HYMETRIC)) / Screen.TwipsPerPixelX - 1
        For Y = 0 To Int((DisPic.Picture.Height / HYMETRIC)) / Screen.TwipsPerPixelY - 1
            If DisPic.Point(X * Screen.TwipsPerPixelX, Y * Screen.TwipsPerPixelY) <> BackCol Then
                Col = GetPixel(DisPic.hdc, X, Y)
                R = Col And &HFF&
                G = (Col And &HFF00&) \ 256
                B = (Col And &HFF0000) \ 65536
                
                Grey = Int((R + G + B) / 3)
                
                GreyCol = RGB(Grey, Grey, Grey)
                
                Call SetPixel(UserControl.hdc, SX + X, SY + Y, GreyCol)
            End If
        Next
    Next
End Sub

Public Sub ShowAboutBox()
Attribute ShowAboutBox.VB_UserMemId = -552
Attribute ShowAboutBox.VB_MemberFlags = "40"
frmAbout.lblOCXName.Caption = "XP CommandButton"
frmAbout.Show (1)
End Sub


'***************** READ & WRITE PROPERTIES ******************
Private Sub UserControl_WriteProperties(PropBag As PropertyBag)

ReadingProps = True

PropBag.WriteProperty "Style", ActBtStyle, 0
PropBag.WriteProperty "Enabled", UserControl.Enabled, True
PropBag.WriteProperty "Picture", imgIcon.Picture, Nothing
PropBag.WriteProperty "Caption", lblCaption.Caption, Ambient.DisplayName
PropBag.WriteProperty "Font", lblCaption.Font, Ambient.Font
PropBag.WriteProperty "ForeColor", lblCaption.ForeColor, &H80000012
PropBag.WriteProperty "PictureAlignment", ActAlignment, 0
PropBag.WriteProperty "SoundOnClick", ActSoundStatus, 0
PropBag.WriteProperty "SoundFile", ActSoundFile, ""
PropBag.WriteProperty "ColorScheme", ActColorScheme, 0
PropBag.WriteProperty "ColorBegin", ActColorBegin, normColBegin
PropBag.WriteProperty "ColorEnd", ActColorEnd, normColEnd
PropBag.WriteProperty "ShowFocusRect", ActFocusRectStatus, True
PropBag.WriteProperty "HoverEffect", ActHoverEffect, False
PropBag.WriteProperty "CheckboxBehaviour", ActChkStatus, False
PropBag.WriteProperty "Value", ActValue, False

ReadingProps = False

End Sub

Private Sub UserControl_ReadProperties(PropBag As PropertyBag)

Style = PropBag.ReadProperty("Style", 0)
Enabled = PropBag.ReadProperty("Enabled", True)
Set Picture = PropBag.ReadProperty("Picture", Nothing)
Caption = PropBag.ReadProperty("Caption", Ambient.DisplayName)
Set Font = PropBag.ReadProperty("Font", Ambient.Font)
ForeColor = PropBag.ReadProperty("ForeColor", &H80000012)
PictureAlignment = PropBag.ReadProperty("PictureAlignment", 0)
SoundOnClick = PropBag.ReadProperty("SoundOnClick", 0)
SoundFile = PropBag.ReadProperty("SoundFile", "")
ColorScheme = PropBag.ReadProperty("ColorScheme", 0)
ColorBegin = PropBag.ReadProperty("ColorBegin", normColBegin)
ColorEnd = PropBag.ReadProperty("ColorEnd", normColEnd)
ShowFocusRect = PropBag.ReadProperty("ShowFocusRect", True)
HoverEffect = PropBag.ReadProperty("HoverEffect", False)
CheckboxBehaviour = PropBag.ReadProperty("CheckboxBehaviour", False)
Value = PropBag.ReadProperty("Value", False)

End Sub

'************************************************************
