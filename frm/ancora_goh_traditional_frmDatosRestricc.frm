VERSION 5.00
Begin VB.Form frmDatosRestricc 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Restricciones"
   ClientHeight    =   6375
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   4485
   Icon            =   "ancora_goh_traditional_frmDatosRestricc.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   6375
   ScaleWidth      =   4485
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Visible         =   0   'False
   Begin VB.CommandButton Command3 
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
      Left            =   3240
      TabIndex        =   128
      Top             =   5880
      Width           =   1095
   End
   Begin VB.CommandButton Command1 
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
      Left            =   2040
      TabIndex        =   127
      Top             =   5880
      Width           =   1095
   End
   Begin VB.CommandButton cmdEntireTurno 
      Height          =   255
      Index           =   11
      Left            =   4080
      TabIndex        =   124
      ToolTipText     =   "Seleccionar/invertir selección en la fila"
      Top             =   4920
      Width           =   255
   End
   Begin VB.CommandButton cmdEntireTurno 
      Height          =   255
      Index           =   10
      Left            =   4080
      TabIndex        =   123
      ToolTipText     =   "Seleccionar/invertir selección en la fila"
      Top             =   4560
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
      TabIndex        =   122
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
      TabIndex        =   121
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
      TabIndex        =   120
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
      TabIndex        =   119
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
      TabIndex        =   118
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
      TabIndex        =   117
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
      TabIndex        =   116
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
      TabIndex        =   115
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
      TabIndex        =   114
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
      TabIndex        =   113
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
      TabIndex        =   112
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
      TabIndex        =   111
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
      TabIndex        =   110
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
      TabIndex        =   109
      Top             =   4560
      Width           =   500
   End
   Begin VB.CommandButton cmdEmpty 
      Height          =   255
      Left            =   4080
      TabIndex        =   108
      Top             =   480
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.CommandButton cmdEntireDia 
      Height          =   255
      Index           =   6
      Left            =   3480
      TabIndex        =   107
      ToolTipText     =   "Seleccionar/invertir selección en la columna"
      Top             =   5400
      Width           =   255
   End
   Begin VB.CommandButton cmdEntireDia 
      Height          =   255
      Index           =   5
      Left            =   3000
      TabIndex        =   106
      ToolTipText     =   "Seleccionar/invertir selección en la columna"
      Top             =   5400
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
      Index           =   69
      Left            =   3360
      Style           =   1  'Graphical
      TabIndex        =   105
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
      Index           =   68
      Left            =   2880
      Style           =   1  'Graphical
      TabIndex        =   104
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
      Index           =   67
      Left            =   2400
      Style           =   1  'Graphical
      TabIndex        =   103
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
      Index           =   66
      Left            =   1920
      Style           =   1  'Graphical
      TabIndex        =   102
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
      Index           =   65
      Left            =   1440
      Style           =   1  'Graphical
      TabIndex        =   101
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
      Index           =   64
      Left            =   960
      Style           =   1  'Graphical
      TabIndex        =   100
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
      Index           =   63
      Left            =   480
      Style           =   1  'Graphical
      TabIndex        =   99
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
      TabIndex        =   98
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
      Index           =   61
      Left            =   2880
      Style           =   1  'Graphical
      TabIndex        =   97
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
      Index           =   60
      Left            =   2400
      Style           =   1  'Graphical
      TabIndex        =   96
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
      Index           =   59
      Left            =   1920
      Style           =   1  'Graphical
      TabIndex        =   95
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
      Index           =   58
      Left            =   1440
      Style           =   1  'Graphical
      TabIndex        =   94
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
      Index           =   57
      Left            =   960
      Style           =   1  'Graphical
      TabIndex        =   93
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
      Index           =   56
      Left            =   480
      Style           =   1  'Graphical
      TabIndex        =   92
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
      TabIndex        =   87
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
      Index           =   54
      Left            =   2880
      Style           =   1  'Graphical
      TabIndex        =   86
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
      Index           =   53
      Left            =   2400
      Style           =   1  'Graphical
      TabIndex        =   85
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
      Index           =   52
      Left            =   1920
      Style           =   1  'Graphical
      TabIndex        =   84
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
      Index           =   51
      Left            =   1440
      Style           =   1  'Graphical
      TabIndex        =   83
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
      Index           =   50
      Left            =   960
      Style           =   1  'Graphical
      TabIndex        =   82
      Top             =   3480
      Width           =   500
   End
   Begin VB.CommandButton cmdEntireTurno 
      Height          =   255
      Index           =   9
      Left            =   4080
      TabIndex        =   79
      ToolTipText     =   "Seleccionar/invertir selección en la fila"
      Top             =   4200
      Width           =   255
   End
   Begin VB.CommandButton cmdEntireTurno 
      Height          =   255
      Index           =   8
      Left            =   4080
      TabIndex        =   78
      ToolTipText     =   "Seleccionar/invertir selección en la fila"
      Top             =   3840
      Width           =   255
   End
   Begin VB.CommandButton cmdEntireTurno 
      Height          =   255
      Index           =   7
      Left            =   4080
      TabIndex        =   77
      ToolTipText     =   "Seleccionar/invertir selección en la fila"
      Top             =   3480
      Width           =   255
   End
   Begin VB.CommandButton cmdEntireTurno 
      Height          =   255
      Index           =   6
      Left            =   4080
      TabIndex        =   76
      ToolTipText     =   "Seleccionar/invertir selección en la fila"
      Top             =   3120
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
      Index           =   49
      Left            =   480
      Style           =   1  'Graphical
      TabIndex        =   75
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
      TabIndex        =   74
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
      Index           =   47
      Left            =   2880
      Style           =   1  'Graphical
      TabIndex        =   73
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
      Index           =   46
      Left            =   2400
      Style           =   1  'Graphical
      TabIndex        =   72
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
      Index           =   45
      Left            =   1920
      Style           =   1  'Graphical
      TabIndex        =   71
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
      Index           =   44
      Left            =   1440
      Style           =   1  'Graphical
      TabIndex        =   70
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
      Index           =   43
      Left            =   960
      Style           =   1  'Graphical
      TabIndex        =   69
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
      Index           =   42
      Left            =   480
      Style           =   1  'Graphical
      TabIndex        =   68
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
      TabIndex        =   67
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
      Index           =   40
      Left            =   2880
      Style           =   1  'Graphical
      TabIndex        =   66
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
      Index           =   39
      Left            =   2400
      Style           =   1  'Graphical
      TabIndex        =   65
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
      Index           =   38
      Left            =   1920
      Style           =   1  'Graphical
      TabIndex        =   64
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
      Index           =   37
      Left            =   1440
      Style           =   1  'Graphical
      TabIndex        =   63
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
      Index           =   36
      Left            =   960
      Style           =   1  'Graphical
      TabIndex        =   62
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
      Index           =   35
      Left            =   480
      Style           =   1  'Graphical
      TabIndex        =   61
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
      Index           =   33
      Left            =   2880
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
      Index           =   32
      Left            =   2400
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
      Index           =   30
      Left            =   1440
      Style           =   1  'Graphical
      TabIndex        =   56
      Top             =   2400
      Width           =   500
   End
   Begin VB.CommandButton cmdEntireDia 
      Height          =   255
      Index           =   4
      Left            =   2520
      TabIndex        =   55
      ToolTipText     =   "Seleccionar/invertir selección en la columna"
      Top             =   5400
      Width           =   255
   End
   Begin VB.CommandButton cmdEntireDia 
      Height          =   255
      Index           =   3
      Left            =   2040
      TabIndex        =   54
      ToolTipText     =   "Seleccionar/invertir selección en la columna"
      Top             =   5400
      Width           =   255
   End
   Begin VB.CommandButton cmdEntireDia 
      Height          =   255
      Index           =   2
      Left            =   1560
      TabIndex        =   53
      ToolTipText     =   "Seleccionar/invertir selección en la columna"
      Top             =   5400
      Width           =   255
   End
   Begin VB.CommandButton cmdEntireDia 
      Height          =   255
      Index           =   1
      Left            =   1080
      TabIndex        =   52
      ToolTipText     =   "Seleccionar/invertir selección en la columna"
      Top             =   5400
      Width           =   255
   End
   Begin VB.CommandButton cmdEntireDia 
      Height          =   255
      Index           =   0
      Left            =   600
      TabIndex        =   51
      ToolTipText     =   "Seleccionar/invertir selección en la columna"
      Top             =   5400
      Width           =   255
   End
   Begin VB.CommandButton cmdEntireTurno 
      Height          =   255
      Index           =   5
      Left            =   4080
      TabIndex        =   50
      ToolTipText     =   "Seleccionar/invertir selección en la fila"
      Top             =   2760
      Width           =   255
   End
   Begin VB.CommandButton cmdEntireTurno 
      Height          =   255
      Index           =   4
      Left            =   4080
      TabIndex        =   49
      ToolTipText     =   "Seleccionar/invertir selección en la fila"
      Top             =   2400
      Width           =   255
   End
   Begin VB.CommandButton cmdEntireTurno 
      Height          =   255
      Index           =   3
      Left            =   4080
      TabIndex        =   48
      ToolTipText     =   "Seleccionar/invertir selección en la fila"
      Top             =   2040
      Width           =   255
   End
   Begin VB.CommandButton cmdEntireTurno 
      Height          =   255
      Index           =   2
      Left            =   4080
      TabIndex        =   47
      ToolTipText     =   "Seleccionar/invertir selección en la fila"
      Top             =   1680
      Width           =   255
   End
   Begin VB.CommandButton cmdEntireTurno 
      Height          =   255
      Index           =   1
      Left            =   4080
      TabIndex        =   46
      ToolTipText     =   "Seleccionar/invertir selección en la fila"
      Top             =   1320
      Width           =   255
   End
   Begin VB.CommandButton cmdEntireTurno 
      Height          =   255
      Index           =   0
      Left            =   4080
      TabIndex        =   45
      ToolTipText     =   "Seleccionar/invertir selección en la fila"
      Top             =   960
      Width           =   255
   End
   Begin VB.ComboBox cboPer 
      Height          =   315
      Left            =   840
      Style           =   2  'Dropdown List
      TabIndex        =   43
      Top             =   120
      Width           =   3015
   End
   Begin VB.CommandButton cmdZpriori 
      Height          =   255
      Left            =   3840
      Picture         =   "ancora_goh_traditional_frmDatosRestricc.frx":1CCA
      Style           =   1  'Graphical
      TabIndex        =   42
      Top             =   120
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.CommandButton cmdRestricc 
      Height          =   255
      Left            =   4080
      Picture         =   "ancora_goh_traditional_frmDatosRestricc.frx":2019
      Style           =   1  'Graphical
      TabIndex        =   41
      Top             =   120
      Visible         =   0   'False
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
      Index           =   29
      Left            =   960
      Style           =   1  'Graphical
      TabIndex        =   29
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
      Index           =   28
      Left            =   480
      Style           =   1  'Graphical
      TabIndex        =   28
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
      TabIndex        =   27
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
      Index           =   26
      Left            =   2880
      Style           =   1  'Graphical
      TabIndex        =   26
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
      Index           =   25
      Left            =   2400
      Style           =   1  'Graphical
      TabIndex        =   25
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
      Index           =   24
      Left            =   1920
      Style           =   1  'Graphical
      TabIndex        =   24
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
      Index           =   23
      Left            =   1440
      Style           =   1  'Graphical
      TabIndex        =   23
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
      Index           =   22
      Left            =   960
      Style           =   1  'Graphical
      TabIndex        =   22
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
      Index           =   21
      Left            =   480
      Style           =   1  'Graphical
      TabIndex        =   21
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
      TabIndex        =   20
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
      Index           =   19
      Left            =   2880
      Style           =   1  'Graphical
      TabIndex        =   19
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
      Index           =   18
      Left            =   2400
      Style           =   1  'Graphical
      TabIndex        =   18
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
      Index           =   17
      Left            =   1920
      Style           =   1  'Graphical
      TabIndex        =   17
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
      Index           =   16
      Left            =   1440
      Style           =   1  'Graphical
      TabIndex        =   16
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
      Index           =   15
      Left            =   960
      Style           =   1  'Graphical
      TabIndex        =   15
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
      Index           =   14
      Left            =   480
      Style           =   1  'Graphical
      TabIndex        =   14
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
      TabIndex        =   13
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
      Index           =   12
      Left            =   2880
      Style           =   1  'Graphical
      TabIndex        =   12
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
      Index           =   11
      Left            =   2400
      Style           =   1  'Graphical
      TabIndex        =   11
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
      Index           =   10
      Left            =   1920
      Style           =   1  'Graphical
      TabIndex        =   10
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
      Index           =   9
      Left            =   1440
      Style           =   1  'Graphical
      TabIndex        =   9
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
      Index           =   8
      Left            =   960
      Style           =   1  'Graphical
      TabIndex        =   8
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
      Index           =   7
      Left            =   480
      Style           =   1  'Graphical
      TabIndex        =   7
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
      TabIndex        =   6
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
      Index           =   5
      Left            =   2880
      Style           =   1  'Graphical
      TabIndex        =   5
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
      Index           =   4
      Left            =   2400
      Style           =   1  'Graphical
      TabIndex        =   4
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
      Index           =   3
      Left            =   1920
      Style           =   1  'Graphical
      TabIndex        =   3
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
      Index           =   2
      Left            =   1440
      Style           =   1  'Graphical
      TabIndex        =   2
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
      Index           =   1
      Left            =   960
      Style           =   1  'Graphical
      TabIndex        =   1
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
      Index           =   0
      Left            =   480
      Style           =   1  'Graphical
      TabIndex        =   0
      Top             =   960
      Width           =   500
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
      TabIndex        =   126
      Top             =   4920
      Width           =   270
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
      TabIndex        =   125
      Top             =   4560
      Width           =   270
   End
   Begin VB.Line Line2 
      BorderColor     =   &H80000010&
      X1              =   -360
      X2              =   4680
      Y1              =   5760
      Y2              =   5760
   End
   Begin VB.Line Line1 
      BorderColor     =   &H00FFFFFF&
      X1              =   4680
      X2              =   -360
      Y1              =   5775
      Y2              =   5775
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
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
      TabIndex        =   91
      Top             =   4200
      Width           =   270
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
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
      TabIndex        =   90
      Top             =   3840
      Width           =   135
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
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
      TabIndex        =   89
      Top             =   3480
      Width           =   135
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
      Index           =   13
      Left            =   240
      TabIndex        =   88
      Top             =   3120
      Width           =   135
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Sab"
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
      Left            =   2880
      TabIndex        =   81
      Top             =   600
      Width           =   435
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Dom"
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
      Left            =   3360
      TabIndex        =   80
      Top             =   600
      Width           =   510
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Periodo"
      Height          =   195
      Left            =   120
      TabIndex        =   44
      Top             =   120
      Width           =   540
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
      Index           =   10
      Left            =   240
      TabIndex        =   40
      Top             =   2760
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
      Index           =   9
      Left            =   240
      TabIndex        =   39
      Top             =   2400
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
      Index           =   8
      Left            =   240
      TabIndex        =   38
      Top             =   2040
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
      Index           =   7
      Left            =   240
      TabIndex        =   37
      Top             =   1680
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
      Index           =   6
      Left            =   240
      TabIndex        =   36
      Top             =   1320
      Width           =   135
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
      Index           =   5
      Left            =   240
      TabIndex        =   35
      Top             =   960
      Width           =   135
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Vie"
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
      Left            =   2400
      TabIndex        =   34
      Top             =   600
      Width           =   345
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Jue"
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
      Left            =   1920
      TabIndex        =   33
      Top             =   600
      Width           =   390
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Mie"
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
      Left            =   1440
      TabIndex        =   32
      Top             =   600
      Width           =   375
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Mar"
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
      Left            =   960
      TabIndex        =   31
      Top             =   600
      Width           =   405
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Lun"
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
      Left            =   480
      TabIndex        =   30
      Top             =   600
      Width           =   405
   End
