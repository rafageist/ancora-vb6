VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "Mscomctl.ocx"
Begin VB.Form frmReportesHuecosComunes 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Huecos comunes"
   ClientHeight    =   6165
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   9105
   Icon            =   "ancora_goh_traditional_frmReportesHuecosComunes.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   6165
   ScaleWidth      =   9105
   StartUpPosition =   2  'CenterScreen
   Begin VB.CheckBox chkUsarSeleccionados 
      Caption         =   "Utilizar seleccionados"
      Height          =   255
      Left            =   6720
      TabIndex        =   9
      Top             =   4920
      Width           =   1935
   End
   Begin VB.CommandButton cmdNinguna 
      Caption         =   "Desmarcar todo"
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
      Left            =   4800
      TabIndex        =   8
      Top             =   4920
      Width           =   1695
   End
   Begin VB.CommandButton cmdTodas 
      Caption         =   "Marcar todo"
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
      Left            =   3240
      TabIndex        =   7
      Top             =   4920
      Width           =   1455
   End
   Begin VB.CommandButton cmdInvertir 
      Caption         =   "Invertir marcados"
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
      Left            =   1200
      TabIndex        =   6
      Top             =   4920
      Width           =   1935
   End
   Begin VB.CommandButton cmdCancel 
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
      Left            =   7920
      TabIndex        =   5
      Top             =   5640
      Width           =   1095
   End
   Begin VB.CommandButton cmdOK 
      Caption         =   "Mostrar"
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
      Left            =   6600
      TabIndex        =   4
      Top             =   5640
      Width           =   1215
   End
   Begin VB.ComboBox cboPeriod 
      Height          =   315
      Left            =   840
      Style           =   2  'Dropdown List
      TabIndex        =   0
      ToolTipText     =   "Seleccione aquí el período de actividades"
      Top             =   120
      Width           =   3735
   End
   Begin MSComctlLib.ListView lvw 
      Height          =   3735
      Index           =   0
      Left            =   240
      TabIndex        =   3
      Top             =   1080
      Visible         =   0   'False
      Width           =   8655
      _ExtentX        =   15266
      _ExtentY        =   6588
      View            =   3
      LabelEdit       =   1
      MultiSelect     =   -1  'True
      LabelWrap       =   -1  'True
      HideSelection   =   -1  'True
      Checkboxes      =   -1  'True
      FullRowSelect   =   -1  'True
      GridLines       =   -1  'True
      _Version        =   393217
      Icons           =   "imgList"
      SmallIcons      =   "imgList"
      ColHdrIcons     =   "imgList"
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      BorderStyle     =   1
      Appearance      =   1
      NumItems        =   0
   End
   Begin MSComctlLib.ImageList imgList 
      Left            =   600
      Top             =   5520
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   16
      ImageHeight     =   16
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   7
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ancora_goh_traditional_frmReportesHuecosComunes.frx":030A
            Key             =   ""
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ancora_goh_traditional_frmReportesHuecosComunes.frx":075C
            Key             =   ""
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ancora_goh_traditional_frmReportesHuecosComunes.frx":0EC2
            Key             =   ""
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ancora_goh_traditional_frmReportesHuecosComunes.frx":1314
            Key             =   ""
         EndProperty
         BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ancora_goh_traditional_frmReportesHuecosComunes.frx":1766
            Key             =   ""
         EndProperty
         BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ancora_goh_traditional_frmReportesHuecosComunes.frx":1BB8
            Key             =   ""
         EndProperty
         BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ancora_goh_traditional_frmReportesHuecosComunes.frx":200A
            Key             =   ""
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.TabStrip TabStrip 
      Height          =   4935
      Left            =   120
      TabIndex        =   2
      Top             =   600
      Width           =   8895
      _ExtentX        =   15690
      _ExtentY        =   8705
      _Version        =   393216
      BeginProperty Tabs {1EFB6598-857C-11D1-B16A-00C0F0283628} 
         NumTabs         =   7
         BeginProperty Tab1 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            Caption         =   "Especialiades"
            Key             =   "esp"
            ImageVarType    =   2
         EndProperty
         BeginProperty Tab2 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            Caption         =   "Brigadas"
            Key             =   "brg"
            ImageVarType    =   2
         EndProperty
         BeginProperty Tab3 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            Caption         =   "Asignaturas"
            Key             =   "asig"
            ImageVarType    =   2
         EndProperty
         BeginProperty Tab4 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            Caption         =   "Clasificaciones de actividades"
            ImageVarType    =   2
         EndProperty
         BeginProperty Tab5 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            Caption         =   "Profesores"
            Key             =   "profe"
            ImageVarType    =   2
         EndProperty
         BeginProperty Tab6 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            Caption         =   "Lugares"
            Key             =   "lug"
            ImageVarType    =   2
         EndProperty
         BeginProperty Tab7 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            Caption         =   "Otros recursos"
            ImageVarType    =   2
         EndProperty
      EndProperty
   End
   Begin VB.Label labPeriod 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Período:"
      ForeColor       =   &H80000008&
      Height          =   195
      Left            =   120
      TabIndex        =   1
      Top             =   120
      Width           =   615
   End
End
Attribute VB_Name = "frmReportesHuecosComunes"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"489BC22B0369"
Public buttonresult As Long

Private Sub cmdCancel_Click()
    buttonresult = 2
    Hide
End Sub

Private Sub cmdOK_Click()
    buttonresult = 1
    Hide
End Sub

Private Sub Form_Load()
    interface.SkinFor Me
End Sub

Private Sub TabStrip_Click()
    Dim i As Long

    If Not TabStrip.SelectedItem Is Nothing Then
        For i = 1 To lvw.Count - 1
            lvw(i).Visible = False
        Next
        lvw(TabStrip.SelectedItem.index).Visible = True
    End If
    TabStrip.ZOrder 1
End Sub

Private Sub cmdInvertir_Click()
    interface.SelectAll_Lvw lvw(TabStrip.SelectedItem.index), 2, IIf(chkUsarSeleccionados.value, True, False)
End Sub

Private Sub cmdNinguna_Click()
    interface.SelectAll_Lvw lvw(TabStrip.SelectedItem.index), 0, IIf(chkUsarSeleccionados.value, True, False)
End Sub

Private Sub cmdTodas_Click()
    interface.SelectAll_Lvw lvw(TabStrip.SelectedItem.index), 1, IIf(chkUsarSeleccionados.value, True, False)
End Sub


