VERSION 5.00
Begin VB.Form frmSplash 
   BorderStyle     =   0  'None
   ClientHeight    =   3615
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   6375
   FillColor       =   &H00808080&
   ForeColor       =   &H8000000C&
   Icon            =   "ancora_goh_traditional_frmSplash.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3615
   ScaleWidth      =   6375
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.Timer timerInicio 
      Enabled         =   0   'False
      Interval        =   6000
      Left            =   5760
      Top             =   3120
   End
   Begin VB.Image imgApplication 
      Height          =   3615
      Left            =   0
      Picture         =   "ancora_goh_traditional_frmSplash.frx":000C
      Top             =   0
      Width           =   6375
   End
End
Attribute VB_Name = "frmSplash"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"489BC1F502D6"
Dim switchbarra As Boolean
Private Sub Form_Activate()
    timerInicio.Enabled = True
End Sub

Private Sub timerInicio_Timer()   'se activa el timer
    timerInicio.Enabled = False
    Unload Me
End Sub