End
Attribute VB_Name = "frmDatosRestricc"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"489BC1E702B7"
Option Explicit
'Form Restricciones en tiempo de los objetos

Private refre As Boolean
Private mvarresultbutton As Integer
Private mvarmodo As Integer

Public Property Get getModo() As Integer
getModo = mvarmodo
End Property

Public Property Let setModo(ByVal value As Integer)
mvarmodo = value
End Property

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

Private Sub Command1_Click()
    resultbutton = 1
    Hide
End Sub

Private Sub Command3_Click()
    resultbutton = 2
    Hide
End Sub

Private Sub cboPer_Click()
    On Error Resume Next
    If refre = False Then
        resultbutton = 0
        Hide
    End If

End Sub

Private Sub cmdEntireDia_Click(Index As Integer)
    Dim i As Long

    For i = 1 To MAX_TURNOS
        If cmdRes((i - 1) * MAX_DIAS + (Index)).Enabled Then cmdRes_Click (i - 1) * MAX_DIAS + (Index)
    Next

End Sub

Private Sub cmdEntireTurno_Click(Index As Integer)
    Dim i As Long

    For i = 1 To MAX_DIAS
        If cmdRes((Index) * MAX_DIAS + (i - 1)).Enabled Then cmdRes_Click (Index) * MAX_DIAS + (i - 1)
    Next

