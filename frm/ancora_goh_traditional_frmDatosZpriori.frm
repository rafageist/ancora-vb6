VERSION 5.00
Begin VB.Form frmDatosZpriori 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Zonas de prioridad"
   ClientHeight    =   7770
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   4500
   Icon            =   "ancora_goh_traditional_frmDatosZpriori.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   7770
   ScaleWidth      =   4500
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton CmdCancel 
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
      Left            =   3000
      TabIndex        =   135
      Top             =   7320
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
      Left            =   1560
      TabIndex        =   134
      Top             =   7320
      Width           =   1335
   End
   Begin VB.CommandButton cmdCascadaDia 
      Caption         =   "Cascada por día"
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
      Left            =   360
      TabIndex        =   133
      Top             =   6720
      Width           =   1815
   End
   Begin VB.CommandButton cmdCascadaTurno 
      Caption         =   "Cascada por turno"
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
      Left            =   2400
      TabIndex        =   132
      Top             =   6720
      Width           =   1815
   End
   Begin VB.CommandButton cmdAplicarvalor 
      Caption         =   "Aplicar el valor"
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
      Left            =   2400
      TabIndex        =   131
      Top             =   6240
      Width           =   1815
   End
   Begin VB.CommandButton cmdRecolorear 
      Height          =   255
      Left            =   120
      TabIndex        =   130
      ToolTipText     =   "Arreglar y Colorear"
      Top             =   600
      Width           =   255
   End
   Begin VB.CheckBox chkTodosDiasTurnos 
      Height          =   255
      Left            =   3960
      TabIndex        =   129
      Top             =   5400
      Width           =   255
   End
   Begin VB.CheckBox chkTodosDias 
      Height          =   255
      Left            =   120
      TabIndex        =   128
      ToolTipText     =   "Marcar/desmarcar todos los días"
      Top             =   5400
      Width           =   255
   End
   Begin VB.CheckBox chkTodosTurnos 
      Height          =   255
      Left            =   3960
      TabIndex        =   127
      ToolTipText     =   "Marcar/desmarcar todos los turnos"
      Top             =   600
      Width           =   255
   End
   Begin VB.TextBox txtValor 
      Height          =   315
      Left            =   1440
      TabIndex        =   124
      Text            =   "1"
      Top             =   6240
      Width           =   495
   End
   Begin VB.CheckBox chkDias 
      Height          =   255
      Index           =   6
      Left            =   3480
      TabIndex        =   123
      Top             =   5400
      Width           =   255
   End
   Begin VB.CheckBox chkDias 
      Height          =   255
      Index           =   5
      Left            =   3000
      TabIndex        =   122
      Top             =   5400
      Width           =   255
   End
   Begin VB.CheckBox chkDias 
      Height          =   255
      Index           =   4
      Left            =   2520
      TabIndex        =   121
      Top             =   5400
      Width           =   255
   End
   Begin VB.CheckBox chkDias 
      Height          =   255
      Index           =   3
      Left            =   2040
      TabIndex        =   120
      Top             =   5400
      Width           =   255
   End
   Begin VB.CheckBox chkDias 
      Height          =   255
      Index           =   2
      Left            =   1560
      TabIndex        =   119
      Top             =   5400
      Width           =   255
   End
   Begin VB.CheckBox chkDias 
      Height          =   255
      Index           =   1
      Left            =   1080
      TabIndex        =   118
      Top             =   5400
      Width           =   255
   End
   Begin VB.CheckBox chkDias 
      Height          =   255
      Index           =   0
      Left            =   600
      TabIndex        =   117
      Top             =   5400
      Width           =   255
   End
   Begin VB.CheckBox chkTurno 
      Height          =   375
      Index           =   11
      Left            =   3960
      TabIndex        =   116
      Top             =   4920
      Width           =   255
   End
   Begin VB.CheckBox chkTurno 
      Height          =   375
      Index           =   10
      Left            =   3960
      TabIndex        =   115
      Top             =   4560
      Width           =   255
   End
   Begin VB.CheckBox chkTurno 
      Height          =   375
      Index           =   9
      Left            =   3960
      TabIndex        =   114
      Top             =   4200
      Width           =   255
   End
   Begin VB.CheckBox chkTurno 
      Height          =   375
      Index           =   8
      Left            =   3960
      TabIndex        =   113
      Top             =   3840
      Width           =   255
   End
   Begin VB.CheckBox chkTurno 
      Height          =   375
      Index           =   7
      Left            =   3960
      TabIndex        =   112
      Top             =   3480
      Width           =   255
   End
   Begin VB.CheckBox chkTurno 
      Height          =   375
      Index           =   6
      Left            =   3960
      TabIndex        =   111
      Top             =   3120
      Width           =   255
   End
   Begin VB.CheckBox chkTurno 
      Height          =   375
      Index           =   5
      Left            =   3960
      TabIndex        =   110
      Top             =   2760
      Width           =   255
   End
   Begin VB.CheckBox chkTurno 
      Height          =   375
      Index           =   4
      Left            =   3960
      TabIndex        =   109
      Top             =   2400
      Width           =   255
   End
   Begin VB.CheckBox chkTurno 
      Height          =   375
      Index           =   3
      Left            =   3960
      TabIndex        =   108
      Top             =   2040
      Width           =   255
   End
   Begin VB.CheckBox chkTurno 
      Height          =   375
      Index           =   2
      Left            =   3960
      TabIndex        =   107
      Top             =   1680
      Width           =   255
   End
   Begin VB.CheckBox chkTurno 
      Height          =   375
      Index           =   1
      Left            =   3960
      TabIndex        =   106
      Top             =   1320
      Width           =   255
   End
   Begin VB.CheckBox chkTurno 
      Height          =   375
      Index           =   0
      Left            =   3960
      TabIndex        =   105
      Top             =   960
      Width           =   255
   End
   Begin VB.CommandButton cmdRes 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   400
      Index           =   83
      Left            =   3360
      Style           =   1  'Graphical
      TabIndex        =   89
      Top             =   4920
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   400
      Index           =   82
      Left            =   2880
      Style           =   1  'Graphical
      TabIndex        =   90
      Top             =   4920
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   400
      Index           =   81
      Left            =   2400
      Style           =   1  'Graphical
      TabIndex        =   91
      Top             =   4920
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   400
      Index           =   80
      Left            =   1920
      Style           =   1  'Graphical
      TabIndex        =   92
      Top             =   4920
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   400
      Index           =   79
      Left            =   1440
      Style           =   1  'Graphical
      TabIndex        =   93
      Top             =   4920
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   400
      Index           =   78
      Left            =   960
      Style           =   1  'Graphical
      TabIndex        =   94
      Top             =   4920
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   400
      Index           =   77
      Left            =   480
      Style           =   1  'Graphical
      TabIndex        =   95
      Top             =   4920
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   400
      Index           =   76
      Left            =   3360
      Style           =   1  'Graphical
      TabIndex        =   96
      Top             =   4560
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   400
      Index           =   75
      Left            =   2880
      Style           =   1  'Graphical
      TabIndex        =   97
      Top             =   4560
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   400
      Index           =   74
      Left            =   2400
      Style           =   1  'Graphical
      TabIndex        =   98
      Top             =   4560
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   400
      Index           =   73
      Left            =   1920
      Style           =   1  'Graphical
      TabIndex        =   99
      Top             =   4560
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   400
      Index           =   72
      Left            =   1440
      Style           =   1  'Graphical
      TabIndex        =   100
      Top             =   4560
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   400
      Index           =   71
      Left            =   960
      Style           =   1  'Graphical
      TabIndex        =   101
      Top             =   4560
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   400
      Index           =   70
      Left            =   480
      Style           =   1  'Graphical
      TabIndex        =   102
      Top             =   4560
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   400
      Index           =   69
      Left            =   3360
      Style           =   1  'Graphical
      TabIndex        =   19
      Top             =   4200
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   400
      Index           =   62
      Left            =   3360
      Style           =   1  'Graphical
      TabIndex        =   26
      Top             =   3840
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   400
      Index           =   55
      Left            =   3360
      Style           =   1  'Graphical
      TabIndex        =   33
      Top             =   3480
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   400
      Index           =   48
      Left            =   3360
      Style           =   1  'Graphical
      TabIndex        =   40
      Top             =   3120
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   400
      Index           =   41
      Left            =   3360
      Style           =   1  'Graphical
      TabIndex        =   47
      Top             =   2760
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   400
      Index           =   34
      Left            =   3360
      Style           =   1  'Graphical
      TabIndex        =   54
      Top             =   2400
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   400
      Index           =   27
      Left            =   3360
      Style           =   1  'Graphical
      TabIndex        =   61
      Top             =   2040
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   400
      Index           =   20
      Left            =   3360
      Style           =   1  'Graphical
      TabIndex        =   68
      Top             =   1680
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   400
      Index           =   13
      Left            =   3360
      Style           =   1  'Graphical
      TabIndex        =   75
      Top             =   1320
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   400
      Index           =   6
      Left            =   3360
      Style           =   1  'Graphical
      TabIndex        =   82
      Top             =   960
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   400
      Index           =   68
      Left            =   2880
      Style           =   1  'Graphical
      TabIndex        =   20
      Top             =   4200
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   400
      Index           =   61
      Left            =   2880
      Style           =   1  'Graphical
      TabIndex        =   27
      Top             =   3840
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   400
      Index           =   54
      Left            =   2880
      Style           =   1  'Graphical
      TabIndex        =   34
      Top             =   3480
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   400
      Index           =   47
      Left            =   2880
      Style           =   1  'Graphical
      TabIndex        =   41
      Top             =   3120
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   400
      Index           =   40
      Left            =   2880
      Style           =   1  'Graphical
      TabIndex        =   48
      Top             =   2760
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   400
      Index           =   33
      Left            =   2880
      Style           =   1  'Graphical
      TabIndex        =   55
      Top             =   2400
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   400
      Index           =   26
      Left            =   2880
      Style           =   1  'Graphical
      TabIndex        =   62
      Top             =   2040
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   400
      Index           =   19
      Left            =   2880
      Style           =   1  'Graphical
      TabIndex        =   69
      Top             =   1680
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   400
      Index           =   12
      Left            =   2880
      Style           =   1  'Graphical
      TabIndex        =   76
      Top             =   1320
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   400
      Index           =   5
      Left            =   2880
      Style           =   1  'Graphical
      TabIndex        =   83
      Top             =   960
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   400
      Index           =   67
      Left            =   2400
      Style           =   1  'Graphical
      TabIndex        =   21
      Top             =   4200
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   400
      Index           =   60
      Left            =   2400
      Style           =   1  'Graphical
      TabIndex        =   28
      Top             =   3840
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   400
      Index           =   53
      Left            =   2400
      Style           =   1  'Graphical
      TabIndex        =   35
      Top             =   3480
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   400
      Index           =   46
      Left            =   2400
      Style           =   1  'Graphical
      TabIndex        =   42
      Top             =   3120
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   400
      Index           =   39
      Left            =   2400
      Style           =   1  'Graphical
      TabIndex        =   49
      Top             =   2760
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   400
      Index           =   32
      Left            =   2400
      Style           =   1  'Graphical
      TabIndex        =   56
      Top             =   2400
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   400
      Index           =   25
      Left            =   2400
      Style           =   1  'Graphical
      TabIndex        =   63
      Top             =   2040
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   400
      Index           =   18
      Left            =   2400
      Style           =   1  'Graphical
      TabIndex        =   70
      Top             =   1680
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   400
      Index           =   11
      Left            =   2400
      Style           =   1  'Graphical
      TabIndex        =   77
      Top             =   1320
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   400
      Index           =   4
      Left            =   2400
      Style           =   1  'Graphical
      TabIndex        =   84
      Top             =   960
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   400
      Index           =   66
      Left            =   1920
      Style           =   1  'Graphical
      TabIndex        =   22
      Top             =   4200
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   400
      Index           =   59
      Left            =   1920
      Style           =   1  'Graphical
      TabIndex        =   29
      Top             =   3840
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   400
      Index           =   52
      Left            =   1920
      Style           =   1  'Graphical
      TabIndex        =   36
      Top             =   3480
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   400
      Index           =   45
      Left            =   1920
      Style           =   1  'Graphical
      TabIndex        =   43
      Top             =   3120
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   400
      Index           =   38
      Left            =   1920
      Style           =   1  'Graphical
      TabIndex        =   50
      Top             =   2760
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   400
      Index           =   31
      Left            =   1920
      Style           =   1  'Graphical
      TabIndex        =   57
      Top             =   2400
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   400
      Index           =   24
      Left            =   1920
      Style           =   1  'Graphical
      TabIndex        =   64
      Top             =   2040
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   400
      Index           =   17
      Left            =   1920
      Style           =   1  'Graphical
      TabIndex        =   71
      Top             =   1680
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   400
      Index           =   10
      Left            =   1920
      Style           =   1  'Graphical
      TabIndex        =   78
      Top             =   1320
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   400
      Index           =   3
      Left            =   1920
      Style           =   1  'Graphical
      TabIndex        =   85
      Top             =   960
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   400
      Index           =   65
      Left            =   1440
      Style           =   1  'Graphical
      TabIndex        =   23
      Top             =   4200
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   400
      Index           =   58
      Left            =   1440
      Style           =   1  'Graphical
      TabIndex        =   30
      Top             =   3840
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   400
      Index           =   51
      Left            =   1440
      Style           =   1  'Graphical
      TabIndex        =   37
      Top             =   3480
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   400
      Index           =   44
      Left            =   1440
      Style           =   1  'Graphical
      TabIndex        =   44
      Top             =   3120
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   400
      Index           =   37
      Left            =   1440
      Style           =   1  'Graphical
      TabIndex        =   51
      Top             =   2760
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   400
      Index           =   30
      Left            =   1440
      Style           =   1  'Graphical
      TabIndex        =   58
      Top             =   2400
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   400
      Index           =   23
      Left            =   1440
      Style           =   1  'Graphical
      TabIndex        =   65
      Top             =   2040
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   400
      Index           =   16
      Left            =   1440
      Style           =   1  'Graphical
      TabIndex        =   72
      Top             =   1680
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   400
      Index           =   9
      Left            =   1440
      Style           =   1  'Graphical
      TabIndex        =   79
      Top             =   1320
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   400
      Index           =   2
      Left            =   1440
      Style           =   1  'Graphical
      TabIndex        =   86
      Top             =   960
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   400
      Index           =   64
      Left            =   960
      Style           =   1  'Graphical
      TabIndex        =   24
      Top             =   4200
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   400
      Index           =   57
      Left            =   960
      Style           =   1  'Graphical
      TabIndex        =   31
      Top             =   3840
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   400
      Index           =   50
      Left            =   960
      Style           =   1  'Graphical
      TabIndex        =   38
      Top             =   3480
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   400
      Index           =   43
      Left            =   960
      Style           =   1  'Graphical
      TabIndex        =   45
      Top             =   3120
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   400
      Index           =   36
      Left            =   960
      Style           =   1  'Graphical
      TabIndex        =   52
      Top             =   2760
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   400
      Index           =   29
      Left            =   960
      Style           =   1  'Graphical
      TabIndex        =   59
      Top             =   2400
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   400
      Index           =   22
      Left            =   960
      Style           =   1  'Graphical
      TabIndex        =   66
      Top             =   2040
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   400
      Index           =   15
      Left            =   960
      Style           =   1  'Graphical
      TabIndex        =   73
      Top             =   1680
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   400
      Index           =   8
      Left            =   960
      Style           =   1  'Graphical
      TabIndex        =   80
      Top             =   1320
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   400
      Index           =   1
      Left            =   960
      Style           =   1  'Graphical
      TabIndex        =   87
      Top             =   960
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   400
      Index           =   63
      Left            =   480
      Style           =   1  'Graphical
      TabIndex        =   25
      Top             =   4200
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   400
      Index           =   56
      Left            =   480
      Style           =   1  'Graphical
      TabIndex        =   32
      Top             =   3840
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   400
      Index           =   49
      Left            =   480
      Style           =   1  'Graphical
      TabIndex        =   39
      Top             =   3480
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   400
      Index           =   42
      Left            =   480
      Style           =   1  'Graphical
      TabIndex        =   46
      Top             =   3120
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   400
      Index           =   35
      Left            =   480
      Style           =   1  'Graphical
      TabIndex        =   53
      Top             =   2760
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   400
      Index           =   28
      Left            =   480
      Style           =   1  'Graphical
      TabIndex        =   60
      Top             =   2400
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   400
      Index           =   21
      Left            =   480
      Style           =   1  'Graphical
      TabIndex        =   67
      Top             =   2040
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   400
      Index           =   14
      Left            =   480
      Style           =   1  'Graphical
      TabIndex        =   74
      Top             =   1680
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   400
      Index           =   7
      Left            =   480
      Style           =   1  'Graphical
      TabIndex        =   81
      Top             =   1320
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   400
      Index           =   0
      Left            =   480
      Style           =   1  'Graphical
      TabIndex        =   88
      Top             =   960
      Width           =   500
   End
   Begin VB.ComboBox cboPer 
      BackColor       =   &H00FFFFFF&
      Height          =   315
      Left            =   1200
      Style           =   2  'Dropdown List
      TabIndex        =   0
      Top             =   120
      Width           =   2655
   End
   Begin VB.Label labComentario 
      BackStyle       =   0  'Transparent
      Caption         =   "Marque en casillas de verificación de la derecha y/o abajo para realizar lo siguiente:"
      Height          =   495
      Left            =   360
      TabIndex        =   126
      Top             =   5760
      Width           =   3735
   End
   Begin VB.Label lblValor 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Aplicar o a partir de"
      Height          =   390
      Left            =   360
      TabIndex        =   125
      Top             =   6240
      Width           =   885
      WordWrap        =   -1  'True
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "11"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   300
      Index           =   17
      Left            =   120
      TabIndex        =   104
      Top             =   4560
      Width           =   270
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "12"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   300
      Index           =   18
      Left            =   120
      TabIndex        =   103
      Top             =   4920
      Width           =   270
   End
   Begin VB.Line Line2 
      BorderColor     =   &H80000010&
      X1              =   -4440
      X2              =   4554
      Y1              =   7200
      Y2              =   7200
   End
   Begin VB.Line Line1 
      BorderColor     =   &H00FFFFFF&
      X1              =   -4440
      X2              =   4554
      Y1              =   7215
      Y2              =   7215
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "1"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   300
      Index           =   0
      Left            =   600
      TabIndex        =   18
      Top             =   600
      Width           =   135
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "2"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   300
      Index           =   1
      Left            =   1080
      TabIndex        =   17
      Top             =   600
      Width           =   135
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "3"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   300
      Index           =   2
      Left            =   1560
      TabIndex        =   16
      Top             =   600
      Width           =   135
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "4"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   300
      Index           =   3
      Left            =   2040
      TabIndex        =   15
      Top             =   600
      Width           =   135
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "5"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   300
      Index           =   4
      Left            =   2520
      TabIndex        =   14
      Top             =   600
      Width           =   135
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      BackColor       =   &H00FFC0C0&
      BackStyle       =   0  'Transparent
      Caption         =   "1"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   300
      Index           =   5
      Left            =   240
      TabIndex        =   13
      Top             =   960
      Width           =   135
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      BackColor       =   &H00FFC0C0&
      BackStyle       =   0  'Transparent
      Caption         =   "2"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   300
      Index           =   6
      Left            =   240
      TabIndex        =   12
      Top             =   1320
      Width           =   135
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      BackColor       =   &H00FFC0C0&
      BackStyle       =   0  'Transparent
      Caption         =   "3"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   300
      Index           =   7
      Left            =   240
      TabIndex        =   11
      Top             =   1680
      Width           =   135
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      BackColor       =   &H00FFC0C0&
      BackStyle       =   0  'Transparent
      Caption         =   "4"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   300
      Index           =   8
      Left            =   240
      TabIndex        =   10
      Top             =   2040
      Width           =   135
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      BackColor       =   &H00FFC0C0&
      BackStyle       =   0  'Transparent
      Caption         =   "5"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   300
      Index           =   9
      Left            =   240
      TabIndex        =   9
      Top             =   2400
      Width           =   135
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      BackColor       =   &H00FFC0C0&
      BackStyle       =   0  'Transparent
      Caption         =   "6"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   300
      Index           =   10
      Left            =   240
      TabIndex        =   8
      Top             =   2760
      Width           =   135
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      BackColor       =   &H00FFC0C0&
      BackStyle       =   0  'Transparent
      Caption         =   "Período"
      Height          =   195
      Left            =   480
      TabIndex        =   7
      Top             =   120
      Width           =   570
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "7"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   300
      Index           =   11
      Left            =   3480
      TabIndex        =   6
      Top             =   600
      Width           =   135
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "6"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   300
      Index           =   12
      Left            =   3000
      TabIndex        =   5
      Top             =   600
      Width           =   135
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      BackColor       =   &H00FFC0C0&
      BackStyle       =   0  'Transparent
      Caption         =   "7"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   300
      Index           =   13
      Left            =   240
      TabIndex        =   4
      Top             =   3120
      Width           =   135
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      BackColor       =   &H00FFC0C0&
      BackStyle       =   0  'Transparent
      Caption         =   "8"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   300
      Index           =   14
      Left            =   240
      TabIndex        =   3
      Top             =   3480
      Width           =   135
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      BackColor       =   &H00FFC0C0&
      BackStyle       =   0  'Transparent
      Caption         =   "9"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   300
      Index           =   15
      Left            =   240
      TabIndex        =   2
      Top             =   3840
      Width           =   135
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      BackColor       =   &H00FFC0C0&
      BackStyle       =   0  'Transparent
      Caption         =   "10"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   300
      Index           =   16
      Left            =   120
      TabIndex        =   1
      Top             =   4200
      Width           =   270
   End
