VERSION 5.00
Begin VB.Form frmDatosData 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "titulo"
   ClientHeight    =   2820
   ClientLeft      =   45
   ClientTop       =   450
   ClientWidth     =   5985
   Icon            =   "ancora_goh_traditional_frmDatosData.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2820
   ScaleWidth      =   5985
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton cmdCancel 
      Caption         =   "Cancelar"
      Height          =   375
      Left            =   4680
      TabIndex        =   11
      Top             =   2280
      Width           =   1095
   End
   Begin VB.CommandButton cmdOK 
      Caption         =   "Aceptar"
      Height          =   375
      Left            =   3360
      TabIndex        =   10
      Top             =   2280
      Width           =   1215
   End
   Begin VB.TextBox txtAlias 
      Height          =   315
      Left            =   2280
      MaxLength       =   10
      TabIndex        =   2
      Top             =   600
      Width           =   2175
   End
   Begin VB.ComboBox cboNivel 
      Height          =   315
      ItemData        =   "ancora_goh_traditional_frmDatosData.frx":6452
      Left            =   2280
      List            =   "ancora_goh_traditional_frmDatosData.frx":6454
      Style           =   2  'Dropdown List
      TabIndex        =   5
      Top             =   1680
      Width           =   2055
   End
   Begin VB.ComboBox cboEspBrgTurno 
      Height          =   315
      Left            =   2280
      Style           =   2  'Dropdown List
      TabIndex        =   4
      Top             =   1320
      Width           =   2295
   End
   Begin VB.TextBox txtDescrip 
      Height          =   315
      Left            =   2280
      MaxLength       =   50
      TabIndex        =   3
      Top             =   960
      Width           =   3495
   End
   Begin VB.TextBox txtID 
      Height          =   315
      Left            =   2280
      MaxLength       =   10
      TabIndex        =   1
      Top             =   240
      Width           =   2175
   End
   Begin VB.Label labAlias 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Alias"
      Height          =   195
      Left            =   1800
      TabIndex        =   9
      Top             =   600
      Width           =   330
   End
   Begin VB.Image imgs 
      Height          =   510
      Index           =   8
      Left            =   5040
      Picture         =   "ancora_goh_traditional_frmDatosData.frx":6456
      Top             =   120
      Visible         =   0   'False
      Width           =   435
   End
   Begin VB.Line Line2 
      BorderColor     =   &H80000010&
      X1              =   120
      X2              =   6000
      Y1              =   2160
      Y2              =   2160
   End
   Begin VB.Line Line1 
      BorderColor     =   &H00FFFFFF&
      X1              =   6000
      X2              =   120
      Y1              =   2175
      Y2              =   2175
   End
   Begin VB.Image imgs 
      Height          =   480
      Index           =   7
      Left            =   240
      Picture         =   "ancora_goh_traditional_frmDatosData.frx":6A5C
      Top             =   600
      Visible         =   0   'False
      Width           =   480
   End
   Begin VB.Image imgs 
      Height          =   480
      Index           =   6
      Left            =   5040
      Picture         =   "ancora_goh_traditional_frmDatosData.frx":6E9E
      Top             =   1560
      Visible         =   0   'False
      Width           =   480
   End
   Begin VB.Image imgs 
      Height          =   480
      Index           =   5
      Left            =   240
      Picture         =   "ancora_goh_traditional_frmDatosData.frx":72E0
      Top             =   2280
      Visible         =   0   'False
      Width           =   480
   End
   Begin VB.Image imgs 
      Height          =   510
      Index           =   4
      Left            =   1320
      Picture         =   "ancora_goh_traditional_frmDatosData.frx":7722
      Top             =   1920
      Visible         =   0   'False
      Width           =   735
   End
   Begin VB.Image imgs 
      Height          =   480
      Index           =   3
      Left            =   840
      Picture         =   "ancora_goh_traditional_frmDatosData.frx":7E78
      Top             =   2040
      Visible         =   0   'False
      Width           =   480
   End
   Begin VB.Image imgs 
      Height          =   480
      Index           =   2
      Left            =   240
      Picture         =   "ancora_goh_traditional_frmDatosData.frx":82BA
      Top             =   1920
      Visible         =   0   'False
      Width           =   480
   End
   Begin VB.Image imgs 
      Height          =   480
      Index           =   1
      Left            =   120
      Picture         =   "ancora_goh_traditional_frmDatosData.frx":86FC
      Top             =   1320
      Visible         =   0   'False
      Width           =   480
   End
   Begin VB.Image imgIcon 
      Height          =   510
      Left            =   120
      Top             =   240
      Width           =   480
   End
   Begin VB.Label labNivel 
      BackStyle       =   0  'Transparent
      Caption         =   "Nivel"
      Height          =   195
      Left            =   1560
      TabIndex        =   8
      Top             =   1680
      Width           =   525
   End
   Begin VB.Label labEspBrg 
      Alignment       =   1  'Right Justify
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "labEspBrgTurno"
      Height          =   195
      Left            =   120
      TabIndex        =   7
      Top             =   1320
      Width           =   2040
      WordWrap        =   -1  'True
   End
   Begin VB.Label labDescrip 
      BackStyle       =   0  'Transparent
      Caption         =   "Descripción"
      Height          =   195
      Left            =   1320
      TabIndex        =   6
      Top             =   960
      Width           =   840
   End
   Begin VB.Label labID 
      BackStyle       =   0  'Transparent
      Caption         =   "Identificación"
      Height          =   195
      Left            =   1200
      TabIndex        =   0
      Top             =   240
      Width           =   945
   End