End Sub

Private Sub cmdRes_Click(Index As Integer)
    Dim dia As Long, turno As Long
    Index = Index + 1
    turno = Int(((Index - 1) / MAX_DIAS) + 1)
    dia = Int(Index - (turno - 1) * MAX_DIAS)
    If BotonesRestriccion(dia, turno) Then
        cmdRes(Index - 1).Picture = cmdEmpty.Picture
        BotonesRestriccion(dia, turno) = False
    Else
        If getModo <> 6 Then
            cmdRes(Index - 1).Picture = cmdRestricc.Picture
        Else
            cmdRes(Index - 1).Picture = cmdZpriori.Picture
        End If

        BotonesRestriccion(dia, turno) = True
    End If

End Sub

Public Sub redibuja()
    Dim i As Long, turno As Long, dia As Long

    For i = 1 To MAX_DIAS * MAX_TURNOS
        turno = Int(((i - 1) / MAX_DIAS) + 1)
        dia = Int(i - (turno - 1) * MAX_DIAS)
        If BotonesRestriccion(dia, turno) = False Then
            cmdRes(i - 1).Picture = cmdEmpty.Picture
        Else
            If getModo <> 6 Then cmdRes(i - 1).Picture = cmdRestricc.Picture
            If getModo = 6 Then cmdRes(i - 1).Picture = cmdZpriori.Picture
        End If

        If Inhabil(dia, turno) Then
            cmdRes(i - 1).Enabled = False
            cmdRes(i - 1).BackColor = RGB(100 + Int(Rnd * 155), 100 + Int(Rnd * 155), 100 + Int(Rnd * 155))
            cmdRes(i - 1).Picture = cmdEmpty.Picture
        End If

    Next

End Sub

Public Sub refresca()
    Dim i As Long, j As Long

    For i = 1 To MAX_DIAS

        For j = 1 To MAX_TURNOS
            cmdRes(((j - 1) * MAX_DIAS + i) - 1).Enabled = False
            cmdRes(((j - 1) * MAX_DIAS + i) - 1).BackColor = &H808080
        Next

    Next

    For i = 1 To ancora.CD

        For j = 1 To ancora.ct
            cmdRes(((j - 1) * MAX_DIAS + i) - 1).Enabled = True
            cmdRes(((j - 1) * MAX_DIAS + i) - 1).BackColor = &HE0E0E0
        Next

    Next

    redibuja
End Sub


Private Sub Form_Load()
    interface.SkinFor Me
End Sub

Private Sub Form_Terminate()
    If resultbutton = 0 Then resultbutton = 2
End Sub


