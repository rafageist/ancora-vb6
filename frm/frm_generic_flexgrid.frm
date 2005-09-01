VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Begin VB.Form frm_generic_flexgrid 
   Caption         =   "Resultados"
   ClientHeight    =   7020
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   6585
   Icon            =   "frm_generic_flexgrid.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   7020
   ScaleWidth      =   6585
   StartUpPosition =   2  'CenterScreen
   Begin MSFlexGridLib.MSFlexGrid tabla 
      Height          =   6975
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   6615
      _ExtentX        =   11668
      _ExtentY        =   12303
      _Version        =   393216
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
End
Attribute VB_Name = "frm_generic_flexgrid"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_Load()
    interface.SkinFor Me
End Sub

Private Sub Form_Resize()
    With tabla
        .Height = Height - 450
        .Width = Width - 200
        .Top = 0
        .Left = 0
    End With
End Sub
