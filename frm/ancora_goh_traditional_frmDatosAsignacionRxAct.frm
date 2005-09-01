VERSION 5.00
Object = "{90F3D7B3-92E7-44BA-B444-6A8E2A3BC375}#1.0#0"; "actskin4.ocx"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "Mscomctl.ocx"
Object = "{B42578F8-962C-436D-9516-4E26101FF1D9}#4.0#0"; "buttonskin.ocx"
Begin VB.Form frmDatosAsignacionRxAct 
   Caption         =   "Asignando recursos para las actividades"
   ClientHeight    =   7770
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   12930
   DrawMode        =   14  'Copy Pen
   Icon            =   "ancora_goh_traditional_frmDatosAsignacionRxAct.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   7770
   ScaleWidth      =   12930
   StartUpPosition =   2  'CenterScreen
   Visible         =   0   'False
   Begin ButtonSkin.ucBtnSkin StatusBar 
      Height          =   495
      Left            =   0
      TabIndex        =   33
      Top             =   7320
      Width           =   12975
      _ExtentX        =   22886
      _ExtentY        =   873
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
      CaptionAlign    =   1
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
   Begin VB.Frame frameOpciones 
      Height          =   735
      Left            =   7080
      TabIndex        =   32
      Top             =   6480
      Width           =   5775
      Begin VB.CommandButton cmdTerminar 
         Caption         =   "Terminar sin guardar"
         Height          =   375
         Left            =   3600
         TabIndex        =   55
         Top             =   240
         Width           =   2055
      End
      Begin VB.CommandButton cmdGuardarTerminar 
         Caption         =   "Guardar y terminar"
         Height          =   375
         Left            =   1560
         TabIndex        =   54
         Top             =   240
         Width           =   1935
      End
   End
   Begin MSComctlLib.TreeView tvwExplorerAct 
      Height          =   6735
      Left            =   0
      TabIndex        =   1
      Top             =   480
      Width           =   5895
      _ExtentX        =   10398
      _ExtentY        =   11880
      _Version        =   393217
      LabelEdit       =   1
      LineStyle       =   1
      Style           =   7
      ImageList       =   "imlExplorerAct"
      Appearance      =   1
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Calibri"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin VB.Frame frameDetail 
      BorderStyle     =   0  'None
      Height          =   6495
      Left            =   7080
      TabIndex        =   0
      Top             =   0
      Width           =   5775
      Begin VB.Frame frameOtrosRecursos 
         Caption         =   "Grupos de recursos asignados a la actividad"
         Height          =   5535
         Left            =   120
         TabIndex        =   24
         Top             =   600
         Width           =   5535
         Begin VB.CommandButton cmdGResDown 
            Caption         =   "v"
            Height          =   375
            Left            =   120
            TabIndex        =   44
            Top             =   1680
            Width           =   495
         End
         Begin VB.CommandButton cmdGResUp 
            Caption         =   "^"
            Height          =   375
            Left            =   120
            TabIndex        =   43
            Top             =   1200
            Width           =   495
         End
         Begin VB.CommandButton cmdDelGRes 
            Caption         =   "<"
            Height          =   375
            Left            =   120
            TabIndex        =   42
            Top             =   720
            Width           =   495
         End
         Begin VB.CommandButton cmdAddGRes 
            Caption         =   ">"
            Height          =   375
            Left            =   120
            TabIndex        =   41
            Top             =   240
            Width           =   495
         End
         Begin VB.Frame frameDetallesGRes 
            Caption         =   "Detalles del grupo de recursos"
            Height          =   3135
            Left            =   120
            TabIndex        =   26
            Top             =   2280
            Width           =   5295
            Begin ACTIVESKINLibCtl.SkinLabel labResDisponibles 
               Height          =   255
               Left            =   120
               OleObjectBlob   =   "ancora_goh_traditional_frmDatosAsignacionRxAct.frx":08CA
               TabIndex        =   51
               Top             =   360
               Width           =   735
            End
            Begin ACTIVESKINLibCtl.SkinLabel labRecursoImprescindible 
               Height          =   255
               Left            =   3600
               OleObjectBlob   =   "ancora_goh_traditional_frmDatosAsignacionRxAct.frx":0938
               TabIndex        =   50
               Top             =   2640
               Width           =   1575
            End
            Begin ACTIVESKINLibCtl.SkinLabel labNecesarios 
               Height          =   255
               Left            =   120
               OleObjectBlob   =   "ancora_goh_traditional_frmDatosAsignacionRxAct.frx":09C0
               TabIndex        =   49
               Top             =   2640
               Width           =   855
            End
            Begin VB.CommandButton cmdResDown 
               Caption         =   "v"
               Height          =   375
               Left            =   120
               TabIndex        =   48
               Top             =   2160
               Width           =   495
            End
            Begin VB.CommandButton cmdResUp 
               Caption         =   "^"
               Height          =   375
               Left            =   120
               TabIndex        =   47
               Top             =   1680
               Width           =   495
            End
            Begin VB.CommandButton cmdDelRes 
               Caption         =   "<"
               Height          =   375
               Left            =   120
               TabIndex        =   46
               Top             =   1200
               Width           =   495
            End
            Begin VB.CommandButton cmdAddRes 
               Caption         =   ">"
               Height          =   375
               Left            =   120
               TabIndex        =   45
               Top             =   720
               Width           =   495
            End
            Begin MSComctlLib.ListView lvwRecursosAsignados 
               Height          =   1815
               Left            =   720
               TabIndex        =   30
               ToolTipText     =   "Recursos asignados"
               Top             =   720
               Width           =   4455
               _ExtentX        =   7858
               _ExtentY        =   3201
               View            =   3
               LabelEdit       =   1
               LabelWrap       =   -1  'True
               HideSelection   =   -1  'True
               FullRowSelect   =   -1  'True
               GridLines       =   -1  'True
               _Version        =   393217
               Icons           =   "imlExplorerAct"
               SmallIcons      =   "imlExplorerAct"
               ColHdrIcons     =   "imlExplorerAct"
               ForeColor       =   -2147483640
               BackColor       =   -2147483643
               BorderStyle     =   1
               Appearance      =   1
               NumItems        =   2
               BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
                  Text            =   "Recurso"
                  Object.Width           =   2540
               EndProperty
               BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
                  SubItemIndex    =   1
                  Text            =   "Prioridad"
                  Object.Width           =   2540
               EndProperty
            End
            Begin VB.ComboBox cboRecursoNecesarios 
               Height          =   315
               Left            =   1200
               Style           =   2  'Dropdown List
               TabIndex        =   29
               Top             =   2640
               Width           =   2055
            End
            Begin VB.ComboBox cboRecursoDisponibles 
               Height          =   315
               Left            =   960
               Style           =   2  'Dropdown List
               TabIndex        =   28
               ToolTipText     =   "Recursos disponibles"
               Top             =   360
               Width           =   4215
            End
            Begin VB.CheckBox chkRecursoImprescindible 
               Height          =   255
               Left            =   3360
               TabIndex        =   27
               Top             =   2640
               Width           =   255
            End
         End
         Begin MSComctlLib.ListView lvwGrupoRecursos 
            Height          =   1935
            Left            =   720
            TabIndex        =   25
            Top             =   240
            Width           =   4695
            _ExtentX        =   8281
            _ExtentY        =   3413
            View            =   3
            LabelEdit       =   1
            LabelWrap       =   -1  'True
            HideSelection   =   -1  'True
            FullRowSelect   =   -1  'True
            GridLines       =   -1  'True
            _Version        =   393217
            Icons           =   "imlExplorerAct"
            SmallIcons      =   "imlExplorerAct"
            ColHdrIcons     =   "imlExplorerAct"
            ForeColor       =   -2147483640
            BackColor       =   -2147483643
            BorderStyle     =   1
            Appearance      =   1
            NumItems        =   3
            BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
               Text            =   "Grupo de Recurso"
               Object.Width           =   2540
            EndProperty
            BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
               SubItemIndex    =   1
               Text            =   "Asignados"
               Object.Width           =   1235
            EndProperty
            BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
               SubItemIndex    =   2
               Text            =   "Prioridad"
               Object.Width           =   1235
            EndProperty
         End
      End
      Begin VB.Frame frameAplicarATodas 
         Caption         =   "Clonar los recursos para las actividades..."
         Height          =   5175
         Left            =   120
         TabIndex        =   2
         Top             =   600
         Visible         =   0   'False
         Width           =   5535
         Begin VB.CommandButton cmdAplicarATodas_profe 
            Caption         =   "Clonar profesores"
            Height          =   375
            Left            =   3480
            TabIndex        =   53
            Top             =   4440
            Width           =   1815
         End
         Begin VB.CommandButton cmdAplicarATodas_lug 
            Caption         =   "Clonar lugares"
            Height          =   375
            Left            =   1800
            TabIndex        =   52
            Top             =   4440
            Width           =   1575
         End
         Begin VB.CheckBox chkToSpecific 
            Caption         =   "Específicamente a las actividades que ..."
            Height          =   255
            Left            =   360
            TabIndex        =   23
            Top             =   2640
            Value           =   1  'Checked
            Width           =   3375
         End
         Begin VB.CheckBox chkMismoNivel 
            Caption         =   "...del mismo Nivel"
            Height          =   255
            Left            =   480
            TabIndex        =   22
            Top             =   600
            Width           =   1455
         End
         Begin VB.Frame frameToSpecific 
            Height          =   855
            Left            =   360
            TabIndex        =   9
            Top             =   2880
            Width           =   4935
            Begin VB.OptionButton radioNoFaltantes 
               Caption         =   "...ya tienen recursos asignados"
               Height          =   255
               Left            =   120
               TabIndex        =   11
               Top             =   480
               Width           =   2775
            End
            Begin VB.OptionButton radioFaltantes 
               Caption         =   "...faltan por recursos"
               Height          =   195
               Left            =   120
               TabIndex        =   10
               Top             =   240
               Value           =   -1  'True
               Width           =   2775
            End
         End
         Begin VB.CheckBox chkLimpiarRecursosExistentes 
            Caption         =   "Limpiar recursos asignados anteriormente"
            Height          =   255
            Left            =   360
            TabIndex        =   8
            Top             =   3960
            Width           =   3375
         End
         Begin VB.CheckBox chkMismaClasif 
            Caption         =   "...con la misma Clasificación de actividad"
            Height          =   255
            Left            =   480
            TabIndex        =   7
            Top             =   2040
            Value           =   1  'Checked
            Width           =   3255
         End
         Begin VB.CheckBox chkMismoNumeroAct 
            Caption         =   "...con el mismo Número de actividad (orden)"
            Height          =   255
            Left            =   480
            TabIndex        =   6
            Top             =   1680
            Width           =   3615
         End
         Begin VB.CheckBox chkMismaAsig 
            Caption         =   "...de la misma Asignatura"
            Height          =   255
            Left            =   480
            TabIndex        =   5
            Top             =   1320
            Width           =   3255
         End
         Begin VB.CheckBox chkMismoPeriodo 
            Caption         =   "...del mismo Período"
            Height          =   255
            Left            =   480
            TabIndex        =   4
            Top             =   960
            Width           =   3255
         End
         Begin VB.CheckBox chkMismaEsp 
            Caption         =   "...de la misma Especialidad"
            Height          =   255
            Left            =   480
            TabIndex        =   3
            Top             =   240
            Width           =   3255
         End
      End
      Begin VB.Frame framelug 
         Caption         =   "Asignación de lugares"
         Height          =   5655
         Left            =   120
         TabIndex        =   16
         Top             =   600
         Visible         =   0   'False
         Width           =   5535
         Begin VB.CommandButton cmdDel 
            Caption         =   "Quitar asignación"
            Height          =   375
            Left            =   3720
            TabIndex        =   63
            Top             =   5160
            Width           =   1695
         End
         Begin VB.CommandButton cmdAdd 
            Caption         =   "Asignar lugares"
            Height          =   375
            Left            =   2040
            TabIndex        =   62
            Top             =   5160
            Width           =   1575
         End
         Begin VB.Frame frameRecursos 
            Height          =   4815
            Left            =   120
            TabIndex        =   17
            Top             =   240
            Width           =   5295
            Begin ACTIVESKINLibCtl.SkinLabel labInsuficientesLugs 
               Height          =   495
               Left            =   3480
               OleObjectBlob   =   "ancora_goh_traditional_frmDatosAsignacionRxAct.frx":0A32
               TabIndex        =   67
               Top             =   4200
               Visible         =   0   'False
               Width           =   1695
            End
            Begin VB.TextBox txtCantLugNecesarios 
               Height          =   375
               Left            =   2520
               TabIndex        =   66
               Top             =   4200
               Visible         =   0   'False
               Width           =   855
            End
            Begin ACTIVESKINLibCtl.SkinLabel labCantLugNecesarios 
               Height          =   255
               Left            =   120
               OleObjectBlob   =   "ancora_goh_traditional_frmDatosAsignacionRxAct.frx":0ACA
               TabIndex        =   65
               Top             =   4200
               Visible         =   0   'False
               Width           =   2295
            End
            Begin ACTIVESKINLibCtl.SkinLabel Label4 
               Height          =   255
               Left            =   2040
               OleObjectBlob   =   "ancora_goh_traditional_frmDatosAsignacionRxAct.frx":0B64
               TabIndex        =   61
               Top             =   3840
               Width           =   2295
            End
            Begin VB.CommandButton cmdDown 
               Caption         =   "v"
               Height          =   375
               Left            =   120
               TabIndex        =   60
               Top             =   3240
               Width           =   495
            End
            Begin VB.CommandButton cmdUp 
               Caption         =   "^"
               Height          =   375
               Left            =   120
               TabIndex        =   59
               Top             =   2760
               Width           =   495
            End
            Begin VB.CommandButton cmdDelAllPlaces 
               Caption         =   "<<"
               Height          =   375
               Left            =   120
               TabIndex        =   58
               Top             =   2280
               Width           =   495
            End
            Begin VB.CommandButton cmdAddAllPlaces 
               Caption         =   ">>"
               Height          =   375
               Left            =   120
               TabIndex        =   57
               Top             =   1320
               Width           =   495
            End
            Begin VB.CommandButton cmdAddPlace 
               Caption         =   ">"
               Height          =   375
               Left            =   120
               TabIndex        =   56
               Top             =   840
               Width           =   495
            End
            Begin VB.CommandButton cmdDelPlace 
               Caption         =   "<"
               Height          =   375
               Left            =   120
               TabIndex        =   31
               Top             =   1800
               Width           =   495
            End
            Begin VB.ComboBox cboLugares 
               Height          =   315
               ItemData        =   "ancora_goh_traditional_frmDatosAsignacionRxAct.frx":0C02
               Left            =   840
               List            =   "ancora_goh_traditional_frmDatosAsignacionRxAct.frx":0C04
               Style           =   2  'Dropdown List
               TabIndex        =   19
               Top             =   240
               Width           =   4335
            End
            Begin VB.TextBox txtPlacePriority 
               Height          =   405
               Left            =   4440
               MaxLength       =   3
               TabIndex        =   18
               ToolTipText     =   "Índice de prioridad del lugar para esta actividad"
               Top             =   3720
               Width           =   735
            End
            Begin MSComctlLib.ListView lvwPlaces 
               CausesValidation=   0   'False
               Height          =   2895
               Left            =   720
               TabIndex        =   20
               Top             =   720
               Width           =   4455
               _ExtentX        =   7858
               _ExtentY        =   5106
               View            =   3
               LabelEdit       =   1
               MultiSelect     =   -1  'True
               LabelWrap       =   -1  'True
               HideSelection   =   0   'False
               FullRowSelect   =   -1  'True
               GridLines       =   -1  'True
               TextBackground  =   -1  'True
               _Version        =   393217
               Icons           =   "imlExplorerAct"
               SmallIcons      =   "imlExplorerAct"
               ColHdrIcons     =   "imlExplorerAct"
               ForeColor       =   0
               BackColor       =   16777215
               BorderStyle     =   1
               Appearance      =   1
               BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
                  Name            =   "MS Sans Serif"
                  Size            =   8.25
                  Charset         =   0
                  Weight          =   400
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               NumItems        =   2
               BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
                  Text            =   "Lugar"
                  Object.Width           =   2540
               EndProperty
               BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
                  SubItemIndex    =   1
                  Text            =   "Prioridad"
                  Object.Width           =   2540
               EndProperty
            End
            Begin VB.Label Label5 
               AutoSize        =   -1  'True
               BackStyle       =   0  'Transparent
               Caption         =   "Lugares"
               Height          =   195
               Left            =   120
               TabIndex        =   21
               Top             =   240
               Width           =   570
            End
         End
      End
      Begin VB.Frame frameProfe 
         Caption         =   "Profesores asignados"
         Height          =   5535
         Left            =   120
         TabIndex        =   12
         Top             =   600
         Width           =   5535
         Begin VB.TextBox txtCantProfesNecesarios 
            Height          =   375
            Left            =   2520
            TabIndex        =   69
            Top             =   4680
            Visible         =   0   'False
            Width           =   855
         End
         Begin ACTIVESKINLibCtl.SkinLabel labProfe 
            Height          =   255
            Left            =   120
            OleObjectBlob   =   "ancora_goh_traditional_frmDatosAsignacionRxAct.frx":0C06
            TabIndex        =   40
            Top             =   240
            Width           =   855
         End
         Begin ACTIVESKINLibCtl.SkinLabel Label1 
            Height          =   255
            Left            =   120
            OleObjectBlob   =   "ancora_goh_traditional_frmDatosAsignacionRxAct.frx":0C78
            TabIndex        =   39
            Top             =   2760
            Width           =   3495
         End
         Begin VB.CommandButton cmdPriorityProfeUp 
            Caption         =   "^"
            Height          =   375
            Left            =   120
            TabIndex        =   38
            Top             =   1560
            Width           =   495
         End
         Begin VB.CommandButton cmdPriorityProfeDown 
            Caption         =   "v"
            Height          =   375
            Left            =   120
            TabIndex        =   37
            Top             =   2040
            Width           =   495
         End
         Begin VB.CommandButton cmdDelProfe 
            Caption         =   "<"
            Height          =   375
            Left            =   120
            TabIndex        =   36
            Top             =   1080
            Width           =   495
         End
         Begin VB.CommandButton cmdAddProfe 
            Caption         =   ">"
            Height          =   375
            Left            =   120
            TabIndex        =   35
            Top             =   600
            Width           =   495
         End
         Begin VB.ComboBox cboProfes 
            Height          =   315
            Left            =   1080
            Style           =   2  'Dropdown List
            TabIndex        =   15
            Top             =   240
            Width           =   4335
         End
         Begin VB.ListBox lstGrupos 
            Height          =   1410
            Left            =   120
            Style           =   1  'Checkbox
            TabIndex        =   14
            Top             =   3120
            Width           =   5295
         End
         Begin VB.ListBox lstProfes 
            Height          =   2010
            Left            =   720
            TabIndex        =   13
            Top             =   600
            Width           =   4695
         End
         Begin ACTIVESKINLibCtl.SkinLabel labCantProfesNecesarios 
            Height          =   255
            Left            =   120
            OleObjectBlob   =   "ancora_goh_traditional_frmDatosAsignacionRxAct.frx":0D2C
            TabIndex        =   68
            Top             =   4680
            Visible         =   0   'False
            Width           =   2295
         End
         Begin ACTIVESKINLibCtl.SkinLabel labInsuficientesProfes 
            Height          =   495
            Left            =   3480
            OleObjectBlob   =   "ancora_goh_traditional_frmDatosAsignacionRxAct.frx":0DC6
            TabIndex        =   70
            Top             =   4680
            Visible         =   0   'False
            Width           =   1695
         End
      End
      Begin MSComctlLib.TabStrip TabStripOpciones 
         Height          =   6255
         Left            =   0
         TabIndex        =   64
         Top             =   120
         Width           =   5775
         _ExtentX        =   10186
         _ExtentY        =   11033
         _Version        =   393216
         BeginProperty Tabs {1EFB6598-857C-11D1-B16A-00C0F0283628} 
            NumTabs         =   4
            BeginProperty Tab1 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
               Caption         =   "Lugares"
               ImageVarType    =   2
            EndProperty
            BeginProperty Tab2 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
               Caption         =   "Profesores"
               ImageVarType    =   2
            EndProperty
            BeginProperty Tab3 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
               Caption         =   "Otros recursos"
               ImageVarType    =   2
            EndProperty
            BeginProperty Tab4 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
               Caption         =   "Herramientas"
               ImageVarType    =   2
            EndProperty
         EndProperty
      End
   End
   Begin MSComctlLib.ImageList imlExplorerAct 
      Left            =   6240
      Top             =   5520
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   16
      ImageHeight     =   16
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   8
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ancora_goh_traditional_frmDatosAsignacionRxAct.frx":0E5E
            Key             =   ""
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ancora_goh_traditional_frmDatosAsignacionRxAct.frx":12B0
            Key             =   ""
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ancora_goh_traditional_frmDatosAsignacionRxAct.frx":18FF
            Key             =   ""
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ancora_goh_traditional_frmDatosAsignacionRxAct.frx":1D51
            Key             =   ""
         EndProperty
         BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ancora_goh_traditional_frmDatosAsignacionRxAct.frx":21A3
            Key             =   ""
         EndProperty
         BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ancora_goh_traditional_frmDatosAsignacionRxAct.frx":28CE
            Key             =   ""
         EndProperty
         BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ancora_goh_traditional_frmDatosAsignacionRxAct.frx":2D20
            Key             =   ""
         EndProperty
         BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ancora_goh_traditional_frmDatosAsignacionRxAct.frx":3172
            Key             =   ""
         EndProperty
      EndProperty
   End
   Begin VB.Label labExplorer 
      Alignment       =   2  'Center
      Caption         =   "Explorador de actividades"
      BeginProperty Font 
         Name            =   "Calibri"
         Size            =   11.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   0
      TabIndex        =   34
      Top             =   0
      Width           =   6255
   End
