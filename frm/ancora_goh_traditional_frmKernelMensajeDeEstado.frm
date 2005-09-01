VERSION 5.00
Object = "{90F3D7B3-92E7-44BA-B444-6A8E2A3BC375}#1.0#0"; "actskin4.ocx"
Begin VB.Form frmKernelMensajeDeEstado 
   BorderStyle     =   0  'None
   ClientHeight    =   1110
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   5310
   LinkTopic       =   "Form1"
   ScaleHeight     =   1110
   ScaleWidth      =   5310
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.Frame frame 
      Height          =   975
      Left            =   120
      TabIndex        =   0
      Top             =   60
      Width           =   5055
      Begin ACTIVESKINLibCtl.SkinLabel mensaje 
         Height          =   255
         Left            =   240
         OleObjectBlob   =   "ancora_goh_traditional_frmKernelMensajeDeEstado.frx":0000
         TabIndex        =   3
         Top             =   120
         Width           =   4575
      End
      Begin VB.CommandButton inquieta 
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   1680
         TabIndex        =   2
         Top             =   480
         Width           =   1695
      End
      Begin VB.Timer Timer1 
         Interval        =   5
         Left            =   0
         Top             =   120
      End
      Begin ACTIVESKINLibCtl.SkinLabel barra 
         Height          =   255
         Left            =   240
         OleObjectBlob   =   "ancora_goh_traditional_frmKernelMensajeDeEstado.frx":0072
         TabIndex        =   4
         Top             =   480
         Width           =   4575
      End
   End
   Begin VB.CommandButton ucBtnSkin1 
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1095
      Left            =   0
      TabIndex        =   1
      Top             =   0
      Width           =   5295
   End
End
Attribute VB_Name = "frmKernelMensajeDeEstado"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"489BC2CC02CB"
Option Explicit
Dim switchbarra As Boolean

Private Sub Form_Activate()
    interface.SkinFor Me
End Sub

Private Sub Form_Load()
    interface.SkinFor Me
End Sub

Private Sub Form_Terminate()
    Timer1.Enabled = False
End Sub

Private Sub Timer1_Timer()

    If Not Visible Then
        Timer1.Interval = 0
        Timer1.Enabled = False
    Else
        Timer1.Interval = 1
        Timer1.Enabled = True
    End If
    If inquieta.Left <= barra.Left Or inquieta.Left + inquieta.Width >= barra.Left + barra.Width Then switchbarra = Not switchbarra
    inquieta.Left = inquieta.Left + IIf(switchbarra, -50, 50)
End Sub

