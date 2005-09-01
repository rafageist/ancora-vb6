VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "Mscomctl.ocx"
Begin VB.Form frmDatosHRT_detalles 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Detalles de la herencia de restricción en tiempo"
   ClientHeight    =   8415
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   9375
   Icon            =   "ancora_goh_traditional_frmDatosHRT_detalles.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   8415
   ScaleWidth      =   9375
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
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
      Left            =   8160
      TabIndex        =   141
      Top             =   7920
      Width           =   1095
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
      Left            =   6960
      TabIndex        =   140
      Top             =   7920
      Width           =   1095
   End
   Begin MSComctlLib.ImageList imgList 
      Left            =   240
      Top             =   7920
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   16
      ImageHeight     =   16
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   1
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ancora_goh_traditional_frmDatosHRT_detalles.frx":1CCA
            Key             =   ""
         EndProperty
      EndProperty
   End
   Begin VB.Frame frameExcepciones 
      Caption         =   "Heredar restricciones excepto en los siguientes períodos"
      Height          =   5655
      Left            =   120
      TabIndex        =   10
      Top             =   2040
      Width           =   9135
      Begin VB.Frame frameCasillero 
         Caption         =   "Para este período NO heredar de los turnos..."
         Enabled         =   0   'False
         Height          =   5295
         Left            =   4560
         TabIndex        =   15
         ToolTipText     =   "Estas restricciones serán establecidas para todos los elementos marcados"
         Top             =   240
         Width           =   4335
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
            Left            =   3240
            Style           =   1  'Graphical
            TabIndex        =   18
            Top             =   4440
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
            Left            =   2760
            Style           =   1  'Graphical
            TabIndex        =   19
            Top             =   4440
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
            Left            =   2280
            Style           =   1  'Graphical
            TabIndex        =   20
            Top             =   4440
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
            Left            =   1800
            Style           =   1  'Graphical
            TabIndex        =   21
            Top             =   4440
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
            Left            =   1320
            Style           =   1  'Graphical
            TabIndex        =   22
            Top             =   4440
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
            Left            =   840
            Style           =   1  'Graphical
            TabIndex        =   23
            Top             =   4440
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
            Left            =   360
            Style           =   1  'Graphical
            TabIndex        =   24
            Top             =   4440
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
            Left            =   3240
            Style           =   1  'Graphical
            TabIndex        =   25
            Top             =   4080
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
            Left            =   2760
            Style           =   1  'Graphical
            TabIndex        =   26
            Top             =   4080
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
            Left            =   2280
            Style           =   1  'Graphical
            TabIndex        =   27
            Top             =   4080
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
            Left            =   1800
            Style           =   1  'Graphical
            TabIndex        =   28
            Top             =   4080
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
            Left            =   1320
            Style           =   1  'Graphical
            TabIndex        =   29
            Top             =   4080
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
            Left            =   840
            Style           =   1  'Graphical
            TabIndex        =   30
            Top             =   4080
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
            Left            =   360
            Style           =   1  'Graphical
            TabIndex        =   31
            Top             =   4080
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
            Left            =   3240
            Style           =   1  'Graphical
            TabIndex        =   35
            Top             =   3720
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
            Left            =   2760
            Style           =   1  'Graphical
            TabIndex        =   36
            Top             =   3720
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
            Left            =   2280
            Style           =   1  'Graphical
            TabIndex        =   37
            Top             =   3720
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
            Left            =   1800
            Style           =   1  'Graphical
            TabIndex        =   38
            Top             =   3720
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
            Left            =   1320
            Style           =   1  'Graphical
            TabIndex        =   39
            Top             =   3720
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
            Left            =   840
            Style           =   1  'Graphical
            TabIndex        =   40
            Top             =   3720
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
            Left            =   360
            Style           =   1  'Graphical
            TabIndex        =   41
            Top             =   3720
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
            Left            =   3240
            Style           =   1  'Graphical
            TabIndex        =   42
            Top             =   3360
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
            Left            =   2760
            Style           =   1  'Graphical
            TabIndex        =   43
            Top             =   3360
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
            Left            =   2280
            Style           =   1  'Graphical
            TabIndex        =   44
            Top             =   3360
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
            Left            =   1800
            Style           =   1  'Graphical
            TabIndex        =   45
            Top             =   3360
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
            Left            =   1320
            Style           =   1  'Graphical
            TabIndex        =   46
            Top             =   3360
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
            Left            =   840
            Style           =   1  'Graphical
            TabIndex        =   47
            Top             =   3360
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
            Left            =   360
            Style           =   1  'Graphical
            TabIndex        =   48
            Top             =   3360
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
            Left            =   3240
            Style           =   1  'Graphical
            TabIndex        =   49
            Top             =   3000
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
            Left            =   2760
            Style           =   1  'Graphical
            TabIndex        =   50
            Top             =   3000
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
            Left            =   2280
            Style           =   1  'Graphical
            TabIndex        =   51
            Top             =   3000
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
            Left            =   1800
            Style           =   1  'Graphical
            TabIndex        =   52
            Top             =   3000
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
            Left            =   1320
            Style           =   1  'Graphical
            TabIndex        =   53
            Top             =   3000
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
            Left            =   840
            Style           =   1  'Graphical
            TabIndex        =   54
            Top             =   3000
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
            Left            =   360
            Style           =   1  'Graphical
            TabIndex        =   59
            Top             =   3000
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
            Left            =   3240
            Style           =   1  'Graphical
            TabIndex        =   60
            Top             =   2640
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
            Left            =   2760
            Style           =   1  'Graphical
            TabIndex        =   61
            Top             =   2640
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
            Left            =   2280
            Style           =   1  'Graphical
            TabIndex        =   62
            Top             =   2640
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
            Left            =   1800
            Style           =   1  'Graphical
            TabIndex        =   63
            Top             =   2640
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
            Left            =   1320
            Style           =   1  'Graphical
            TabIndex        =   64
            Top             =   2640
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
            Left            =   840
            Style           =   1  'Graphical
            TabIndex        =   65
            Top             =   2640
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
            Left            =   360
            Style           =   1  'Graphical
            TabIndex        =   66
            Top             =   2640
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
            Left            =   3240
            Style           =   1  'Graphical
            TabIndex        =   67
            Top             =   2280
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
            Left            =   2760
            Style           =   1  'Graphical
            TabIndex        =   68
            Top             =   2280
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
            Left            =   2280
            Style           =   1  'Graphical
            TabIndex        =   69
            Top             =   2280
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
            Left            =   1800
            Style           =   1  'Graphical
            TabIndex        =   70
            Top             =   2280
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
            Left            =   1320
            Style           =   1  'Graphical
            TabIndex        =   71
            Top             =   2280
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
            Left            =   840
            Style           =   1  'Graphical
            TabIndex        =   72
            Top             =   2280
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
            Left            =   360
            Style           =   1  'Graphical
            TabIndex        =   73
            Top             =   2280
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
            Left            =   3240
            Style           =   1  'Graphical
            TabIndex        =   74
            Top             =   1920
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
            Left            =   2760
            Style           =   1  'Graphical
            TabIndex        =   75
            Top             =   1920
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
            Left            =   2280
            Style           =   1  'Graphical
            TabIndex        =   76
            Top             =   1920
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
            Left            =   1800
            Style           =   1  'Graphical
            TabIndex        =   77
            Top             =   1920
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
            Left            =   1320
            Style           =   1  'Graphical
            TabIndex        =   78
            Top             =   1920
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
            Left            =   840
            Style           =   1  'Graphical
            TabIndex        =   91
            Top             =   1920
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
            Left            =   360
            Style           =   1  'Graphical
            TabIndex        =   92
            Top             =   1920
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
            Left            =   3240
            Style           =   1  'Graphical
            TabIndex        =   93
            Top             =   1560
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
            Left            =   2760
            Style           =   1  'Graphical
            TabIndex        =   94
            Top             =   1560
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
            Left            =   2280
            Style           =   1  'Graphical
            TabIndex        =   95
            Top             =   1560
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
            Left            =   1800
            Style           =   1  'Graphical
            TabIndex        =   96
            Top             =   1560
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
            Left            =   1320
            Style           =   1  'Graphical
            TabIndex        =   97
            Top             =   1560
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
            Left            =   840
            Style           =   1  'Graphical
            TabIndex        =   98
            Top             =   1560
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
            Left            =   360
            Style           =   1  'Graphical
            TabIndex        =   99
            Top             =   1560
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
            Left            =   3240
            Style           =   1  'Graphical
            TabIndex        =   100
            Top             =   1200
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
            Left            =   2760
            Style           =   1  'Graphical
            TabIndex        =   101
            Top             =   1200
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
            Left            =   2280
            Style           =   1  'Graphical
            TabIndex        =   102
            Top             =   1200
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
            Left            =   1800
            Style           =   1  'Graphical
            TabIndex        =   103
            Top             =   1200
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
            Left            =   1320
            Style           =   1  'Graphical
            TabIndex        =   104
            Top             =   1200
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
            Left            =   840
            Style           =   1  'Graphical
            TabIndex        =   105
            Top             =   1200
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
            Left            =   360
            Style           =   1  'Graphical
            TabIndex        =   106
            Top             =   1200
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
            Left            =   3240
            Style           =   1  'Graphical
            TabIndex        =   107
            Top             =   840
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
            Left            =   2760
            Style           =   1  'Graphical
            TabIndex        =   108
            Top             =   840
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
            Left            =   2280
            Style           =   1  'Graphical
            TabIndex        =   109
            Top             =   840
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
            Left            =   1800
            Style           =   1  'Graphical
            TabIndex        =   110
            Top             =   840
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
            Left            =   1320
            Style           =   1  'Graphical
            TabIndex        =   111
            Top             =   840
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
            Left            =   840
            Style           =   1  'Graphical
            TabIndex        =   112
            Top             =   840
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
            Left            =   360
            Style           =   1  'Graphical
            TabIndex        =   113
            Top             =   840
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
            Left            =   3240
            Style           =   1  'Graphical
            TabIndex        =   114
            Top             =   480
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
            Left            =   2760
            Style           =   1  'Graphical
            TabIndex        =   115
            Top             =   480
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
            Left            =   2280
            Style           =   1  'Graphical
            TabIndex        =   116
            Top             =   480
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
            Left            =   1800
            Style           =   1  'Graphical
            TabIndex        =   117
            Top             =   480
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
            Left            =   1320
            Style           =   1  'Graphical
            TabIndex        =   118
            Top             =   480
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
            Left            =   840
            Style           =   1  'Graphical
            TabIndex        =   119
            Top             =   480
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
            Left            =   360
            Style           =   1  'Graphical
            TabIndex        =   120
            Top             =   480
            Width           =   500
         End
         Begin VB.CommandButton cmdRestricc 
            Height          =   255
            Left            =   3360
            Picture         =   "ancora_goh_traditional_frmDatosHRT_detalles.frx":211C
            Style           =   1  'Graphical
            TabIndex        =   90
            Top             =   120
            Visible         =   0   'False
            Width           =   255
         End
         Begin VB.CommandButton cmdEntireTurno 
            Height          =   255
            Index           =   0
            Left            =   3840
            TabIndex        =   89
            ToolTipText     =   "Seleccionar/invertir selección en la fila"
            Top             =   480
            Width           =   255
         End
         Begin VB.CommandButton cmdEntireTurno 
            Height          =   255
            Index           =   1
            Left            =   3840
            TabIndex        =   88
            ToolTipText     =   "Seleccionar/invertir selección en la fila"
            Top             =   840
            Width           =   255
         End
         Begin VB.CommandButton cmdEntireTurno 
            Height          =   255
            Index           =   2
            Left            =   3840
            TabIndex        =   87
            ToolTipText     =   "Seleccionar/invertir selección en la fila"
            Top             =   1200
            Width           =   255
         End
         Begin VB.CommandButton cmdEntireTurno 
            Height          =   255
            Index           =   3
            Left            =   3840
            TabIndex        =   86
            ToolTipText     =   "Seleccionar/invertir selección en la fila"
            Top             =   1560
            Width           =   255
         End
         Begin VB.CommandButton cmdEntireTurno 
            Height          =   255
            Index           =   4
            Left            =   3840
            TabIndex        =   85
            ToolTipText     =   "Seleccionar/invertir selección en la fila"
            Top             =   1920
            Width           =   255
         End
         Begin VB.CommandButton cmdEntireTurno 
            Height          =   255
            Index           =   5
            Left            =   3840
            TabIndex        =   84
            ToolTipText     =   "Seleccionar/invertir selección en la fila"
            Top             =   2280
            Width           =   255
         End
         Begin VB.CommandButton cmdEntireDia 
            Height          =   255
            Index           =   0
            Left            =   480
            TabIndex        =   83
            ToolTipText     =   "Seleccionar/invertir selección en la columna"
            Top             =   4920
            Width           =   255
         End
         Begin VB.CommandButton cmdEntireDia 
            Height          =   255
            Index           =   1
            Left            =   960
            TabIndex        =   82
            ToolTipText     =   "Seleccionar/invertir selección en la columna"
            Top             =   4920
            Width           =   255
         End
         Begin VB.CommandButton cmdEntireDia 
            Height          =   255
            Index           =   2
            Left            =   1440
            TabIndex        =   81
            ToolTipText     =   "Seleccionar/invertir selección en la columna"
            Top             =   4920
            Width           =   255
         End
         Begin VB.CommandButton cmdEntireDia 
            Height          =   255
            Index           =   3
            Left            =   1920
            TabIndex        =   80
            ToolTipText     =   "Seleccionar/invertir selección en la columna"
            Top             =   4920
            Width           =   255
         End
         Begin VB.CommandButton cmdEntireDia 
            Height          =   255
            Index           =   4
            Left            =   2400
            TabIndex        =   79
            ToolTipText     =   "Seleccionar/invertir selección en la columna"
            Top             =   4920
            Width           =   255
         End
         Begin VB.CommandButton cmdEntireTurno 
            Height          =   255
            Index           =   6
            Left            =   3840
            TabIndex        =   58
            ToolTipText     =   "Seleccionar/invertir selección en la fila"
            Top             =   2640
            Width           =   255
         End
         Begin VB.CommandButton cmdEntireTurno 
            Height          =   255
            Index           =   7
            Left            =   3840
            TabIndex        =   57
            ToolTipText     =   "Seleccionar/invertir selección en la fila"
            Top             =   3000
            Width           =   255
         End
         Begin VB.CommandButton cmdEntireTurno 
            Height          =   255
            Index           =   8
            Left            =   3840
            TabIndex        =   56
            ToolTipText     =   "Seleccionar/invertir selección en la fila"
            Top             =   3360
            Width           =   255
         End
         Begin VB.CommandButton cmdEntireTurno 
            Height          =   255
            Index           =   9
            Left            =   3840
            TabIndex        =   55
            ToolTipText     =   "Seleccionar/invertir selección en la fila"
            Top             =   3720
            Width           =   255
         End
         Begin VB.CommandButton cmdEntireDia 
            Height          =   255
            Index           =   5
            Left            =   2880
            TabIndex        =   34
            ToolTipText     =   "Seleccionar/invertir selección en la columna"
            Top             =   4920
            Width           =   255
         End
         Begin VB.CommandButton cmdEntireDia 
            Height          =   255
            Index           =   6
            Left            =   3360
            TabIndex        =   33
            ToolTipText     =   "Seleccionar/invertir selección en la columna"
            Top             =   4920
            Width           =   255
         End
         Begin VB.CommandButton cmdEmpty 
            Height          =   255
            Left            =   3600
            TabIndex        =   32
            Top             =   120
            Visible         =   0   'False
            Width           =   255
         End
         Begin VB.CommandButton cmdEntireTurno 
            Height          =   255
            Index           =   10
            Left            =   3840
            TabIndex        =   17
            ToolTipText     =   "Seleccionar/invertir selección en la fila"
            Top             =   4080
            Width           =   255
         End
         Begin VB.CommandButton cmdEntireTurno 
            Height          =   255
            Index           =   11
            Left            =   3840
            TabIndex        =   16
            ToolTipText     =   "Seleccionar/invertir selección en la fila"
            Top             =   4440
            Width           =   255
         End
         Begin VB.Label Label1 
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   "Lun"
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   9.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H80000008&
            Height          =   240
            Index           =   19
            Left            =   360
            TabIndex        =   139
            Top             =   240
            Width           =   315
         End
         Begin VB.Label Label1 
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   "Mar"
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   9.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H80000008&
            Height          =   240
            Index           =   1
            Left            =   840
            TabIndex        =   138
            Top             =   240
            Width           =   345
         End
         Begin VB.Label Label1 
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   "Mie"
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   9.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H80000008&
            Height          =   240
            Index           =   2
            Left            =   1320
            TabIndex        =   137
            Top             =   240
            Width           =   330
         End
         Begin VB.Label Label1 
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   "Jue"
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   9.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H80000008&
            Height          =   240
            Index           =   3
            Left            =   1800
            TabIndex        =   136
            Top             =   240
            Width           =   330
         End
         Begin VB.Label Label1 
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   "Vie"
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   9.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H80000008&
            Height          =   240
            Index           =   4
            Left            =   2280
            TabIndex        =   135
            Top             =   240
            Width           =   300
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
            Left            =   120
            TabIndex        =   134
            Top             =   480
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
            Left            =   120
            TabIndex        =   133
            Top             =   840
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
            Left            =   120
            TabIndex        =   132
            Top             =   1200
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
            Left            =   120
            TabIndex        =   131
            Top             =   1560
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
            Left            =   120
            TabIndex        =   130
            Top             =   1920
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
            Index           =   10
            Left            =   120
            TabIndex        =   129
            Top             =   2280
            Width           =   135
         End
         Begin VB.Label Label1 
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   "Dom"
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   9.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H80000008&
            Height          =   240
            Index           =   11
            Left            =   3240
            TabIndex        =   128
            Top             =   240
            Width           =   435
         End
         Begin VB.Label Label1 
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   "Sab"
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   9.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H80000008&
            Height          =   240
            Index           =   12
            Left            =   2760
            TabIndex        =   127
            Top             =   240
            Width           =   375
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
            Left            =   120
            TabIndex        =   126
            Top             =   2640
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
            Left            =   120
            TabIndex        =   125
            Top             =   3000
            Width           =   135
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
            Left            =   120
            TabIndex        =   124
            Top             =   3360
            Width           =   135
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
            Left            =   0
            TabIndex        =   123
            Top             =   3720
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
            Left            =   0
            TabIndex        =   122
            Top             =   4080
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
            Left            =   0
            TabIndex        =   121
            Top             =   4440
            Width           =   270
         End
      End
      Begin VB.ComboBox cboPeriodo 
         Height          =   315
         Left            =   120
         Style           =   2  'Dropdown List
         TabIndex        =   14
         Top             =   5040
         Width           =   3135
      End
      Begin VB.CommandButton cmdDeletePeriodo 
         Height          =   375
         Left            =   3960
         Picture         =   "ancora_goh_traditional_frmDatosHRT_detalles.frx":24A6
         Style           =   1  'Graphical
         TabIndex        =   13
         ToolTipText     =   "Elimina el período seleccionado de la lista"
         Top             =   5040
         Width           =   495
      End
      Begin VB.CommandButton cmdAddPeriodo 
         Height          =   375
         Left            =   3360
         Picture         =   "ancora_goh_traditional_frmDatosHRT_detalles.frx":2830
         Style           =   1  'Graphical
         TabIndex        =   12
         ToolTipText     =   "Agrega el período seleccionado  "
         Top             =   5040
         Width           =   495
      End
      Begin MSComctlLib.ListView lvwPeriodos 
         Height          =   4575
         Left            =   120
         TabIndex        =   11
         Top             =   360
         Width           =   4335
         _ExtentX        =   7646
         _ExtentY        =   8070
         View            =   3
         LabelEdit       =   1
         LabelWrap       =   -1  'True
         HideSelection   =   -1  'True
         FullRowSelect   =   -1  'True
         GridLines       =   -1  'True
         _Version        =   393217
         ForeColor       =   -2147483640
         BackColor       =   -2147483643
         BorderStyle     =   1
         Appearance      =   1
         NumItems        =   1
         BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Text            =   "Periodo"
            Object.Width           =   10583
         EndProperty
      End
   End
   Begin VB.Frame frameDetallesA 
      Caption         =   "Elemento que hereda"
      Height          =   1815
      Left            =   120
      TabIndex        =   1
      Top             =   120
      Width           =   4455
      Begin VB.ComboBox cboObjetoA 
         Height          =   315
         Left            =   240
         Style           =   2  'Dropdown List
         TabIndex        =   3
         Top             =   1320
         Width           =   3975
      End
      Begin VB.ComboBox cboTipoA 
         Height          =   315
         Left            =   240
         Style           =   2  'Dropdown List
         TabIndex        =   2
         Top             =   600
         Width           =   3975
      End
      Begin VB.Label labObjetoA 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Elemento"
         Height          =   195
         Left            =   240
         TabIndex        =   5
         Top             =   1080
         Width           =   660
      End
      Begin VB.Label labTipoA 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Tipo de elemento"
         Height          =   195
         Left            =   240
         TabIndex        =   4
         Top             =   360
         Width           =   1230
      End
   End
   Begin VB.Frame frameDetallesB 
      Caption         =   "Elemento que transmite la herencia"
      Height          =   1815
      Left            =   4680
      TabIndex        =   0
      Top             =   120
      Width           =   4455
      Begin VB.ComboBox cboObjetoB 
         Height          =   315
         Left            =   240
         Style           =   2  'Dropdown List
         TabIndex        =   7
         Top             =   1320
         Width           =   3975
      End
      Begin VB.ComboBox cboTipoB 
         Height          =   315
         Left            =   240
         Style           =   2  'Dropdown List
         TabIndex        =   6
         Top             =   600
         Width           =   3975
      End
      Begin VB.Label Label2 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Elemento"
         Height          =   195
         Left            =   240
         TabIndex        =   9
         Top             =   1080
         Width           =   660
      End
      Begin VB.Label Label1 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Tipo de elemento"
         Height          =   195
         Index           =   0
         Left            =   240
         TabIndex        =   8
         Top             =   360
         Width           =   1230
      End
   End
   Begin VB.Line Line2 
      BorderColor     =   &H80000010&
      X1              =   11680
      X2              =   -120
      Y1              =   7800
      Y2              =   7800
   End
   Begin VB.Line Line1 
      BorderColor     =   &H00FFFFFF&
      X1              =   11680
      X2              =   -120
      Y1              =   7815
      Y2              =   7815
   End