End
Attribute VB_Name = "frmDatosAsignacionRxAct"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"489BC1C6024C"
Option Explicit

'Form Recursos por actividad

'<!- ATRIBUTOS -!>
    
    Dim id_lugxact As Long
    Dim id_desglose As Long
    Dim id_asig_selected As Long
    Dim id_per_selected As Long
    Dim asig_selected As String
    Dim per_selected As String
    Dim act_selected As Long
    Dim cantactividades As Long
    Dim listapxact() As Long
    Dim cantlistapxact As Long
    Dim refre As Boolean
    Dim idlug As Long
    Dim grupos As Variant
    Dim cantGrupos As Long
    Dim id_rxact As Long

'<!- EVENTOS -!>
    Private Sub cboRecursoNecesarios_Click()
        If id_rxact > 0 And id_rxact <= ancora.recursosXact.Count And Not lvwGrupoRecursos.SelectedItem Is Nothing Then
            ancora.recursosXact(id_rxact).gruposRecursos(lvwGrupoRecursos.SelectedItem.index).cantNecesarios = cboRecursoNecesarios.ListIndex + 1
            refreGrupoRecursos
        End If
    End Sub
    
    Private Sub cmdaddGRes_Click()
        If id_rxact = 0 Then
            ancora.recursosXact.add act_selected, per_selected, asig_selected, New TGOH_arrGroupRest
            id_rxact = ancora.recursosXact.Count
        End If
    
        If id_rxact > 0 And id_rxact <= ancora.recursosXact.Count Then _
        ancora.recursosXact(id_rxact).gruposRecursos.add New TAtom_arrVariant, New TAtom_arrVariant, 0, False, 1
        refreGrupoRecursos
    End Sub
    
    Private Sub cmdaddProfe_Click()
        cantlistapxact = cantlistapxact + 1
        ReDim Preserve listapxact(cantlistapxact)
        ancora.insertProfexAct asig_selected, per_selected, act_selected, profe(cboProfes.ListIndex + 1).id
        listapxact(cantlistapxact) = ancora.cantPxAct
        refresca
    End Sub
    
    Private Sub cmdaddRes_Click()
        If id_rxact > 0 And id_rxact <= ancora.recursosXact.Count And Not lvwGrupoRecursos.SelectedItem Is Nothing And cboRecursoDisponibles.ListIndex > -1 Then
            Dim id As String
            id = ancora.recursos(cboRecursoDisponibles.ListIndex + 1).id
            If ancora.recursosXact(id_rxact).gruposRecursos.estaRecurso(id) Then
                interface.MessageDlg "No se puede agregar otra vez", "El recurso ya está asignado a la actividad", vbInformation, "Aceptar"
                Exit Sub
            End If
            ancora.recursosXact(id_rxact).gruposRecursos(lvwGrupoRecursos.SelectedItem.index).recursos.add id
            ancora.recursosXact(id_rxact).gruposRecursos(lvwGrupoRecursos.SelectedItem.index).prioridades.add 1
        End If
    
        refreDetallesGrupoRecurso
        refreGrupoRecursos
    End Sub
    
    Private Sub cmdDelRes_Click()
        If id_rxact > 0 And id_rxact <= ancora.recursosXact.Count And Not lvwGrupoRecursos.SelectedItem Is Nothing _
            And Not lvwRecursosAsignados.SelectedItem Is Nothing Then
    
            If interface.Question_Eliminar Then ancora.recursosXact(id_rxact).gruposRecursos(lvwGrupoRecursos.SelectedItem.index).recursos.Remove lvwRecursosAsignados.SelectedItem.index
        End If
        refreDetallesGrupoRecurso
    End Sub
    Private Sub cmdAplicarATodas_lug_Click()
        If id_lugxact > 0 Then
            If LugXact(id_lugxact).cantLug > 0 Then
                statusBar.Caption = "Clonando asignación de lugares.."
                ancora.AutoLxAct id_lugxact, chkMismaEsp.value = 1, chkMismoNivel.value = 1, chkMismoPeriodo.value = 1, chkMismaAsig.value = 1, chkMismoNumeroAct.value = 1, chkMismaClasif.value = 1, chkToSpecific.value = 1, radioFaltantes.value, chkLimpiarRecursosExistentes = 1
                refresca
            Else
                interface.MessageDlg "No se clonó absolutamente nada", "La actividad no tiene lugares asignados", vbInformation, "Aceptar"
            End If
        End If
    End Sub
    
    Private Sub cmdAplicarATodas_profe_Click()
        If cantlistapxact > 0 Then
            statusBar.Caption = "Clonando asignación de profesores.."
            ancora.AutoPxAct listapxact(1), chkMismaEsp.value = 1, chkMismoNivel.value = 1, chkMismoPeriodo.value = 1, chkMismaAsig.value = 1, chkMismoNumeroAct.value = 1, chkMismaClasif.value = 1, chkToSpecific.value = 1, radioFaltantes.value, chkLimpiarRecursosExistentes = 1
            refresca
        Else
            interface.MessageDlg "No se clonó absolutamente nada", "La actividad no tiene profesores asignados", vbInformation, "Aceptar"
        End If
    End Sub
    
    Private Sub cmdDelGRes_Click()
    
        If id_rxact > 0 And id_rxact <= ancora.recursosXact.Count And Not lvwGrupoRecursos.SelectedItem Is Nothing Then
            If interface.Question_Eliminar Then
                ancora.recursosXact(id_rxact).gruposRecursos.Remove (lvwGrupoRecursos.SelectedItem.index)
                If ancora.recursosXact(id_rxact).gruposRecursos.Count = 0 Then
                    ancora.recursosXact.Remove id_rxact
                    id_rxact = 0
                End If
            End If
        End If
        refreGrupoRecursos
    End Sub
    
    Private Sub cmdDelProfe_Click()
        Dim ix As Long
        ix = lstProfes.ListIndex + 1
        If ix > 0 Then
            If interface.Question_Eliminar Then ancora.deleteProfexAct listapxact(ix)
        End If
        refresca
    End Sub
    
    Private Sub cmdGResDown_Click()
        If id_rxact > 0 And id_rxact <= ancora.recursosXact.Count And Not lvwGrupoRecursos.SelectedItem Is Nothing Then
            With ancora.recursosXact(id_rxact).gruposRecursos(lvwGrupoRecursos.SelectedItem.index)
    
                Dim max As Long, cant As Long
                max = ancora.recursosXact(id_rxact).gruposRecursos.MaxPrioridad
                cant = ancora.recursosXact(id_rxact).gruposRecursos.getCantWithPriori(max)
                If Not (cant = 1 And .prioridad = max) Then
                    .prioridad = .prioridad + 1
                    ancora.recursosXact(id_rxact).gruposRecursos.alinearPrioridades
                End If
            End With
    
            refreGrupoRecursos
    
        End If
    End Sub
    
    Private Sub cmdGResUp_Click()
        If id_rxact > 0 And id_rxact <= ancora.recursosXact.Count And Not lvwGrupoRecursos.SelectedItem Is Nothing Then
            With ancora.recursosXact(id_rxact).gruposRecursos(lvwGrupoRecursos.SelectedItem.index)
                If .prioridad > 1 Then
                    .prioridad = .prioridad - 1
                    ancora.recursosXact(id_rxact).gruposRecursos.alinearPrioridades
                End If
    
            End With
            refreGrupoRecursos
        End If
    End Sub
    
    Private Sub cmdGuardarTerminar_Click()
        Hide
        ancora.Save
    End Sub
       
    Private Sub cmdPriorityProfeDown_Click()
        Dim ix As Long
        ix = lstProfes.ListIndex + 1
        If ix < cantlistapxact Then
            ancora.XCHANGE_Profexact listapxact(ix), listapxact(ix + 1)
            Dim temp As Long
            temp = listapxact(ix)
            listapxact(ix) = listapxact(ix + 1)
            listapxact(ix + 1) = temp
            ix = ix - 1
            Dim temp1 As String
            temp1 = lstProfes.List(ix)
            lstProfes.List(ix) = lstProfes.List(ix + 1)
            lstProfes.List(ix + 1) = temp1
        End If
    
    End Sub
    
    Private Sub cmdPriorityProfeUp_click()
        Dim ix As Long
        ix = lstProfes.ListIndex + 1
        If ix > 1 Then
            ancora.XCHANGE_Profexact listapxact(ix), listapxact(ix - 1)
            Dim temp As Long
            temp = listapxact(ix)
            listapxact(ix) = listapxact(ix - 1)
            listapxact(ix - 1) = temp
            ix = ix - 1
            Dim temp1 As String
            temp1 = lstProfes.List(ix)
            lstProfes.List(ix) = lstProfes.List(ix - 1)
            lstProfes.List(ix - 1) = temp1
        End If
    
    End Sub
    
    Private Sub cmdResDown_Click()
        If id_rxact > 0 And id_rxact <= ancora.recursosXact.Count And Not lvwGrupoRecursos.SelectedItem Is Nothing And Not lvwRecursosAsignados.SelectedItem Is Nothing Then
            With ancora.recursosXact(id_rxact).gruposRecursos(lvwGrupoRecursos.SelectedItem.index).prioridades(lvwRecursosAsignados.SelectedItem.index)
    
                Dim max As Long, cant As Long
                max = ancora.recursosXact(id_rxact).gruposRecursos(lvwGrupoRecursos.SelectedItem.index).MaxPrioridad
                cant = ancora.recursosXact(id_rxact).gruposRecursos(lvwGrupoRecursos.SelectedItem.index).getCantWithPriori(max)
                If Not (cant = 1 And .value = max) Then
                    .value = .value + 1
                    ancora.recursosXact(id_rxact).gruposRecursos(lvwGrupoRecursos.SelectedItem.index).alinearPrioridades
                End If
            End With
    
            refreDetallesGrupoRecurso
    
        End If
    End Sub
    
    Private Sub cmdResUp_Click()
        If id_rxact > 0 And id_rxact <= ancora.recursosXact.Count And Not lvwGrupoRecursos.SelectedItem Is Nothing And Not lvwRecursosAsignados.SelectedItem Is Nothing Then
            With ancora.recursosXact(id_rxact).gruposRecursos(lvwGrupoRecursos.SelectedItem.index).prioridades(lvwRecursosAsignados.SelectedItem.index)
                If .value > 1 Then
                    .value = .value - 1
                    ancora.recursosXact(id_rxact).gruposRecursos(lvwGrupoRecursos.SelectedItem.index).alinearPrioridades
                End If
    
            End With
            refreDetallesGrupoRecurso
        End If
    End Sub
    
    Private Sub chkLimpiarRecursosExistentes_Click()
        If chkLimpiarRecursosExistentes.value = 1 Then
            Dim r As Variant
            r = interface.MessageDlg("Importante", "No habrá forma de deshacer esta operación a menos que salga de la aplicación sin guardar los cambios efectuados. ¿Está seguro de lo que hará?", vbQuestion, "No", "Sí")
            chkLimpiarRecursosExistentes.value = IIf(r = 2, 1, 0)
        End If
    End Sub
    
    Private Sub chkRecursoImprescindible_Click()
        If id_rxact > 0 And id_rxact <= ancora.recursosXact.Count And Not lvwGrupoRecursos.SelectedItem Is Nothing Then
            ancora.recursosXact(id_rxact).gruposRecursos(lvwGrupoRecursos.SelectedItem.index).imprescindibles = (chkRecursoImprescindible.value = 1)
            refreGrupoRecursos
        End If
    End Sub
    
    Private Sub chkToSpecific_Click()
        frameToSpecific.Enabled = (chkToSpecific.value = 1)
    End Sub
    
    Private Sub cmdTerminar_Click()
        Hide
    End Sub
    
    Private Sub lstProfes_Click()
        RefrescaGrupos
    End Sub
    
    Private Sub lvwGrupoRecursos_ItemClick(ByVal Item As MSComctlLib.ListItem)
        refreDetallesGrupoRecurso
    End Sub
    
    Private Sub TabStripOpciones_Click()
        Dim index As Long
        If Not TabStripOpciones.SelectedItem Is Nothing Then
            index = TabStripOpciones.SelectedItem.index
            frameAplicarATodas.Visible = False
            frameProfe.Visible = False
            framelug.Visible = False
            frameOtrosRecursos.Visible = False
            Select Case index
                Case 1: framelug.Visible = True
                Case 2: frameProfe.Visible = True
                Case 3: frameOtrosRecursos.Visible = True
                Case 4: frameAplicarATodas.Visible = True
            End Select
        End If
    End Sub
    
    Private Sub tvwExplorerAct_NodeClick(ByVal Node As MSComctlLib.Node)
        If Mid(Node.key, 1, 3) = "act" Then
            ancora.reparaLxAct
            asig_selected = kernel.strings.subcadena(Node.key, 7, "_")
            per_selected = kernel.strings.subcadena(Node.key, 5, "_")
            act_selected = Val(kernel.strings.subcadena(Node.key, 2, "_"))
            id_asig_selected = ancora.IndexById(dASIG, asig_selected, 0)
            id_per_selected = ancora.IndexById(dPERIODO, per_selected, 0)
            id_lugxact = ancora.IndexLugxAct(id_per_selected, id_asig_selected, act_selected)
            id_desglose = ancora.IndexById(dDESGLOSE, per_selected, id_asig_selected)
            id_rxact = ancora.IndexResxAct(id_per_selected, id_asig_selected, act_selected)
            refresca
        Else
            id_lugxact = -1
            refresca
        End If
    
    End Sub
    
    Private Sub txtCantLugNecesarios_Change()
        labInsuficientesLugs.Visible = Val(txtCantLugNecesarios.Text) > lvwPlaces.ListItems.Count
        asig(id_asig_selected).desglose(id_desglose).act(act_selected).cantLugaresNecesarios = Val(txtCantLugNecesarios.Text)
    End Sub
    
    Private Sub txtCantLugNecesarios_KeyPress(KeyAscii As Integer)
        If (KeyAscii < Asc("0") Or KeyAscii > Asc("9")) And KeyAscii <> 8 Then KeyAscii = 0
    End Sub
    
    Private Sub txtCantProfesNecesarios_Change()
        labInsuficientesProfes.Visible = Val(txtCantProfesNecesarios.Text) > lstProfes.ListCount
        asig(id_asig_selected).desglose(id_desglose).act(act_selected).cantProfesNecesarios = Val(txtCantProfesNecesarios.Text)
    End Sub
    
    Private Sub txtCantProfesNecesarios_KeyPress(KeyAscii As Integer)
        If (KeyAscii < Asc("0") Or KeyAscii > Asc("9")) And KeyAscii <> 8 Then KeyAscii = 0
    End Sub

    Private Sub txtPlacePriority_Change()
        If idlug <> 0 Then
            txtPlacePriority.Text = kernel.utils.trunca(Str(Val(txtPlacePriority.Text)))
            ancora.setLugxAct_Priori id_lugxact, idlug, Val(txtPlacePriority.Text)
            lvwPlaces.ListItems(idlug).ListSubItems(1).Text = txtPlacePriority.Text
        End If
    
    End Sub
    
    Private Sub txtPlacePriority_KeyPress(KeyAscii As Integer)
        If (KeyAscii < Asc("0") Or KeyAscii > Asc("9")) And KeyAscii <> 8 Then
            KeyAscii = 0
        Else
            If txtPlacePriority.Text = "0" And KeyAscii <> 8 Then txtPlacePriority.Text = Chr(KeyAscii)
        End If
    
    End Sub
    
    Private Sub cmdAdd_Click()
        ancora.insertLugXAct act_selected, asig_selected, per_selected
        id_lugxact = ancora.getCantLxAct
        refresca
    End Sub
    
    Private Sub cmdDel_Click()
        Dim i As Long, j As Long, ini As Long
        If interface.Question_Eliminar Then
            ancora.deleteLxAct id_lugxact
            id_lugxact = -1
        End If
    
        refresca
        frameDetail.Enabled = True
    End Sub
    
    Private Sub cmdDown_Click()
        Dim i As Long, c As Long
        i = lvwPlaces.SelectedItem.index
        c = lvwPlaces.ListItems.Count
        If i < c Then
            intercambia i, i + 1
            lvwPlaces.ListItems(i).Selected = False
            lvwPlaces.ListItems(i + 1).Selected = True
            lvwPlaces.ListItems(i + 1).EnsureVisible
        End If
    
    End Sub
    
    Private Sub cmdUp_Click()
        Dim i As Long
        i = lvwPlaces.SelectedItem.index
        If i > 1 Then
            intercambia i, i - 1
            lvwPlaces.ListItems(i).Selected = False
            lvwPlaces.ListItems(i - 1).Selected = True
            lvwPlaces.ListItems(i - 1).EnsureVisible
        End If
    
    End Sub
    
    Private Sub cmdaddPlace_Click()
        ancora.insertLxAct_lug id_lugxact, lugar(cboLugares.ListIndex + 1).id, -1
        txtPlacePriority.Enabled = True
    
        With cboLugares
            If .ListIndex < .ListCount - 1 Then .ListIndex = .ListIndex + 1
        End With
    
        refresca
        txtPlacePriority.Enabled = True
        If lvwPlaces.ListItems.Count > 0 Then
            lvwPlaces.ListItems(idlug).Selected = False
            lvwPlaces.ListItems(lvwPlaces.ListItems.Count).Selected = True
            lvwPlaces.SelectedItem.EnsureVisible
        End If
        idlug = lvwPlaces.ListItems.Count
        refresca
    End Sub
    
    Private Sub cmdDelPlace_Click()
        Dim i As Long, ini As Long, j As Long
        If lvwPlaces.ListItems.Count = 0 Then Exit Sub
        ini = 1
        If interface.Question_Eliminar Then