End
Attribute VB_Name = "frmDatosZpriori"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"489BC22F033D"
Option Explicit
'Zonas de prioridad
'form
'Zonas de prioridad de las clasificaciones de actividades
Dim refre As Boolean
Dim mvarresultbutton As Integer
Dim coloresCasillas() As Long

Public Property Get getRefrescando() As Boolean
getRefrescando = refre
End Property

Public Property Let setRefrescando(ByVal value As Boolean)
refre = value
End Property

Public Property Get resultbutton() As Integer
resultbutton = mvarresultbutton
End Property

Public Property Let resultbutton(ByVal value As Integer)
mvarresultbutton = value
End Property

Private Sub cmdAplicarvalor_Click()
    Dim i As Long, j As Long
    For i = 1 To ancora.CD
        For j = 1 To ancora.ct
            If chkDias(i - 1).value = 1 And chkTurno(j - 1).value = 1 Then BotonesZPriori(i, j) = Val(txtValor.Text)
        Next
    Next
    NormalizarZpriori
End Sub

    Private Sub cmdCascadaDia_Click()
        Dim i As Long, j As Long, cascada As Long
        cascada = Val(txtValor.Text)
        For i = 1 To ancora.CD
            If chkDias(i - 1).value = 1 Then
                cascada = cascada + 1
                For j = 1 To ancora.ct
                    If chkTurno(j - 1).value = 1 Then BotonesZPriori(i, j) = cascada
                Next
            End If
        Next
        NormalizarZpriori
    End Sub