End
Attribute VB_Name = "frmDatosHRT_detalles"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

'Form Detalles de la herencia de restriccion en tiempo

'<!- ATRIBUTOS -!>

    Public data As TGOH_HRT
    Public tipos As Variant
    Public canttipos As Long
    Public resultbutton As Long

'<!- EVENTOS -!>

    Private Sub cboObjetoA_Click()
        data.idxobjetoA = cboObjetoA.ListIndex + 1
    End Sub
    
    Private Sub cboObjetoA_Validate(Cancel As Boolean)
        Cancel = Not validateData
    End Sub
    
    Private Sub cboObjetoB_Click()
        data.idxobjetoB = cboObjetoB.ListIndex + 1
    End Sub
    
    Private Sub cboObjetoB_Validate(Cancel As Boolean)
        Cancel = Not validateData
    End Sub
    
    Private Sub cboTipoA_Click()
        data.tipoObjetoA = tipos(cboTipoA.ListIndex + 1)
        interface.fillCboGenerico data.tipoObjetoA, cboObjetoA
    End Sub
    
    Private Sub cboTipoA_Validate(Cancel As Boolean)
        Cancel = Not validateData
    End Sub
    
    Private Sub cboTipoB_Click()
        data.tipoObjetoB = tipos(cboTipoB.ListIndex + 1)
        interface.fillCboGenerico data.tipoObjetoB, cboObjetoB
    End Sub
    
    Private Sub cboTipoB_Validate(Cancel As Boolean)
        Cancel = Not validateData
    End Sub
    
    Private Sub cmdaddPeriodo_Click()
        Dim rest As TGOH_Restriccion, per As String
        
        per = ancora.periodos(cboPeriodo.ListIndex + 1).id
        
        For Each rest In data.exceptoEnTiempo
            If kernel.utils.idigual(rest.idperiodo, per) Then
                interface.MessageDlg "No se puede insertar", "El período ya fue insertado", vbCritical, "Aceptar"
                Exit Sub
            End If
        Next
        
        data.exceptoEnTiempo.add per
        lvwPeriodos.ListItems.add , , interface.getRS_Periodo(0, per), 1, 1
        
        refreCasillero
        
    End Sub
    
    Private Sub cmdCancel_Click()
        resultbutton = 2
        Hide
    End Sub

    Private Sub cmddeletePeriodo_Click()
        If Not lvwPeriodos.SelectedItem Is Nothing Then
            data.exceptoEnTiempo.Remove PerSeleccionado
            lvwPeriodos.ListItems.Remove lvwPeriodos.SelectedItem.index
            refreCasillero
        End If
    End Sub
    
    Private Sub cmdEntireDia_Click(index As Integer)
        Dim i As Long
    
        For i = 1 To MAX_TURNOS
            If cmdRes((i - 1) * MAX_DIAS + (index)).Enabled Then cmdRes_Click (i - 1) * MAX_DIAS + (index)
        Next
    End Sub
    
    Private Sub cmdEntireTurno_Click(index As Integer)
        Dim i As Long
    
        For i = 1 To MAX_DIAS
            If cmdRes((index) * MAX_DIAS + (i - 1)).Enabled Then cmdRes_Click (index) * MAX_DIAS + (i - 1)
        Next
    End Sub
       
    Private Sub cmdOK_Click()
        resultbutton = 1
        Hide
    End Sub
    
    Private Sub cmdRes_Click(index As Integer)
        Dim dia As Long, turno As Long, valor As Long
        index = index + 1
        turno = Int(((index - 1) / MAX_DIAS) + 1)
        dia = Int(index - (turno - 1) * MAX_DIAS)
        valor = data.exceptoEnTiempo.getRest(PerSeleccionado, dia, turno)
        valor = IIf(valor = 1, 0, 1)
        cmdRes(index - 1).Picture = IIf(valor = 1, cmdRestricc.Picture, cmdEmpty.Picture)
        data.exceptoEnTiempo.setRest PerSeleccionado, dia, turno, valor
    End Sub

    Private Sub Form_Load()
        interface.SkinFor Me
    End Sub
    
    Private Sub lvwPeriodos_ItemClick(ByVal Item As MSComctlLib.ListItem)
        refreCasillero
    End Sub