10
    
            For i = ini To lvwPlaces.ListItems.Count
                If lvwPlaces.ListItems(i).Selected Then
                    ancora.deleteLxAct_lug id_lugxact, i
                    lvwPlaces.ListItems.Remove (i)
                    ini = i
                    GoTo 10
                End If
    
            Next
    
            idlug = ini
    
            If idlug > lvwPlaces.ListItems.Count Then idlug = lvwPlaces.ListItems.Count
            If idlug <> 0 Then
                lvwPlaces.ListItems(idlug).Selected = True
                lvwPlaces.SelectedItem.EnsureVisible
                lvwPlaces.SetFocus
            End If
    
            If lvwPlaces.ListItems.Count = 0 Then
                txtPlacePriority.Text = ""
                txtPlacePriority.Enabled = False
            End If
    
            ancora.reparaLxAct
            refresca
        End If
    
    End Sub
    
    Private Sub cmdDelAllPlaces_Click()
        Dim i As Long
    
        For i = 1 To lvwPlaces.ListItems.Count
            lvwPlaces.ListItems(i).Selected = True
        Next
    
        cmdDelPlace_Click
    End Sub
    
    Private Sub cmdaddAllPlaces_Click()
        Dim i As Long
    
        For i = 1 To cboLugares.ListCount
            cboLugares.ListIndex = i - 1
            cmdaddPlace_Click
        Next
    
        lvwPlaces.SetFocus
        lvwPlaces.SelectedItem.EnsureVisible
        lvwPlaces_ItemClick lvwPlaces.SelectedItem
    End Sub
    
    Private Sub Form_Activate()
        Dim i As Long
        interface.SkinFor Me
        cantactividades = ancora.getTotalDeActividades
        interface.fillTvwExplorerAct tvwExplorerAct, False
        id_lugxact = -1
        If ancora.getCantLxAct > 0 Then id_lugxact = 1
        cboLugares.clear
    
        For i = 1 To ancora.cantLug
            cboLugares.AddItem interface.getRS_Lugar(i)
        Next
    
        If ancora.cantLug > 0 Then cboLugares.ListIndex = 0
        cboProfes.clear
    
        For i = 1 To ancora.cantProfe
            cboProfes.AddItem interface.getRS_Profe(i)
        Next
    
        TabStripOpciones.Tabs(1).Selected = True
        TabStripOpciones_Click
        refresca
    End Sub
    
    Private Sub Form_Resize()
    
        On Error Resume Next
    
        tvwExplorerAct.Left = 0
        tvwExplorerAct.Top = labExplorer.Height + 50
    
        frameDetail.Left = Width - frameDetail.Width - 200
        frameDetail.Top = 0
    
        frameDetail.Height = Height - statusBar.Height - frameOpciones.Height - 550
    
        tvwExplorerAct.Height = Height - statusBar.Height - labExplorer.Height - 650
        tvwExplorerAct.Width = frameDetail.Left - 100
        labExplorer.Width = tvwExplorerAct.Width
        tvwExplorerAct.Appearance = cc3D
    
        frameOpciones.Top = frameDetail.Height + 1
        frameOpciones.Left = frameDetail.Left
        frameOpciones.Width = frameDetail.Width
    
        statusBar.Top = Height - statusBar.Height - 500
        statusBar.Left = -50
        statusBar.Width = Width
        refresca
    End Sub
    
    Private Sub lvwPlaces_ItemClick(ByVal Item As MSComctlLib.ListItem)
        idlug = lvwPlaces.SelectedItem.index
        txtPlacePriority.Text = "" & ancora.getLxAct_Priority(id_lugxact, idlug)
    End Sub

    Private Sub lstGrupos_Click()
        Dim kk As Long, i As Long, j As Long, a As String, ix As Long
        ix = listapxact(lstProfes.ListIndex + 1)
        If refre = False Then
            kk = lstGrupos.ListIndex
            ProfeXAct(ix).cantGrupos = 0
    
            For i = 1 To lstGrupos.ListCount
                If lstGrupos.Selected(i - 1) Then
                    ancora.insertPxAct_Grupo ix, grupos(i)
                End If
    
            Next
    
            refre = True
            lstGrupos.ListIndex = kk
            refre = False
        End If
    
    End Sub

