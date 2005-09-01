VERSION 5.00
Begin VB.Form frmReportesEstadisticas 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Estadisticas"
   ClientHeight    =   6045
   ClientLeft      =   45
   ClientTop       =   450
   ClientWidth     =   5280
   Icon            =   "ancora_goh_traditional_frmReportesEstadisticas.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   6045
   ScaleWidth      =   5280
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Visible         =   0   'False
   Begin VB.CommandButton Command1 
      Caption         =   "Aceptar"
      Height          =   375
      Left            =   2040
      TabIndex        =   35
      Top             =   5520
      Width           =   1335
   End
   Begin VB.Label labTotal 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "#"
      ForeColor       =   &H00800000&
      Height          =   195
      Left            =   4560
      TabIndex        =   34
      Top             =   5160
      Width           =   105
   End
   Begin VB.Label labCantImposibles 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "#"
      ForeColor       =   &H00800000&
      Height          =   195
      Left            =   4560
      TabIndex        =   33
      Top             =   4920
      Width           =   105
   End
   Begin VB.Label labCantidadFijas 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "#"
      ForeColor       =   &H00800000&
      Height          =   195
      Left            =   4560
      TabIndex        =   32
      Top             =   4680
      Width           =   105
   End
   Begin VB.Label labCantAsignaciones 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "#"
      ForeColor       =   &H00800000&
      Height          =   195
      Left            =   4560
      TabIndex        =   31
      Top             =   4440
      Width           =   105
   End
   Begin VB.Label labCantLugXact 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "#"
      ForeColor       =   &H00800000&
      Height          =   195
      Left            =   4560
      TabIndex        =   30
      Top             =   3840
      Width           =   105
   End
   Begin VB.Label labCantProfXAct 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "#"
      ForeColor       =   &H00800000&
      Height          =   195
      Left            =   4560
      TabIndex        =   29
      Top             =   3600
      Width           =   105
   End
   Begin VB.Label Label29 
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
      ForeColor       =   &H00008000&
      Height          =   255
      Left            =   2400
      TabIndex        =   28
      Top             =   5160
      Width           =   1935
   End
   Begin VB.Label Label28 
      BackStyle       =   0  'Transparent
      Caption         =   "Actividades que no se pudieron generar:"
      ForeColor       =   &H00000000&
      Height          =   255
      Left            =   360
      TabIndex        =   27
      Top             =   4920
      Width           =   3495
   End
   Begin VB.Label Label27 
      BackStyle       =   0  'Transparent
      Caption         =   "Actividades fijadas por el usuario:"
      ForeColor       =   &H00000000&
      Height          =   255
      Left            =   360
      TabIndex        =   26
      Top             =   4680
      Width           =   3495
   End
   Begin VB.Label Label26 
      BackStyle       =   0  'Transparent
      Caption         =   "Actividades asignadas por el generador:"
      ForeColor       =   &H00000000&
      Height          =   255
      Left            =   360
      TabIndex        =   25
      Top             =   4440
      Width           =   3615
   End
   Begin VB.Label Label25 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Resultados de las generaciones"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   240
      Left            =   120
      TabIndex        =   24
      Top             =   4200
      Width           =   3390
   End
   Begin VB.Label Label24 
      BackStyle       =   0  'Transparent
      Caption         =   "Lugares por actividades:"
      ForeColor       =   &H00000000&
      Height          =   255
      Left            =   360
      TabIndex        =   23
      Top             =   3840
      Width           =   2775
   End
   Begin VB.Label Label23 
      BackStyle       =   0  'Transparent
      Caption         =   "Profesores por actividades:"
      ForeColor       =   &H00000000&
      Height          =   255
      Left            =   360
      TabIndex        =   22
      Top             =   3600
      Width           =   2775
   End
   Begin VB.Label Label22 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Recursos"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   240
      Left            =   120
      TabIndex        =   21
      Top             =   3360
      Width           =   1005
   End
   Begin VB.Label labCantLug 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "#"
      ForeColor       =   &H00800000&
      Height          =   195
      Left            =   4560
      TabIndex        =   20
      Top             =   3000
      Width           =   105
   End
   Begin VB.Label labcantProfes 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "#"
      ForeColor       =   &H00800000&
      Height          =   195
      Left            =   4560
      TabIndex        =   19
      Top             =   2760
      Width           =   105
   End
   Begin VB.Label Label19 
      BackStyle       =   0  'Transparent
      Caption         =   "Lugares:"
      ForeColor       =   &H00000000&
      Height          =   255
      Left            =   360
      TabIndex        =   18
      Top             =   3000
      Width           =   2775
   End
   Begin VB.Label Label18 
      BackStyle       =   0  'Transparent
      Caption         =   "Profesores:"
      ForeColor       =   &H00000000&
      Height          =   255
      Left            =   360
      TabIndex        =   17
      Top             =   2760
      Width           =   2775
   End
   Begin VB.Label Label17 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Necesarias"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   240
      Left            =   120
      TabIndex        =   16
      Top             =   2520
      Width           =   1215
   End
   Begin VB.Label labCantAsig 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "#"
      ForeColor       =   &H00800000&
      Height          =   195
      Left            =   4560
      TabIndex        =   15
      Top             =   2160
      Width           =   105
   End
   Begin VB.Label labCantBrg 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "#"
      ForeColor       =   &H00800000&
      Height          =   195
      Left            =   4560
      TabIndex        =   14
      Top             =   1920
      Width           =   105
   End
   Begin VB.Label labCantClasif 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "#"
      ForeColor       =   &H00800000&
      Height          =   195
      Left            =   4560
      TabIndex        =   13
      Top             =   1680
      Width           =   105
   End
   Begin VB.Label labCantEsp 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "#"
      ForeColor       =   &H00800000&
      Height          =   195
      Left            =   4560
      TabIndex        =   12
      Top             =   1440
      Width           =   105
   End
   Begin VB.Label labCantPer 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "#"
      ForeColor       =   &H00800000&
      Height          =   195
      Left            =   4560
      TabIndex        =   11
      Top             =   1200
      Width           =   105
   End
   Begin VB.Label Label11 
      BackStyle       =   0  'Transparent
      Caption         =   "Asignaturas:"
      ForeColor       =   &H00000000&
      Height          =   255
      Left            =   360
      TabIndex        =   10
      Top             =   2160
      Width           =   2775
   End
   Begin VB.Label Label10 
      BackStyle       =   0  'Transparent
      Caption         =   "Brigadas:"
      ForeColor       =   &H00000000&
      Height          =   255
      Left            =   360
      TabIndex        =   9
      Top             =   1920
      Width           =   2775
   End
   Begin VB.Label Label9 
      BackStyle       =   0  'Transparent
      Caption         =   "Clasificaciones de actividades"
      ForeColor       =   &H00000000&
      Height          =   255
      Left            =   360
      TabIndex        =   8
      Top             =   1680
      Width           =   2775
   End
   Begin VB.Label Label8 
      BackStyle       =   0  'Transparent
      Caption         =   "Especialidades:"
      ForeColor       =   &H00000000&
      Height          =   255
      Left            =   360
      TabIndex        =   7
      Top             =   1440
      Width           =   2295
   End
   Begin VB.Label Label7 
      BackStyle       =   0  'Transparent
      Caption         =   "Períodos:"
      ForeColor       =   &H00000000&
      Height          =   255
      Left            =   360
      TabIndex        =   6
      Top             =   1200
      Width           =   2295
   End
   Begin VB.Label Label6 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Indispensables"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   240
      Left            =   120
      TabIndex        =   5
      Top             =   960
      Width           =   1605
   End
   Begin VB.Label labCD 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "#"
      ForeColor       =   &H00800000&
      Height          =   195
      Left            =   4560
      TabIndex        =   4
      Top             =   600
      Width           =   105
   End
   Begin VB.Label labCT 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "#"
      ForeColor       =   &H00800000&
      Height          =   195
      Left            =   4560
      TabIndex        =   3
      Top             =   360
      Width           =   105
   End
   Begin VB.Label Label3 
      BackStyle       =   0  'Transparent
      Caption         =   "Turnos por día:"
      ForeColor       =   &H00000000&
      Height          =   255
      Left            =   360
      TabIndex        =   2
      Top             =   600
      Width           =   1455
   End
   Begin VB.Label Label2 
      BackStyle       =   0  'Transparent
      Caption         =   "Cantidad de días:"
      ForeColor       =   &H00000000&
      Height          =   255
      Left            =   360
      TabIndex        =   1
      Top             =   360
      Width           =   1575
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Generales"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   240
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   1095
   End
End
Attribute VB_Name = "frmReportesEstadisticas"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"489BC1EB0105"
Option Explicit
Private Sub Command1_Click()
    Hide
End Sub

Sub go()
    labCantAsig = Str(ancora.cantAsig)
    labCantAsignaciones = Str(ancora.cantAsignaciones - ancora.getCantAsignacionesFijas)
    labCantBrg = Str(ancora.cantBrg)
    labCantClasif = Str(ancora.cantClasif)
    labCantEsp = Str(ancora.cantEsp)
    labCantidadFijas = Str(ancora.getCantAsignacionesFijas)
    labCantImposibles = ancora.cantImposibles
    labCantLug = Str(ancora.cantLug)
    labCantLugXact = Str(ancora.cantLxAct)
    labCantPer = Str(ancora.periodos.Count)
    labcantProfes = Str(ancora.cantProfe)
    labCantProfXAct = Str(ancora.cantPxAct)
    labCD = Str(ancora.CD)
    labCT = Str(ancora.ct)
    labTotal = Str(ancora.cantAsignaciones + ancora.cantImposibles)
    Show vbModal
End Sub

Private Sub Form_Load()
    interface.SkinFor Me
End Sub

