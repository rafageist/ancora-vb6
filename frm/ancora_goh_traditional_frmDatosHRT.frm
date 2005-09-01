VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "Mscomctl.ocx"
Begin VB.Form frmDatosHRT 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Herencias de restricciones en tiempo"
   ClientHeight    =   7485
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   9615
   Icon            =   "ancora_goh_traditional_frmDatosHRT.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   7485
   ScaleWidth      =   9615
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton cmdOK 
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
      Left            =   8400
      TabIndex        =   4
      Top             =   6960
      Width           =   975
   End
   Begin VB.CommandButton cmdDelete 
      Caption         =   "Eliminar"
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
      Left            =   7440
      TabIndex        =   3
      Top             =   6960
      Width           =   855
   End
   Begin VB.CommandButton cmdEdit 
      Caption         =   "Editar"
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
      Left            =   6360
      TabIndex        =   2
      Top             =   6960
      Width           =   975
   End
   Begin VB.CommandButton cmdInsert 
      Caption         =   "Insertar"
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
      Left            =   5160
      TabIndex        =   1
      Top             =   6960
      Width           =   1095
   End
   Begin MSComctlLib.ImageList imgList 
      Left            =   240
      Top             =   6960
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
            Picture         =   "ancora_goh_traditional_frmDatosHRT.frx":1CCA
            Key             =   ""
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ancora_goh_traditional_frmDatosHRT.frx":39A4
            Key             =   ""
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ancora_goh_traditional_frmDatosHRT.frx":3DF6
            Key             =   ""
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ancora_goh_traditional_frmDatosHRT.frx":455C
            Key             =   ""
         EndProperty
         BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ancora_goh_traditional_frmDatosHRT.frx":49AE
            Key             =   ""
         EndProperty
         BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ancora_goh_traditional_frmDatosHRT.frx":4E00
            Key             =   ""
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.ListView lvwHRT 
      Height          =   6615
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   9255
      _ExtentX        =   16325
      _ExtentY        =   11668
      View            =   3
      LabelEdit       =   1
      LabelWrap       =   -1  'True
      HideSelection   =   -1  'True
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
      NumItems        =   2
      BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         Text            =   "Elemento que hereda"
         Object.Width           =   8819
      EndProperty
      BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   1
         Text            =   "Elemento que transmite"
         Object.Width           =   8819
      EndProperty
   End
   Begin VB.Line Line1 
      BorderColor     =   &H00FFFFFF&
      X1              =   11800
      X2              =   0
      Y1              =   6855
      Y2              =   6855
   End
   Begin VB.Line Line2 
      BorderColor     =   &H80000010&
      X1              =   11800
      X2              =   0
      Y1              =   6840
      Y2              =   6840
   End
End
Attribute VB_Name = "frmDatosHRT"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

'Form Herencia de Restricciones en Tiempo

'<!- ATRIBUOTOS -!>

'<!- EVENTOS -!>

    Private Sub cmddelete_Click()
        If Not lvwHRT.SelectedItem Is Nothing Then
            If interface.Question_Eliminar Then
                ancora.hrt.Remove lvwHRT.SelectedItem.index
                refre
            End If
        End If
    End Sub
    
    Private Sub cmdEdit_Click()
        Dim hrt As TGOH_HRT
        If Not lvwHRT.SelectedItem Is Nothing Then
            Set hrt = interface.goDatosHRT_detalles(ancora.hrt(lvwHRT.SelectedItem.index))
            If Not hrt Is Nothing Then
                With ancora.hrt(lvwHRT.SelectedItem.index)
                    .idObjetoA = hrt.idObjetoA
                    .idObjetoB = hrt.idObjetoB
                    .tipoObjetoA = hrt.tipoObjetoA
                    .tipoObjetoB = hrt.tipoObjetoB
                    Set .exceptoEnTiempo = hrt.exceptoEnTiempo
                End With
            End If
        End If
    End Sub

    Private Sub cmdInsert_Click()
        Dim hrt As TGOH_HRT
        Set hrt = interface.goDatosHRT_detalles(hrt)
        If hrt Is Nothing Then Exit Sub
        With hrt
            ancora.hrt.add .tipoObjetoA, .idObjetoA, .tipoObjetoB, .idObjetoB, .exceptoEnTiempo
            refre
        End With
    End Sub
    
    Private Sub cmdOK_Click()
        Hide
    End Sub

    Private Sub Form_Load()
        interface.SkinFor Me
    End Sub

'<!- METODOS -!>

    Public Function refre()
        interface.fillLvwHRT lvwHRT
    End Function
    
    Public Sub go()
        refre
        Show vbModal
    End Sub