'<!- METODOS -!>
    Public Sub refresca()  'refrescar
        Dim i As Long, ix As Long
        
        lvwPlaces.ListItems.clear
        statusBar.Caption = "Se ha asignado recursos a " & ancora.cantLxAct & " plantillas de actividades de un total de " & cantactividades
        
        If id_lugxact = -1 Then
            frameDetail.Enabled = False
            cmdAdd.Enabled = Not frameRecursos.Enabled
            cmdDel.Enabled = frameRecursos.Enabled
            Exit Sub
        Else
            frameDetail.Enabled = True
            frameRecursos.Enabled = Not (id_lugxact = 0)
            cmdAdd.Enabled = Not frameRecursos.Enabled
            cmdDel.Enabled = frameRecursos.Enabled
            If id_lugxact <> 0 Then
                lvwPlaces.ListItems.clear
    
                For i = 1 To LugXact(id_lugxact).cantLug
                    lvwPlaces.ListItems.add , , ancora.getLxAct_Lug(id_lugxact, i), 6, 6
                    lvwPlaces.ListItems(i).ListSubItems.clear
                    lvwPlaces.ListItems(i).ListSubItems.add , , ancora.getLxAct_Priority(id_lugxact, i)
                Next
    
                If lvwPlaces.ListItems.Count > 0 Then
                    lvwPlaces.ListItems(1).Selected = True
                    idlug = 1
                End If
    
            End If
    
            cantlistapxact = 0
    
            For i = 1 To ancora.getCantPxAct
    
                With ProfeXAct(i)
                    If .para.idact = act_selected And kernel.utils.idigual(.para.idasig, asig_selected) And kernel.utils.idigual(.para.idper, per_selected) Then
                        cantlistapxact = cantlistapxact + 1
                        ReDim Preserve listapxact(cantlistapxact)
                        listapxact(cantlistapxact) = i
                    End If
    
                End With
    
            Next
    
            lstProfes.clear
    
            For i = 1 To cantlistapxact
                ix = ancora.IndexById(dPROFE, ProfeXAct(listapxact(i)).idprofes, 0)
                lstProfes.AddItem interface.getRS_Profe(ix)
            Next
    
            If lstProfes.ListCount > 0 Then lstProfes.Selected(0) = True
    
            If id_asig_selected > 0 And id_desglose > 0 And act_selected > 0 Then
                With asig(id_asig_selected).desglose(id_desglose).act(act_selected)
                    txtCantLugNecesarios.Text = "" & .cantLugaresNecesarios
                    txtCantProfesNecesarios.Text = "" & .cantProfesNecesarios
                End With
            End If
        End If
    
        refreGrupoRecursos
        refreDetallesGrupoRecurso
    
    End Sub
    
    Public Sub intercambia(id1 As Long, id2 As Long)
        If id1 <> 0 And id2 <> 0 Then
            ancora.XCHANGE_LxAct_Lug id_lugxact, id1, id2
            interface.XCHANGE_ListItem lvwPlaces, id1, id2
        End If
    
    End Sub
    
    Public Sub RefrescaGrupos()

        Dim idclasif As String, esp As String, Nivel As Long, i As Long, j As Long
        Dim localBrgs As Variant, localCantbrg As Long
        
        refre = True
        idclasif = asig(id_asig_selected).desglose(id_desglose).act(act_selected).idclasif
        esp = asig(id_asig_selected).idesp
        Nivel = asig(id_asig_selected).Nivel
        grupos = ancora.getArrayOfGruposXClasif(esp, Nivel, idclasif, cantGrupos)
        lstGrupos.clear
    
        For i = 1 To cantGrupos
            localBrgs = ancora.getArrayOfBrgsByEspNivelClasifGroup(esp, Nivel, idclasif, grupos(i), localCantbrg)
            Dim a As String
            a = ""
    
            For j = 1 To localCantbrg
                a = a + kernel.utils.trunca(Brigada(localBrgs(j)).comun.id) + IIf(j < localCantbrg, ", ", "")
            Next
    
            lstGrupos.AddItem grupos(i) & " - " & a
        Next
    
        'autoseleccionar los grupos
    
        For i = 1 To lstGrupos.ListCount
            lstGrupos.Selected(i - 1) = False
        Next
    
        For i = 1 To ProfeXAct(listapxact(lstProfes.ListIndex + 1)).cantGrupos
            If ProfeXAct(listapxact(lstProfes.ListIndex + 1)).grupos(i) > 0 Then lstGrupos.Selected(getIxOfGrupo(ProfeXAct(listapxact(lstProfes.ListIndex + 1)).grupos(i)) - 1) = True
        Next
    
        refre = False
    End Sub
    
    Public Function getIxOfGrupo(g As Long) As Long
        Dim i As Long
        For i = 1 To cantGrupos
            If grupos(i) = g Then
                getIxOfGrupo = i
                Exit Function
            End If
        Next
        getIxOfGrupo = 0
    End Function

    Public Sub refreGrupoRecursos()
        If id_rxact > 0 And id_rxact <= ancora.recursosXact.Count Then
            Dim ix As Long
            If Not lvwGrupoRecursos.SelectedItem Is Nothing Then ix = lvwGrupoRecursos.SelectedItem.index
    
            lvwGrupoRecursos.ListItems.clear
            Dim i  As Long
            With ancora.recursosXact(id_rxact)
    
                For i = 1 To .gruposRecursos.Count
                    lvwGrupoRecursos.ListItems.add , , "" & i, 8, 8
                    lvwGrupoRecursos.ListItems(i).ListSubItems.add , , "" & .gruposRecursos(i).recursos.Count
                    lvwGrupoRecursos.ListItems(i).ListSubItems.add , , "" & .gruposRecursos(i).prioridad
                Next
    
            End With
            If ix > 0 And ix <= lvwGrupoRecursos.ListItems.Count Then
                lvwGrupoRecursos.ListItems(ix).Selected = True
                lvwGrupoRecursos.ListItems(ix).EnsureVisible
            End If
            
            If lvwGrupoRecursos.Visible Then lvwGrupoRecursos.SetFocus
        End If
    End Sub

    Public Sub refreDetallesGrupoRecurso()
        If id_rxact > 0 And id_rxact <= ancora.recursosXact.Count Then
            Dim ix As Long, i As Long
            If Not lvwGrupoRecursos.SelectedItem Is Nothing Then
                If Not lvwRecursosAsignados.SelectedItem Is Nothing Then ix = lvwRecursosAsignados.SelectedItem.index
                Dim ixr As Long
    
                'mostrando recursos disponibles
                ixr = cboRecursoDisponibles.ListIndex
                interface.fillCboRecursos cboRecursoDisponibles
                interface.fillCboConsecutivos cboRecursoNecesarios, ancora.recursosXact(id_rxact).gruposRecursos(lvwGrupoRecursos.SelectedItem.index).recursos.Count
    
                cboRecursoNecesarios.ListIndex = ancora.recursosXact(id_rxact).gruposRecursos(lvwGrupoRecursos.SelectedItem.index).cantNecesarios - 1
                chkRecursoImprescindible.value = IIf(ancora.recursosXact(id_rxact).gruposRecursos(lvwGrupoRecursos.SelectedItem.index).imprescindibles, 1, 0)
    
                If ixr < cboRecursoDisponibles.ListCount Then cboRecursoDisponibles.ListIndex = ixr
    
                lvwRecursosAsignados.ListItems.clear
                With ancora.recursosXact(id_rxact).gruposRecursos(lvwGrupoRecursos.SelectedItem.index)
                    For i = 1 To .recursos.Count
                        lvwRecursosAsignados.ListItems.add , , interface.getRS_Recurso(ancora.IndexById("" & dRECURSO, .recursos(i).value)), 8, 8
                        lvwRecursosAsignados.ListItems(i).ListSubItems.add , , "" & .prioridades(i).value
                    Next
                    If Not (ix > 0 And ix <= lvwRecursosAsignados.ListItems.Count) Then ix = lvwRecursosAsignados.ListItems.Count
                    If ix > 0 Then
                        lvwRecursosAsignados.ListItems(ix).Selected = True
                        lvwRecursosAsignados.ListItems(ix).EnsureVisible
                        If lvwRecursosAsignados.Visible Then lvwRecursosAsignados.SetFocus
                    End If
    
                End With
            End If
        End If
    End Sub
