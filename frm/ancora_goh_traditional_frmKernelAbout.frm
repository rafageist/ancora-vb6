VERSION 5.00
Begin VB.Form frmKernelAbout 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Acerca de Áncora GOH"
   ClientHeight    =   4770
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   6630
   ClipControls    =   0   'False
   Icon            =   "ancora_goh_traditional_frmKernelAbout.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4770
   ScaleWidth      =   6630
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Tag             =   "Acerca de Proyecto1"
   Visible         =   0   'False
   Begin VB.Label Label2 
      BackStyle       =   0  'Transparent
      Caption         =   "por"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00404000&
      Height          =   255
      Left            =   2160
      TabIndex        =   4
      Top             =   3000
      Width           =   495
   End
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
   Begin VB.Label Label10 
      BackStyle       =   0  'Transparent
      Caption         =   "Frank Baltodano de León"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00404000&
      Height          =   255
      Left            =   2640
      TabIndex        =   3
      Top             =   3480
      Width           =   3015
   End
   Begin VB.Label Label9 
      BackStyle       =   0  'Transparent
      Caption         =   "Irving Leonard Pérez de Alejo"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00404000&
      Height          =   255
      Left            =   2640
      TabIndex        =   2
      Top             =   3240
      Width           =   3615
   End
   Begin VB.Label Label8 
      BackStyle       =   0  'Transparent
      Caption         =   "Rafael Rodríguez Ramírez"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00404000&
      Height          =   255
      Left            =   2640
      TabIndex        =   1
      Top             =   3000
      Width           =   3015
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   $"ancora_goh_traditional_frmKernelAbout.frx":0CCA
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   855
      Left            =   960
      TabIndex        =   0
      Top             =   3960
      Width           =   5655
   End
   Begin VB.Image Image1 
      Height          =   600
      Left            =   120
      Picture         =   "ancora_goh_traditional_frmKernelAbout.frx":0DA5
      Stretch         =   -1  'True
      Top             =   4080
      Width           =   600
   End
   Begin VB.Image imgApplication 
      Height          =   3615
      Left            =   120
      Picture         =   "ancora_goh_traditional_frmKernelAbout.frx":1280
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
