VERSION 5.00
Begin VB.UserControl casilleroRest 
   ClientHeight    =   5340
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   5640
   ScaleHeight     =   5340
   ScaleWidth      =   5640
   Begin VB.CommandButton cmdZoomIn 
      Caption         =   "-"
      Height          =   255
      Left            =   3960
      TabIndex        =   6
      ToolTipText     =   "Reducir vista"
      Top             =   3360
      Width           =   255
   End
   Begin VB.CommandButton cmdZoomOut 
      Caption         =   "+"
      Height          =   255
      Left            =   2880
      TabIndex        =   5
      ToolTipText     =   "Aumentar vista"
      Top             =   1320
      Width           =   375
   End
   Begin VB.CommandButton turno 
      Caption         =   "1"
      Height          =   495
      Index           =   0
      Left            =   120
      TabIndex        =   4
      Top             =   360
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.CommandButton dia 
      Caption         =   "1"
      Height          =   255
      Index           =   0
      Left            =   360
      TabIndex        =   3
      Top             =   120
      Visible         =   0   'False
      Width           =   615
   End
   Begin VB.CommandButton casilla 
      Height          =   495
      Index           =   0
      Left            =   360
      Picture         =   "ancora_goh_traditional_casillero.ctx":0000
      Style           =   1  'Graphical
      TabIndex        =   2
      Top             =   360
      Visible         =   0   'False
      Width           =   615
   End
   Begin VB.HScrollBar shcasillero 
      Height          =   255
      Left            =   120
      TabIndex        =   1
      Top             =   4200
      Width           =   4335
   End
   Begin VB.VScrollBar svcasillero 
      Height          =   4095
      Left            =   4680
      TabIndex        =   0
      Top             =   120
      Width           =   255
   End
End
Attribute VB_Name = "casillerorest"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Dim lcasillero As Long
Dim tcasillero As Long
Dim w As Long
Dim h As Long
Private matrix() As Boolean
Private cd As Long
Private ct As Long
Public Property Let CantDias(value As Integer)
    cd = value
    redimensiona
End Property
Public Property Get CantDias() As Integer
    CantDias = cd
End Property
Public Property Let CantTurnos(value As Integer)
    ct = value
    redimensiona
End Property
Public Property Get CantTurnos() As Integer
    CantTurnos = ct
End Property
Public Sub redimensiona()
    Dim i As Long, cc As Long
    ReDim Preserve matrix(cd, ct)
    cc = UserControl.dia.Count
    If cc < cd Then
        For i = cc To cd
            Load UserControl.dia(i)
        Next
    End If
    cc = UserControl.turno.Count
    If cc < ct Then
        For i = cc To ct
            Load UserControl.turno(i)
        Next
    End If
    cc = UserControl.casilla.Count
    If cc < cd * ct Then
        For i = cc To cd * ct
            Load UserControl.casilla(i)
        Next
    End If
    refresca
End Sub

Private Sub casilla_Click(Index As Integer)
    Dim d As Long
    Dim t As Long
    t = Int((Index / cd)) + 1
    d = Index - ((t - 1) * cd)
    matrix(d, t) = Not matrix(d, t)
    If matrix(d, t) Then casilla(Index).Picture = casilla(0).Picture Else casilla(Index).Picture = dia(0).Picture
End Sub
Sub refresca()
    Dim k As Long, i As Long, j As Long
    k = 0
    tcasillero = 0
    lcasillero = 0
    If h = 0 Then h = 800
    If w = 0 Then w = 800
    For i = 1 To UserControl.turno.Count - 1
        If i > ct Then UserControl.turno(i).Visible = False
    Next
    For i = 1 To UserControl.dia.Count - 1
        If i > cd Then UserControl.dia(i).Visible = False
    Next

    For i = 1 To ct
        With UserControl.turno(i)
            If UserControl.turno.Count <= i Then Load UserControl.turno(i)
            .Top = tcasillero + UserControl.dia(0).Height + (-1 * UserControl.svcasillero.value / UserControl.svcasillero.Max * ct * h + (i - 1) * h)
            .Left = lcasillero
            .Height = h
            .Width = turno(0).Width
            .Visible = True
            .Caption = "" & i
        End With
        For j = 1 To cd
            With UserControl.dia(j)
                If UserControl.dia.Count <= j Then Load UserControl.dia(j)
                .Top = tcasillero
                .Left = lcasillero + UserControl.turno(0).Width + (-1 * UserControl.shcasillero.value / UserControl.shcasillero.Max * cd * w + (j - 1) * w)
                .Height = UserControl.dia(0).Height
                .Width = w
                .Visible = True
                .Caption = "" & j
            End With
            k = k + 1
            With UserControl.casilla(k)
                .Left = lcasillero + UserControl.turno(0).Width + (-1 * UserControl.shcasillero.value / UserControl.shcasillero.Max * cd * w + (j - 1) * w)
                .Top = tcasillero + UserControl.dia(0).Height + (-1 * UserControl.svcasillero.value / UserControl.svcasillero.Max * ct * h + (i - 1) * h)
                .Width = w
                .Height = h
                .Visible = True
                .Picture = dia(0).Picture
                If matrix(j, i) Then .Picture = casilla(0).Picture
            End With
        Next
    Next
End Sub

Private Sub shcasillero_Change()
    refresca
End Sub

Private Sub shcasillero_Scroll()
    refresca
End Sub

Private Sub svcasillero_Change()
    refresca
End Sub

Private Sub svcasillero_Scroll()
    refresca
End Sub

Private Sub UserControl_Initialize()
    cd = 5
    ct = 6
    redimensiona
End Sub

Private Sub UserControl_Resize()

    UserControl.svcasillero.Top = UserControl.dia(0).Height
    UserControl.svcasillero.Left = (UserControl.Width - 100) - UserControl.svcasillero.Width
    UserControl.svcasillero.Height = UserControl.Height - UserControl.shcasillero.Height - UserControl.dia(0).Height
    UserControl.shcasillero.Left = UserControl.turno(0).Width
    UserControl.shcasillero.Top = UserControl.Height - UserControl.shcasillero.Height
    UserControl.shcasillero.Width = (UserControl.Width - 100) - UserControl.cmdZoomIn.Width - UserControl.turno(0).Width
    With UserControl.cmdZoomIn
        .Left = UserControl.shcasillero.Left + UserControl.shcasillero.Width
        .Top = UserControl.svcasillero.Top + UserControl.svcasillero.Height
        .Width = UserControl.svcasillero.Width
        .Height = UserControl.shcasillero.Height
    End With
    With UserControl.cmdZoomOut
        .Left = 0
        .Top = 0
        .Width = UserControl.turno(0).Width
        .Height = UserControl.dia(0).Height
    End With
    refresca
End Sub
Private Sub UserControl_InitProperties()
    cd = 5
    ct = 6
End Sub
Private Sub UserControl_ReadProperties(PropBag As PropertyBag)
    cd = PropBag.ReadProperty("CantDias", 5)
    ct = PropBag.ReadProperty("CantTurnos", 6)
End Sub
Private Sub UserControl_WriteProperties(PropBag As PropertyBag)
    Call PropBag.WriteProperty("CantDias", cd, 5)
    Call PropBag.WriteProperty("CantTurnos", ct, 6)
End Sub
