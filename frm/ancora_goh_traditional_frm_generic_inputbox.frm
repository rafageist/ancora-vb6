VERSION 5.00
Object = "{90F3D7B3-92E7-44BA-B444-6A8E2A3BC375}#1.0#0"; "actskin4.ocx"
Begin VB.Form frm_generic_inputbox 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Introduzca el dato"
   ClientHeight    =   2070
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   5880
   Icon            =   "ancora_goh_traditional_frm_generic_inputbox.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2070
   ScaleWidth      =   5880
   StartUpPosition =   2  'CenterScreen
   Begin ACTIVESKINLibCtl.SkinLabel labPrompt 
      Height          =   855
      Left            =   120
      OleObjectBlob   =   "ancora_goh_traditional_frm_generic_inputbox.frx":000C
      TabIndex        =   4
      Top             =   120
      Width           =   5535
   End
   Begin VB.TextBox txtDato 
      Height          =   375
      Left            =   120
      TabIndex        =   3
      Top             =   1080
      Width           =   5655
   End
   Begin VB.CommandButton cmdCancelar 
      Caption         =   "Cancelar"
      Height          =   375
      Left            =   4800
      TabIndex        =   2
      Top             =   1560
      Width           =   975
   End
   Begin VB.CommandButton cmdAceptar 
      Caption         =   "Aceptar"
      Height          =   375
      Left            =   3720
      TabIndex        =   1
      Top             =   1560
      Width           =   975
   End
   Begin VB.CommandButton cmdRestaura 
      Caption         =   "Restaurar"
      Height          =   375
      Left            =   2640
      TabIndex        =   0
      Top             =   1560
      Width           =   975
   End
End
Attribute VB_Name = "frm_generic_inputbox"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

''''''''''''''''''''
'' Form Input Box
''''''''''''''''''''

'<!- ATRIBUTOS -!>
    
    Public original As String
    Public caracteres As String
    Public result As Integer

'<!- EVENTOS -!>

    Private Sub txtDato_KeyPress(KeyAscii As Integer)
        If KeyAscii = 13 Then cmdAceptar_Click
        If InStr(1, caracteres, Chr(KeyAscii)) = 0 And KeyAscii <> 8 Then KeyAscii = 0
    End Sub

    Private Sub cmdAceptar_Click()
        result = 1
        Hide
    End Sub

    Private Sub cmdCancelar_Click()
        result = 2
        Hide
    End Sub
    
    Private Sub cmdRepara_Click()
        txtDato.Text = original
    End Sub

    Private Sub Form_Load()
        interface.SkinFor Me
    End Sub

'<!- METODOS -!>

    Public Sub go()
        txtDato.Text = original
        Show vbModal
    End Sub