Private Sub cmdCascadaTurno_Click()
        Dim i As Long, j As Long, cascada As Long

        For i = 1 To ancora.CD
            If chkDias(i - 1).value = 1 Then
                cascada = Val(txtValor.Text)
                For j = 1 To ancora.ct
                    cascada = cascada + 1
                    If chkTurno(j - 1).value = 1 Then BotonesZPriori(i, j) = cascada
                Next
            End If
        Next
        NormalizarZpriori
End Sub

     Private Sub cmdOK_Click()
          SalvarPriori
          resultbutton = 1
          Hide
     End Sub

     Private Sub cmdCancel_Click()
          resultbutton = 2
          Hide
     End Sub

     Private Sub cboPer_Click()
          If refre = False Then
               SalvarPriori
               resultbutton = 3
               Hide
          End If
     End Sub

    Private Sub cmdRecolorear_Click()
        NormalizarZpriori
        recolorear
    End Sub

     Private Sub cmdRes_Click(index As Integer)
          Dim dia As Long, turno As Long
          index = index + 1
          turno = Int(((index - 1) / MAX_DIAS) + 1)
          dia = Int(index - (turno - 1) * MAX_DIAS)
          interface.SumaBotonesZpriori dia, turno
          redibuja
     End Sub

     Public Sub refresca()
          Dim i As Long, j As Long

          For i = 1 To MAX_DIAS

               For j = 1 To MAX_TURNOS
                    cmdRes(((j - 1) * MAX_DIAS + i) - 1).Enabled = False
                    cmdRes(((j - 1) * MAX_DIAS + i) - 1).BackColor = BackColor
                    cmdRes(((j - 1) * MAX_DIAS + i) - 1).Caption = ""
               Next

          Next

          For i = 1 To ancora.CD

               For j = 1 To ancora.ct
                    cmdRes(((j - 1) * MAX_DIAS + i) - 1).Enabled = True
                    cmdRes(((j - 1) * MAX_DIAS + i) - 1).BackColor = BackColor
               Next

          Next

          refre = True
          interface.fillCboPer cboPer

          cboPer.ListIndex = Trabajando_PerZpriori - 1
          refre = False
          redibuja
     End Sub

     Public Sub redibuja()
          Dim i As Long, turno As Long, dia As Long

          For i = 1 To MAX_DIAS * MAX_TURNOS
               turno = Int(((i - 1) / MAX_DIAS) + 1)
               dia = Int(i - (turno - 1) * MAX_DIAS)
               If dia <= ancora.CD And turno <= ancora.ct Then
                    With cmdRes(i - 1)
                     .Caption = Str(BotonesZPriori(dia, turno))
                     .BackColor = coloresCasillas(BotonesZPriori(dia, turno))
                    End With
               End If
          Next

     End Sub

     Public Sub SalvarPriori()
          Dim iper As Long, i As Long, j As Long

          With clasif(Trabajando_IdZpriori)
               iper = ancora.IndexRestZpriori(ancora.periodos(Trabajando_PerZpriori).id, Trabajando_IdZpriori)

               For i = 1 To ancora.CD

                    For j = 1 To ancora.ct
                         .zpriori(iper).rest(i, j) = BotonesZPriori(i, j)
                    Next

               Next

          End With

     End Sub

    Sub recolorear()
        Dim i As Long
        ReDim coloresCasillas(MAX_DIAS * MAX_TURNOS)
        Randomize Timer
        For i = 1 To MAX_DIAS * MAX_TURNOS
            coloresCasillas(i) = RGB(50 + Int(Rnd * 200), 50 + Int(Rnd * 200), 50 + Int(Rnd * 200))
        Next
        refresca
    End Sub
    Sub go()
        recolorear
        Show vbModal
    End Sub

