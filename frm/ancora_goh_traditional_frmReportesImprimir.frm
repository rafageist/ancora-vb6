VERSION 5.00
Object = "{3B7C8863-D78F-101B-B9B5-04021C009402}#1.2#0"; "RICHTX32.OCX"
Begin VB.Form frmReportesImprimir 
   Caption         =   "Imprimir horarios"
   ClientHeight    =   7650
   ClientLeft      =   60
   ClientTop       =   465
   ClientWidth     =   10005
   Icon            =   "ancora_goh_traditional_frmReportesImprimir.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   7650
   ScaleWidth      =   10005
   StartUpPosition =   2  'CenterScreen
   Begin VB.Frame frameOpciones 
      Height          =   855
      Left            =   240
      TabIndex        =   1
      Top             =   3600
      Width           =   6495
      Begin VB.CommandButton cmdAyuda 
         Caption         =   "Ayuda"
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
         Left            =   3480
         TabIndex        =   4
         Top             =   240
         Width           =   1215
      End
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
         Left            =   2160
         TabIndex        =   3
         Top             =   240
         Width           =   1215
      End
      Begin VB.CommandButton cmdImprimir 
         Caption         =   "Imprimir"
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
         Left            =   720
         TabIndex        =   2
         Top             =   240
         Width           =   1335
      End
   End
   Begin RichTextLib.RichTextBox RichTextBox1 
      Height          =   3375
      Left            =   240
      TabIndex        =   0
      ToolTipText     =   "Documento en formato TXT"
      Top             =   120
      Width           =   6495
      _ExtentX        =   11456
      _ExtentY        =   5953
      _Version        =   393217
      BackColor       =   16777215
      BorderStyle     =   0
      ScrollBars      =   3
      Appearance      =   0
      RightMargin     =   19999
      AutoVerbMenu    =   -1  'True
      TextRTF         =   $"ancora_goh_traditional_frmReportesImprimir.frx":0FB2
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Courier New"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
End
Attribute VB_Name = "frmReportesImprimir"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"489BC2250130"
Option Explicit


Private Sub cmdImprimir_Click()

    On Error GoTo errdep

    Dim r As Variant
    Printer.Print " "
    r = interface.MessageDlg("Imprimir", "Prepare la impresora y haga click en aceptar para imprimir", vbInformation, "Aceptar", "Cancelar")
    If r = 2 Then
        RichTextBox1.SelPrint Printer.hDC
        Printer.EndDoc
    End If

finish:
    Exit Sub
errdep:
    interface.MessageDlg "Error al imprimir", Err.Description, vbCritical, "Aceptar"
    Resume finish
End Sub

Private Sub cmdTerminar_Click()
    Hide
End Sub

Private Sub Form_Activate()
    reports.GuardarHorarioRTF App.path + "\AncoraHorarioTXT.txt"
    RichTextBox1.LoadFile App.path + "\AncoraHorarioTXT.txt", rtfText
End Sub

Private Sub Form_Load()
    interface.SkinFor Me
End Sub

Private Sub Form_Resize()

    On Error Resume Next

    RichTextBox1.Top = 0
    RichTextBox1.Left = 0
    RichTextBox1.Height = Height - frameOpciones.Height - 400
    RichTextBox1.Width = Width - 200
    frameOpciones.Top = Height - frameOpciones.Height - 400
    frameOpciones.Width = Width - 200
    frameOpciones.Left = -0
    cmdTerminar.Left = frameOpciones.Width - cmdTerminar.Width - 180
    cmdImprimir.Left = cmdTerminar.Left - cmdImprimir.Width - 100
    
End Sub


