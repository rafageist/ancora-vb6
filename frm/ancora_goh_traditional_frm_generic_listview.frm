VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "Mscomctl.ocx"
Object = "{B42578F8-962C-436D-9516-4E26101FF1D9}#4.0#0"; "buttonskin.ocx"
Begin VB.Form frm_generic_listview 
   Caption         =   "título"
   ClientHeight    =   8310
   ClientLeft      =   165
   ClientTop       =   450
   ClientWidth     =   8880
   Icon            =   "ancora_goh_traditional_frm_generic_listview.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   8310
   ScaleWidth      =   8880
   StartUpPosition =   2  'CenterScreen
   Begin Áncora.ACPRibbon ribbon 
      Align           =   1  'Align Top
      Height          =   1740
      Left            =   0
      TabIndex        =   2
      Top             =   0
      Width           =   8880
      _ExtentX        =   15663
      _ExtentY        =   3069
      Theme           =   1
      BackColor       =   14537936
      ForeColor       =   6971996
   End
   Begin ButtonSkin.ucBtnSkin barraestado 
      Height          =   615
      Left            =   0
      TabIndex        =   1
      Top             =   7680
      Width           =   10695
      _ExtentX        =   18865
      _ExtentY        =   1085
      Skin            =   9
      Caption         =   "ucBtnSkin1"
      Enabled         =   -1  'True
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Value           =   0   'False
      ForeColorNormal =   0
      ForeColorDown   =   0
      ForeColorUp     =   0
      ForeColorDisabled=   12500670
      ForeColorCheck  =   0
      CaptionAlign    =   1
      CaptionMargin   =   10
      ButtonType      =   0
      Object.ToolTipText     =   ""
      UseUnderLineMouseUp=   0   'False
      UseUnderLineMouseCheck=   0   'False
      BorderColorCheck=   0
      ColorSchemas    =   1
   End
   Begin MSComctlLib.ImageList imgList 
      Left            =   6600
      Top             =   840
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   16
      ImageHeight     =   16
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   6
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ancora_goh_traditional_frm_generic_listview.frx":0252
            Key             =   ""
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ancora_goh_traditional_frm_generic_listview.frx":1044
            Key             =   ""
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ancora_goh_traditional_frm_generic_listview.frx":13DE
            Key             =   ""
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ancora_goh_traditional_frm_generic_listview.frx":16F8
            Key             =   ""
         EndProperty
         BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ancora_goh_traditional_frm_generic_listview.frx":1B4A
            Key             =   ""
         EndProperty
         BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ancora_goh_traditional_frm_generic_listview.frx":1F24
            Key             =   ""
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.ListView tabla 
      Height          =   5895
      Left            =   0
      TabIndex        =   0
      Top             =   1800
      Width           =   8895
      _ExtentX        =   15690
      _ExtentY        =   10398
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
End
Attribute VB_Name = "frm_generic_listview"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"489BC2F000C4"
Option Explicit
'''''''''''''''''''''
'Form with Listview
'''''''''''''''''''''

'<!- ATRIBUTOS -!>
    
    Public resultHerramientas As String

'<!- EVENTOS -!>

    Private Sub Form_Activate()
        Form_Resize
        interface.SkinFor Me
    End Sub
    
    Private Sub Form_Resize()
        On Error Resume Next
        tabla.Height = Height - IIf(barraestado.Visible, barraestado.Height, 0) - IIf(ribbon.Visible, ribbon.Height, 0) - 600
        tabla.Width = Width - 100
        tabla.Left = 0
        tabla.Top = IIf(ribbon.Visible, ribbon.Height, 0) + 100
        ribbon.Top = 100
        ribbon.Width = Width - 100
        ribbon.Left = 0
        barraestado.Left = -50
        barraestado.Top = Height - barraestado.Height - 480
        barraestado.Width = Width - 80
    End Sub

    Private Sub ribbon_ButtonClick(ByVal id As String, ByVal Caption As String)
                If Mid(id, 1, 3) = "del" Then
                    If interface.Question_Eliminar Then
                        GoTo sale
                    End If
                Else
sale:                     resultHerramientas = id
                    Hide
                End If
    
    End Sub

'<!- METODOS -!>
    Public Sub Resize()
        Form_Resize
    End Sub

