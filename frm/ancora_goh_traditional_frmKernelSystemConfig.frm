VERSION 5.00
Begin VB.Form frmKernelSystemConfig 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Opciones de inicio"
   ClientHeight    =   2145
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   4080
   Icon            =   "ancora_goh_traditional_frmKernelSystemConfig.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2145
   ScaleWidth      =   4080
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
      Left            =   1320
      TabIndex        =   5
      Top             =   1680
      Width           =   1335
   End
   Begin VB.Frame Frame1 
      Height          =   1455
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   3855
      Begin VB.OptionButton Option4 
         Caption         =   "Iniciar abriendo el último archivo utilizado"
         Height          =   195
         Left            =   240
         TabIndex        =   4
         Top             =   960
         Width           =   3375
      End
      Begin VB.OptionButton Option3 
         Caption         =   "Iniciar con ""Abrir un archivo de horarios"""
         Height          =   195
         Left            =   240
         TabIndex        =   3
         Top             =   720
         Width           =   3255
      End
      Begin VB.OptionButton Option2 
         Caption         =   "Iniciar con ""Crear un archivo de horarios"""
         Height          =   195
         Left            =   240
         TabIndex        =   2
         Top             =   480
         Width           =   3255
      End
      Begin VB.OptionButton Option1 
         Caption         =   "Iniciar como por primera vez"
         Height          =   195
         Left            =   240
         TabIndex        =   1
         Top             =   240
         Width           =   2415
      End
   End
End
Attribute VB_Name = "frmKernelSystemConfig"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"489BC2370096"
Private Sub Command1_Click()

    With ConfigSystem
        .frmKernelBienvenido = Option1.value
        .creando = Option2.value
        .abriendo = Option3.value
        .abriendoLastFile = Option4.value
        kernel.SaveCFG
        Hide
    End With

End Sub

Private Sub Form_Activate()
    refre
End Sub

Public Sub refre()  'refrescamiento

    With ConfigSystem
        Option1.value = .frmKernelBienvenido
        Option2.value = .creando
        Option3.value = .abriendo
        Option4.value = .abriendoLastFile
    End With

End Sub

Private Sub Form_Load()
    interface.SkinFor Me
End Sub
