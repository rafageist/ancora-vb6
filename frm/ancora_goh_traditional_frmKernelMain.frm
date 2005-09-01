VERSION 5.00
Object = "{90F3D7B3-92E7-44BA-B444-6A8E2A3BC375}#1.0#0"; "actskin4.ocx"
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "Comdlg32.ocx"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "Mscomctl.ocx"
Begin VB.Form frmKernelMain 
   BackColor       =   &H8000000C&
   Caption         =   "Áncora GOH, generación y organización de horarios"
   ClientHeight    =   9930
   ClientLeft      =   2100
   ClientTop       =   240
   ClientWidth     =   14100
   BeginProperty Font 
      Name            =   "Calibri"
      Size            =   9.75
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "ancora_goh_traditional_frmKernelMain.frx":0000
   LinkTopic       =   "frmKernelMain"
   ScaleHeight     =   9930
   ScaleWidth      =   14100
   StartUpPosition =   2  'CenterScreen
   Visible         =   0   'False
   WhatsThisHelp   =   -1  'True
   WindowState     =   2  'Maximized
   Begin ACTIVESKINLibCtl.SkinLabel labProgress 
      Height          =   255
      Left            =   120
      OleObjectBlob   =   "ancora_goh_traditional_frmKernelMain.frx":0CCA
      TabIndex        =   13
      Top             =   9600
      Visible         =   0   'False
      Width           =   4935
   End
   Begin MSComctlLib.ProgressBar Progress 
      Height          =   120
      Left            =   10440
      TabIndex        =   12
      Top             =   9720
      Visible         =   0   'False
      Width           =   3375
      _ExtentX        =   5953
      _ExtentY        =   212
      _Version        =   393216
      Appearance      =   0
      MousePointer    =   11
      Min             =   1e-4
      Scrolling       =   1
   End
   Begin Áncora.ACPRibbon mainribbon 
      Align           =   1  'Align Top
      Height          =   1740
      Left            =   0
      TabIndex        =   9
      Top             =   0
      Width           =   14100
      _ExtentX        =   24871
      _ExtentY        =   3069
      BackColor       =   14537936
      ForeColor       =   6971996
   End
   Begin ACTIVESKINLibCtl.Skin Skin1 
      Left            =   120
      OleObjectBlob   =   "ancora_goh_traditional_frmKernelMain.frx":0D32
      Top             =   5040
   End
   Begin VB.Frame frameExploradorHorarios 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   7455
      Left            =   240
      TabIndex        =   1
      Top             =   1800
      Visible         =   0   'False
      Width           =   13575
      Begin MSComctlLib.ImageList imlCasillas 
         Left            =   720
         Top             =   4920
         _ExtentX        =   1005
         _ExtentY        =   1005
         BackColor       =   -2147483643
         ImageWidth      =   48
         ImageHeight     =   48
         MaskColor       =   12632256
         _Version        =   393216
         BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
            NumListImages   =   10
            BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "ancora_goh_traditional_frmKernelMain.frx":0F66
               Key             =   ""
            EndProperty
            BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "ancora_goh_traditional_frmKernelMain.frx":178B
               Key             =   ""
            EndProperty
            BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "ancora_goh_traditional_frmKernelMain.frx":20AD
               Key             =   ""
            EndProperty
            BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "ancora_goh_traditional_frmKernelMain.frx":2826
               Key             =   ""
            EndProperty
            BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "ancora_goh_traditional_frmKernelMain.frx":3106
               Key             =   ""
            EndProperty
            BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "ancora_goh_traditional_frmKernelMain.frx":370B
               Key             =   ""
            EndProperty
            BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "ancora_goh_traditional_frmKernelMain.frx":3CBA
               Key             =   ""
            EndProperty
            BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "ancora_goh_traditional_frmKernelMain.frx":A11C
               Key             =   ""
            EndProperty
            BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "ancora_goh_traditional_frmKernelMain.frx":A804
               Key             =   ""
            EndProperty
            BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "ancora_goh_traditional_frmKernelMain.frx":AEFE
               Key             =   ""
            EndProperty
         EndProperty
      End
      Begin VB.PictureBox picSplitter 
         BackColor       =   &H00808000&
         BorderStyle     =   0  'None
         FillColor       =   &H00808080&
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   5400
         Left            =   3600
         MousePointer    =   9  'Size W E
         ScaleHeight     =   2351.391
         ScaleMode       =   0  'User
         ScaleWidth      =   1404
         TabIndex        =   4
         Top             =   0
         Visible         =   0   'False
         Width           =   135
      End
      Begin MSComctlLib.ImageList imgtvwExplorer 
         Left            =   120
         Top             =   4920
         _ExtentX        =   1005
         _ExtentY        =   1005
         BackColor       =   16777215
         ImageWidth      =   16
         ImageHeight     =   16
         MaskColor       =   12632256
         _Version        =   393216
         BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
            NumListImages   =   13
            BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "ancora_goh_traditional_frmKernelMain.frx":BDD8
               Key             =   ""
            EndProperty
            BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "ancora_goh_traditional_frmKernelMain.frx":C503
               Key             =   ""
            EndProperty
            BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "ancora_goh_traditional_frmKernelMain.frx":C955
               Key             =   ""
            EndProperty
            BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "ancora_goh_traditional_frmKernelMain.frx":CFA4
               Key             =   ""
            EndProperty
            BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "ancora_goh_traditional_frmKernelMain.frx":D70A
               Key             =   ""
            EndProperty
            BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "ancora_goh_traditional_frmKernelMain.frx":DB5C
               Key             =   ""
            EndProperty
            BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "ancora_goh_traditional_frmKernelMain.frx":DFAE
               Key             =   ""
            EndProperty
            BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "ancora_goh_traditional_frmKernelMain.frx":E5C4
               Key             =   ""
            EndProperty
            BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "ancora_goh_traditional_frmKernelMain.frx":E8DE
               Key             =   ""
            EndProperty
            BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "ancora_goh_traditional_frmKernelMain.frx":EBF8
               Key             =   ""
            EndProperty
            BeginProperty ListImage11 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "ancora_goh_traditional_frmKernelMain.frx":EF12
               Key             =   ""
            EndProperty
            BeginProperty ListImage12 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "ancora_goh_traditional_frmKernelMain.frx":F364
               Key             =   ""
            EndProperty
            BeginProperty ListImage13 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "ancora_goh_traditional_frmKernelMain.frx":F7B6
               Key             =   ""
            EndProperty
         EndProperty
      End
      Begin MSComctlLib.TreeView tvwScheduleExplorer 
         Height          =   4815
         Left            =   120
         TabIndex        =   5
         ToolTipText     =   "Seleccione aquí la brigada, el profesor o el lugar que desea ver"
         Top             =   240
         Width           =   3255
         _ExtentX        =   5741
         _ExtentY        =   8493
         _Version        =   393217
         HideSelection   =   0   'False
         LabelEdit       =   1
         LineStyle       =   1
         Style           =   7
         ImageList       =   "imgtvwExplorer"
         Appearance      =   1
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Calibri"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
      End
      Begin VB.Frame frameEstadoActual 
         Caption         =   "Estado actual y posibles problemas"
         Height          =   3975
         Left            =   6120
         TabIndex        =   10
         Top             =   1080
         Width           =   9135
         Begin MSComctlLib.ListView lvwEstado 
            Height          =   1335
            Left            =   1320
            TabIndex        =   11
            Top             =   1440
            Width           =   4695
            _ExtentX        =   8281
            _ExtentY        =   2355
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
            NumItems        =   0
         End
         Begin MSComctlLib.TabStrip TabStripEstados 
            Height          =   2895
            Left            =   120
            TabIndex        =   19
            Top             =   360
            Width           =   7095
            _ExtentX        =   12515
            _ExtentY        =   5106
            _Version        =   393216
            BeginProperty Tabs {1EFB6598-857C-11D1-B16A-00C0F0283628} 
               NumTabs         =   6
               BeginProperty Tab1 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
                  Caption         =   "Estadísticas"
                  ImageVarType    =   2
               EndProperty
               BeginProperty Tab2 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
                  Caption         =   "Asignación de recursos"
                  ImageVarType    =   2
               EndProperty
               BeginProperty Tab3 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
                  Caption         =   "Actividades rechazadas"
                  ImageVarType    =   2
               EndProperty
               BeginProperty Tab4 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
                  Caption         =   "Actividades sin colocar"
                  ImageVarType    =   2
               EndProperty
               BeginProperty Tab5 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
                  Caption         =   "Análisis de restricciones"
                  ImageVarType    =   2
               EndProperty
               BeginProperty Tab6 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
                  Caption         =   "Resumen del análisis de restricciones"
                  ImageVarType    =   2
               EndProperty
            EndProperty
         End
      End
      Begin VB.Frame frameDetalles 
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   7215
         Left            =   3840
         TabIndex        =   2
         Top             =   240
         Visible         =   0   'False
         Width           =   9615
         Begin VB.Frame frameCasillero 
            BackColor       =   &H00808080&
            BorderStyle     =   0  'None
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   6375
            Left            =   240
            TabIndex        =   3
            Top             =   720
            Width           =   9375
            Begin VB.CommandButton cmdZoomOut 
               Caption         =   "+"
               Height          =   255
               Left            =   0
               TabIndex        =   18
               ToolTipText     =   "Aumentar vista"
               Top             =   0
               Width           =   375
            End
            Begin VB.CommandButton turno 
               Caption         =   "1"
               Height          =   975
               Index           =   0
               Left            =   120
               TabIndex        =   22
               Top             =   480
               Visible         =   0   'False
               Width           =   255
            End
            Begin VB.CommandButton dia 
               Caption         =   "1"
               Height          =   255
               Index           =   0
               Left            =   480
               TabIndex        =   21
               Top             =   120
               Visible         =   0   'False
               Width           =   1335
            End
            Begin VB.VScrollBar svcasillero 
               Height          =   5895
               Left            =   9240
               Max             =   12
               TabIndex        =   17
               Top             =   0
               Width           =   255
            End
            Begin VB.HScrollBar shcasillero 
               Height          =   255
               Left            =   0
               Max             =   30000
               SmallChange     =   800
               TabIndex        =   16
               Top             =   5880
               Width           =   9255
            End
            Begin VB.CommandButton cmdZoomIn 
               Caption         =   "-"
               Height          =   255
               Left            =   7680
               TabIndex        =   15
               ToolTipText     =   "Reducir vista"
               Top             =   4920
               Width           =   255
            End
            Begin VB.CommandButton casilla 
               Height          =   975
               Index           =   0
               Left            =   480
               Style           =   1  'Graphical
               TabIndex        =   20
               Top             =   480
               Width           =   1335
            End
         End
         Begin VB.CommandButton cmdPeriodoSiguiente 
            Caption         =   ">"
            Height          =   495
            Left            =   5400
            TabIndex        =   0
            Top             =   120
            Width           =   615
         End
         Begin VB.CommandButton cmdPeriodoAnterior 
            Caption         =   "<"
            Height          =   495
            Left            =   240
            TabIndex        =   7
            Top             =   120
            Width           =   615
         End
         Begin VB.ComboBox cboPer 
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   315
            Left            =   3240
            Style           =   2  'Dropdown List
            TabIndex        =   6
            Top             =   240
            Width           =   2055
         End
         Begin VB.CommandButton labPeriodo 
            Caption         =   "Período"
            Height          =   495
            Left            =   720
            TabIndex        =   8
            Top             =   120
            Width           =   4695
         End
      End
      Begin VB.Image imgSplitter 
         Height          =   5355
         Left            =   3480
         MousePointer    =   9  'Size W E
         Top             =   0
         Width           =   105
      End
   End
   Begin MSComDlg.CommonDialog dlgCommonDialog 
      Left            =   0
      Top             =   3720
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
      Color           =   1
      FontBold        =   -1  'True
      FontStrikeThru  =   -1  'True
      Orientation     =   2
   End
   Begin MSComctlLib.ImageList imlRibbon 
      Left            =   0
      Top             =   4320
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   24
      ImageHeight     =   23
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   45
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ancora_goh_traditional_frmKernelMain.frx":FC08
            Key             =   ""
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ancora_goh_traditional_frmKernelMain.frx":1005A
            Key             =   ""
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ancora_goh_traditional_frmKernelMain.frx":104AC
            Key             =   ""
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ancora_goh_traditional_frmKernelMain.frx":108FE
            Key             =   ""
         EndProperty
         BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ancora_goh_traditional_frmKernelMain.frx":10D50
            Key             =   ""
         EndProperty
         BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ancora_goh_traditional_frmKernelMain.frx":111A2
            Key             =   ""
         EndProperty
         BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ancora_goh_traditional_frmKernelMain.frx":115F4
            Key             =   ""
         EndProperty
         BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ancora_goh_traditional_frmKernelMain.frx":11C4F
            Key             =   ""
         EndProperty
         BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ancora_goh_traditional_frmKernelMain.frx":120A1
            Key             =   ""
         EndProperty
         BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ancora_goh_traditional_frmKernelMain.frx":124F3
            Key             =   ""
         EndProperty
         BeginProperty ListImage11 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ancora_goh_traditional_frmKernelMain.frx":12B42
            Key             =   ""
         EndProperty
         BeginProperty ListImage12 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ancora_goh_traditional_frmKernelMain.frx":133E1
            Key             =   ""
         EndProperty
         BeginProperty ListImage13 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ancora_goh_traditional_frmKernelMain.frx":13833
            Key             =   ""
         EndProperty
         BeginProperty ListImage14 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ancora_goh_traditional_frmKernelMain.frx":14006
            Key             =   ""
         EndProperty
         BeginProperty ListImage15 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ancora_goh_traditional_frmKernelMain.frx":14458
            Key             =   ""
         EndProperty
         BeginProperty ListImage16 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ancora_goh_traditional_frmKernelMain.frx":14D30
            Key             =   ""
         EndProperty
         BeginProperty ListImage17 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ancora_goh_traditional_frmKernelMain.frx":15314
            Key             =   ""
         EndProperty
         BeginProperty ListImage18 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ancora_goh_traditional_frmKernelMain.frx":15766
            Key             =   ""
         EndProperty
         BeginProperty ListImage19 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ancora_goh_traditional_frmKernelMain.frx":15BB8
            Key             =   ""
         EndProperty
         BeginProperty ListImage20 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ancora_goh_traditional_frmKernelMain.frx":161CE
            Key             =   ""
         EndProperty
         BeginProperty ListImage21 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ancora_goh_traditional_frmKernelMain.frx":16A44
            Key             =   ""
         EndProperty
         BeginProperty ListImage22 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ancora_goh_traditional_frmKernelMain.frx":1713A
            Key             =   ""
         EndProperty
         BeginProperty ListImage23 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ancora_goh_traditional_frmKernelMain.frx":1758C
            Key             =   ""
         EndProperty
         BeginProperty ListImage24 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ancora_goh_traditional_frmKernelMain.frx":179DE
            Key             =   ""
         EndProperty
         BeginProperty ListImage25 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ancora_goh_traditional_frmKernelMain.frx":18109
            Key             =   ""
         EndProperty
         BeginProperty ListImage26 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ancora_goh_traditional_frmKernelMain.frx":188EF
            Key             =   ""
         EndProperty
         BeginProperty ListImage27 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ancora_goh_traditional_frmKernelMain.frx":192A2
            Key             =   ""
         EndProperty
         BeginProperty ListImage28 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ancora_goh_traditional_frmKernelMain.frx":19CD6
            Key             =   ""
         EndProperty
         BeginProperty ListImage29 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ancora_goh_traditional_frmKernelMain.frx":1A9F7
            Key             =   ""
         EndProperty
         BeginProperty ListImage30 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ancora_goh_traditional_frmKernelMain.frx":1B2A4
            Key             =   ""
         EndProperty
         BeginProperty ListImage31 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ancora_goh_traditional_frmKernelMain.frx":1BB03
            Key             =   ""
         EndProperty
         BeginProperty ListImage32 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ancora_goh_traditional_frmKernelMain.frx":1C4C5
            Key             =   ""
         EndProperty
         BeginProperty ListImage33 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ancora_goh_traditional_frmKernelMain.frx":1CDB7
            Key             =   ""
         EndProperty
         BeginProperty ListImage34 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ancora_goh_traditional_frmKernelMain.frx":1D5D9
            Key             =   ""
         EndProperty
         BeginProperty ListImage35 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ancora_goh_traditional_frmKernelMain.frx":1DB9F
            Key             =   ""
         EndProperty
         BeginProperty ListImage36 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ancora_goh_traditional_frmKernelMain.frx":1E3E6
            Key             =   ""
         EndProperty
         BeginProperty ListImage37 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ancora_goh_traditional_frmKernelMain.frx":1EC7E
            Key             =   ""
         EndProperty
         BeginProperty ListImage38 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ancora_goh_traditional_frmKernelMain.frx":1F0D0
            Key             =   ""
         EndProperty
         BeginProperty ListImage39 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ancora_goh_traditional_frmKernelMain.frx":1FA35
            Key             =   ""
         EndProperty
         BeginProperty ListImage40 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ancora_goh_traditional_frmKernelMain.frx":1FE87
            Key             =   ""
         EndProperty
         BeginProperty ListImage41 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ancora_goh_traditional_frmKernelMain.frx":2083A
            Key             =   ""
         EndProperty
         BeginProperty ListImage42 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ancora_goh_traditional_frmKernelMain.frx":211EF
            Key             =   ""
         EndProperty
         BeginProperty ListImage43 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ancora_goh_traditional_frmKernelMain.frx":21C1A
            Key             =   ""
         EndProperty
         BeginProperty ListImage44 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ancora_goh_traditional_frmKernelMain.frx":2211D
            Key             =   ""
         EndProperty
         BeginProperty ListImage45 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ancora_goh_traditional_frmKernelMain.frx":22951
            Key             =   ""
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.StatusBar StatusBar 
      Align           =   2  'Align Bottom
      Height          =   375
      Left            =   0
      TabIndex        =   14
      Top             =   9555
      Width           =   14100
      _ExtentX        =   24871
      _ExtentY        =   661
      _Version        =   393216
      BeginProperty Panels {8E3867A5-8586-11D1-B16A-00C0F0283628} 
         NumPanels       =   1
         BeginProperty Panel1 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Bevel           =   2
         EndProperty
      EndProperty
   End
   Begin VB.Menu popTvwExplorer 
      Caption         =   "popTvwExplorer"
      Visible         =   0   'False
      Begin VB.Menu popMenu 
         Caption         =   "Agregar especialidad"
         Index           =   1
      End
      Begin VB.Menu popMenu 
         Caption         =   "Agregar brigada"
         Index           =   2
      End
      Begin VB.Menu popMenu 
         Caption         =   "Agregar profesor"
         Index           =   3
      End
      Begin VB.Menu popMenu 
         Caption         =   "Agregar lugar"
         Index           =   4
      End
      Begin VB.Menu popMenu 
         Caption         =   "Agregar recurso"
         Index           =   5
      End
      Begin VB.Menu popMenu 
         Caption         =   "Niveles"
         Index           =   6
      End
      Begin VB.Menu popMenu 
         Caption         =   "-"
         Index           =   7
      End
      Begin VB.Menu popMenu 
         Caption         =   "Editar"
         Index           =   8
      End
   End
