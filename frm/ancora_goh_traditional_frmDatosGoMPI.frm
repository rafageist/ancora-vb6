VERSION 5.00
Begin VB.Form frmDatosGoMPI 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Cambio de turno, profesor y/o lugar"
   ClientHeight    =   7260
   ClientLeft      =   150
   ClientTop       =   450
   ClientWidth     =   4050
   ForeColor       =   &H00400000&
   Icon            =   "ancora_goh_traditional_frmDatosGoMPI.frx":0000
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   7260
   ScaleWidth      =   4050
   ShowInTaskbar   =   0   'False
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
      Left            =   2760
      TabIndex        =   113
      Top             =   6720
      Width           =   1095
   End
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
      Left            =   1440
      TabIndex        =   112
      Top             =   6720
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
      Left            =   120
      TabIndex        =   111
      Top             =   6720
      Width           =   1215
   End
   Begin VB.CommandButton cmdRes 
      Height          =   400
      Index           =   77
      Left            =   3240
      Style           =   1  'Graphical
      TabIndex        =   103
      Top             =   4800
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      Height          =   400
      Index           =   78
      Left            =   2760
      Style           =   1  'Graphical
      TabIndex        =   104
      Top             =   4800
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      Height          =   400
      Index           =   79
      Left            =   2280
      Style           =   1  'Graphical
      TabIndex        =   105
      Top             =   4800
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      Height          =   400
      Index           =   80
      Left            =   1800
      Style           =   1  'Graphical
      TabIndex        =   106
      Top             =   4800
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      Height          =   400
      Index           =   81
      Left            =   1320
      Style           =   1  'Graphical
      TabIndex        =   107
      Top             =   4800
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      Height          =   400
      Index           =   82
      Left            =   840
      Style           =   1  'Graphical
      TabIndex        =   108
      Top             =   4800
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      Height          =   400
      Index           =   83
      Left            =   360
      Style           =   1  'Graphical
      TabIndex        =   109
      Top             =   4800
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      Height          =   400
      Index           =   76
      Left            =   3240
      Style           =   1  'Graphical
      TabIndex        =   101
      Top             =   4440
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      Height          =   400
      Index           =   75
      Left            =   2760
      Style           =   1  'Graphical
      TabIndex        =   100
      Top             =   4440
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      Height          =   400
      Index           =   74
      Left            =   2280
      Style           =   1  'Graphical
      TabIndex        =   99
      Top             =   4440
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      Height          =   400
      Index           =   73
      Left            =   1800
      Style           =   1  'Graphical
      TabIndex        =   98
      Top             =   4440
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      Height          =   400
      Index           =   72
      Left            =   1320
      Style           =   1  'Graphical
      TabIndex        =   97
      Top             =   4440
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      Height          =   400
      Index           =   71
      Left            =   840
      Style           =   1  'Graphical
      TabIndex        =   96
      Top             =   4440
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      Height          =   400
      Index           =   70
      Left            =   360
      Style           =   1  'Graphical
      TabIndex        =   95
      Top             =   4440
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      Height          =   400
      Index           =   69
      Left            =   3240
      Style           =   1  'Graphical
      TabIndex        =   6
      Top             =   4080
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      Height          =   400
      Index           =   68
      Left            =   2760
      Style           =   1  'Graphical
      TabIndex        =   7
      Top             =   4080
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      Height          =   400
      Index           =   67
      Left            =   2280
      Style           =   1  'Graphical
      TabIndex        =   8
      Top             =   4080
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      Height          =   400
      Index           =   66
      Left            =   1800
      Style           =   1  'Graphical
      TabIndex        =   9
      Top             =   4080
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      Height          =   400
      Index           =   65
      Left            =   1320
      Style           =   1  'Graphical
      TabIndex        =   10
      Top             =   4080
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      Height          =   400
      Index           =   64
      Left            =   840
      Style           =   1  'Graphical
      TabIndex        =   11
      Top             =   4080
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      Height          =   400
      Index           =   63
      Left            =   360
      Style           =   1  'Graphical
      TabIndex        =   12
      Top             =   4080
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      Height          =   400
      Index           =   62
      Left            =   3240
      Style           =   1  'Graphical
      TabIndex        =   13
      Top             =   3720
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      Height          =   400
      Index           =   61
      Left            =   2760
      Style           =   1  'Graphical
      TabIndex        =   14
      Top             =   3720
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      Height          =   400
      Index           =   60
      Left            =   2280
      Style           =   1  'Graphical
      TabIndex        =   15
      Top             =   3720
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      Height          =   400
      Index           =   59
      Left            =   1800
      Style           =   1  'Graphical
      TabIndex        =   16
      Top             =   3720
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      Height          =   400
      Index           =   58
      Left            =   1320
      Style           =   1  'Graphical
      TabIndex        =   17
      Top             =   3720
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      Height          =   400
      Index           =   57
      Left            =   840
      Style           =   1  'Graphical
      TabIndex        =   18
      Top             =   3720
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      Height          =   400
      Index           =   56
      Left            =   360
      Style           =   1  'Graphical
      TabIndex        =   19
      Top             =   3720
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      Height          =   400
      Index           =   55
      Left            =   3240
      Style           =   1  'Graphical
      TabIndex        =   20
      Top             =   3360
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      Height          =   400
      Index           =   54
      Left            =   2760
      Style           =   1  'Graphical
      TabIndex        =   21
      Top             =   3360
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      Height          =   400
      Index           =   53
      Left            =   2280
      Style           =   1  'Graphical
      TabIndex        =   22
      Top             =   3360
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      Height          =   400
      Index           =   52
      Left            =   1800
      Style           =   1  'Graphical
      TabIndex        =   23
      Top             =   3360
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      Height          =   400
      Index           =   51
      Left            =   1320
      Style           =   1  'Graphical
      TabIndex        =   24
      Top             =   3360
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      Height          =   400
      Index           =   50
      Left            =   840
      Style           =   1  'Graphical
      TabIndex        =   25
      Top             =   3360
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      Height          =   400
      Index           =   49
      Left            =   360
      Style           =   1  'Graphical
      TabIndex        =   26
      Top             =   3360
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      Height          =   400
      Index           =   48
      Left            =   3240
      Style           =   1  'Graphical
      TabIndex        =   27
      Top             =   3000
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      Height          =   400
      Index           =   47
      Left            =   2760
      Style           =   1  'Graphical
      TabIndex        =   28
      Top             =   3000
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      Height          =   400
      Index           =   46
      Left            =   2280
      Style           =   1  'Graphical
      TabIndex        =   29
      Top             =   3000
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      Height          =   400
      Index           =   45
      Left            =   1800
      Style           =   1  'Graphical
      TabIndex        =   30
      Top             =   3000
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      Height          =   400
      Index           =   44
      Left            =   1320
      Style           =   1  'Graphical
      TabIndex        =   31
      Top             =   3000
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      Height          =   400
      Index           =   43
      Left            =   840
      Style           =   1  'Graphical
      TabIndex        =   32
      Top             =   3000
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      Height          =   400
      Index           =   42
      Left            =   360
      Style           =   1  'Graphical
      TabIndex        =   33
      Top             =   3000
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      Height          =   400
      Index           =   41
      Left            =   3240
      Style           =   1  'Graphical
      TabIndex        =   34
      Top             =   2640
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      Height          =   400
      Index           =   40
      Left            =   2760
      Style           =   1  'Graphical
      TabIndex        =   35
      Top             =   2640
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      Height          =   400
      Index           =   39
      Left            =   2280
      Style           =   1  'Graphical
      TabIndex        =   36
      Top             =   2640
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      Height          =   400
      Index           =   38
      Left            =   1800
      Style           =   1  'Graphical
      TabIndex        =   37
      Top             =   2640
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      Height          =   400
      Index           =   37
      Left            =   1320
      Style           =   1  'Graphical
      TabIndex        =   38
      Top             =   2640
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      Height          =   400
      Index           =   36
      Left            =   840
      Style           =   1  'Graphical
      TabIndex        =   39
      Top             =   2640
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      Height          =   400
      Index           =   34
      Left            =   3240
      Style           =   1  'Graphical
      TabIndex        =   41
      Top             =   2280
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      Height          =   400
      Index           =   27
      Left            =   3240
      Style           =   1  'Graphical
      TabIndex        =   48
      Top             =   1920
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      Height          =   400
      Index           =   33
      Left            =   2760
      Style           =   1  'Graphical
      TabIndex        =   42
      Top             =   2280
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      Height          =   400
      Index           =   32
      Left            =   2280
      Style           =   1  'Graphical
      TabIndex        =   43
      Top             =   2280
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      Height          =   400
      Index           =   31
      Left            =   1800
      Style           =   1  'Graphical
      TabIndex        =   44
      Top             =   2280
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      Height          =   400
      Index           =   30
      Left            =   1320
      Style           =   1  'Graphical
      TabIndex        =   45
      Top             =   2280
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      Height          =   400
      Index           =   35
      Left            =   360
      Style           =   1  'Graphical
      TabIndex        =   40
      Top             =   2640
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      Height          =   400
      Index           =   29
      Left            =   840
      Style           =   1  'Graphical
      TabIndex        =   46
      Top             =   2280
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      Height          =   400
      Index           =   28
      Left            =   360
      Style           =   1  'Graphical
      TabIndex        =   47
      Top             =   2280
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      Height          =   400
      Index           =   26
      Left            =   2760
      Style           =   1  'Graphical
      TabIndex        =   49
      Top             =   1920
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      Height          =   400
      Index           =   25
      Left            =   2280
      Style           =   1  'Graphical
      TabIndex        =   50
      Top             =   1920
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      Height          =   400
      Index           =   24
      Left            =   1800
      Style           =   1  'Graphical
      TabIndex        =   51
      Top             =   1920
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      Height          =   400
      Index           =   23
      Left            =   1320
      Style           =   1  'Graphical
      TabIndex        =   52
      Top             =   1920
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      Height          =   400
      Index           =   22
      Left            =   840
      Style           =   1  'Graphical
      TabIndex        =   53
      Top             =   1920
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      Height          =   400
      Index           =   21
      Left            =   360
      Style           =   1  'Graphical
      TabIndex        =   54
      Top             =   1920
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      Height          =   400
      Index           =   20
      Left            =   3240
      Style           =   1  'Graphical
      TabIndex        =   55
      Top             =   1560
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      Height          =   400
      Index           =   19
      Left            =   2760
      Style           =   1  'Graphical
      TabIndex        =   56
      Top             =   1560
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      Height          =   400
      Index           =   18
      Left            =   2280
      Style           =   1  'Graphical
      TabIndex        =   57
      Top             =   1560
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      Height          =   400
      Index           =   17
      Left            =   1800
      Style           =   1  'Graphical
      TabIndex        =   58
      Top             =   1560
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      Height          =   400
      Index           =   16
      Left            =   1320
      Style           =   1  'Graphical
      TabIndex        =   59
      Top             =   1560
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      Height          =   400
      Index           =   15
      Left            =   840
      Style           =   1  'Graphical
      TabIndex        =   60
      Top             =   1560
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      Height          =   400
      Index           =   14
      Left            =   360
      Style           =   1  'Graphical
      TabIndex        =   61
      Top             =   1560
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      Height          =   400
      Index           =   13
      Left            =   3240
      Style           =   1  'Graphical
      TabIndex        =   62
      Top             =   1200
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      Height          =   400
      Index           =   12
      Left            =   2760
      Style           =   1  'Graphical
      TabIndex        =   63
      Top             =   1200
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      Height          =   400
      Index           =   11
      Left            =   2280
      Style           =   1  'Graphical
      TabIndex        =   64
      Top             =   1200
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      Height          =   400
      Index           =   10
      Left            =   1800
      Style           =   1  'Graphical
      TabIndex        =   65
      Top             =   1200
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      Height          =   400
      Index           =   9
      Left            =   1320
      Style           =   1  'Graphical
      TabIndex        =   66
      Top             =   1200
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      Height          =   400
      Index           =   8
      Left            =   840
      Style           =   1  'Graphical
      TabIndex        =   67
      Top             =   1200
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      Height          =   400
      Index           =   6
      Left            =   3240
      Style           =   1  'Graphical
      TabIndex        =   69
      Top             =   840
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      Height          =   400
      Index           =   5
      Left            =   2760
      Style           =   1  'Graphical
      TabIndex        =   70
      Top             =   840
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      Height          =   400
      Index           =   4
      Left            =   2280
      Style           =   1  'Graphical
      TabIndex        =   71
      Top             =   840
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      Height          =   400
      Index           =   3
      Left            =   1800
      Style           =   1  'Graphical
      TabIndex        =   72
      Top             =   840
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      Height          =   400
      Index           =   2
      Left            =   1320
      Style           =   1  'Graphical
      TabIndex        =   73
      Top             =   840
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      Height          =   400
      Index           =   1
      Left            =   840
      Style           =   1  'Graphical
      TabIndex        =   74
      Top             =   840
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      Height          =   400
      Index           =   7
      Left            =   360
      Style           =   1  'Graphical
      TabIndex        =   68
      Top             =   1200
      Width           =   500
   End
   Begin VB.CommandButton cmdRes 
      Height          =   400
      Index           =   0
      Left            =   360
      Style           =   1  'Graphical
      TabIndex        =   75
      Top             =   840
      Width           =   500
   End
   Begin VB.CommandButton cmdEmpty 
      BackColor       =   &H00FFFFFF&
      Height          =   375
      Left            =   3120
      Style           =   1  'Graphical
      TabIndex        =   93
      Top             =   120
      Visible         =   0   'False
      Width           =   495
   End
   Begin VB.ComboBox cboLug 
      Height          =   315
      Left            =   360
      Style           =   2  'Dropdown List
      TabIndex        =   3
      Top             =   6120
      Width           =   3375
   End
   Begin VB.ComboBox cboProfes 
      Height          =   315
      Left            =   360
      Style           =   2  'Dropdown List
      TabIndex        =   2
      Top             =   5520
      Width           =   3375
   End
   Begin VB.CommandButton cmdRestricc 
      Height          =   375
      Left            =   2640
      Picture         =   "ancora_goh_traditional_frmDatosGoMPI.frx":6452
      Style           =   1  'Graphical
      TabIndex        =   1
      Top             =   120
      Visible         =   0   'False
      Width           =   495
   End
   Begin VB.CommandButton cmdZpriori 
      Height          =   375
      Left            =   2160
      Picture         =   "ancora_goh_traditional_frmDatosGoMPI.frx":6620
      Style           =   1  'Graphical
      TabIndex        =   0
      Top             =   120
      Visible         =   0   'False
      Width           =   495
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "12"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   300
      Index           =   18
      Left            =   0
      TabIndex        =   110
      Top             =   4800
      Width           =   315
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "11"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   300
      Index           =   17
      Left            =   0
      TabIndex        =   102
      Top             =   4440
      Width           =   315
   End
   Begin VB.Label Label4 
      BackStyle       =   0  'Transparent
      Caption         =   "Seleccione el turno"
      Height          =   255
      Left            =   360
      TabIndex        =   94
      Top             =   240
      Width           =   1815
   End
   Begin VB.Line Line2 
      BorderColor     =   &H80000010&
      X1              =   -840
      X2              =   4200
      Y1              =   6600
      Y2              =   6600
   End
   Begin VB.Line Line1 
      BorderColor     =   &H00FFFFFF&
      X1              =   4200
      X2              =   -840
      Y1              =   6600
      Y2              =   6600
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Lun"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   240
      Index           =   0
      Left            =   360
      TabIndex        =   92
      Top             =   600
      Width           =   375
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Mar"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   240
      Index           =   1
      Left            =   840
      TabIndex        =   91
      Top             =   600
      Width           =   405
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Mie"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   240
      Index           =   2
      Left            =   1320
      TabIndex        =   90
      Top             =   600
      Width           =   390
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Jue"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   240
      Index           =   3
      Left            =   1800
      TabIndex        =   89
      Top             =   600
      Width           =   390
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Vie"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   240
      Index           =   4
      Left            =   2280
      TabIndex        =   88
      Top             =   600
      Width           =   360
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "1"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   300
      Index           =   5
      Left            =   120
      TabIndex        =   87
      Top             =   840
      Width           =   165
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "2"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   300
      Index           =   6
      Left            =   120
      TabIndex        =   86
      Top             =   1200
      Width           =   165
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "3"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   300
      Index           =   7
      Left            =   120
      TabIndex        =   85
      Top             =   1560
      Width           =   165
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "4"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   300
      Index           =   8
      Left            =   120
      TabIndex        =   84
      Top             =   1920
      Width           =   165
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "5"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   300
      Index           =   9
      Left            =   120
      TabIndex        =   83
      Top             =   2280
      Width           =   165
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "6"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   300
      Index           =   10
      Left            =   120
      TabIndex        =   82
      Top             =   2640
      Width           =   165
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Dom"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   240
      Index           =   11
      Left            =   3240
      TabIndex        =   81
      Top             =   600
      Width           =   495
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Sab"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   240
      Index           =   12
      Left            =   2760
      TabIndex        =   80
      Top             =   600
      Width           =   435
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "7"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   300
      Index           =   13
      Left            =   120
      TabIndex        =   79
      Top             =   3000
      Width           =   165
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "8"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   300
      Index           =   14
      Left            =   120
      TabIndex        =   78
      Top             =   3360
      Width           =   165
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "9"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   300
      Index           =   15
      Left            =   120
      TabIndex        =   77
      Top             =   3720
      Width           =   165
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "10"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   300
      Index           =   16
      Left            =   0
      TabIndex        =   76
      Top             =   4080
      Width           =   315
   End
   Begin VB.Label Label3 
      BackStyle       =   0  'Transparent
      Caption         =   "Posibles Lugares"
      ForeColor       =   &H80000008&
      Height          =   255
      Left            =   360
      TabIndex        =   5
      Top             =   5880
      Width           =   1335
   End
   Begin VB.Label Label2 
      BackStyle       =   0  'Transparent
      Caption         =   "Posibles profesores"
      ForeColor       =   &H80000008&
      Height          =   255
      Left            =   360
      TabIndex        =   4
      Top             =   5280
      Width           =   1455
   End
