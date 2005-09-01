VERSION 5.00
Begin VB.Form frmDatosEditar 
   Caption         =   "Editando"
   ClientHeight    =   5325
   ClientLeft      =   60
   ClientTop       =   405
   ClientWidth     =   4440
   Icon            =   "ancora_goh_traditional_frmDatosEditar.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   5325
   ScaleWidth      =   4440
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton cmdZPriori 
      Caption         =   "Zonas de prioridad"
      Height          =   375
      Left            =   2400
      TabIndex        =   21
      Top             =   4200
      Width           =   1935
   End
   Begin VB.TextBox txtMatricula 
      Height          =   285
      Left            =   1410
      MaxLength       =   5
      TabIndex        =   19
      Top             =   3600
      Width           =   855
   End
   Begin VB.ComboBox cboEsp 
      Height          =   315
      Left            =   1410
      Style           =   2  'Dropdown List
      TabIndex        =   16
      Top             =   2880
      Width           =   2295
   End
   Begin VB.ComboBox cboNivel 
      Appearance      =   0  'Flat
      Height          =   315
      Left            =   1410
      Style           =   2  'Dropdown List
      TabIndex        =   15
      Top             =   3240
      Width           =   1935
   End
   Begin VB.CommandButton cmdCancelar 
      Caption         =   "Cancelar"
      Height          =   375
      Left            =   3000
      TabIndex        =   14
      Tag             =   " "
      Top             =   4800
      Width           =   1335
   End
   Begin VB.CommandButton cmdAceptar 
      Caption         =   "Aceptar"
      Height          =   375
      Left            =   1680
      TabIndex        =   13
      Tag             =   " "
      Top             =   4800
      Width           =   1215
   End
   Begin VB.ComboBox cboTurnos 
      Height          =   315
      Left            =   1410
      Style           =   2  'Dropdown List
      TabIndex        =   6
      Top             =   1320
      Width           =   855
   End
   Begin VB.TextBox txtCapacidad 
      Height          =   285
      Left            =   1410
      TabIndex        =   5
      Top             =   2520
      Width           =   1095
   End
   Begin VB.ComboBox cboPlantilla 
      Height          =   315
      Left            =   1410
      Style           =   2  'Dropdown List
      TabIndex        =   4
      Top             =   2160
      Width           =   2415
   End
   Begin VB.TextBox txtAlias 
      Height          =   285
      Left            =   1410
      TabIndex        =   3
      Top             =   600
      Width           =   1575
   End
   Begin VB.CheckBox chkVirtual 
      Alignment       =   1  'Right Justify
      Caption         =   "Virtual"
      Height          =   255
      Left            =   600
      TabIndex        =   2
      Top             =   1800
      Width           =   975
   End
   Begin VB.TextBox txtDescrip 
      Height          =   285
      Left            =   1410
      MaxLength       =   50
      MousePointer    =   3  'I-Beam
      TabIndex        =   1
      Top             =   960
      Width           =   2655
   End
   Begin VB.TextBox txtID 
      Height          =   285
      Left            =   1410
      MaxLength       =   10
      MousePointer    =   3  'I-Beam
      TabIndex        =   0
      Top             =   240
      Width           =   2175
   End
   Begin VB.Label labMatricula 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Matrícula"
      Height          =   195
      Left            =   600
      TabIndex        =   20
      Top             =   3600
      Width           =   675
   End
   Begin VB.Label labEsp 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Especialidad"
      ForeColor       =   &H00000000&
      Height          =   195
      Left            =   375
      TabIndex        =   18
      Top             =   2880
      Width           =   900
   End
   Begin VB.Label labNivel 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Nivel"
      ForeColor       =   &H00000000&
      Height          =   195
      Left            =   990
      TabIndex        =   17
      Top             =   3240
      Width           =   285
   End
   Begin VB.Line Line2 
      BorderColor     =   &H80000010&
      Tag             =   " "
      X1              =   -120
      X2              =   4920
      Y1              =   4680
      Y2              =   4680
   End
   Begin VB.Line Line1 
      BorderColor     =   &H00FFFFFF&
      Tag             =   " "
      X1              =   4920
      X2              =   -120
      Y1              =   4695
      Y2              =   4695
   End
   Begin VB.Label labCapacidad 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Capacidad"
      Height          =   195
      Left            =   510
      TabIndex        =   12
      Top             =   2520
      Width           =   765
   End
   Begin VB.Label labPlantilla 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Plantilla"
      Height          =   195
      Left            =   735
      TabIndex        =   11
      Top             =   2160
      Width           =   540
   End
   Begin VB.Label labAlias 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Alias"
      Height          =   195
      Left            =   945
      TabIndex        =   10
      Top             =   600
      Width           =   330
   End
   Begin VB.Label labTurnos 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Turnos"
      ForeColor       =   &H80000008&
      Height          =   195
      Left            =   780
      TabIndex        =   9
      Top             =   1320
      Width           =   495
   End
   Begin VB.Label labDescrip 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Descripción"
      ForeColor       =   &H80000008&
      Height          =   195
      Left            =   435
      TabIndex        =   8
      Top             =   960
      Width           =   840
   End
   Begin VB.Label labId 
      AutoSize        =   -1  'True
      Caption         =   "Identificación"
      ForeColor       =   &H00000000&
      Height          =   195
      Left            =   330
      TabIndex        =   7
      Top             =   240
      Width           =   945
   End
End
Attribute VB_Name = "frmDatosEditar"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

'Form Editar datos del objeto

'<!- ATRIBUTOS !->

    Public resultbutton As Integer

'<!- EVENTOS !->
    Private Sub cmdAceptar_Click()
        resultbutton = 1
        Hide
    End Sub
    
    Private Sub cmdCancelar_Click()
        resultbutton = 0
        Hide
    End Sub
    Private Sub cmdZPriori_Click()
        resultbutton = 3
        Hide
    End Sub
    
    Private Sub Form_Load()
        interface.SkinFor Me
    End Sub

    Private Sub txtID_KeyPress(KeyAscii As Integer)
        If KeyAscii <> 13 And KeyAscii <> 8 Then If InStr(1, "abcdefghijklmnopqrstuvwxyz1234567890_- /().", Chr(KeyAscii)) = 0 Then KeyAscii = 0
    End Sub
    
    
    Private Sub txtDescrip_KeyPress(KeyAscii As Integer)
        If KeyAscii <> 13 And KeyAscii <> 8 Then If InStr(1, "><áéíóüúÁÉÍÓÚÜabcdefghijklmnopqrstuvwxyz1234567890_- /().", LCase(Chr(KeyAscii))) = 0 Then KeyAscii = 0
    End Sub
    
    Private Sub txtCapacidad_KeyPress(KeyAscii As Integer)
        If KeyAscii <> 13 And KeyAscii <> 8 Then If InStr(1, "><áéíóüúÁÉÍÓÚÜabcdefghijklmnopqrstuvwxyz1234567890_- /().", LCase(Chr(KeyAscii))) = 0 Then KeyAscii = 0
    End Sub
    
    Private Sub txtMatricula_KeyPress(KeyAscii As Integer)
        If KeyAscii <> 13 And KeyAscii <> 8 Then If KeyAscii < Asc("0") Or KeyAscii > Asc("9") Then KeyAscii = 0
    End Sub

'<!- METODOS !->