End
Attribute VB_Name = "frmDatosData"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"489BC2220190"
Option Explicit

'Form Entrada de datos

'<!- ATRIBUTOS !->

    Public resultbutton As Long
    Dim listaids() As String
    Dim cantlistaids As Long

'<!- EVENTOS !->

    Private Sub cmdCancel_Click()
        resultbutton = vbCancel
        Hide
    End Sub

   
    Private Sub cmdOK_Click()
        If IdValidation Then
            If Trim(txtID.Text) = "" Then
                interface.MessageDlg "Faltan datos", "Debe introducir una identificación", vbExclamation, "Aceptar"
                txtID.SetFocus
                Exit Sub
            End If
            resultbutton = vbOK
            Hide
        End If
    End Sub

    Private Sub Form_Activate()
        txtID.SetFocus
    End Sub

    Private Sub cboEspBrgTurno_KeyPress(KeyAscii As Integer)
        If KeyAscii = 27 Then
            resultbutton = 2
            Hide
        End If
    End Sub

    Private Sub cboNivel_KeyPress(KeyAscii As Integer)
        If KeyAscii = 27 Then
            resultbutton = 2
            Hide
        End If
    End Sub

    Private Sub Form_KeyPress(KeyAscii As Integer)
        resultbutton = vbCancel
        Hide
    End Sub
    
    Private Sub Form_Load()
        interface.SkinFor Me
    End Sub
    
    Private Sub Form_Terminate()
        If resultbutton = 0 Then resultbutton = vbCancel
    End Sub

    Private Sub txtID_KeyPress(KeyAscii As Integer)
        Dim b As Boolean
        If KeyAscii = 27 Then
            resultbutton = 2
            Hide
        End If
    
        If KeyAscii <> 13 And KeyAscii <> 8 Then
            If InStr(1, "abcdefghijklmnopqrstuvwxyz1234567890_-/().", Chr(KeyAscii)) = 0 Then KeyAscii = 0
        End If
    
    End Sub

    Private Sub txtDescrip_KeyPress(KeyAscii As Integer)
        If KeyAscii = 27 Then
            resultbutton = 2
            Hide
        End If
    
        If KeyAscii <> 13 And KeyAscii <> 8 Then If InStr(1, "><áéíóüúÁÉÍÓÚÜabcdefghijklmnopqrstuvwxyz1234567890_- /().", LCase(Chr(KeyAscii))) = 0 Then KeyAscii = 0
        If KeyAscii = 13 Then
    
            If cboEspBrgTurno.Visible Then cboEspBrgTurno.SetFocus
            If Not cboEspBrgTurno.Visible Then txtID.SetFocus
        End If
    
    End Sub

'<!- METODOS -!>

    Public Function IdValidation() As Boolean
        Dim i As Long
        For i = 1 To cantlistaids
            If kernel.utils.idigual(listaids(i), txtID.Text) Then
                interface.MessageDlg "Error de entrada de datos", "La identificación entrada ya existe. No puede ser duplicada.", vbExclamation, "Aceptar"
                IdValidation = False
                Exit Function
            End If
        Next
        IdValidation = True
    End Function

    Public Sub go(Optional title As String = "Agregando", Optional icon As Long = 1, Optional ByVal pShowId As Boolean = True, Optional ByVal pShowDescrip As Boolean = True, Optional ByVal pShowEspBrgTurno As Boolean = False, Optional ByVal pShowNivel As Boolean = False)
        cboEspBrgTurno.Visible = pShowEspBrgTurno
        cboNivel.Visible = pShowNivel
        labEspBrg.Visible = pShowEspBrgTurno
        labNivel.Visible = pShowNivel
        imgIcon.Picture = imgs(icon).Picture
        imgIcon.Visible = True
        Caption = title
        Show vbModal
    End Sub
    
    Public Sub clear()
        txtAlias.Text = ""
        txtDescrip.Text = ""
        txtID.Text = ""
    End Sub
    
    Public Sub addToListaIds(id As String)
        cantlistaids = cantlistaids + 1
        ReDim Preserve listaids(cantlistaids)
        listaids(cantlistaids) = id
    End Sub
    
    Public Sub clearListaIds()
        cantlistaids = 0
        ReDim Preserve listaids(cantlistaids)
    End Sub
    
