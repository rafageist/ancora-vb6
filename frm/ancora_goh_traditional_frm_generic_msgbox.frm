VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frm_generic_msgbox 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Áncora GOH"
   ClientHeight    =   2340
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   6195
   Icon            =   "ancora_goh_traditional_frm_generic_msgbox.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2340
   ScaleWidth      =   6195
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton boton1 
      Height          =   375
      Left            =   4800
      TabIndex        =   3
      Top             =   1800
      Width           =   1215
   End
   Begin VB.CommandButton boton2 
      Height          =   375
      Left            =   3480
      TabIndex        =   2
      Top             =   1800
      Width           =   1215
   End
   Begin VB.CommandButton boton3 
      Height          =   375
      Left            =   2160
      TabIndex        =   1
      Top             =   1800
      Width           =   1215
   End
   Begin MSComctlLib.ImageList iconos 
      Left            =   240
      Top             =   1200
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   32
      ImageHeight     =   32
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   4
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ancora_goh_traditional_frm_generic_msgbox.frx":0CCA
            Key             =   ""
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ancora_goh_traditional_frm_generic_msgbox.frx":111C
            Key             =   ""
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ancora_goh_traditional_frm_generic_msgbox.frx":156E
            Key             =   ""
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ancora_goh_traditional_frm_generic_msgbox.frx":19C0
            Key             =   ""
         EndProperty
      EndProperty
   End
   Begin VB.Image icono 
      Height          =   855
      Left            =   240
      Top             =   240
      Width           =   975
   End
   Begin VB.Label mensaje 
      BackStyle       =   0  'Transparent
      Caption         =   "mensaje"
      BeginProperty Font 
         Name            =   "Calibri"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1575
      Left            =   1320
      TabIndex        =   0
      Top             =   120
      Width           =   4815
   End
End
Attribute VB_Name = "frm_generic_msgbox"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

'Form Message Dialog

'<!- ATRIBUTOS -!>
    
    Public result As Integer

'<!- EVENTOS -!>

    Private Sub boton1_Click()
        result = 1
        Hide
    End Sub
    
    Private Sub boton2_Click()
        result = 2
        Hide
    End Sub
    
    Private Sub boton3_Click()
        result = 3
        Hide
    End Sub
    
    Private Sub Form_Activate()
        interface.SkinFor Me
    End Sub

'<!- METODOS -!>

    Function go(titulo As String, msg As String, ico As Integer, Optional b1 As String = "", Optional b2 As String = "", Optional b3 As String = "", Optional default As Integer) As Integer
    
        Dim ic As Integer
        
        boton1.Visible = b1 <> ""
        boton2.Visible = b2 <> ""
        boton3.Visible = b3 <> ""
    
        boton1.Caption = b1
        boton2.Caption = b2
        boton3.Caption = b3
        
        mensaje.Caption = msg
        Caption = titulo
        result = default
        
        ic = 1
        Select Case ico
            Case vbExclamation: ic = 1
            Case vbQuestion: ic = 2
            Case vbCritical: ic = 3
            Case vbInformation: ic = 4
        End Select
        
        icono.Picture = iconos.ListImages(ic).Picture
        
        Show vbModal
        
        go = result
    End Function