'<!- METODOS -!>
    
    Public Function refreCasillero()
        Dim i As Long, j  As Long
        If Not lvwPeriodos.SelectedItem Is Nothing Then
            For i = 1 To MAX_DIAS
                For j = 1 To MAX_TURNOS
                    If i <= ancora.CD And j <= ancora.ct Then
                        If data.exceptoEnTiempo.getRest(PerSeleccionado, i, j) = 1 Then
                            cmdRes((j - 1) * MAX_DIAS + (i - 1)).Picture = cmdRestricc.Picture
                        Else
                            cmdRes((j - 1) * MAX_DIAS + (i - 1)).Picture = cmdEmpty.Picture
                        End If
                    Else
                        cmdRes((j - 1) * MAX_DIAS + (i - 1)).Enabled = False
                    End If
                Next
            Next
            frameCasillero.Enabled = True
        Else
            For i = 0 To cmdRes.Count - 1
                cmdRes(i).Picture = cmdEmpty.Picture
            Next
            frameCasillero.Enabled = False
        End If
    End Function
    
    Public Function validateData() As Boolean
        validateData = True
        If cboTipoA.ListIndex = cboTipoB.ListIndex _
           And cboObjetoA.ListIndex = cboObjetoB.ListIndex _
           And cboTipoA.ListIndex <> -1 _
           And cboObjetoA.ListIndex <> -1 Then
            interface.MessageDlg "Imposible heredar restricciones", "Seleccione dos elementos diferentes", vbCritical, "Aceptar"
            validateData = False
        End If
    End Function
    
    Public Function PerSeleccionado() As String
        Dim rest As TGOH_Restriccion, i As Long
        i = 0
        If Not lvwPeriodos.SelectedItem Is Nothing Then
            For Each rest In data.exceptoEnTiempo
                i = i + 1
                If i = lvwPeriodos.SelectedItem.index Then
                    PerSeleccionado = rest.idperiodo
                    Exit Function
                End If
            Next
        End If
        PerSeleccionado = ""
    End Function
    
    Public Function ixTipo(t As Long) As Long
        Dim i As Long
        For i = 1 To canttipos
            If tipos(i) = t Then
                ixTipo = i
                Exit Function
            End If
        Next
    End Function
    
    Public Sub go()
        
        Dim rest As TGOH_Restriccion
        
        With data
            cboTipoA.ListIndex = ixTipo(.tipoObjetoA) - 1
            cboTipoB.ListIndex = ixTipo(.tipoObjetoB) - 1
            
            interface.fillCboGenerico .tipoObjetoA, cboObjetoA
            interface.fillCboGenerico .tipoObjetoB, cboObjetoB
            
            If .tipoObjetoA > 0 Then .idxobjetoA = ancora.IndexById(.tipoObjetoA, .idObjetoA)
            If .tipoObjetoB > 0 Then .idxobjetoB = ancora.IndexById(.tipoObjetoB, .idObjetoB)
            
            cboObjetoA.ListIndex = .idxobjetoA - 1
            cboObjetoB.ListIndex = .idxobjetoB - 1
            
            lvwPeriodos.ListItems.clear
            
            For Each rest In .exceptoEnTiempo
                lvwPeriodos.ListItems.add , , interface.getRS_Periodo(0, rest.idperiodo), 1, 1
            Next
            
        End With
        
        Show vbModal
        
    End Sub
    
