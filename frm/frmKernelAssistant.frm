VERSION 5.00
Object = "{B42578F8-962C-436D-9516-4E26101FF1D9}#4.0#0"; "buttonskin.ocx"
Begin VB.Form frmKernelAssistant 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Asistente"
   ClientHeight    =   5430
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   8790
   Icon            =   "frmKernelAssistant.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   5430
   ScaleWidth      =   8790
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin ButtonSkin.ucBtnSkin cmdCancel 
      Height          =   375
      Left            =   7680
      TabIndex        =   4
      Top             =   4920
      Width           =   975
      _ExtentX        =   1720
      _ExtentY        =   661
      Skin            =   9
      Caption         =   "Cancelar"
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
      CaptionAlign    =   0
      CaptionMargin   =   10
      ButtonType      =   0
      Object.ToolTipText     =   ""
      UseUnderLineMouseUp=   0   'False
      UseUnderLineMouseCheck=   0   'False
      BorderColorCheck=   0
      ColorSchemas    =   1
   End
   Begin ButtonSkin.ucBtnSkin cmdJump 
      Height          =   375
      Left            =   6600
      TabIndex        =   3
      Top             =   4920
      Width           =   975
      _ExtentX        =   1720
      _ExtentY        =   661
      Skin            =   9
      Caption         =   "Saltar"
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
      CaptionAlign    =   0
      CaptionMargin   =   10
      ButtonType      =   0
      Object.ToolTipText     =   ""
      UseUnderLineMouseUp=   0   'False
      UseUnderLineMouseCheck=   0   'False
      BorderColorCheck=   0
      ColorSchemas    =   1
   End
   Begin ButtonSkin.ucBtnSkin cmdAdelante 
      Height          =   375
      Left            =   5520
      TabIndex        =   2
      Top             =   4920
      Width           =   975
      _ExtentX        =   1720
      _ExtentY        =   661
      Skin            =   9
      Caption         =   "Adelante"
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
      CaptionAlign    =   0
      CaptionMargin   =   10
      ButtonType      =   0
      Object.ToolTipText     =   ""
      UseUnderLineMouseUp=   0   'False
      UseUnderLineMouseCheck=   0   'False
      BorderColorCheck=   0
      ColorSchemas    =   1
   End
   Begin ButtonSkin.ucBtnSkin cmdAtras 
      Height          =   375
      Left            =   4440
      TabIndex        =   1
      Top             =   4920
      Width           =   975
      _ExtentX        =   1720
      _ExtentY        =   661
      Skin            =   9
      Caption         =   "Atrás"
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
      CaptionAlign    =   0
      CaptionMargin   =   10
      ButtonType      =   0
      Object.ToolTipText     =   ""
      UseUnderLineMouseUp=   0   'False
      UseUnderLineMouseCheck=   0   'False
      BorderColorCheck=   0
      ColorSchemas    =   1
   End
   Begin ButtonSkin.ucBtnSkin cmdEmpezar 
      Height          =   375
      Left            =   3360
      TabIndex        =   0
      Top             =   4920
      Width           =   975
      _ExtentX        =   1720
      _ExtentY        =   661
      Skin            =   9
      Caption         =   "Empezar"
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
      CaptionAlign    =   0
      CaptionMargin   =   10
      ButtonType      =   0
      Object.ToolTipText     =   ""
      UseUnderLineMouseUp=   0   'False
      UseUnderLineMouseCheck=   0   'False
      BorderColorCheck=   0
      ColorSchemas    =   1
   End
   Begin ButtonSkin.ucBtnSkin pasomsg 
      Height          =   4455
      Left            =   1320
      TabIndex        =   5
      Top             =   120
      Width           =   7335
      _ExtentX        =   12938
      _ExtentY        =   7858
      Skin            =   9
      Caption         =   ""
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
      CaptionAlign    =   0
      CaptionMargin   =   10
      ButtonType      =   0
      Object.ToolTipText     =   ""
      UseUnderLineMouseUp=   0   'False
      UseUnderLineMouseCheck=   0   'False
      BackColor       =   16636865
      BackColorOver   =   16636865
      BackColorDown   =   16636865
      BackColorCheck  =   16636865
      BackColorDisabled=   16636865
      BorderColorCheck=   0
      ColorSchemas    =   1
   End
   Begin VB.Image imgAssistant 
      Height          =   1290
      Index           =   8
      Left            =   135
      Picture         =   "frmKernelAssistant.frx":0CCA
      Top             =   3300
      Visible         =   0   'False
      Width           =   1035
   End
   Begin VB.Image imgAssistant 
      Height          =   1245
      Index           =   7
      Left            =   135
      Picture         =   "frmKernelAssistant.frx":1F49
      Top             =   3300
      Visible         =   0   'False
      Width           =   1020
   End
   Begin VB.Image imgAssistant 
      Height          =   1245
      Index           =   6
      Left            =   135
      Picture         =   "frmKernelAssistant.frx":310A
      Top             =   3300
      Visible         =   0   'False
      Width           =   1035
   End
   Begin VB.Image imgAssistant 
      Height          =   1260
      Index           =   0
      Left            =   135
      Picture         =   "frmKernelAssistant.frx":4231
      Top             =   3300
      Visible         =   0   'False
      Width           =   1155
   End
   Begin VB.Image imgIcon 
      Height          =   600
      Left            =   240
      Top             =   240
      Width           =   600
   End
   Begin VB.Line Line2 
      BorderColor     =   &H80000010&
      X1              =   8554
      X2              =   -1245
      Y1              =   4800
      Y2              =   4800
   End
   Begin VB.Line Line1 
      BorderColor     =   &H00FFFFFF&
      X1              =   8554
      X2              =   -1245
      Y1              =   4815
      Y2              =   4815
   End
   Begin VB.Image imgAssistant 
      Height          =   1245
      Index           =   5
      Left            =   135
      Picture         =   "frmKernelAssistant.frx":5513
      Top             =   3300
      Visible         =   0   'False
      Width           =   1155
   End
   Begin VB.Image imgAssistant 
      Height          =   1245
      Index           =   4
      Left            =   135
      Picture         =   "frmKernelAssistant.frx":67B0
      Top             =   3300
      Visible         =   0   'False
      Width           =   855
   End
   Begin VB.Image imgAssistant 
      Height          =   1200
      Index           =   3
      Left            =   135
      Picture         =   "frmKernelAssistant.frx":782F
      Top             =   3300
      Visible         =   0   'False
      Width           =   915
   End
   Begin VB.Image imgAssistant 
      Height          =   1200
      Index           =   2
      Left            =   120
      Picture         =   "frmKernelAssistant.frx":8716
      Top             =   3300
      Visible         =   0   'False
      Width           =   1005
   End
   Begin VB.Image imgAssistant 
      Height          =   1200
      Index           =   1
      Left            =   120
      Picture         =   "frmKernelAssistant.frx":9C61
      Top             =   3300
      Visible         =   0   'False
      Width           =   795
   End
