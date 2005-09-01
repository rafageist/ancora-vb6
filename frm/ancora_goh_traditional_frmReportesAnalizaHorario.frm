VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "Mscomctl.ocx"
Begin VB.Form frmReportesAnalizaHorario 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Analisis de la optimización de horarios"
   ClientHeight    =   5205
   ClientLeft      =   90
   ClientTop       =   870
   ClientWidth     =   6105
   Icon            =   "ancora_goh_traditional_frmReportesAnalizaHorario.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   5205
   ScaleWidth      =   6105
   StartUpPosition =   2  'CenterScreen
   Visible         =   0   'False
   Begin VB.CommandButton cmdHelp 
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
      Left            =   4560
      TabIndex        =   24
      Top             =   4680
      Width           =   1335
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
      Left            =   3000
      TabIndex        =   23
      Top             =   4680
      Width           =   1455
   End
   Begin MSComctlLib.ProgressBar barPercentOptimization 
      Height          =   375
      Left            =   360
      TabIndex        =   21
      Top             =   4200
      Width           =   5535
      _ExtentX        =   9763
      _ExtentY        =   661
      _Version        =   393216
      BorderStyle     =   1
      Appearance      =   0
      Scrolling       =   1
   End
   Begin MSComctlLib.ProgressBar barPercentActAsig 
      Height          =   375
      Left            =   360
      TabIndex        =   20
      Top             =   3360
      Width           =   5535
      _ExtentX        =   9763
      _ExtentY        =   661
      _Version        =   393216
      BorderStyle     =   1
      Appearance      =   0
      Scrolling       =   1
   End
   Begin MSComctlLib.ProgressBar barPercentZpriori 
      Height          =   375
      Left            =   360
      TabIndex        =   19
      Top             =   1920
      Width           =   5535
      _ExtentX        =   9763
      _ExtentY        =   661
      _Version        =   393216
      BorderStyle     =   1
      Appearance      =   0
      Scrolling       =   1
   End
   Begin VB.Label labNiveldeOptimizacion 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF0000&
      Height          =   195
      Left            =   4320
      TabIndex        =   22
      Top             =   3840
      Width           =   915
   End
   Begin VB.Label Label10 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Nivel de optimización con respecto a lo ideal"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   195
      Left            =   360
      TabIndex        =   18
      Top             =   3840
      Width           =   3840
   End
   Begin VB.Label labTurnosZpriori 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Turnos en zonas de prioridad"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF0000&
      Height          =   195
      Left            =   3240
      TabIndex        =   17
      Top             =   3000
      Width           =   2490
   End
   Begin VB.Label labTurnosOcupados 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Total turnos ocupados"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF0000&
      Height          =   195
      Left            =   3240
      TabIndex        =   16
      Top             =   2760
      Width           =   1920
   End
   Begin VB.Label labEsp 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Especialidad"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF0000&
      Height          =   195
      Left            =   2040
      TabIndex        =   15
      Top             =   240
      Width           =   1095
   End
   Begin VB.Label labNivel 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Nivel:"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF0000&
      Height          =   195
      Left            =   2040
      TabIndex        =   14
      Top             =   480
      Width           =   405
   End
   Begin VB.Label labPer 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Periodo"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF0000&
      Height          =   195
      Left            =   2040
      TabIndex        =   13
      Top             =   720
      Width           =   660
   End
   Begin VB.Label labTotalAct 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Total de actividades:"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF0000&
      Height          =   195
      Left            =   3000
      TabIndex        =   12
      Top             =   1080
      Width           =   1815
   End
   Begin VB.Label labTotalFijas 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Total actividades fijas"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF0000&
      Height          =   195
      Left            =   3000
      TabIndex        =   11
      Top             =   1320
      Width           =   1890
   End
   Begin VB.Label labTotalGeneradasCaption 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Total de actividades generadas:"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   195
      Left            =   360
      TabIndex        =   10
      Top             =   1560
      Width           =   2760
   End
   Begin VB.Label labRechazadas 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Actividades rechazadas"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF0000&
      Height          =   195
      Left            =   3240
      TabIndex        =   9
      Top             =   2520
      Width           =   2040
   End
   Begin VB.Label labTurnosZprioriCaption 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Turnos en zonas de prioridad"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   195
      Left            =   360
      TabIndex        =   8
      Top             =   3000
      Width           =   2490
   End
   Begin VB.Label labTurnosOcupadosCaption 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Total turnos ocupados"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   195
      Left            =   360
      TabIndex        =   7
      Top             =   2760
      Width           =   1920
   End
   Begin VB.Label labRechazadasCaption 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Actividades rechazadas"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   195
      Left            =   360
      TabIndex        =   6
      Top             =   2520
      Width           =   2040
   End
   Begin VB.Label labTotalGeneradas 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Total de actividades generadas:"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF0000&
      Height          =   195
      Left            =   3240
      TabIndex        =   5
      Top             =   1560
      Width           =   2760
   End
   Begin VB.Label labTotalFijasCaption 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Total actividades fijas"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   195
      Left            =   360
      TabIndex        =   4
      Top             =   1320
      Width           =   1890
   End
   Begin VB.Label labTotalActCaption 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Total de actividades:"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   195
      Left            =   360
      TabIndex        =   3
      Top             =   1080
      Width           =   1815
   End
   Begin VB.Label labPerCaption 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Período"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   195
      Left            =   360
      TabIndex        =   2
      Top             =   720
      Width           =   690
   End
   Begin VB.Label labNivelCaption 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Nivel:"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   195
      Left            =   360
      TabIndex        =   1
      Top             =   480
      Width           =   405
   End
   Begin VB.Label labEspCaption 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Especialidad"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   195
      Left            =   360
      TabIndex        =   0
      Top             =   240
      Width           =   1095
   End
End
Attribute VB_Name = "frmReportesAnalizaHorario"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"489BC20A0073"
Option Explicit
'Analisis de horario
'Muestra el nivel de optimización de un horario

Dim Moviendo As Boolean
Dim ActualLeft As Long
Dim ActualTop As Long

'aceptar y salir
Private Sub cmdOK_Click()
    Hide
End Sub

'lanzamiento del formulario
Sub go(ByVal pEspec As String, ByVal pPeriod As String, ByVal pNivel As Long, ByVal pTotalAct As Long, ByVal pTotalAsignadas As Long, ByVal pTotalFijas As Long, ByVal pTotalTurnos As Long, ByVal pTotalEnZpriori As Long, ByVal pPercentAsig As Long, ByVal pPercenZpriori As Long, Optional ByVal modal As Boolean = True)
    labNivel.Caption = "" & pNivel
    labEsp.Caption = pEspec
    labPer.Caption = pPeriod
    labTotalAct.Caption = Str(pTotalAct)
    labTotalFijas.Caption = Str(pTotalFijas)
    labTotalGeneradas.Caption = Str(pTotalAsignadas - pTotalFijas)
    labRechazadas.Caption = Str(pTotalAct - pTotalAsignadas)
    labTurnosOcupados.Caption = Str(pTotalTurnos)
    labTurnosZpriori.Caption = Str(pTotalEnZpriori)
    barPercentActAsig.value = pPercentAsig
    barPercentZpriori.value = pPercenZpriori
    barPercentOptimization.value = (pPercentAsig + pPercenZpriori) / 2
    labNiveldeOptimizacion.Caption = "" & barPercentOptimization.value & " %"
    If modal Then Show vbModal Else Show
End Sub

Private Sub Form_Load()
    interface.SkinFor Me
End Sub
