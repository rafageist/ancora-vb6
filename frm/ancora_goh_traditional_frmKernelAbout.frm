VERSION 5.00
Begin VB.Form frmKernelAbout 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Acerca de Áncora GOH"
   ClientHeight    =   3855
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   6630
   ClipControls    =   0   'False
   Icon            =   "ancora_goh_traditional_frmKernelAbout.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3855
   ScaleWidth      =   6630
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Tag             =   "Acerca de Proyecto1"
   Visible         =   0   'False
   Begin VB.Line Line2 
      BorderColor     =   &H80000010&
      X1              =   -240
      X2              =   8758
      Y1              =   3840
      Y2              =   3840
   End
   Begin VB.Line Line1 
      BorderColor     =   &H00FFFFFF&
      X1              =   -240
      X2              =   8758
      Y1              =   3855
      Y2              =   3855
   End
   Begin VB.Image imgApplication 
      Height          =   3615
      Left            =   120
      Picture         =   "ancora_goh_traditional_frmKernelAbout.frx":0CCA
      Top             =   120
      Width           =   6375
   End
End
Attribute VB_Name = "frmKernelAbout"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"489BC1C502E1"
Option Explicit
'Acerca de...
'Muestra la versión del sistema, los autores y la licencia

Private Sub Form_Load()
    interface.SkinFor Me
End Sub
