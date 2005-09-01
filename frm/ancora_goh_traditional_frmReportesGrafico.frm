VERSION 5.00
Object = "{0002E550-0000-0000-C000-000000000046}#1.1#0"; "owc10.dll"
Begin VB.Form frmReportesGrafico 
   Caption         =   "Grafico"
   ClientHeight    =   4515
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   5730
   Icon            =   "ancora_goh_traditional_frmReportesGrafico.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   4515
   ScaleWidth      =   5730
   StartUpPosition =   2  'CenterScreen
   Begin OWC10.ChartSpace grafico 
      Height          =   3975
      Left            =   120
      OleObjectBlob   =   "ancora_goh_traditional_frmReportesGrafico.frx":0912
      TabIndex        =   0
      Top             =   240
      Width           =   5055
   End
End
Attribute VB_Name = "frmReportesGrafico"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"489BC236017B"
Private Sub Form_Load()
    interface.SkinFor Me
End Sub

Private Sub Form_Resize()

    On Error Resume Next

    grafico.Top = 120
    grafico.Left = 120
    grafico.Width = Width - 400
    grafico.Height = Height - 800
End Sub