End
Attribute VB_Name = "frmDatosGoMPI"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"489BC1F00094"
Option Explicit

'Form Cambio de turno

'<!- ATRIBUTOS -!>
    
    Private refre As Boolean
    

'<!- EVENTOS -!>
    Private Sub cmdCancel_Click()
        Hide
    End Sub
    
    Private Sub cmdHelp_Click()
        interface.ShowHelp Name
    End Sub
    
    Private Sub cmdOK_Click()
        Dim r As Variant, i As Long, j As Long, k As Long, iper As Long
        Dim a As String, b As String

            If cboProfes.ListIndex = -1 Then
                interface.MessageDlg "Todavía usted no ha terminado", "Seleccione un profesor", vbInformation, "Aceptar"
                Exit Sub
            End If
    
            If cboLug.ListIndex = -1 Then
                interface.MessageDlg "Todavía usted no ha terminado", "Seleccione un lugar", vbInformation, "Aceptar"
                Exit Sub
            End If

    
        r = interface.MessageDlg("Eliminar", "¿Está seguro que desa cambiar la actividad para este turno, con este profesor y este lugar?", vbQuestion, "No", "Sí")
        If r = 2 Then
            If IDASIGNA_CAMBIANDO <> 0 Then
    
                Dim newprofe As String, newlugar As String
    
                With Asignaciones(IDASIGNA_CAMBIANDO)
                    newprofe = .idprofe
                    newlugar = .idlugar
                    If cboProfes.ListIndex > -1 Then newprofe = profe(Posi_profe.id(cboProfes.ListIndex + 1)).id
                    If cboLug.ListIndex > -1 Then newlugar = lugar(Posi_lug.id(cboLug.ListIndex + 1)).id
                End With
                
                Dim lista As Variant
                Dim cantlista As Long
                Dim ii As Long
                
                lista = ancora.MarcaAsignacionesIgualGrupo(IDASIGNA_CAMBIANDO, cantlista)

                For ii = 1 To cantlista
                    ancora.setAsignaciones_lugar Val(lista(ii)), newlugar
                    ancora.setAsignaciones_profe Val(lista(ii)), newprofe
                    ancora.moveAsignacion Val(lista(ii)), DIA_SEL, TURNO_SEL
                Next
                Hide
            Else
                'FIJANDO ACTIVIDAD
                'agrego las nuevas

                    Dim ixprofe As Long, ixlug As Long
                    
                    ixprofe = cboProfes.ListIndex + 1
                    ixlug = cboLug.ListIndex + 1
    
                    For i = 1 To MPI_frm.listabrg.cant
                        r = ancora.insertAsignacionAct(DIA_SEL, "" & Date, MPI_frm.fija, "" & Time, MPI_frm.act, asig(MPI_frm.asg).comun.id, Brigada(MPI_frm.listabrg.id(i)).comun.id, lugar(Posi_lug.id(ixlug)).id, ancora.periodos(MPI_frm.per).id, profe(Posi_profe.id(ixprofe)).id, TURNO_SEL)
    
                        For k = 1 To clasif(MPI_frm.clas).ct
                            iper = IndexRestRecurso(ancora.periodos(MPI_frm.per).id, profe(Posi_profe.id(ixprofe)))
                            If Mid(profe(Posi_profe.id(ixprofe)).id, 1, 1) <> "_" Then profe(Posi_profe.id(ixprofe)).rest(iper).rest(DIA_SEL, TURNO_SEL + k - 1) = True
                            iper = IndexRestRecurso(ancora.periodos(MPI_frm.per).id, lugar(Posi_lug.id(ixlug)))
                            If Mid(lugar(Posi_lug.id(ixlug)).id, 1, 1) <> "_" Then lugar(Posi_lug.id(ixlug)).rest(iper).rest(DIA_SEL, TURNO_SEL + k - 1) = True
                            iper = IndexRestRecurso(ancora.periodos(MPI_frm.per).id, Brigada(MPI_frm.listabrg.id(i)).comun)
                            If Mid(Brigada(MPI_frm.listabrg.id(i)).comun.id, 1, 1) <> "_" Then Brigada(MPI_frm.listabrg.id(i)).comun.rest(iper).rest(DIA_SEL, TURNO_SEL + k - 1) = True
                        Next
    
                    Next
    
    
            End If
    
            r = interface.MessageDlg("Proceso terminado", "Se ha asignado la actividad satisfactoriamente. ¿Desea guardar los cambios?", vbQuestion, "No", "Sí")
            If r = 2 Then ancora.GuardarTodo
            Hide
        End If
    End Sub
    
    Private Sub Form_Activate()
        redibuja
        refresca
    End Sub
        
    Private Sub cmdRes_Click(index As Integer)
        Dim dia As Long, turno As Long
        Dim i As Long, j As Long
        index = index + 1
        turno = Int(((index - 1) / MAX_DIAS) + 1)
        dia = Int(index - (turno - 1) * MAX_DIAS)
        If dia > ancora.CD Then dia = ancora.CD
        If turno > ancora.ct Then dia = ancora.ct
        DIA_SEL = dia
        TURNO_SEL = turno
        ReDim Preserve MPI_seleccion(ancora.CD, ancora.ct)
    
        For i = 1 To ancora.CD
    
            For j = 1 To ancora.ct
                MPI_seleccion(i, j) = False
            Next
    
        Next
    
        MPI_seleccion(dia, turno) = True
        redibuja
        cmdRes(index - 1).Picture = cmdZPriori.Picture
        PonRecursos dia, turno
    End Sub

    Private Sub Form_Load()
        interface.SkinFor Me
    End Sub

