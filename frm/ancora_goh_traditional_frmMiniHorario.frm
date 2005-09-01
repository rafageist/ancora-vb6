VERSION 5.00
Begin VB.Form frmMiniHorario 
   AutoRedraw      =   -1  'True
   BorderStyle     =   3  'Fixed Dialog
   ClientHeight    =   5145
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   6900
   Icon            =   "ancora_goh_traditional_frmMiniHorario.frx":0000
   LinkTopic       =   "MiniHorario"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   MouseIcon       =   "ancora_goh_traditional_frmMiniHorario.frx":0252
   MousePointer    =   4  'Icon
   ScaleHeight     =   5145
   ScaleWidth      =   6900
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton casilla 
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   735
      Index           =   0
      Left            =   960
      TabIndex        =   2
      Top             =   360
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.CommandButton labDia 
      Appearance      =   0  'Flat
      BackColor       =   &H00C0FFFF&
      Caption         =   "1"
      Height          =   220
      Left            =   840
      Style           =   1  'Graphical
      TabIndex        =   1
      ToolTipText     =   "Click para posicionar arriba/abajo"
      Top             =   0
      Width           =   375
   End
   Begin VB.CommandButton labTurno 
      Appearance      =   0  'Flat
      BackColor       =   &H00C0FFFF&
      Caption         =   "1"
      Height          =   220
      Left            =   0
      MaskColor       =   &H00FFFFFF&
      Style           =   1  'Graphical
      TabIndex        =   0
      ToolTipText     =   "Click para posicionar a la derecha/izquierda"
      Top             =   840
      Width           =   375
   End
End
Attribute VB_Name = "frmMiniHorario"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"489BC224007A"
Option Explicit
Dim derecha As Boolean
Dim abajo As Boolean
Dim casillaactual As Integer

Private Sub casilla_Click(Index As Integer)
    If Casilla(Index).ToolTipText <> "" Then interface.MessageDlg "Detalles de la Actividad", Casilla(Index).ToolTipText, vbInformation, "Aceptar"
End Sub

Private Sub casilla_GotFocus(Index As Integer)
       trabajoCasilla Index, 1, 1
End Sub

Private Sub Casilla_MouseMove(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
   trabajoCasilla Index, X, Y
End Sub

Private Sub Form_Load()
    interface.SkinFor Me
End Sub

Private Sub Form_Unload(Cancel As Integer)
    Dim i As Long
    For i = 1 To Casilla.Count - 1
        Unload Casilla(i)
    Next
End Sub

Sub PosicionaEtiquetas(Index As Integer, X As Single, Y As Single)
    If Casilla(Index).Left + X + labDia.Width < Width - 80 Then labDia.Left = Casilla(Index).Left + X
    If Casilla(Index).Top + Y + labTurno.Height < Height - 305 Then labTurno.Top = Casilla(Index).Top + Y
    If Not abajo Then labDia.Top = 0 Else labDia.Top = Height - 340 - labDia.Height
    If Not derecha Then labTurno.Left = 0 Else labTurno.Left = Width - 30 - labTurno.Width
End Sub

Private Sub labDia_Click()
    abajo = Not abajo
    trabajoCasilla casillaactual, 1, 1
End Sub

Private Sub labTurno_Click()
    derecha = Not derecha
    trabajoCasilla casillaactual, 1, 1
End Sub

Sub trabajoCasilla(Index As Integer, X As Single, Y As Single)
    Dim dia As Long, turno As Long
    
    casillaactual = Index
    turno = Int(((Index - 1) / ancora.CD) + 1)
    dia = Int(Index - (turno - 1) * ancora.CD)

    labDia.Caption = "" & dia
    labTurno.Caption = "" & turno
    
    If Casilla(Index).Left + X + labDia.Width < Width - 80 Then labDia.Left = Casilla(Index).Left + X
    If Casilla(Index).Top + Y + labTurno.Height < Height - 305 Then labTurno.Top = Casilla(Index).Top + Y
    If Not abajo Then labDia.Top = 0 Else labDia.Top = Height - 340 - labDia.Height
    If Not derecha Then labTurno.Left = 0 Else labTurno.Left = Width - 30 - labTurno.Width
   
End Sub
