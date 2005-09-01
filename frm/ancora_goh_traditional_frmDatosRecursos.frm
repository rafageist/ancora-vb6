     VERSION 5.00
     Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
     Begin VB.Form frmDatosRecursos
     BorderStyle     =   3  'Fixed Dialog
     Caption         =   "Recursos de la actividad"
     ClientHeight    =   6870
     ClientLeft      =   45
     ClientTop       =   435
     ClientWidth     =   9720
     Icon            =   "ancora_goh_traditional_frmDatosRecursos.frx":0000
     LinkTopic       =   "Form1"
     MaxButton       =   0   'False
     MinButton       =   0   'False
     ScaleHeight     =   6870
     ScaleWidth      =   9720
     ShowInTaskbar   =   0   'False
     StartUpPosition =   2  'CenterScreen
     Begin VB.CommandButton cmdAceptar
     Caption         =   "Aceptar"
     Height          =   495
     Left            =   7680
     TabIndex        =   19
     Top             =   6240
     Width           =   1815
     End
     Begin VB.Frame Frame_Lugares
     Caption         =   "Lugares"
     Height          =   2415
     Left            =   120
     TabIndex        =   7
     Top             =   3720
     Width           =   9375
     Begin VB.CommandButton cmdDown
     Height          =   495
     Left            =   8640
     Picture         =   "ancora_goh_traditional_frmDatosRecursos.frx":08CA
     Style           =   1  'Graphical
     TabIndex        =   15
     ToolTipText     =   "Mover lugar abajo"
     Top             =   1200
     Width           =   495
     End
     Begin VB.CommandButton cmdUp
     Height          =   495
     Left            =   8640
     Picture         =   "ancora_goh_traditional_frmDatosRecursos.frx":0C4C
     Style           =   1  'Graphical
     TabIndex        =   14
     ToolTipText     =   "Mover lugar arriba"
     Top             =   480
     Width           =   495
     End
     Begin VB.CommandButton Command3
     Height          =   495
     Left            =   2400
     Picture         =   "ancora_goh_traditional_frmDatosRecursos.frx":0F8E
     Style           =   1  'Graphical
     TabIndex        =   13
     ToolTipText     =   "Insertar a la lista"
     Top             =   360
     Width           =   615
     End
     Begin VB.CommandButton Command4
     Height          =   495
     Left            =   2400
     Picture         =   "ancora_goh_traditional_frmDatosRecursos.frx":1310
     Style           =   1  'Graphical
     TabIndex        =   12
     ToolTipText     =   "Extraer de la lista"
     Top             =   1320
     Width           =   615
     End
     Begin VB.ComboBox cboLugares
     Height          =   315
     ItemData        =   "ancora_goh_traditional_frmDatosRecursos.frx":1692
     Left            =   120
     List            =   "ancora_goh_traditional_frmDatosRecursos.frx":1694
     Style           =   2  'Dropdown List
     TabIndex        =   11
     Top             =   960
     Width           =   3615
     End
     Begin VB.TextBox Text1
     Height          =   285
     Left            =   7800
     MaxLength       =   3
     TabIndex        =   10
     ToolTipText     =   "Índice de prioridad del lugar para esta actividad"
     Top             =   1920
     Width           =   615
     End
     Begin VB.CommandButton Command5
     Height          =   495
     Left            =   3120
     Picture         =   "ancora_goh_traditional_frmDatosRecursos.frx":1696
     Style           =   1  'Graphical
     TabIndex        =   9
     ToolTipText     =   "Extraer todos (limpia la lista)"
     Top             =   1320
     Width           =   615
     End
     Begin VB.CommandButton Command6
     Height          =   495
     Left            =   3120
     Picture         =   "ancora_goh_traditional_frmDatosRecursos.frx":1A18
     Style           =   1  'Graphical
     TabIndex        =   8
     ToolTipText     =   "Insertar todos"
     Top             =   360
     Width           =   615
     End
     Begin MSComctlLib.ListView lstLugares
     CausesValidation=   0   'False
     Height          =   1575
     Left            =   4080
     TabIndex        =   16
     Top             =   240
     Width           =   4455
     _ExtentX        =   7858
     _ExtentY        =   2778
     View            =   3
     LabelEdit       =   1
     MultiSelect     =   -1  'True
     LabelWrap       =   -1  'True
     HideSelection   =   0   'False
     FullRowSelect   =   -1  'True
     GridLines       =   -1  'True
     TextBackground  =   -1  'True
     _Version        =   393217
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
     Begin VB.Label Label2
     Caption         =   "Prioridad:"
     ForeColor       =   &H00FF0000&
     Height          =   255
     Left            =   6720
     TabIndex        =   17
     Top             =   1920
     Width           =   855
     End
     Begin VB.Image Image2
     Height          =   480
     Left            =   240
     Picture         =   "ancora_goh_traditional_frmDatosRecursos.frx":1D9A
     Top             =   360
     Width           =   480
     End
     End
     Begin VB.Frame Frame_Profesor
     Caption         =   "Profesor"
     Height          =   2895
     Left            =   120
     TabIndex        =   4
     Top             =   720
     Width           =   9375
     Begin VB.CommandButton Command2
     Height          =   495
     Left            =   1920
     Picture         =   "ancora_goh_traditional_frmDatosRecursos.frx":2664
     Style           =   1  'Graphical
     TabIndex        =   22
     ToolTipText     =   "Mover lugar abajo"
     Top             =   600
     Width           =   495
     End
     Begin VB.CommandButton Command1
     Height          =   495
     Left            =   1200
     Picture         =   "ancora_goh_traditional_frmDatosRecursos.frx":29E6
     Style           =   1  'Graphical
     TabIndex        =   21
     ToolTipText     =   "Mover lugar arriba"
     Top             =   600
     Width           =   495
     End
     Begin MSComctlLib.ListView lstProfes
     Height          =   1695
     Left            =   120
     TabIndex        =   20
     Top             =   1080
     Width           =   4095
     _ExtentX        =   7223
     _ExtentY        =   2990
     LabelWrap       =   -1  'True
     HideSelection   =   -1  'True
     _Version        =   393217
     ForeColor       =   -2147483640
     BackColor       =   -2147483643
     BorderStyle     =   1
     Appearance      =   1
     NumItems        =   0
     End
     Begin VB.ListBox lstGrupos
     Height          =   1635
     Left            =   4320
     Style           =   1  'Checkbox
     TabIndex        =   6
     Top             =   1080
     Width           =   4935
     End
     Begin VB.ComboBox cboProfe
     Height          =   315
     Left            =   1200
     TabIndex        =   5
     Text            =   "Combo1"
     Top             =   240
     Width           =   4335
     End
     Begin VB.Label Label6
     Caption         =   "Grupos que atiende"
     Height          =   255
     Left            =   6120
     TabIndex        =   18
     Top             =   840
     Width           =   1455
     End
     Begin VB.Image Image1
     Height          =   480
     Left            =   240
     Picture         =   "ancora_goh_traditional_frmDatosRecursos.frx":2D28
     Top             =   240
     Width           =   480
     End
     End
     Begin VB.Label labClasif
     Caption         =   "Clasificación"
     ForeColor       =   &H00FF0000&
     Height          =   375
     Left            =   7200
     TabIndex        =   3
     Top             =   240
     Width           =   2295
     End
     Begin VB.Label labidAct
     Caption         =   "# de actividad"
     ForeColor       =   &H00FF0000&
     Height          =   375
     Left            =   2520
     TabIndex        =   2
     Top             =   240
     Width           =   2175
     End
     Begin VB.Label labPeriodo
     Caption         =   "Periodo"
     ForeColor       =   &H00FF0000&
     Height          =   495
     Left            =   4920
     TabIndex        =   1
     Top             =   120
     Width           =   2055
     End
     Begin VB.Label labAsig
     Caption         =   "Asignatura"
     ForeColor       =   &H00FF0000&
     Height          =   375
     Left            =   240
     TabIndex        =   0
     Top             =   240
     Width           =   1935
     End
     End
     Attribute VB_Name = "frmDatosRecursos"
     Attribute VB_GlobalNameSpace = False
     Attribute VB_Creatable = False
     Attribute VB_PredeclaredId = True
     Attribute VB_Exposed = False
     '@module_name =
     '@module_type = form
     '@module_description =
     '@local_vars
     '@end_local_vars
     '@events
     '@end_events
     '@methods
     '@end_methods

     