'<!- METODOS -!>
    
    Public Sub Click(index As Integer)
        cmdRes_Click index
    End Sub

    Public Sub redibuja()
        Dim i As Long, turno As Long, dia As Long
        ReDim Preserve MPI_seleccion(ancora.CD, ancora.ct)
            
        cboProfes.Enabled = True
        cboLug.Enabled = True
    
10
    
        For i = 1 To MAX_DIAS * MAX_TURNOS
            turno = Int(((i - 1) / MAX_DIAS) + 1)
            dia = Int(i - (turno - 1) * MAX_DIAS)
            If MPI_frm.GrupoMPI.MPI(dia, turno).valor = False Or dia > ancora.CD Or turno > ancora.ct Then
                cmdRes(i - 1).Picture = cmdEmpty.Picture
                cmdRes(i - 1).Enabled = False
                cmdRes(i - 1).BackColor = BackColor
            Else
                cmdRes(i - 1).Picture = cmdEmpty.Picture
                cmdRes(i - 1).Enabled = True
                cmdRes(i - 1).BackColor = cmdEmpty.BackColor
                If MPI_seleccion(dia, turno) = False Then
                    cmdRes(i - 1).Picture = cmdEmpty.Picture
                Else
                    cmdRes(i - 1).Picture = cmdZPriori.Picture
                End If
    
            End If
    
            If dia = DIA_CAMBIO And turno = TURNO_CAMBIO Then cmdRes(i - 1).BackColor = vbBlue
        Next
    
    End Sub

    Public Sub refresca()
        Dim i As Long, j As Long
        refre = True
    
        For i = 1 To MAX_DIAS
    
            For j = 1 To MAX_TURNOS
                cmdRes(((j - 1) * MAX_DIAS + i) - 1).Enabled = False
            Next
    
        Next
    
        For i = 1 To ancora.CD
    
            For j = 1 To ancora.ct
                cmdRes(((j - 1) * MAX_DIAS + i) - 1).Enabled = True
            Next
    
        Next
    
10
        refre = False
        redibuja
        If cboProfes.ListCount > 0 Then cboProfes.ListIndex = 0
        If cboLug.ListCount > 0 Then cboLug.ListIndex = 0
    End Sub
    
    Public Sub PonRecursos(dia As Long, turno As Long)
        Dim temp As TFiltro, i As Long
        cboProfes.clear
        cboLug.clear
    
        With MPI_frm
            temp = FiltraProfexAct(.per, .asg, .act, .gxc)
            temp = FiltraProfeQuePermanece(.per, temp, dia, turno, clasif(.clas).ct)
            Posi_profe = temp
    
            For i = 1 To temp.cant
                cboProfes.AddItem interface.getRS_Profe(temp.id(i))
            Next
    
            temp = FiltraLugxAct(.per, .asg, .act)
            temp = FiltraLugarQuePermanece(.per, temp, dia, turno, clasif(.clas).ct)
            Posi_lug = temp
    
            For i = 1 To temp.cant
                cboLug.AddItem interface.getRS_Lugar(temp.id(i))
            Next
    
        End With
    
    End Sub
