VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "msflxgrd.ocx"
Begin VB.Form frmDatosGenerales 
   Caption         =   "Datos generales"
   ClientHeight    =   6615
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   4665
   Icon            =   "ancora_goh_traditional_frmDatosGenerales.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   6615
   ScaleWidth      =   4665
   StartUpPosition =   2  'CenterScreen
   Visible         =   0   'False
   Begin VB.CommandButton cmdCancel 
      Caption         =   "Cancelar"
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
      Left            =   3360
      TabIndex        =   10
      Top             =   6120
      Width           =   1215
   End
   Begin VB.CommandButton cmdOK 
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
      Left            =   1920
      TabIndex        =   9
      Top             =   6120
      Width           =   1335
   End
   Begin VB.CommandButton cmdAdd 
      Caption         =   ">"
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
      Left            =   4080
      TabIndex        =   8
      Top             =   600
      Width           =   495
   End
   Begin VB.CommandButton cmdDel 
      Caption         =   "<"
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
      Left            =   840
      TabIndex        =   7
      Top             =   600
      Width           =   495
   End
   Begin VB.CommandButton cmdAddTurno 
      Caption         =   "v"
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
      Left            =   120
      TabIndex        =   6
      Top             =   4080
      Width           =   495
   End
   Begin VB.CommandButton cmdDelTurno 
      Caption         =   "^"
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
      Left            =   120
      TabIndex        =   5
      Top             =   1800
      Width           =   495
   End
   Begin MSFlexGridLib.MSFlexGrid flexCasillero 
      Height          =   4695
      Left            =   840
      TabIndex        =   4
      Top             =   1080
      Width           =   3735
      _ExtentX        =   6588
      _ExtentY        =   8281
      _Version        =   393216
      BackColorBkg    =   -2147483633
      GridColor       =   16777215
      ScrollTrack     =   -1  'True
      TextStyle       =   2
      FocusRect       =   2
      BorderStyle     =   0
      Appearance      =   0
      GridLineWidth   =   2
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "Urilice los controles (botones con flechitas) para cambiar las dimensiones de los períodos."
      Height          =   375
      Left            =   120
      TabIndex        =   3
      Top             =   120
      Width           =   4455
   End
   Begin VB.Label labPer 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Período"
      Height          =   195
      Left            =   120
      TabIndex        =   2
      Top             =   720
      Width           =   570
   End
   Begin VB.Label labTurno 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Turnos"
      Height          =   195
      Left            =   120
      TabIndex        =   1
      Top             =   3000
      Width           =   495
   End
   Begin VB.Line Line2 
      BorderColor     =   &H80000010&
      X1              =   -240
      X2              =   4800
      Y1              =   5985
      Y2              =   5985
   End
   Begin VB.Line Line1 
      BorderColor     =   &H00FFFFFF&
      X1              =   4800
      X2              =   -240
      Y1              =   6000
      Y2              =   6000
   End
   Begin VB.Label labDay 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Días"
      Height          =   195
      Left            =   2400
      TabIndex        =   0
      Top             =   720
      Width           =   345
   End
End
Attribute VB_Name = "frmDatosGenerales"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"489BC1D4027E"
Option Explicit

'Form Datos generales

'<!- ATRIBUTOS !->

    Public CD As Long
    Public ct As Long
    Public resultbutton As Integer

'<!- EVENTOS !->
    
    Private Sub cmdCancel_Click()
        resultbutton = 2
        Hide
    End Sub
    
    Private Sub cmdaddTurno_Click()
        If ct < MAX_TURNOS Then
            ct = ct + 1
            refre
        End If
    End Sub
    
    Private Sub cmdDelTurno_Click()
        If ct > 1 Then
            ct = ct - 1
            refre
        End If
    End Sub

    Private Sub cmdOK_Click()
        Dim r As Variant
        r = interface.MessageDlg("Seguridad", "Recuerde que esta configuración es fundamental en todo el proceso de planificación de los horarios. Cualquier cambio en la misma puede alterar u ocasionar trastornos a lo hecho hasta ahora. ¿Está seguro de los cambios que hizo?", vbQuestion, "No", "Sí")
        If r = 2 Then
            resultbutton = 1
            Hide
        End If
    End Sub

    Private Sub cmdCance_Click()
        Hide
        GuardarAlSalir = False
    End Sub

   
    Private Sub cmdAdd_Click()
        If CD < MAX_DIAS Then
            CD = CD + 1
            refre
        End If
    End Sub
    
    Private Sub cmdDel_Click()
        If CD > 1 Then
            CD = CD - 1
            refre
        End If
    End Sub
    Private Sub Form_Activate()
        CD = ancora.CD
        ct = ancora.ct
        refre
    End Sub

    Public Sub refre()
        Dim i As Long, j As Long, letras As String
        letras = " ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    
        flexCasillero.Rows = ct + 1
        flexCasillero.cols = CD + 1
        If ct > 0 And CD > 0 Then
            flexCasillero.FixedCols = 1
            flexCasillero.FixedRows = 1
        End If
    
        For i = 1 To CD
            flexCasillero.TextMatrix(0, i) = "" & i
            flexCasillero.ColWidth(i) = 400
        Next
    
        flexCasillero.ColWidth(0) = 400
        flexCasillero.RowHeight(0) = 400
    
        For i = 1 To ct
            flexCasillero.TextMatrix(i, 0) = "" & i
            flexCasillero.RowHeight(i) = 400
    
        Next
    
        Randomize Timer
        For i = 1 To ct
            flexCasillero.row = i
            For j = 1 To CD
                flexCasillero.col = j
                flexCasillero.TextMatrix(i, j) = Mid(letras, 1 + Int(Rnd * Len(letras)), 1)
                flexCasillero.CellBackColor = RGB(100 + Int(Rnd * 100), 100 + Int(Rnd * 100), 100 + Int(Rnd * 100))
            Next
        Next
    
    End Sub

    Private Sub Form_Load()
        interface.SkinFor Me
    End Sub


