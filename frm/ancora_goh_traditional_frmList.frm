VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmList 
   Caption         =   "Lista de ..."
   ClientHeight    =   6720
   ClientLeft      =   60
   ClientTop       =   390
   ClientWidth     =   9315
   Icon            =   "ancora_goh_traditional_frmList.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   6720
   ScaleWidth      =   9315
   StartUpPosition =   2  'CenterScreen
   Begin VB.Frame frameOpciones 
      Height          =   735
      Left            =   120
      TabIndex        =   1
      Top             =   5880
      Width           =   9135
      Begin VB.CommandButton cmdTerminar 
         Caption         =   "Terminar"
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
         Left            =   5400
         TabIndex        =   3
         Top             =   240
         Width           =   1695
      End
      Begin VB.CommandButton cmdPropiedades 
         Caption         =   "Propiedades"
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
         Left            =   7200
         TabIndex        =   2
         Top             =   240
         Width           =   1815
      End
   End
   Begin MSComctlLib.ListView ListView1 
      Height          =   5415
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   9135
      _ExtentX        =   16113
      _ExtentY        =   9551
      View            =   3
      LabelEdit       =   1
      LabelWrap       =   -1  'True
      HideSelection   =   -1  'True
      FullRowSelect   =   -1  'True
      GridLines       =   -1  'True
      _Version        =   393217
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      BorderStyle     =   1
      Appearance      =   1
      NumItems        =   0
   End
   Begin MSComctlLib.ImageList ImageList1 
      Left            =   3120
      Top             =   120
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   16
      ImageHeight     =   16
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   3
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ancora_goh_traditional_frmList.frx":6452
            Key             =   ""
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ancora_goh_traditional_frmList.frx":746C
            Key             =   ""
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ancora_goh_traditional_frmList.frx":7AA6
            Key             =   ""
         EndProperty
      EndProperty
   End
End
Attribute VB_Name = "frmList"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"489BC1C5001C"
Private Sub cmdPropiedades_Click()
    ListView1_DblClick
End Sub

Private Sub Form_Load()
    interface.SkinFor Me
End Sub

Private Sub Form_Resize()

    On Error Resume Next

    ListView1.Top = 120
    ListView1.Left = 120
    ListView1.Width = Width - 350
    frameOpciones.Left = 0
    frameOpciones.Width = Width - 150
    frameOpciones.Top = Height - 500 - frameOpciones.Height
    cmdPropiedades.Left = frameOpciones.Width - 200 - cmdPropiedades.Width
    cmdTerminar.Left = cmdPropiedades.Left - cmdTerminar.Width - 100
    ListView1.Height = Height - 800 - frameOpciones.Height
End Sub

Private Sub ListView1_DblClick()   'doble click en
    Dim arr As String
    arr = Mid(ListView1.SelectedItem.Key, 1, 1)

    Select Case arr
        Case "P"
            interface.goDatosEditar dPROFE, Mid(ListView1.SelectedItem.Key, 2)
        Case "L"
            interface.goDatosEditar dLUGAR, Mid(ListView1.SelectedItem.Key, 2)
        Case "B"
            interface.goDatosEditar dBRIGADA, Mid(ListView1.SelectedItem.Key, 2)
    End Select

End Sub