End
Attribute VB_Name = "frmKernelAssistant"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"489BC2CE001B"
Option Explicit
Dim mvarresultbutton As Integer
Dim iximg As Integer
Public Property Get resultbutton() As Integer
resultbutton = mvarresultbutton
End Property

Public Property Let resultbutton(ByVal value As Integer)
mvarresultbutton = value
End Property

Public Sub go(paso As String, Comentario As String, Optional pEmpezar As Boolean = True, Optional pAtras As Boolean = True, Optional pAdelante As Boolean = True, Optional picon As Integer = 0)
    Dim i As Long
    
        Dim lFontColor As Long
    Dim lBorderColor As Long
    Dim lBackColor   As Long
    
    lBorderColor = pasomsg.BorderColorSkinDefault
    lBackColor = pasomsg.BackColorSkinDefault
    lFontColor = pasomsg.ForeColorNormal
    
    cmdEmpezar.Enabled = pEmpezar
    cmdAtras.Enabled = pAtras
    cmdAdelante.Enabled = pAdelante

    Randomize Timer
    For i = 0 To imgAssistant.Count - 1
        imgAssistant(i).Visible = False
    Next
    imgAssistant(1 + Int(Rnd * imgAssistant.Count) - 1).Visible = True
    If picon = 0 Then
        imgIcon.Visible = False
    Else
        imgIcon.Visible = True
        imgIcon.Picture = frmKernelMain.imlRibbon.ListImages(picon).Picture
    End If
    
    With pasomsg
            .FormatTextClear
            .FormatTextSetup 10, 2, 5
            .FormatTextAddParagraph (eleft)
            .FormatTextAdd Chr(52), "Webdings", 12, lFontColor
            .FormatTextAdd "" & paso, "Verdana", 10, lFontColor, , , True
            .FormatTextDrawLine lFontColor, vbDot
            .FormatTextAddParagraph (eleft)
            .FormatTextAdd "" & Comentario, "Verdana", 8, lFontColor, , , False
            .FormatTextAddNewLine
            .EnabledFormatText = True
            .Refresh
    End With
    
    Show vbModal
End Sub

Private Sub cmdAdelante_Click()
    resultbutton = 3
    Hide
End Sub

Private Sub cmdAtras_Click()
    resultbutton = 2
    Hide
End Sub

Private Sub cmdCancel_Click()
    resultbutton = 4
    Hide
End Sub

Private Sub cmdEmpezar_Click()
    resultbutton = 1
    Hide
End Sub

Private Sub cmdJump_Click()
    resultbutton = 6
    Hide
End Sub

Private Sub Form_Load()
    interface.SkinFor Me
End Sub
