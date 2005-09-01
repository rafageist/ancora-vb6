VERSION 5.00
Begin VB.Form frmPropiedades 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "frmPropiedades"
   ClientHeight    =   4350
   ClientLeft      =   45
   ClientTop       =   375
   ClientWidth     =   5715
   Icon            =   "ancora_goh_traditional_frmPropiedades.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4350
   ScaleWidth      =   5715
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton Command1 
      Caption         =   "Aceptar"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   4080
      TabIndex        =   6
      Top             =   3840
      Width           =   1455
   End
   Begin VB.ListBox lstComplement 
      BackColor       =   &H00FFFFFF&
      Height          =   2010
      Left            =   120
      TabIndex        =   5
      Top             =   1560
      Width           =   5415
   End
   Begin VB.TextBox descrip 
      BackColor       =   &H00FFFFFF&
      Height          =   375
      Left            =   1200
      Locked          =   -1  'True
      TabIndex        =   3
      Top             =   720
      Width           =   4335
   End
   Begin VB.TextBox id 
      BackColor       =   &H00FFFFFF&
      Height          =   375
      Left            =   1200
      Locked          =   -1  'True
      TabIndex        =   1
      Top             =   240
      Width           =   2535
   End
   Begin VB.Line Line2 
      BorderColor     =   &H80000010&
      X1              =   45
      X2              =   5515
      Y1              =   3720
      Y2              =   3720
   End
   Begin VB.Line Line1 
      BorderColor     =   &H00FFFFFF&
      X1              =   45
      X2              =   5515
      Y1              =   3735
      Y2              =   3735
   End
   Begin VB.Label Label3 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Datos complementarios:"
      ForeColor       =   &H80000008&
      Height          =   195
      Left            =   120
      TabIndex        =   4
      Top             =   1200
      Width           =   1695
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Descripción:"
      ForeColor       =   &H80000008&
      Height          =   195
      Left            =   240
      TabIndex        =   2
      Top             =   720
      Width           =   885
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Identificación:"
      ForeColor       =   &H80000008&
      Height          =   195
      Left            =   120
      TabIndex        =   0
      Top             =   240
      Width           =   990
   End
End
Attribute VB_Name = "frmPropiedades"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"489BC1C5015A"
Private Sub Command1_Click()
    Hide
End Sub

Private Sub Form_Load()
    interface.SkinFor Me
End Sub