End
Attribute VB_Name = "frmKernelMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"489D486301A2"
''''''''''''''''''''''''''''''''''
'' Formulario principal
''

'-------------------------------------------------------------------
'Opciones ribbon, en el ImageList las imagenes tienen estos indices
'--------------------------------------------------------------------
''1 - Nuevo
''2 - Abrir
''3 - Guardar
''4 - Guardar como
''5 - Cerrar
''6 - Salir
''7 - Generales
''8 - Peridos
''9 - Especialidades
''10 - Niveles
''11 - Brigadas
''12 - Clasificaciones
''13 - grupox clasif
''14 - asig
''15 - desgloses
''16 - herencia de rest en tiempo
''17 - profesores
''18 - lugares
''19 - recursos
''20 - recursos x act
''21 - distancias
''22 - generar
''23 - redistribuir
''24 - horarios generados y asignaciones de actividades
''25 - act faltan por colocar
''26 - act rechazadas
''27 - confeccion de modelos
''28 - huecos comunes
''29 - resumen huecos y turnos extremos
''30 - faltan recursos
''31 - analisis restricc
''32 - analisis restricc resumen
''33 - estadisticas
''34 - comparativas
''35 - quitar huecos arriba
''36 - quitar huecos abajo
''37 - ver en casillas
''38 - mini horarios
''39 - imprimir borrador
''40 - duplicar info
''41 - autorestricc
''42 - publicar en HTML
''43 - opciones
''44 - minimiza cinta

''46 - asistente
''47 - acerca de
''''''''''''''''''''''''''''''''''''''''''''''''''''''

'--- variables

Private gotoval As Variant
Private gointo As Variant
Public ArchivoAbierto As Boolean

'---- variables para el explorador

Const NAME_COLUMN = 0
Const TYPE_COLUMN = 1
Const SIZE_COLUMN = 2
Const DATE_COLUMN = 3
Const sglSplitLimit = 500
Private mbMoving As Boolean
Private casillaactual As Integer
Private UltimoNodo As Long
Private Permutando As Boolean
Private permutaDia1 As Long
Private permutaDia2 As Long
Private permutaTurno1 As Long
Private permutaTurno2 As Long
Private ColoresAsignaturas() As Long
Private asigcasilla As Long
Private PeriodoActual As Long
Private RibbonDeshabilitado As Boolean
Private casillapermutando As Long
Dim opcionesActividad As Boolean
Dim lcasillero As Long
Dim tcasillero As Long
Dim w As Long
Dim h As Long
Dim MOSTRANDO_HORARIO As Boolean

Private Sub casilla_KeyPress(index As Integer, KeyAscii As Integer)
    If KeyAscii = 27 Then
        If Permutando Then
            Permutando = False
            goMuestraHorario
            casillapermutando = -1
            Exit Sub
        End If
    End If
End Sub

Private Sub Casilla_MouseMove(index As Integer, Button As Integer, Shift As Integer, x As Single, y As Single)
    casilla(index).SetFocus
End Sub

Private Sub cboPer_Click()
    If MOSTRANDO_HORARIO Then Exit Sub
    PeriodoActual = cboPer.ListIndex + 1
    goMuestraHorario
End Sub
Private Sub cmdPeriodoAnterior_Click()
    If PeriodoActual > 1 Then PeriodoActual = PeriodoActual - 1
    goMuestraHorario
End Sub

Private Sub cmdPeriodoSiguiente_Click()
    If PeriodoActual < ancora.periodos.Count Then PeriodoActual = PeriodoActual + 1
    goMuestraHorario
End Sub

Private Sub cmdZoomIn_Click()
    If h - 20 > 100 Then
        h = h - 20
        w = w - 20
        refresca
    End If
End Sub

Private Sub cmdZoomOut_Click()
    If h + 20 < 3000 Then
        h = h + 20
        w = w + 20
        refresca
    End If
End Sub

Private Sub Command1_Click()

End Sub

Private Sub dia_Click(index As Integer)
    Dim i As Long
    opcionesActividad = False
    For i = 1 To ancora.ct
        casilla_Click ((i - 1) * ancora.CD + index) - 1
    Next
    opcionesActividad = True
End Sub

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
    On Error Resume Next
    If KeyCode = 18 Then mainribbon.SetFocus
End Sub

Private Sub Form_Resize()
    Resize
    PosicionaProgress
End Sub

Public Sub goOpcion(id As String)
    mainRibbon_ButtonClick id, ""
End Sub

Private Sub mainRibbon_ButtonClick(ByVal id As String, ByVal Caption As String)

    If RibbonDeshabilitado Then Exit Sub

    RibbonDeshabilitado = True

    If Not ArchivoAbierto Then
        If id <> "archivo_nuevo" _
            And id <> "archivo_abrir" _
            And id <> "ayuda_asistente" _
            And id <> "ayuda_acercade" _
            And id <> "minimiza_cinta" _
            And id <> "opciones" Then
            interface.MessageDlg "Para comenzar...", "Primero abra o cree un archivo", 1, "Aceptar", , , 1
            mainribbon.select_tab 0
            Exit Sub
        End If
    End If

    Dim r As Integer
    Select Case id

        ''''''''''''''''''''''''''''''''''
        ' Archivo
        ''''''''''''''''''''''''''''''''''
        Case "archivo_nuevo"
            If ArchivoAbierto Then
                r = interface.MessageDlg("Antes de crear un archivo...", "¿Desea guardar los cambios efectuados", vbQuestion, "No", "Sí")
                If r = 2 Then ancora.Save
                CierraExploradorHorarios
            End If
            If interface.goKernelArchivoNuevo Then
                Enabled = True
                EstadoApp = True
                ArchivoAbierto = True
                ShowfrmExplorerSchedule
            End If

        Case "archivo_abrir"

            If ArchivoAbierto Then
                r = interface.MessageDlg("Antes de abrir un archivo...", "¿Desea guardar los cambios efectuados", vbQuestion, "No", "Sí")
                If r = 2 Then ancora.Save
                CierraExploradorHorarios
                ArchivoAbierto = False
            End If

            If interface.goKernelArchivoAbrir Then
                Enabled = True
                ArchivoAbierto = True
                EstadoApp = True
                ShowfrmExplorerSchedule
            End If

        Case "archivo_guardar"
            ancora.GuardarTodo

        Case "archivo_guardar_como"
            interface.goKernelArchivoGuardarComo

        Case "archivo_cerrar"
            If ArchivoAbierto Then
                r = interface.MessageDlg("Antes de crear un archivo...", "¿Desea guardar los cambios efectuados", vbQuestion, "No", "Sí")
                If r = 2 Then ancora.Save
                CierraExploradorHorarios
                ArchivoAbierto = False
            End If
            RibbonDeshabilitado = False
            Exit Sub

        Case "archivo_salir"
            If ArchivoAbierto Then
                r = interface.MessageDlg("Antes de crear un archivo...", "¿Desea guardar los cambios efectuados", vbQuestion, "No", "Sí")
                If r = 2 Then ancora.Save
            End If
            End


            ''''''''''''''''''''''''''''''''''
            ' Datos
            ''''''''''''''''''''''''''''''''''
        Case "datos_generales"
            interface.goKernelDatosGenerales
            Resize
            goMuestraHorario

        Case "datos_periodos"
            interface.goKernelDatosPeriodos
            RefrescaTree
            Resize
            goMuestraHorario

        Case "datos_especialidades"
            interface.goKernelDatosEspecialidades
            Resize
            RefrescaTree
            goMuestraHorario

        Case "datos_niveles"
            interface.goKernelDatosNiveles
            Resize
            RefrescaTree
            goMuestraHorario
            
        Case "datos_clasif"
            interface.goKernelDatosClasificaciones
            Resize
            RefrescaTree
            goMuestraHorario

        Case "datos_brigadas"
            interface.goKernelDatosBrigadas
            Resize
            RefrescaTree
            goMuestraHorario

        Case "datos_gxc"
            interface.goKernelDatosGrupoXClasif
            Resize
            goMuestraHorario

        Case "datos_asignaturas"
            interface.goKernelDatosAsignaturas
            Resize
            goMuestraHorario

        Case "datos_profesores"
            interface.goKernelDatosProfesores
            Resize
            RefrescaTree
            goMuestraHorario

        Case "datos_lugares"
            interface.goKernelDatosLugares
            Resize
            RefrescaTree
            goMuestraHorario

        Case "datos_recursos"
            interface.goKernelOtrosRecursos
            Resize
            RefrescaTree
            goMuestraHorario

        Case "datos_desgloses"
            interface.goKernelDatosDesgloses
            Resize
            goMuestraHorario

        Case "datos_distancias"
            interface.goKernelDatosDistancias

        Case "datos_rxact"
            interface.goKernelDatosRxAct

        Case "datos_hrt"
            interface.goDatosHRT

        Case "datos_explorador_act"
            interface.goExploradorActividades

        Case "archivo_exportarhorarioshtml"
            interface.goPublicarEnHTML
            ''''''''''''''''''''''''''''''''''
            ' Horarios
            ''''''''''''''''''''''''''''''''''
        Case "horarios_generar":            interface.goKernelGenerar
        Case "horarios_redistribuir":            frmHerramientasRedistribuir.Show vbModal
        Case "horarios_degenerar":
            interface.showHorariosGenerados
            Resize
            goMuestraHorario
        
        Case "horarios_faltan":
            frameDetalles.Visible = False
            frameEstadoActual.Visible = True
            TabStripEstados.Tabs(4).Selected = True
        Case "horarios_imposibles":
            frameDetalles.Visible = False
            frameEstadoActual.Visible = True
            TabStripEstados.Tabs(3).Selected = True
        Case "horarios_modelos":            frmReportesCreaModelos.Show

            '''''''''''''''''''''''''''''''''
            'este horario
            ''''''''''''''''''''''''''''''''

        Case "este_horario_quita_huecos_arriba":       goQuitaHueco 1
        Case "este_horario_quita_huecos_abajo":        goQuitaHueco 2
        Case "este_horario_permutar":           permutan
        Case "este_horario_cambios":        cambios
        Case "este_horario_minihorario":         PasaMinihor
        Case "este_horario_ver":       verCasillas
        Case "este_horario_imprimir":   PasaAImprimir


            ''''''''''''''''''''''''''''''''''''''
            '' herramientas
            ''''''''''''''''''''''''''''''''''''''

        Case "herramientas_autorestricc": interface.goKernelAutoRestricc
        Case "herramientas_duplicar":         frmHerramientasDuplicar.Show


            ''''''''''''''''''''''''''''''''''
            ' Analisis
            ''''''''''''''''''''''''''''''''''
        Case "analisis_huecos_comunes":          interface.goReporteHuecosComunes
        Case "analisis_resumen_huecos":            frmReportesResumenHuecos.Show vbModal
        Case "analisis_estadisticas":
            frameDetalles.Visible = False
            frameEstadoActual.Visible = True
            TabStripEstados.Tabs(1).Selected = True
        Case "analisis_recursos":
            frameDetalles.Visible = False
            frameEstadoActual.Visible = True
            TabStripEstados.Tabs(2).Selected = True
        Case "analisis_restricc":
            frameDetalles.Visible = False
            frameEstadoActual.Visible = True
            TabStripEstados.Tabs(5).Selected = True
       
        Case "analisis_restricc_resumen":                        frameDetalles.Visible = False
            frameEstadoActual.Visible = True
            TabStripEstados.Tabs(6).Selected = True
       

        Case "analisis_comparativo":            interface.goReporteAnalisisComparativo

            ''
            'aryuda
            '''''''''''''''
        Case "ayuda_asistente":
            If Not ArchivoAbierto Then
                r = interface.MessageDlg("Asistente", "Desea lanzar el asistente creando o abriendo un archivo", 1, "Cancelar", "Abriendo", "Creando", 1)
                If r = 1 Then Exit Sub
                interface.goAsistente r = 3, True
            Else
                interface.goAsistente False, False
            End If
        Case "ayuda_acercade":            frmKernelAbout.Show vbModal, Me

            'generales
        Case "minimiza_cinta":
            mainribbon.Minimizar
            Form_Resize
    End Select

    RibbonDeshabilitado = False
End Sub

Private Sub Form_Unload(Cancel As Integer)

    Dim r As Variant, i As Long
    If ArchivoAbierto Then

        r = interface.MessageDlg("Antes de salir...", "¿Desea guardar los cambios efectuados antes de cerrar?", vbQuestion, "Cancelar", "No", "Sí", 1)
        If r = 3 Then ancora.GuardarTodo
        If r <> 1 Then
            Hide
            EstadoApp = False
        Else
            Cancel = 1
            Exit Sub
        End If
    End If

    For j = 1 To casilla.Count - 1
        Unload casilla(j)
    Next


    kernel.Ancora_Finaliza
    Set kernel = Nothing
    Hide
    End
End Sub

Private Sub Form_Activate()
    Dim i As Long
    If frmKernelBienvenido.Visible Then frmKernelBienvenido.SetFocus
    interface.console.Hide
End Sub

Private Function NextIcon(ByRef ic As Integer) As Integer
    ic = ic + 1
    NextIcon = ic
End Function

Private Sub Form_Load()
    
    interface.SkinFor Me
    Set Me.lvwEstado.SmallIcons = Me.imlRibbon
    Set Me.lvwEstado.Icons = Me.imlRibbon
    creaRibbon
    TabStripEstados.Tabs(1).Selected = True
    interface.filllvwEstadisticas lvwEstado, 33
End Sub

Public Sub creaRibbon()
'creando el Ribbon
    With mainribbon
        .Theme = 2   ' 0 - Black 1 - Blue 2 - Silver
        .ImageList = imlRibbon
        .ButtonCenter = False

        Dim ic As Integer
        ic = 0
        .addTab "archivo", "Archivo"
        .addCat "archivo_comenzando", "archivo", "Comenzando", False
        .addButton "archivo_nuevo", "archivo_comenzando", "Nuevo", NextIcon(ic), False
        .addButton "archivo_abrir", "archivo_comenzando", "Abrir", NextIcon(ic), False
        .addCat "archivo_trabajando", "archivo", "Trabajando", False
        .addButton "archivo_guardar", "archivo_trabajando", "Guardar", NextIcon(ic), False, "Guardar el archivo"
        .addButton "archivo_guardar_como", "archivo_trabajando", "Guardar como...", NextIcon(ic), False, "Hacer una copia del archivo"

        .addCat "archivo_terminando", "archivo", "Terminando", False
        .addButton "archivo_cerrar", "archivo_terminando", "Cerrar", NextIcon(ic), False, "Cerrar el archivo"
        .addButton "archivo_salir", "archivo_terminando", "Salir", NextIcon(ic), False, "Salir de la aplicación"
        .addTab "datos", "Tiempo y objetos"
        
            .addCat "datos_configuracion_tiempo", "datos", "Tiempo", False
            .addButton "datos_generales", "datos_configuracion_tiempo", "Generales", NextIcon(ic), False, "Establecer la configuración general de tiempo"
            .addButton "datos_periodos", "datos_configuracion_tiempo", "Períodos", NextIcon(ic), False, "Establecer los períodos"
    
            .addCat "datos_objetos", "datos", "Objetos", False
            .addButton "datos_especialidades", "datos_objetos", "Especialidades", NextIcon(ic), False, "Especialidades"
            .addButton "datos_niveles", "datos_objetos", "Niveles", NextIcon(ic), False, "Niveles"
            .addButton "datos_brigadas", "datos_objetos", "Brigadas", NextIcon(ic), False, "Brigadas"
            .addButton "datos_clasif", "datos_objetos", "Clasificación " & vbNewLine & "de actividades", NextIcon(ic), False
            .addButton "datos_gxc", "datos_objetos", "Grupos", NextIcon(ic), False
            .addButton "datos_asignaturas", "datos_objetos", "Asignaturas", NextIcon(ic), False
            .addButton "datos_desgloses", "datos_objetos", "Desgloses", NextIcon(ic), False
    
            .addButton "datos_hrt", "datos_objetos", "Herencia de restricciones", NextIcon(ic), False
            .addTab "datos_recur", "Recursos"
            .addCat "datos_asig_recursos", "datos_recur", "Recursos", False
            .addButton "datos_profesores", "datos_asig_recursos", "Profesores", NextIcon(ic), False, "Profesores"
            .addButton "datos_lugares", "datos_asig_recursos", "Lugares", NextIcon(ic), False, "Lugares"
            .addButton "datos_recursos", "datos_asig_recursos", "Recursos " & vbNewLine & "transportables", NextIcon(ic), False, "Lugares"
            .addButton "datos_rxact", "datos_asig_recursos", "Recursos por actividad", NextIcon(ic), False, "Lugares"
            .addButton "datos_distancias", "datos_asig_recursos", "Distancias", NextIcon(ic), False, "Distancias entre lugares"
            .addTab "horarios", "Horarios"
            .addCat "horarios_generacion", "horarios", "Generación", False
            .addButton "horarios_generar", "horarios_generacion", "Generar", NextIcon(ic), False, "Generar horarios"
            .addButton "horarios_redistribuir", "horarios_generacion", "Redistribuir", NextIcon(ic)
    
            .addCat "horarios_resultados", "horarios", "Resultados", False
            
            ic = ic + 1 'esto es porque el icono de asignaciones de actividades (opcion que eliminé) está metío en el medio
            
            .addButton "horarios_degenerar", "horarios_resultados", "Horarios generados", ic
            .addButton "horarios_faltan", "horarios_resultados", "Faltan por colocar", NextIcon(ic), False
            .addButton "horarios_imposibles", "horarios_resultados", "Actividades rechazadas", NextIcon(ic), False
            .addCat "horarios_reportes", "horarios", "Reportes", False
            .addButton "horarios_modelos", "horarios_reportes", "Confección de modelos", NextIcon(ic), False
    
            .addTab "analisis", "Analisis"
            .addCat "analisis_huecos", "analisis", "Huecos", False
            .addButton "analisis_huecos_comunes", "analisis_huecos", "Huecos comunes", NextIcon(ic)
            .addButton "analisis_resumen_huecos", "analisis_huecos", "Huecos y turnos extremos", NextIcon(ic)
            .addCat "analisis_rec", "analisis", "Recursos", False
            .addButton "analisis_recursos", "analisis_rec", "Recursos faltantes", NextIcon(ic)
            .addButton "analisis_restricc", "analisis_rec", "Detallado de restricciones", NextIcon(ic)
            .addButton "analisis_restricc_resumen", "analisis_rec", "Resumen de restricciones", NextIcon(ic)
            .addCat "analisis_generales", "analisis", "Generales", False
            .addButton "analisis_estadisticas", "analisis_generales", "Estadísticas", NextIcon(ic)
            .addButton "analisis_comparativo", "analisis_generales", "Análisis " & vbNewLine & "Comparativo", NextIcon(ic)
    
    
            .addTab "este_horario", "EsteHorario"
            .addCat "este_horario_planificacion", "este_horario", "Planificación", False
            .addButton "este_horario_quita_huecos_arriba", "este_horario_planificacion", "Quitar huecos" & vbNewLine & "Arriba", NextIcon(ic)
            .addButton "este_horario_quita_huecos_abajo", "este_horario_planificacion", "Quitar huecos" & vbNewLine & "Abajo", NextIcon(ic)
            .addCat "este_horario_visualizacion", "este_horario", "Visualización", False
            .addButton "este_horario_ver", "este_horario_visualizacion", "Ver en casilla..", NextIcon(ic)
            .addButton "este_horario_minihorario", "este_horario_visualizacion", "Minihorario", NextIcon(ic)
            .addButton "este_horario_imprimir", "este_horario_visualizacion", "Imprimir" & vbNewLine & "borrador", NextIcon(ic)
        
        
        .addTab "herramientas", "Herramientas"
        
            .addCat "herramientas_datos", "herramientas", "Datos", False
            .addButton "herramientas_duplicar", "herramientas_datos", "Duplicar" & vbNewLine & "Información", NextIcon(ic)
            .addButton "herramientas_autorestricc", "herramientas_datos", "Restringir a...", NextIcon(ic), False, "Restringir en tiempo automáticamente a varios objetos"
            .addCat "herramientas_publicacion", "herramientas", "Publicación", False
            .addButton "archivo_exportarhorarioshtml", "herramientas_publicacion", "Publicar Horarios en HTML", NextIcon(ic), False, "Generar sitio web para la publicación de horarios"
        
        .addCat "herramientas_cinta", "herramientas", "Cinta de opciones", False
        .addButton "minimiza_cinta", "herramientas_cinta", "Minimizar", NextIcon(ic), False, "Minimiza la cinta de opciones"

        .addTab "ayuda", "Ayuda"
        .addCat "ayuda_", "ayuda", "Ayuda", False
        .addButton "ayuda_asistente", "ayuda_", "Asistente", NextIcon(ic)
        .addCat "ayuda_contactos", "ayuda", "Contactos", False
        .addButton "ayuda_acercade", "ayuda_contactos", "Acerca de..", NextIcon(ic)
        .Refresh
    End With
End Sub

'-------------------------- EXPLORADOR DE HORARIOS -------------------------------
Private Sub casilla_GotFocus(index As Integer)
    showDatosCasilla index
End Sub

Private Sub Casilla_MouseDown(index As Integer, Button As Integer, Shift As Integer, x As Single, y As Single)
    Dim i As Long, r As Variant, n As String, p As String
    Dim k As Long, fila As Long, col As Long, tipo As Long
    If Button = 2 And casilla(index).Tag = "act" Then
         n = tvwScheduleExplorer.SelectedItem.key

            p = Mid(n, 1, 4)
            tipo = 0
            If p = "brg_" Then tipo = dBRIGADA
            If p = "prf_" Then tipo = dPROFE
            If p = "lug_" Then tipo = dLUGAR
            If p = "res_" Then tipo = dRECURSO
            
            If tipo <> 0 Then
                n = Mid(n, 5)
        
                frameCasillero.Enabled = True
                    If Permutando Then
                        If index = casillapermutando Then
                            Permutando = False
                            goMuestraHorario
                            casillapermutando = -1
                            Exit Sub
                        End If
                        k = index + 1
                        fila = Int(((k - 1) / ancora.CD) + 1)
                        col = Int(k - (fila - 1) * ancora.CD)
                        permutaDia2 = col
                        permutaTurno2 = fila
                        If permutaDia2 = permutaDia1 And permutaTurno1 = permutaTurno2 Then
                            interface.MessageDlg "Para permutar actividades...", "Seleccione otra actividad", vbInformation, "Aceptar", , , 1
                            Exit Sub
                        End If

                        casilla(index).Picture = imlCasillas.ListImages(9).Picture
                        Permutando = False
                        r = interface.MessageDlg("Permutar actividades...", "¿Está seguro que desea permutar estas actividades?", vbQuestion, "No", "Si", , 1)
                        If r = 2 Then
                            If ancora.permuta(MatrixAsignaciones_frmExplorerSchedule(permutaDia1, permutaTurno1), MatrixAsignaciones_frmExplorerSchedule(permutaDia2, permutaTurno2)) Then
                                interface.MessageDlg "Permuta finalizada", "Actividades permutadas satisfactoriamente", vbInformation, "Aceptar", , , 1
                            Else
                                interface.MessageDlg "Permuta rechazada", "No se pudo permutar las actividades seleccionadas", vbCritical, "Aceptar", , , 1
                            End If

                        End If

                        goMuestraHorario
                    Else

                        Permutando = True
                        casillapermutando = index
                        For i = 1 To casilla.Count
                            casilla(i - 1).Picture = Nothing
                        Next

                        casilla(index).Picture = imlCasillas.ListImages(8).Picture
                        k = index + 1
                        fila = Int(((k - 1) / ancora.CD) + 1)
                        col = Int(k - (fila - 1) * ancora.CD)
                        permutaDia1 = col
                        permutaTurno1 = fila

                    End If

        End If

    End If

End Sub

Private Sub casilla_Click(index As Integer)
    goMPIIn Val(index)
End Sub


Private Sub mainRibbon_TabClick(ByVal id As String, ByVal Caption As String)
    mainribbon.Maximizar
    Form_Resize
End Sub


Private Sub popMenu_Click(index As Integer)
    Select Case index
        Case 1: interface.goDataInsertarEspecialdiades False
        Case 2: interface.goDataInsertarBrigadas False
        Case 3: interface.goDataInsertarProfesor False
        Case 4: interface.goDataInsertarLugar False
        Case 5: interface.goDataInsertarRecurso False
        Case 6: interface.goKernelDatosNiveles
        Case 8: tvwScheduleExplorer_DblClick
    End Select
    RefrescaTree
    goMuestraHorario
End Sub

Private Sub TabStripEstados_Click()
    If Not TabStripEstados.SelectedItem Is Nothing Then
        Select Case TabStripEstados.SelectedItem.index
            Case 1: interface.filllvwEstadisticas lvwEstado, 33
            Case 2: interface.filllvwAnalisisRecursos lvwEstado, 30
            Case 3: interface.filllvwImposibles lvwEstado, 27
            Case 4:
                ancora.BuscaSinGenerar
                interface.filllvwActividadesSinGenerar lvwEstado, 26
            Case 5:
                ancora.AnalisisPrecentRestricc
                interface.filllvwAnalisisPercentRestricc lvwEstado, 31
            Case 6:
                ancora.AnalisisPrecentRestricc
                cantResumenRestricc = 0
                Dim i As Long
                ReDim ResumenRestricc(1)
                For i = 1 To cantPercentRestricc
                    With PercentRestricc(i)
                        addResumenRestricc .parte, .dato
                    End With
                Next
                interface.filllvwAnalisisRestriccionesResumen lvwEstado, 32
        End Select
    End If
End Sub

Private Sub turno_Click(index As Integer)
    Dim i As Long
    opcionesActividad = False
    For i = 1 To ancora.CD
        casilla_Click ((index - 1) * ancora.CD + i - 1)
    Next
    opcionesActividad = True
End Sub

Private Sub tvwScheduleExplorer_DblClick()
    If tvwScheduleExplorer.SelectedItem Is Nothing Then Exit Sub
    Dim k As String, modo As Integer
    k = getKeyOfNodoActual
    modo = 0
    If Mid(k, 1, 4) = "brg_" Then modo = dBRIGADA
    If Mid(k, 1, 4) = "prf_" Then modo = dPROFE
    If Mid(k, 1, 4) = "lug_" Then modo = dLUGAR
    If Mid(k, 1, 4) = "res_" Then modo = dRECURSO
    If Mid(k, 1, 4) = "esp_" Then modo = dESPECIALIDAD
    If Mid(k, 1, 4) = "per_" Then modo = dPERIODO
    If Mid(k, 1, 4) = "cla_" Then modo = dCLASIF
    If Mid(k, 1, 4) = "asg_" Then modo = dASIG
    
    If modo = 0 Or Len(k) = 1 Then Exit Sub
    k = Mid(k, 5)
    interface.goDatosEditar modo, k
    RefrescaTree
    goMuestraHorario
End Sub

Private Sub tvwScheduleExplorer_KeyDown(KeyCode As Integer, Shift As Integer)
    If KeyCode = 116 Then RefrescaTree
    If KeyCode = 93 Then PopupMenu popTvwExplorer
End Sub

Private Sub tvwScheduleExplorer_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
    If Button = 2 Then PopupMenu popTvwExplorer
End Sub

Private Sub tvwScheduleExplorer_NodeClick(ByVal Node As MSComctlLib.Node)

    On Error Resume Next

    If Not MOSTRANDO_HORARIO Then
        keyfrmExplorerSchedule = Node.key
        goMuestraHorario
        UltimoNodo = Node.index
        mainribbon.select_tab 5

    Else
        tvwScheduleExplorer.Nodes(UltimoNodo).Selected = True
        tvwScheduleExplorer.Nodes(UltimoNodo).EnsureVisible
    End If
    tvwScheduleExplorer.SetFocus
    tvwScheduleExplorer.SelectedItem.EnsureVisible
End Sub

Private Sub imgSplitter_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)

    With imgSplitter
        picSplitter.Move .Left, .Top, .Width \ 2, .Height - 20
    End With

    picSplitter.Visible = True
    mbMoving = True
End Sub

Private Sub imgSplitter_MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)
    Dim sglPos As Single
    If mbMoving Then
        sglPos = x + imgSplitter.Left
        If sglPos < sglSplitLimit Then
            picSplitter.Left = sglSplitLimit
        ElseIf sglPos > Width - sglSplitLimit Then
            picSplitter.Left = Width - sglSplitLimit
        Else
            picSplitter.Left = sglPos
        End If
    End If
End Sub

Private Sub imgSplitter_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
    SizeControls picSplitter.Left
    picSplitter.Visible = False
    mbMoving = False
    Resize
End Sub

Private Sub tvwScheduleExplorer_DragDrop(Source As Control, x As Single, y As Single)
    If Source = imgSplitter Then
        SizeControls x
    End If

End Sub

Sub goQuitaHueco(sentido As Long)
    Dim n As String, p As String, tipo As Long, r As Variant, j As Long, asg As Long, i As Long

    If Not tvwScheduleExplorer.SelectedItem Is Nothing Then
        n = tvwScheduleExplorer.SelectedItem.key
        ancora.updateHashPxAct
        If Len(n) > 1 Then
            p = Mid(n, 1, 4)
            n = Mid(n, 5)

            If p = "brg_" Then
                r = interface.MessageDlg("Quitar huecos", "¿Está seguro que desea quitar los huecos?", vbQuestion, "No", "Sí")
                If r = 2 Then
                    refresca
                    frameCasillero.Enabled = True
                    For i = 1 To ancora.CD

                        For j = 1 To ancora.ct
                            DoEvents
                            If MatrixAsignaciones_frmExplorerSchedule(i, j) <> 0 Then

                                With Asignaciones(MatrixAsignaciones_frmExplorerSchedule(i, j))
                                    asg = ancora.IndexById(dASIG, .idasig)
                                    ESPEC_GENERANDO = ancora.IndexById(dESPECIALIDAD, asig(asg).idesp)
                                    ancora.QuitaHuecos n, ancora.periodos(PeriodoActual).id, sentido
                                    GoTo salir
                                End With

                            End If

                        Next

                    Next

                End If

            End If

        End If
    End If

salir:
    goMuestraHorario
End Sub


Public Sub setPropertiesCasilla(index As Long, Optional bcolor As Long, Optional cap As String, Optional enab As Boolean, Optional Pic As StdPicture)

    With casilla(index)
        .BackColor = bcolor
        .Caption = cap
        Set .Picture = Pic
        .Enabled = enab
    End With

End Sub

Sub goMuestraHorario()

    On Error GoTo errdep

    Dim n As String, p As String, tipo As Long, i As Long, cap As String

    frameDetalles.Visible = ancora.periodos.Count > 0 And isNodoActualUnRestringido
    frameEstadoActual.Visible = Not frameDetalles.Visible
    If Not frameDetalles.Visible Then
        TabStripEstados_Click
        Exit Sub
    End If
    If Not tvwScheduleExplorer.SelectedItem Is Nothing And frameDetalles.Visible Then
        cap = tvwScheduleExplorer.SelectedItem.Text

        n = tvwScheduleExplorer.SelectedItem.key

            p = Mid(n, 1, 4)
            tipo = 0
            If p = "brg_" Then tipo = dBRIGADA
            If p = "prf_" Then tipo = dPROFE
            If p = "lug_" Then tipo = dLUGAR
            If p = "res_" Then tipo = dRECURSO
            If p = "esp_" Then tipo = dESPECIALIDAD
            If p = "asg_" Then tipo = dASIG
            If p = "per_" Then tipo = dPERIODO
            If p = "cla_" Then tipo = dCLASIF
            
            If tipo <> 0 Then
                n = Mid(n, 5)

                For i = 0 To casilla.Count - 1
                    setPropertiesCasilla i, &HE0E0E0, "", True
                Next

                frameCasillero.Enabled = True
                mostrarHorario tipo, n
                If PeriodoActual > 0 Then labPeriodo.Caption = interface.getNameOfArreglo(tipo) & ":" & interface.getRS_Generico(tipo, 0, n) & " / Período: " & interface.getRS_Periodo(PeriodoActual)
                refresca
                Exit Sub
            End If
    End If

    For i = 0 To casilla.Count - 1
        setPropertiesCasilla i, &HE0E0E0, "", False, Nothing
    Next

    frameCasillero.Enabled = False
finish:

    refresca
    Exit Sub
errdep:
    Debug.Print Err.Number, Erl, Err.Description
    Resume finish
End Sub

Public Sub PasaAImprimir()
    Dim n As String, i As Long, p As String, tipo As Long
    Dim k As Long, id As Long, dia As Long, turno As Long
    n = tvwScheduleExplorer.SelectedItem.key
    If Len(n) > 1 Then
        p = Mid(n, 1, 4)
        tipo = 0
        If p = "brg_" Then tipo = dBRIGADA
        If p = "prf_" Then tipo = dPROFE
        If p = "lug_" Then tipo = dLUGAR
        If p = "res_" Then tipo = dRECURSO
        If tipo <> 0 Then
            n = Mid(n, 5)


            refresca
            frameCasillero.Enabled = True
            id = ancora.IndexById(tipo, n)

            With DatosImprimir

                Select Case tipo
                    Case dBRIGADA:
                        .Nivel = Brigada(id).Nivel
                        .esp = ancora.IndexById(dESPECIALIDAD, Brigada(id).idesp, 0)
                        .per = PeriodoActual
                        .id = id
                        .tipo = 1
                    Case dPROFE:
                        .Nivel = 0
                        .esp = 0
                        .per = PeriodoActual
                        .id = id
                        .tipo = 2
                    Case dLUGAR:
                        .Nivel = 0
                        .esp = 0
                        .per = PeriodoActual
                        .id = id
                        .tipo = 3
                    Case dRECURSO
                        .Nivel = 0
                        .esp = 0
                        .per = PeriodoActual
                        .id = id
                        .tipo = 4
                End Select

            End With

            For dia = 1 To ancora.CD

                For turno = 1 To ancora.ct
                    k = (turno - 1) * ancora.CD + dia
                    k = k - 1
                    HorarioImprimir(dia, turno) = casilla(k).Caption
                Next

            Next

        End If

        frmReportesImprimir.Show vbModal
        Exit Sub
    End If

    interface.MessageDlg "No se puede imprimir...", "Seleccione un horario", vbExclamation, "Aceptar"
End Sub

Public Sub PasaMinihor()
    Dim n As String, p As String, tipo As Long
    n = tvwScheduleExplorer.SelectedItem.key
    If Len(n) > 1 Then
        p = Mid(n, 1, 4)
        tipo = 0
        If p = "brg_" Then tipo = dBRIGADA
        If p = "prf_" Then tipo = dPROFE
        If p = "lug_" Then tipo = dLUGAR
        If p = "res_" Then tipo = dRECURSO
        If tipo <> 0 Then
            n = Mid(n, 5)
            frameCasillero.Enabled = True
            interface.MuestraMiniHorario n, tipo
            Exit Sub
        End If
    End If

    interface.MessageDlg "Para mostrar un mini horario...", "Seleccione primero un horario", vbInformation, "Aceptar"
End Sub

Public Sub permutan()
    Casilla_MouseDown casillaactual, 2, 0, 0, 0
End Sub

Public Sub verCasillas()
    frmMostrarEnHorarios.Show vbModal, frmKernelMain
    goMuestraHorario
End Sub

Public Sub cambios()
    casilla_Click casillaactual
End Sub

Public Sub SizeControls(x As Single)
    'establecer el ancho
    If x < 1500 Then x = 1500
    If x > (Width - 1500) Then x = Width - 1500
    tvwScheduleExplorer.Width = x
    imgSplitter.Left = x
    frameDetalles.Left = x + imgSplitter.Width
    frameDetalles.Width = Width - tvwScheduleExplorer.Width - imgSplitter.Width - 250
    frameEstadoActual.Width = frameDetalles.Width
    frameEstadoActual.Left = frameDetalles.Left
    'establecer la coordenada superior
    frameDetalles.Top = tvwScheduleExplorer.Top
    frameEstadoActual.Top = frameDetalles.Top
    imgSplitter.Top = tvwScheduleExplorer.Top
    imgSplitter.Height = tvwScheduleExplorer.Height
End Sub

Public Sub ShowfrmExplorerSchedule()
    On Error Resume Next
    frameExploradorHorarios.Visible = True
    frameDetalles.Visible = ancora.periodos.Count > 0 And isNodoActualUnObjeto
    frameEstadoActual.Visible = Not frameDetalles.Visible
    If ArchivoAbierto Then
        For j = 1 To ancora.CD * ancora.ct - 1
            Load casilla(j)
            casilla(j).Visible = True
        Next

        For i = 1 To ancora.ct
            Load turno(i)
            turno(i).Visible = True
            turno(i).Caption = "" & i
            turno(i).ZOrder 0
        Next
        For i = 1 To ancora.CD
            Load dia(i)
            dia(i).Visible = True
            dia(i).Caption = "" & i
            dia(i).ZOrder 0
        Next
    End If

    keyfrmExplorerSchedule = "H"

    For i = 0 To casilla.Count - 1
        ColoresAct(i) = &H8000000F
        casilla(i).Picture = casilla(0).Picture
        If i > ancora.CD * ancora.ct - 1 Then casilla(i).Visible = False
        CantTurnosAct(i) = 1
    Next

    For i = 1 To ancora.CD

        For j = 1 To ancora.ct
            MatrixAsignaciones_frmExplorerSchedule(i, j) = 0
        Next

    Next
    RefrescaTree
    Resize
End Sub

Public Sub RefrescaTree()
    Dim i As Long, bb As String


    With tvwScheduleExplorer
        .Nodes.clear
        .Nodes.add , , "H", Directorio & "\" & NameFile, 1, 1
        
        'periodos
        .Nodes.add "H", tvwChild, "I", "Períodos(" & ancora.periodos.Count & ")", 11, 11
        
        For i = 1 To ancora.periodos.Count
            .Nodes.add "I", tvwChild, "per_" & ancora.periodos(i).id, interface.getRS_Periodo(i), 11, 11
            .Nodes(.Nodes.Count).Tag = "" & i
        Next
        
        
        'clasificaciones
        
        .Nodes.add "H", tvwChild, "C", "Clasificaciones de actividades(" & ancora.cantClasif & ")", 12, 12
        
        For i = 1 To ancora.cantClasif
            .Nodes.add "C", tvwChild, "cla_" & clasif(i).comun.id, interface.getRS_Clasificacion(i), 12, 12
            .Nodes(.Nodes.Count).Tag = "" & i
        Next
        
        
        'especialidades
        .Nodes.add "H", tvwChild, "E", "Especialidades(" & ancora.cantEsp & ")", 2, 2


        For i = 1 To ancora.cantEsp
            .Nodes.add "E", tvwChild, "esp_" & kernel.utils.trunca(Especialidad(i).id), "(" & kernel.utils.trunca(Especialidad(i).id) & ") " & kernel.utils.trunca(Especialidad(i).descrip), 2, 2
            .Nodes(.Nodes.Count).Tag = "" & i
            
            For j = 1 To ancora.cantNiveles
                .Nodes.add "esp_" & kernel.utils.trunca(Especialidad(i).id), tvwChild, "esp_" & kernel.utils.trunca(Especialidad(i).id) & "_" & j, "" & j, 3, 3
                .Nodes.add "esp_" & kernel.utils.trunca(Especialidad(i).id) & "_" & j, tvwChild, "esp_" & kernel.utils.trunca(Especialidad(i).id) & "_" & j & "_asg", "Asignaturas", 13, 13
                .Nodes.add "esp_" & kernel.utils.trunca(Especialidad(i).id) & "_" & j, tvwChild, "esp_" & kernel.utils.trunca(Especialidad(i).id) & "_" & j & "_brg", "Brigadas", 4, 4
            Next

        Next

        'brigadas
        For i = 1 To ancora.cantBrg
            bb = 4
            If Brigada(i).comun.virtual Then bb = 8
            .Nodes.add "esp_" & kernel.utils.trunca(Brigada(i).idesp) & "_" & Brigada(i).Nivel & "_brg", tvwChild, "brg_" + Brigada(i).comun.id, "(" + kernel.utils.trunca(Brigada(i).comun.id) + ") " + kernel.utils.trunca(Brigada(i).comun.descrip), Val(bb)
            .Nodes(.Nodes.Count).Tag = "" & i
        Next


        'asignaturas
        
        For i = 1 To ancora.cantAsig
            .Nodes.add "esp_" & kernel.utils.trunca(asig(i).idesp) & "_" & asig(i).Nivel & "_asg", tvwChild, "asg_" & asig(i).comun.id, interface.getRS_Asignatura(i), 13, 13
            .Nodes(.Nodes.Count).Tag = "" & i
        Next

        'Profesores
        .Nodes.add "H", tvwChild, "P", "Profesores(" & ancora.cantProfe & ")", 5, 5

        For i = 1 To ancora.cantProfe
            bb = 5
            If Mid(profe(i).id, 1, 1) = "_" Then bb = 9
            .Nodes.add "P", tvwChild, "prf_" & profe(i).id, "(" + kernel.utils.trunca(profe(i).id) + ") " + kernel.utils.trunca(profe(i).descrip), Val(bb)
            .Nodes(.Nodes.Count).Tag = "" & i
        Next

        'Lugares
        .Nodes.add "H", tvwChild, "L", "Lugares(" & ancora.cantLug & ")", 6, 6

        For i = 1 To ancora.cantLug
            bb = 6
            If Mid(lugar(i).id, 1, 1) = "_" Then bb = 10
            .Nodes.add "L", tvwChild, "lug_" & lugar(i).id, "(" + kernel.utils.trunca(lugar(i).id) + ") " + kernel.utils.trunca(lugar(i).descrip), Val(bb)
            .Nodes(.Nodes.Count).Tag = "" & i
        Next

        'Recursos
        .Nodes.add "H", tvwChild, "R", "Otros recursos(" & ancora.recursos.Count & ")", 7, 7

        For i = 1 To ancora.recursos.Count
            bb = 7
            If Mid(ancora.recursos(i).id, 1, 1) = "_" Then bb = 7
            .Nodes.add "R", tvwChild, "res_" & ancora.recursos(i).id, "(" + ancora.recursos(i).id + ") " + kernel.utils.trunca(ancora.recursos(i).descrip), Val(bb)
            .Nodes(.Nodes.Count).Tag = "" & i
        Next

    End With



    For i = 1 To tvwScheduleExplorer.Nodes.Count
        If tvwScheduleExplorer.Nodes(i).key = keyfrmExplorerSchedule Then
            tvwScheduleExplorer.SelectedItem = tvwScheduleExplorer.Nodes(i)
            'click
        End If

    Next
    tvwScheduleExplorer.Nodes(1).Expanded = True
    If Not tvwScheduleExplorer.SelectedItem Is Nothing Then
        tvwScheduleExplorer.SelectedItem.EnsureVisible
    Else
        If tvwScheduleExplorer.Nodes.Count > 0 Then
            tvwScheduleExplorer.Nodes(1).Selected = True
            tvwScheduleExplorer.SelectedItem.EnsureVisible
        End If
    End If
    refresca
End Sub
Public Sub mostrarRestriccion(tipo As Long, per As Long, id As String, dia As Long, turno As Long)
    Dim restringido As Boolean, patronrest As String
    Dim tiporest As Long
    restringido = ancora.getRestriccion(tipo, id, ancora.periodos(per).id, dia, turno, patronrest)
    If restringido Then
        Dim tp As String, kk As Long, ntp As String
        tp = patronrest
        tp = Mid(tp, 3)
        tp = Replace(tp, "-", "")
        tp = Trim(tp)
        For kk = 1 To Len(tp)
            ntp = ntp & "[" & Mid(tp, kk, 1) & "]"
        Next
        If ntp = "" Then ntp = " "
        If Mid(patronrest, 1, 2) = "N-" Then ColocaTexto dia, turno, ntp, Enabled, 1
        If Mid(patronrest, 1, 2) = "NH" Then ColocaTexto dia, turno, ntp, Enabled, 2
        If Mid(patronrest, 1, 2) = "-H" Then ColocaTexto dia, turno, ntp, Enabled, 4
        If Mid(patronrest, 1, 2) = "--" Then ColocaTexto dia, turno, ntp, Enabled, 3
    Else
        ColocaTexto dia, turno, "", True, 0, ""
    End If
End Sub
Public Sub mostrarHorario(tipo As Long, id As String)
    On Error GoTo errdep
    Dim tiene As Boolean, a As String
    Dim per As Long, dia As Long, p As Long, turno As Long
    Dim idasg As Long, i As Long, j As Long, k As Long, c As Long
    Dim b As String, ii As Long, asg As String, cla As String, lug As String, pro As String, ll As Long, brg As String
    Dim g As Long, cantciclo As Long, Ciclo As Long, per1 As Long, Enabled As Boolean, per2 As Long

    If MOSTRANDO_HORARIO Then Exit Sub

    'Dim msg As frmKernelMensajeDeEstado
    'Set msg = New frmKernelMensajeDeEstado
    'msg.mensaje.Caption = "Trabajando..."
    'msg.Show
    AsignaColoresAsignatura
    MOSTRANDO_HORARIO = True

    'ReDim MatrixAsignaciones_frmExplorerSchedule(ancora.CD, ancora.CT)

    For i = 0 To casilla.Count - 1
        casilla(i).Picture = Nothing
        casilla(i).Caption = ""
        casilla(i).Tag = ""
        casilla(i).BackColor = &HE0E0E0
        casilla(i).Enabled = True
        ColoresAct(i) = &HE0E0E0
        TextfrmExplorerSchedule(i) = ""
        CantTurnosAct(i) = 1
        If i > ancora.CD * ancora.ct - 1 Then casilla(i).Visible = False
    Next

    If frameDetalles.Visible = False Then
        msg.Hide
        MOSTRANDO_HORARIO = False
        Exit Sub
    End If

    If PeriodoActual = 0 Then PeriodoActual = 1

    interface.fillCboPer cboPer
    cboPer.ListIndex = PeriodoActual - 1

    per = PeriodoActual
        For i = 1 To ancora.CD
            For j = 1 To ancora.ct
                mostrarRestriccion tipo, per, id, i, j
            Next
        Next
    
        Dim plantilla As Boolean

        Select Case tipo
            Case dBRIGADA: 'Brigadas
                MuestraSubBrigadas.num = -1

                For i = 1 To ancora.cantAsignaciones
                    interface.console.Progress "Mostrando horario", kernel.utils.Porciento(i, ancora.cantAsignaciones)
                    UltimoNumSubG = MuestraSubBrigadas.num
                    
                    plantilla = False
                    If ancora.periodos(per).template <> "" Then plantilla = kernel.utils.idigual(Asignaciones(i).idperiodo, ancora.periodos(per).template)
                                
                    If kernel.utils.trunca(Asignaciones(i).idbrigada) = kernel.utils.trunca(id) And (kernel.utils.idigual(Asignaciones(i).idperiodo, ancora.periodos(per).id) Or plantilla) Then
                        idasg = ancora.IndexById(dASIG, Asignaciones(i).idasig, 0)
                        p = ancora.IndexById(dDESGLOSE, ancora.periodos(per).id, idasg)
                        c = ancora.IndexById(dCLASIF, asig(idasg).desglose(p).act(Asignaciones(i).idact).idclasif, 0)
                        turno = Asignaciones(i).turno
                        dia = Asignaciones(i).dia
                        k = (turno - 1) * ancora.CD + dia
                        k = k - 1
                        CantTurnosAct(k) = clasif(c).ct

                        asg = interface.getIdOrAlias(dASIG, Asignaciones(i).idasig)
                        asigcasilla = ancora.IndexById(dASIG, Asignaciones(i).idasig)
                        cla = interface.getIdOrAlias(dCLASIF, asig(idasg).desglose(p).act(Asignaciones(i).idact).idclasif)
                        pro = interface.getIdOrAlias(dPROFE, Asignaciones(i).idprofe)
                        lug = interface.getIdOrAlias(dLUGAR, Asignaciones(i).idlugar)

                        With MUESTRA_EN_HORARIO(1)
                            a = ""
                            If .clasif Then a = cla + Chr(13)
                            If .asig Then a = a + asg + Chr(13)
                            Rem If .profe Then a = a + pro + Chr(13)
                            Rem If .lugar Then a = a + lug
                        End With

                        With MuestraSubBrigadas
                            .lug = lug
                            .prof = pro
                            .num = subg
                            If MUESTRA_EN_HORARIO(1).lugar = False Then .lug = ""
                            If MUESTRA_EN_HORARIO(1).profe = False Then .prof = ""
                        End With

                        If a <> "" Then a = Mid(a, 1, Len(a) - 1)
                        ColocaTexto Asignaciones(i).dia, Asignaciones(i).turno, a, Not plantilla, 0, "act"
                        If Asignaciones(i).fija Then casilla(k).Picture = imlCasillas.ListImages(6).Picture

                        MatrixAsignaciones_frmExplorerSchedule(Asignaciones(i).dia, Asignaciones(i).turno) = i
                        k = (Asignaciones(i).turno - 1) * ancora.CD + Asignaciones(i).dia
                        k = k - 1

                        TextfrmExplorerSchedule(k) = interface.getTextOfAsignacion(i)
                    End If

                Next

            Case dPROFE: 'Profesores

                For i = 1 To ancora.cantAsignaciones
                    interface.console.Progress "Mostrando horario", kernel.utils.Porciento(i, ancora.cantAsignaciones)
                
                    plantilla = False
                    If ancora.periodos(per).template <> "" Then plantilla = kernel.utils.idigual(Asignaciones(i).idperiodo, ancora.periodos(per).template)
                    
                
                    If kernel.utils.idigual(Asignaciones(i).idprofe, id) And (kernel.utils.idigual(Asignaciones(i).idperiodo, ancora.periodos(per).id) Or plantilla) Then
                        idasg = ancora.IndexById(dASIG, Asignaciones(i).idasig, 0)
                        c = ancora.IndexById(dCLASIF, asig(idasg).desglose(p).act(Asignaciones(i).idact).idclasif, 0)
                        turno = Asignaciones(i).turno
                        dia = Asignaciones(i).dia
                        k = (turno - 1) * ancora.CD + dia
                        k = k - 1
                        If k <> 0 And c <> 0 Then CantTurnosAct(k) = clasif(c).ct
                        p = ancora.IndexById(dDESGLOSE, ancora.periodos(per).id, idasg)
                        brg = interface.getIdOrAlias(dBRIGADA, Asignaciones(i).idbrigada)
                        asg = interface.getIdOrAlias(dASIG, Asignaciones(i).idasig)
                        cla = interface.getIdOrAlias(dCLASIF, asig(idasg).desglose(p).act(Asignaciones(i).idact).idclasif)
                        lug = interface.getIdOrAlias(dLUGAR, Asignaciones(i).idlugar)
                        asigcasilla = ancora.IndexById(dASIG, Asignaciones(i).idasig, 0)

                        With MUESTRA_EN_HORARIO(2)
                            a = ""
                            If .clasif Then a = cla & Chr(13)
                            If .asig Then a = a & asg & Chr(13)
                            If .brg Then a = a & brg
                            If .lugar Then a = a & lug & ", "
                        End With

                        If a <> "" Then a = Mid(a, 1, Len(a) - 2)
                        MuestraSubBrigadas.lug = ""
                        MuestraSubBrigadas.prof = ""
                        ColocaTexto Asignaciones(i).dia, Asignaciones(i).turno, a, Not plantilla, 0, "act"
                        If Asignaciones(i).fija Then casilla(k).Picture = imlCasillas.ListImages(6).Picture

                        MatrixAsignaciones_frmExplorerSchedule(Asignaciones(i).dia, Asignaciones(i).turno) = i
                        k = (Asignaciones(i).turno - 1) * ancora.CD + Asignaciones(i).dia
                        k = k - 1
                        TextfrmExplorerSchedule(k) = interface.getTextOfAsignacion(i)
                    End If

                Next

            Case dLUGAR:  'Lugares
                
                For i = 1 To ancora.cantAsignaciones
                    interface.console.Progress "Mostrando horario", kernel.utils.Porciento(i, ancora.cantAsignaciones)
                
                    plantilla = False
                    If ancora.periodos(per).template <> "" Then plantilla = kernel.utils.idigual(Asignaciones(i).idperiodo, ancora.periodos(per).template)
                    
                    If kernel.utils.trunca(Asignaciones(i).idlugar) = kernel.utils.trunca(id) And (kernel.utils.idigual(Asignaciones(i).idperiodo, ancora.periodos(per).id) Or plantilla) Then

                        Dim idclasif As String

                        With Asignaciones(i)
                            idasg = ancora.IndexById(dASIG, .idasig, 0)
                            p = ancora.IndexById(dDESGLOSE, ancora.periodos(per).id, idasg)
                            brg = interface.getIdOrAlias(dBRIGADA, .idbrigada)
                            asg = interface.getIdOrAlias(dASIG, .idasig)
                            idclasif = asig(idasg).desglose(p).act(Asignaciones(i).idact).idclasif
                            cla = interface.getIdOrAlias(dCLASIF, idclasif)
                            pro = interface.getIdOrAlias(dPROFE, .idprofe)
                            asigcasilla = ancora.IndexById(dASIG, .idasig, 0)
                        End With


                        With MUESTRA_EN_HORARIO(3)
                            a = ""
                            If .clasif Then a = cla & Chr(13)
                            If .asig Then a = a & asg & Chr(13)
                            If .brg Then a = a & brg & Chr(13)
                            If .profe Then a = a & pro
                        End With

                        With Asignaciones(i)
                            c = ancora.IndexById(dCLASIF, idclasif, 0)
                            turno = Asignaciones(i).turno
                            dia = Asignaciones(i).dia
                            k = (turno - 1) * ancora.CD + dia
                            k = k - 1
                            CantTurnosAct(k) = clasif(c).ct
                            MuestraSubBrigadas.lug = ""
                            MuestraSubBrigadas.prof = ""
                            ColocaTexto Asignaciones(i).dia, Asignaciones(i).turno, a, Not plantilla, 0, "act"

                            If .fija Then casilla(k).Picture = imlCasillas.ListImages(6).Picture
                            MatrixAsignaciones_frmExplorerSchedule(.dia, .turno) = i
                            k = (.turno - 1) * ancora.CD + .dia
                            k = k - 1
                            TextfrmExplorerSchedule(k) = interface.getTextOfAsignacion(i)
                        End With
                    End If

                Next
                'Otros recursos
            Case dRECURSO:
                
                
                Dim temp As TAtom_arrVariant
                Set temp = ancora.getIDAsignacionesByFilter(, , , , , , , id)

                For i = 1 To temp.Count
                    interface.console.Progress "Mostrando horario", kernel.utils.Porciento(i, temp.Count)
                    plantilla = False
                    If ancora.periodos(per).template <> "" Then plantilla = kernel.utils.idigual(Asignaciones(i).idperiodo, ancora.periodos(per).template)
                
                    
                    With Asignaciones(Val(temp(i).value))
                        Dim esta As Boolean
                        esta = False
                        For j = 1 To .cantrecursos
                            If kernel.utils.idigual(.recursos(j), id) Then
                                esta = True
                                Exit For
                            End If
                        Next
                        If esta And (kernel.utils.idigual(.idperiodo, ancora.periodos(per).id) Or plantilla) Then
    
                            idasg = ancora.IndexById(dASIG, .idasig, 0)
                            p = ancora.IndexById(dDESGLOSE, ancora.periodos(per).id, idasg)
                            brg = interface.getIdOrAlias(dBRIGADA, .idbrigada)
                            asg = interface.getIdOrAlias(dASIG, .idasig)
                            cla = interface.getIdOrAlias(dCLASIF, asig(idasg).desglose(p).act(.idact).idclasif)
                            pro = interface.getIdOrAlias(dPROFE, .idprofe)
                            lug = interface.getIdOrAlias(dLUGAR, .idlugar)
                            asigcasilla = ancora.IndexById(dASIG, .idasig, 0)
    
                            With MUESTRA_EN_HORARIO(3)
                                a = ""
                                If .clasif Then a = cla & Chr(13)
                                If .asig Then a = a & asg & Chr(13)
                                If .brg Then a = a & brg & Chr(13)
                                If .profe Then a = a & pro
                                If .lugar Then a = a & vbNewLine & lug
                            End With
    
                            Rem If a <> "" Then a = Mid(a, 1,    Len(a) - 2)
                            c = ancora.IndexById(dCLASIF, asig(idasg).desglose(p).act(Asignaciones(i).idact).idclasif, 0)
                            turno = Asignaciones(i).turno
                            dia = Asignaciones(i).dia
                            k = (turno - 1) * ancora.CD + dia
                            k = k - 1
                            CantTurnosAct(k) = clasif(c).ct
                            MuestraSubBrigadas.lug = ""
                            MuestraSubBrigadas.prof = ""
                            ColocaTexto .dia, .turno, a, Not plantilla, 0, "act"
                            If .fija Then casilla(k).Picture = imlCasillas.ListImages(6).Picture
                            MatrixAsignaciones_frmExplorerSchedule(.dia, .turno) = temp(i).value
                            k = (.turno - 1) * ancora.CD + .dia
                            k = k - 1
                            TextfrmExplorerSchedule(k) = interface.getTextOfAsignacion(Val(temp(i).value))
                        End If
                    End With

                Next
        End Select
    'msg.Hide
    'Set msg = Nothing
    MOSTRANDO_HORARIO = False
finish:
    
    Exit Sub
errdep:
    Debug.Print Err.Description
    Resume Next

End Sub

'Coloca un texto en la casilla de horario correspondiente. Incluye los iconos
'correspondientes
Public Sub ColocaTexto(dia As Long, turno As Long, s As String, habilitado As Boolean, Optional typerestricc As Long = 0, Optional tagg As String = "")
    Dim k As Long, h  As Long, i As Long, kk As Long
    Dim b As String, cc As Long, j As Long
    'cálculo el índice k en el arreglo de casillas según el dia y el turno
    k = (turno - 1) * ancora.CD + dia
    k = k - 1

    casilla(k).Tag = tagg
    casilla(k).Caption = s
    casilla(k).Picture = Me.dia(0).Picture
    casilla(k).BackColor = vbWhite
    If typerestricc <> 0 And tagg = "" Then casilla(k).Picture = imlCasillas.ListImages(typerestricc).Picture
    If tagg = "act" Then
        'de lo contrario depuro el texto y lo coloco
        b = ""

        If tagg = "act" Then casilla(k).Picture = Nothing
        If kernel.utils.trunca(MuestraSubBrigadas.lug) <> "" Or kernel.utils.trunca(MuestraSubBrigadas.prof) <> "" And MuestraSubBrigadas.num > UltimoNumSubG Then
            b = Chr(13)
            If kernel.utils.trunca(MuestraSubBrigadas.prof) <> "" Then
                b = b & " P:" & kernel.utils.trunca(MuestraSubBrigadas.prof)
                If kernel.utils.trunca(MuestraSubBrigadas.lug) <> "" Then b = b + Chr(13)
            End If
            If kernel.utils.trunca(MuestraSubBrigadas.lug) <> "" Then b = b & "  L:" & kernel.utils.trunca(MuestraSubBrigadas.lug)
        End If

        If casilla(k).Tag = "act" Then
            If casilla(k).Picture <> imlCasillas.ListImages(5).Picture Then
                casilla(k).Caption = casilla(k).Caption & b
                casilla(k).BackColor = ColoresAsignaturas(asigcasilla)
            End If
        Else
            casilla(k).Caption = s & b
            casilla(k).BackColor = ColoresAsignaturas(asigcasilla)
        End If

    End If

    ColoresAct(k) = casilla(k).BackColor
    casilla(k).Font.Bold = habilitado
    casilla(k).Enabled = habilitado
    If Not habilitado Then casilla(k).Picture = imlCasillas.ListImages(5).Picture
End Sub

Public Sub AsignaColoresAsignatura()
    Dim i As Long, col As Long
    ReDim Preserve ColoresAsignaturas(ancora.cantAsig)

    For i = 1 To ancora.cantAsig
        Randomize i
5                                                                        col = RGB(100 + Int(Rnd * 155), 100 + Int(Rnd * 155), 100 + Int(Rnd * 155))
        ReDim Preserve ColoresAsignaturas(i)
10                                                                       ColoresAsignaturas(i) = col
    Next

    Exit Sub
100:                                          If Erl = 10 Or Erl = 5 Then Resume 5
End Sub

Public Sub Resize()

    On Error Resume Next

    Dim i As Long, k As Long, fila As Long, col As Long
    Dim hh As Long

    frameExploradorHorarios.Width = Width
    frameExploradorHorarios.Top = mainribbon.Top + mainribbon.Height
    frameExploradorHorarios.Left = 0
    frameExploradorHorarios.Height = Height - frameExploradorHorarios.Top - StatusBar.Height - 450

    tvwScheduleExplorer.Left = 20
    tvwScheduleExplorer.Top = 110
    tvwScheduleExplorer.Height = frameExploradorHorarios.Height - 105
    picSplitter.Width = 200
    imgSplitter.Width = picSplitter.Width
    frameDetalles.Width = frameExploradorHorarios.Width - tvwScheduleExplorer.Width - imgSplitter.Width - 250
    frameDetalles.Left = tvwScheduleExplorer.Left + tvwScheduleExplorer.Width + picSplitter.Width
    frameDetalles.Height = tvwScheduleExplorer.Height - 60

    frameEstadoActual.Width = frameDetalles.Width
    frameEstadoActual.Left = frameDetalles.Left
    frameEstadoActual.Height = frameDetalles.Height

    cmdPeriodoAnterior.Left = 70
    labPeriodo.Top = 150
    cmdPeriodoAnterior.Top = labPeriodo.Top
    cmdPeriodoSiguiente.Top = labPeriodo.Top
    cmdPeriodoSiguiente.Left = frameDetalles.Width - cmdPeriodoSiguiente.Width - 200
    labPeriodo.Left = cmdPeriodoAnterior.Left + cmdPeriodoAnterior.Width
    labPeriodo.Width = cmdPeriodoSiguiente.Left - (cmdPeriodoAnterior.Left + cmdPeriodoAnterior.Width)
    labPeriodo.Refresh
    cboPer.Left = cmdPeriodoSiguiente.Left - cboPer.Width - 150
    cboPer.Top = labPeriodo.Top + (labPeriodo.Height - cboPer.Height) / 2
    frameCasillero.Width = frameDetalles.Width - 10
    frameCasillero.Top = 700
    frameCasillero.Height = frameDetalles.Height - frameCasillero.Top - 60
    frameCasillero.Left = 70

    StatusBar.Panels(1).Width = Width

    If frameExploradorHorarios.Width < 3000 Then frameExploradorHorarios.Width = 3000
    SizeControls imgSplitter.Left

    TabStripEstados.Left = 0
    TabStripEstados.Top = 300
    TabStripEstados.Width = frameEstadoActual.Width
    TabStripEstados.Height = frameEstadoActual.Height
    lvwEstado.Left = 50
    lvwEstado.Width = frameEstadoActual.Width - 100
    lvwEstado.Top = 700
    lvwEstado.Height = frameEstadoActual.Height - 750

    svcasillero.Top = dia(0).Height
    svcasillero.Left = (frameCasillero.Width - 100) - svcasillero.Width
    svcasillero.Height = frameCasillero.Height - shcasillero.Height - dia(0).Height
    shcasillero.Left = turno(0).Width
    shcasillero.Top = frameCasillero.Height - shcasillero.Height
    shcasillero.Width = (frameCasillero.Width - 100) - cmdZoomIn.Width - turno(0).Width
    With cmdZoomIn
        .Left = shcasillero.Left + shcasillero.Width
        .Top = svcasillero.Top + svcasillero.Height
        .Width = svcasillero.Width
        .Height = shcasillero.Height
    End With
    With cmdZoomOut
        .Left = 0
        .Top = 0
        .Width = turno(0).Width
        .Height = dia(0).Height
    End With
    refresca
End Sub

Public Sub goMPIIn(index As Long)
    Dim k As Long, fila As Long, col As Long, ii As Long, pp As Long
    Dim asg As Long, act As Long, per As Long, brg As Long
    Dim fija As Boolean, i As Long, n As String, p As String
    If casilla(index).Tag = "act" And Not opcionesActividad Then
        k = index + 1
        fila = Int(((k - 1) / ancora.CD) + 1)
        col = Int(k - (fila - 1) * ancora.CD)
        TURNO_CAMBIO = fila
        DIA_CAMBIO = col

        casilla(index).Picture = imlCasillas.ListImages(7).Picture
        IDASIGNA_CAMBIANDO = MatrixAsignaciones_frmExplorerSchedule(DIA_CAMBIO, TURNO_CAMBIO)
        
        interface.goKernelDatosActividad IDASIGNA_CAMBIANDO

        goMuestraHorario
        Exit Sub
    End If
    If casilla(index).Tag <> "act" Then
        k = index + 1
        fila = Int(((k - 1) / ancora.CD) + 1)
        col = Int(k - (fila - 1) * ancora.CD)
        TURNO_CAMBIO = fila
        DIA_CAMBIO = col
        n = tvwScheduleExplorer.SelectedItem.key
        If Len(n) > 1 Then
            Dim tipo As Long
            p = Mid(n, 1, 4)
            tipo = 0
            If p = "brg_" Then tipo = dBRIGADA
            If p = "prf_" Then tipo = dPROFE
            If p = "lug_" Then tipo = dLUGAR
            If p = "res_" Then tipo = dRECURSO
            If p = "asg_" Then tipo = dASIG
            If p = "esp_" Then tipo = dESPECIALIDAD
            If p = "per_" Then tipo = dPERIODO
            If p = "cla_" Then tipo = dCLASIF
            
            If tipo <> 0 Then
                n = Mid(n, 5)
                frameCasillero.Enabled = True
                ancora.switchNativeRestriccion tipo, n, ancora.periodos(PeriodoActual).id, DIA_CAMBIO, TURNO_CAMBIO
                mostrarRestriccion tipo, PeriodoActual, n, DIA_CAMBIO, TURNO_CAMBIO
            End If

        End If

    End If

End Sub

Public Function showDatosCasilla(ByVal index As Long)
    On Error Resume Next
    Dim i As Long
    labProgress.Caption = TextfrmExplorerSchedule(index)
    casilla(casillaactual).BackColor = ColoresAct(casillaactual)

    If casilla(index).Tag = "act" Then
        If Not mbMoving Then casillaactual = index
        casilla(index).BackColor = vbYellow
        casilla(index).ToolTipText = "Click aquí para realizarle cambios a esta actividad (click derecho para permutar actividades)"
    End If
    If casilla(index).Caption <> "" And casilla(index).Tag = "" Then casilla(index).ToolTipText = "Click aquí para activar o desactivar una restricción"

End Function

Public Sub CierraExploradorHorarios()
    Dim i As Integer
    For i = 1 To casilla.Count - 1
        Unload casilla(i)
    Next
    frameExploradorHorarios.Visible = False
End Sub
Public Function getKeyOfNodoActual() As String
    If Not tvwScheduleExplorer.SelectedItem Is Nothing Then
        getKeyOfNodoActual = tvwScheduleExplorer.SelectedItem.key
        Exit Function
    End If
    getKeyOfNodoActual = ""
End Function
Public Function isNodoActualUnObjeto() As Boolean
    Dim a As String
    a = getKeyOfNodoActual
    isNodoActualUnObjeto = Mid(a, 1, 4) = "brg_" Or Mid(a, 1, 4) = "prf_" Or Mid(a, 1, 4) = "lug_" Or Mid(a, 1, 4) = "res_"
End Function
Public Function isNodoActualUnRestringido() As Boolean
    Dim a As String
    a = getKeyOfNodoActual
    isNodoActualUnRestringido = isNodoActualUnObjeto Or Mid(a, 1, 4) = "asg_" Or Mid(a, 1, 4) = "per_" Or Mid(a, 1, 4) = "esp_" Or Mid(a, 1, 4) = "cla_"
End Function
Public Sub PosicionaProgress()
    Progress.Top = Height - 700
    Progress.Width = Width / 4
    Progress.Left = Width - 250 - Progress.Width
    labProgress.Left = 50
    labProgress.Top = Progress.Top - 50
    labProgress.Width = Progress.Left - 50
    labProgress.Alignment = skLabelLeft
End Sub
Private Sub shcasillero_Change()
    refresca
End Sub

Private Sub shcasillero_Scroll()
    refresca
End Sub

Private Sub svcasillero_Change()
    refresca
End Sub

Private Sub svcasillero_Scroll()
    refresca
End Sub
Sub refresca()
    Dim k As Long, i As Long, j As Long
    k = -1
    tcasillero = 0
    lcasillero = 0
    If h = 0 Then h = 1500
    If w = 0 Then w = 1500
    For i = 1 To turno.Count - 1
        If i > ancora.ct Then turno(i).Visible = False
    Next
    For i = 1 To dia.Count - 1
        If i > ancora.CD Then dia(i).Visible = False
    Next

    For i = 1 To ancora.ct
        With turno(i)
            If turno.Count <= i Then Load turno(i)
            .Top = tcasillero + dia(0).Height + (-1 * svcasillero.value / svcasillero.max * ancora.ct * h + (i - 1) * h)
            .Left = lcasillero
            .Height = h
            .Width = turno(0).Width
            .Visible = True
            .Caption = "" & i
        End With
        For j = 1 To ancora.CD
            With dia(j)
                If dia.Count <= j Then Load dia(j)
                .Top = tcasillero
                .Left = lcasillero + turno(0).Width + (-1 * shcasillero.value / shcasillero.max * ancora.CD * w + (j - 1) * w)
                .Height = dia(0).Height
                .Width = w
                .Visible = True
                .Caption = "" & j
            End With
            k = k + 1
            With casilla(k)
                .Left = lcasillero + turno(0).Width + (-1 * shcasillero.value / shcasillero.max * ancora.CD * w + (j - 1) * w)
                .Top = tcasillero + dia(0).Height + (-1 * svcasillero.value / svcasillero.max * ancora.ct * h + (i - 1) * h)
                .Width = w
                .Height = h * IIf(CantTurnosAct(k) = 0, 1, CantTurnosAct(k))
                .Visible = True
            End With
        Next
    Next
    k = -1
    Dim l As Long
    For i = 1 To ancora.ct
        For j = 1 To ancora.CD
            k = k + 1
                If CantTurnosAct(k) > 1 Then
                    For l = i + 1 To i + CantTurnosAct(k) - 1
                        casilla((l - 1) * ancora.CD + j - 1).Visible = False
                    Next
                End If
        Next
    Next
End Sub