Private Sub cmdRes_LostFocus(index As Integer)
    cmdRes(index).BackColor = coloresCasillas(Val(cmdRes(index).Caption))
End Sub

Private Sub cmdRes_MouseMove(index As Integer, Button As Integer, Shift As Integer, x As Single, y As Single)
cmdRes(index).SetFocus
cmdRes(index).BackColor = vbWhite
End Sub

Private Sub chkTodosDias_Click()
    Dim i As Long
    For i = 1 To chkDias.Count
        chkDias(i - 1).value = chkTodosDias.value
    Next
End Sub

    Private Sub chkTodosDiasTurnos_Click()
        chkTodosTurnos.value = chkTodosDiasTurnos.value
        chkTodosDias.value = chkTodosDiasTurnos.value
    End Sub

Private Sub chkTodosTurnos_Click()
    Dim i As Long
    For i = 1 To chkTurno.Count
        chkTurno(i - 1).value = chkTodosTurnos.value
    Next
End Sub

Private Sub Form_Load()
    interface.SkinFor Me
End Sub

Private Sub Form_Terminate()
    If resultbutton = 0 Then resultbutton = 2
End Sub

Private Sub txtValor_KeyPress(KeyAscii As Integer)
    If KeyAscii < Asc("0") Or KeyAscii > Asc("9") And KeyAscii <> 8 Then
        KeyAscii = 0
    End If
End Sub

Private Sub txtValor_Validate(Cancel As Boolean)
    Dim max As Long
    max = interface.DameMaxZPrioriEnBotones + 1
    If Val(txtValor.Text) > max Then
        interface.MessageDlg "Valor no válido", "El máximo valor a ubicar es " & max, vbCritical, "Aceptar"
        Cancel = True
    End If
End Sub

    Public Function NormalizarZpriori()

    Dim max As Long
    Dim min As Long
    Dim i As Long, j As Long, k As Long
    max = interface.DameMaxZPrioriEnBotones

    For i = 1 To max
        min = max + 1

        For j = 1 To ancora.CD
            For k = 1 To ancora.ct
                If BotonesZPriori(j, k) < min And BotonesZPriori(j, k) >= i Then min = BotonesZPriori(j, k)
            Next
        Next

        For j = 1 To ancora.CD
            For k = 1 To ancora.ct
                If BotonesZPriori(j, k) = min Then BotonesZPriori(j, k) = i
            Next
        Next
    Next

    redibuja
    End Function

    
