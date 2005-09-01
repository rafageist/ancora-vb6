VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "Mscomctl.ocx"
Begin VB.Form frmGeneradorGenerar 
   AutoRedraw      =   -1  'True
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Generar horario"
   ClientHeight    =   8160
   ClientLeft      =   285
   ClientTop       =   -660
   ClientWidth     =   10860
   ClipControls    =   0   'False
   DrawStyle       =   5  'Transparent
   FontTransparent =   0   'False
   Icon            =   "ancora_goh_traditional_frmGeneradorGenerar.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   8160
   ScaleWidth      =   10860
   StartUpPosition =   2  'CenterScreen
   Visible         =   0   'False
   Begin VB.CheckBox Check3 
      Caption         =   "Maximizar la combinación de actividades por día"
      Height          =   255
      Left            =   360
      TabIndex        =   44
      Top             =   5400
      Width           =   4815
   End
   Begin VB.CheckBox Check2 
      Caption         =   "Agrupar actividades por su clasificación"
      Height          =   375
      Left            =   360
      TabIndex        =   43
      Top             =   4800
      Width           =   4815
   End
   Begin VB.CommandButton Statusbar 
      Caption         =   "Listo"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   0
      TabIndex        =   42
      Top             =   7680
      Width           =   11055
   End
   Begin VB.CommandButton cmdCompactar 
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
      Index           =   0
      Left            =   2640
      TabIndex        =   37
      Top             =   2880
      Width           =   495
   End
   Begin VB.CommandButton cmdDown 
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
      Height          =   495
      Left            =   5400
      TabIndex        =   36
      Top             =   3240
      Width           =   495
   End
   Begin VB.CommandButton cmdUp 
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
      Height          =   495
      Left            =   5400
      TabIndex        =   35
      Top             =   2640
      Width           =   495
   End
   Begin VB.CommandButton cmdDelAll 
      Caption         =   "<<"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   5400
      TabIndex        =   34
      Top             =   2040
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
      Height          =   495
      Left            =   5400
      TabIndex        =   33
      Top             =   1440
      Width           =   495
   End
   Begin VB.CommandButton btnAdd 
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
      Height          =   495
      Left            =   5400
      TabIndex        =   32
      Top             =   840
      Width           =   495
   End
   Begin VB.CommandButton btnAddAll 
      Caption         =   ">>"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   5400
      TabIndex        =   31
      Top             =   240
      Width           =   495
   End
   Begin VB.CommandButton cmdExit 
      Caption         =   "Terminar sin guardar"
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
      Left            =   8640
      TabIndex        =   30
      Top             =   7080
      Width           =   2055
   End
   Begin VB.CommandButton cmdSaveExit 
      Caption         =   "Guardar y terminar"
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
      Left            =   6600
      TabIndex        =   29
      Top             =   7080
      Width           =   1935
   End
   Begin VB.CommandButton cmdDegenerar 
      BackColor       =   &H00FFF1DD&
      Caption         =   "Deshacer este..."
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
      Left            =   2640
      TabIndex        =   28
      Top             =   2040
      Width           =   1935
   End
   Begin VB.CommandButton ucBtnSkinClasificaciones 
      Caption         =   "Clasificaciones de actividades"
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
      Left            =   3720
      TabIndex        =   27
      Top             =   7080
      Width           =   2775
   End
   Begin MSComctlLib.ProgressBar ProgressBar2 
      Height          =   255
      Left            =   7320
      TabIndex        =   26
      Top             =   6120
      Width           =   3255
      _ExtentX        =   5741
      _ExtentY        =   450
      _Version        =   393216
      Appearance      =   0
      Scrolling       =   1
   End
   Begin MSComctlLib.ImageList ImageList2 
      Left            =   600
      Top             =   6960
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
            Picture         =   "ancora_goh_traditional_frmGeneradorGenerar.frx":0252
            Key             =   ""
         EndProperty
      EndProperty
   End
   Begin VB.Frame Frame2 
      Caption         =   "Priorizar"
      Height          =   855
      Left            =   240
      TabIndex        =   21
      Top             =   3720
      Width           =   4935
      Begin VB.OptionButton Option2 
         Caption         =   "... la cantidad de actividades de las asignaturas"
         Height          =   255
         Left            =   120
         TabIndex        =   23
         Top             =   480
         Width           =   4455
      End
      Begin VB.OptionButton Option1 
         Caption         =   "... el orden de las clasificaciones de actividades"
         Height          =   255
         Left            =   120
         TabIndex        =   22
         Top             =   240
         Value           =   -1  'True
         Width           =   4455
      End
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Pausa entre generaciones"
      Height          =   195
      Left            =   8520
      TabIndex        =   13
      ToolTipText     =   "Reliza una pausa entre cada proceso y permite ver un análisis en el momento"
      Top             =   5400
      Value           =   1  'Checked
      Width           =   2175
   End
   Begin MSComctlLib.ImageList ImageList1 
      Left            =   1200
      Top             =   6960
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
            Picture         =   "ancora_goh_traditional_frmGeneradorGenerar.frx":0A8C
            Key             =   ""
         EndProperty
      EndProperty
   End
   Begin VB.Timer Timer2 
      Enabled         =   0   'False
      Interval        =   1000
      Left            =   1800
      Top             =   7080
   End
   Begin VB.CommandButton Command4 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   6600
      Picture         =   "ancora_goh_traditional_frmGeneradorGenerar.frx":0DA6
      Style           =   1  'Graphical
      TabIndex        =   8
      ToolTipText     =   "Detener"
      Top             =   6000
      Width           =   495
   End
   Begin VB.CommandButton Command1 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   6000
      MaskColor       =   &H00000000&
      Picture         =   "ancora_goh_traditional_frmGeneradorGenerar.frx":12B0
      Style           =   1  'Graphical
      TabIndex        =   6
      ToolTipText     =   "Comenzar"
      Top             =   6000
      Width           =   495
   End
   Begin VB.ComboBox cboPer 
      Height          =   315
      Left            =   1440
      Style           =   2  'Dropdown List
      TabIndex        =   5
      Top             =   1560
      Width           =   3135
   End
   Begin VB.ComboBox cboNivel 
      Height          =   315
      Left            =   1440
      Style           =   2  'Dropdown List
      TabIndex        =   4
      Top             =   1080
      Width           =   3135
   End
   Begin VB.ComboBox cboEsp 
      Height          =   315
      Left            =   1440
      Style           =   2  'Dropdown List
      TabIndex        =   0
      Top             =   600
      Width           =   3135
   End
   Begin MSComctlLib.ListView ListView2 
      Height          =   4935
      Left            =   6000
      TabIndex        =   11
      Top             =   360
      Width           =   4695
      _ExtentX        =   8281
      _ExtentY        =   8705
      View            =   3
      LabelEdit       =   1
      LabelWrap       =   -1  'True
      HideSelection   =   0   'False
      FullRowSelect   =   -1  'True
      GridLines       =   -1  'True
      _Version        =   393217
      Icons           =   "ImageList1"
      SmallIcons      =   "ImageList1"
      ColHdrIcons     =   "ImageList1"
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      BorderStyle     =   1
      Appearance      =   1
      NumItems        =   3
      BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         Text            =   "Especialidad"
         Object.Width           =   2540
      EndProperty
      BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   1
         Text            =   "Nivel"
         Object.Width           =   2540
      EndProperty
      BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   2
         Text            =   "Período"
         Object.Width           =   2540
      EndProperty
   End
   Begin VB.Frame Frame1 
      Caption         =   "Seleccionar lugares según.."
      Height          =   735
      Left            =   240
      TabIndex        =   18
      Top             =   5880
      Width           =   4935
      Begin VB.OptionButton Option4 
         Caption         =   "...el más cercano"
         Height          =   195
         Left            =   2280
         TabIndex        =   20
         Top             =   360
         Width           =   1695
      End
      Begin VB.OptionButton Option3 
         Caption         =   "...el más utilizado"
         Height          =   195
         Left            =   120
         TabIndex        =   19
         Top             =   360
         Value           =   -1  'True
         Width           =   1695
      End
   End
   Begin VB.CommandButton cmdCompactar 
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
      Index           =   1
      Left            =   3240
      TabIndex        =   38
      Top             =   2880
      Width           =   495
   End
   Begin VB.CommandButton cmdCompactar 
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
      Index           =   2
      Left            =   3840
      TabIndex        =   39
      Top             =   2880
      Width           =   495
   End
   Begin VB.CommandButton cmdCompactar 
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
      Index           =   3
      Left            =   4440
      TabIndex        =   40
      Top             =   2880
      Width           =   495
   End
   Begin VB.CommandButton ucBtnSkin1 
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   7200
      TabIndex        =   41
      Top             =   6000
      Width           =   3495
   End
   Begin VB.Line Line2 
      BorderColor     =   &H00808080&
      X1              =   0
      X2              =   10680
      Y1              =   6945
      Y2              =   6945
   End
   Begin VB.Line Line1 
      BorderColor     =   &H00FFFFFF&
      X1              =   0
      X2              =   10695
      Y1              =   6960
      Y2              =   6960
   End
   Begin VB.Label Label5 
      AutoSize        =   -1  'True
      BackColor       =   &H00C00000&
      BackStyle       =   0  'Transparent
      Caption         =   "Generar horario para..."
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
      Left            =   120
      TabIndex        =   25
      Top             =   120
      Width           =   1950
   End
   Begin VB.Label Label14 
      BackStyle       =   0  'Transparent
      Caption         =   "Generando..."
      Height          =   255
      Left            =   7320
      TabIndex        =   24
      Top             =   5760
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.Shape Shape3 
      BorderColor     =   &H8000000C&
      Height          =   1935
      Left            =   120
      Top             =   360
      Width           =   5175
   End
   Begin VB.Label Label13 
      AutoSize        =   -1  'True
      BackColor       =   &H00C00000&
      BackStyle       =   0  'Transparent
      Caption         =   "Estrategia para generar"
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
      Left            =   120
      TabIndex        =   17
      Top             =   2520
      Width           =   2010
   End
   Begin VB.Label Label12 
      BackStyle       =   0  'Transparent
      Caption         =   "más"
      Height          =   255
      Left            =   4560
      TabIndex        =   16
      Top             =   3360
      Width           =   375
   End
   Begin VB.Label Label11 
      BackStyle       =   0  'Transparent
      Caption         =   "menos"
      Height          =   255
      Left            =   2640
      TabIndex        =   15
      Top             =   3360
      Width           =   495
   End
   Begin VB.Label Label9 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Compactar al inicio del período"
      Height          =   195
      Left            =   360
      TabIndex        =   14
      ToolTipText     =   "El generador intentará colocar lo más cercano posible al inicio del período"
      Top             =   3000
      Width           =   2070
   End
   Begin VB.Shape Shape1 
      BorderColor     =   &H00808080&
      FillColor       =   &H00C0C0C0&
      Height          =   3975
      Left            =   120
      Top             =   2760
      Width           =   5175
   End
   Begin VB.Label labTime1 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "00:00:00"
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
      Left            =   7320
      TabIndex        =   9
      ToolTipText     =   "Tiempo de comienzo de este proceso"
      Top             =   6600
      Width           =   645
   End
   Begin VB.Label Label8 
      BackStyle       =   0  'Transparent
      Caption         =   "Cola de espera de los procesos de generación"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   6000
      TabIndex        =   12
      Top             =   120
      Width           =   3975
   End
   Begin VB.Label labTime2 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "00:00:00"
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
      Height          =   195
      Left            =   9960
      TabIndex        =   10
      ToolTipText     =   "Tiempo actual"
      Top             =   6600
      Width           =   645
   End
   Begin VB.Label Label3 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Período"
      ForeColor       =   &H80000008&
      Height          =   195
      Left            =   720
      TabIndex        =   3
      Top             =   1560
      Width           =   570
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Nivel"
      ForeColor       =   &H80000008&
      Height          =   195
      Left            =   840
      TabIndex        =   2
      Top             =   1080
      Width           =   360
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Especialidad"
      ForeColor       =   &H80000008&
      Height          =   195
      Left            =   360
      TabIndex        =   1
      Top             =   600
      Width           =   900
   End
   Begin VB.Label Label4 
      AutoSize        =   -1  'True
      BackColor       =   &H00008000&
      BackStyle       =   0  'Transparent
      Caption         =   "Progreso"
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
      Left            =   6120
      TabIndex        =   7
      Top             =   5520
      Width           =   765
   End
End
Attribute VB_Name = "frmGeneradorGenerar"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"489BC1EC0391"
Option Explicit

Private isGenerando As Boolean
Private mas As Long
Private img As Long
Private compactar As Long
Dim Refrescar As Boolean
Public Sub agregar()
    btnadd_Click
End Sub

Private Sub cmdCompactar_Click(index As Integer)
    compactar = index + 1
End Sub

Private Sub cmdExit_Click()
   Hide
End Sub

Private Sub cmdSaveExit_Click()
    ancora.GuardarTodo
    Hide
End Sub

Private Sub Command4_Click()
    Detener = True
End Sub

Private Sub btnadd_Click()
    ColaDeGeneracion.add Especialidad(cboEsp.ListIndex + 1).id, cboNivel.ListIndex + 1, ancora.periodos(cboPer.ListIndex + 1).id, cboEsp.ListIndex + 1, cboPer.ListIndex + 1
    refreshCola
End Sub

Private Sub btnaddAll_Click()
    Dim i As Long, j As Long, k As Long
    Refrescar = False
    For i = 1 To cboEsp.ListCount
        cboEsp.ListIndex = i - 1

        For j = 1 To cboNivel.ListCount
            cboNivel.ListIndex = j - 1

            For k = 1 To cboPer.ListCount
                cboPer.ListIndex = k - 1
                btnadd_Click
            Next

        Next

    Next
    Refrescar = True
    refreshCola

End Sub

Private Sub cmdDel_Click()
    If ColaDeGeneracion.Count > 0 Then
        If Timer2.Enabled And ListView2.SelectedItem.index = 1 Then Exit Sub
        ColaDeGeneracion.Remove (ListView2.SelectedItem.index)
        refreshCola
    End If

End Sub

Private Sub cmdDelAll_Click()
    Dim i As Long
    Dim k As TKernel_ProcesoEnCola
    Set k = New TKernel_ProcesoEnCola
    Set k = ColaDeGeneracion(1)

    Set ColaDeGeneracion = Nothing
    Set ColaDeGeneracion = New TKernel_arrProcesoEnCola

    ColaDeGeneracion.add k.esp, k.Nivel, k.per, k.ixesp, k.ixper
    refreshCola
End Sub

Private Sub cmdDown_Click()
    Dim i As Long
    i = ListView2.SelectedItem.index
    If i = 1 Or ColaDeGeneracion.Count = 1 Or i = ColaDeGeneracion.Count Then Exit Sub
    ColaDeGeneracion.swap i, i + 1
    refreshCola
End Sub

Private Sub cmdUp_Click()
    Dim i As Long
    i = ListView2.SelectedItem.index
    If i < 3 Or ColaDeGeneracion.Count = 1 Then Exit Sub
    ColaDeGeneracion.swap i, i - 1
    refreshCola
End Sub

Private Sub Command1_Click()
    Dim compa As Long
    Dim r As Variant
    Dim forma As Long
    Dim buscalugar As Boolean
    Dim espec As Long, Nivel As Long, perio As Long, PARCHE As Long, parche1 As Boolean
    If ListView2.ListItems.Count = 0 Then
        interface.MessageDlg "Imposible comenzar", "Debe pasar los datos necesarios para generar a la 'Cola de espera de los procesos de generación'", vbExclamation, "Aceptar"
        Exit Sub
    End If
    Label14.Visible = True
    ListView2.ListItems.Item(1).SmallIcon = 1
    Command1.Enabled = False
    Command4.Enabled = True
    Dim t As String
    isGenerando = True
    t = Time$
    Timer2.Enabled = True
    ucBtnSkinClasificaciones.Enabled = False
    cmdSaveExit.Enabled = False
    cmdExit.Enabled = False
    
    ancora.updateHashPxAct
    ancora.updateHashLxAct
    ancora.updatehash
    ancora.updateHash_objects
    
    While ColaDeGeneracion.Count > 0
        
        statusBar.Caption = "Procesos en cola: " & ColaDeGeneracion.Count & " | Actividades rechazadas: " & ancora.IMPOSIBLES_NOW
        Command1.Enabled = False
        ListView2.ListItems(1).Selected = True
        ListView2.SelectedItem.EnsureVisible

        With ColaDeGeneracion(1)
            ancora.LimpiaImposibles .esp, .Nivel, .per
            If Option1.value = True Then forma = 1 Else forma = 2
            If Option3.value = True Then buscalugar = False Else buscalugar = True
            If Check2.value = 1 Then PARCHE = 1
            If Check3.value = 1 Then parche1 = 1

            compa = compactar
            Generando.brgs = BrgGenerando(.ixesp, .Nivel)
            labTime1.Caption = "" & Time
            ancora.Generar .ixesp, .Nivel, .ixper, forma, PARCHE, compa, parche1, buscalugar

            If Check1.value = 1 Then
                r = interface.MessageDlg("Generación de horario", "!Proceso terminado satisfactoriamente! " + Chr(13) + Chr(13) + "   - Empezado a la hora " + ancora.HoraInicialGeneracion + Chr(13) + "   - Terminado a la hora " + Time$ + Chr(13) + Chr(13) + "Cantidad de actividades sin asignar: " + Str(ancora.IMPOSIBLES_NOW) + Chr(13) + Chr(13) + "¿Desea mostrar un análisis de este horario?", vbQuestion, "No", "Sí")
                If r = 2 Then interface.showAnalisisHorario .ixesp, .Nivel, .ixper, True
            End If
        End With

        If Detener = True Then
            r = interface.MessageDlg("Detener", "¿Desea detener todos los procesos?", vbQuestion, "No", "Sí")
            If r = 2 Then
                Command1.Enabled = True
                Command1.Enabled = True
                Command4.Enabled = False
                limpia

                ucBtnSkinClasificaciones.Enabled = True
                cmdSaveExit.Enabled = True
                cmdExit.Enabled = True

                Exit Sub
            End If
        End If
        ColaDeGeneracion.Remove 1
    Wend
    refreshCola
    Command1.Enabled = True
    Command4.Enabled = False
    Beep
    interface.MessageDlg "Procesos terminados", "Todos los procesos de generación han sido terminados" + Chr(13) + Chr(13) + "Comenzados a las:" + t + Chr$(13) + Chr(13) + "Terminados a las:" + Time$, vbInformation, "Aceptar"
    limpia
    isGenerando = False
    Command1.Enabled = True
    Label14.Visible = False
    ucBtnSkinClasificaciones.Enabled = True
    cmdSaveExit.Enabled = True
    cmdExit.Enabled = True
End Sub

Private Sub cmdDegenerar_Click()
    Dim r As Variant

    If ColaDeGeneracion.Count > 0 And Timer2.Enabled Then
        If cboEsp.ListIndex + 1 = ColaDeGeneracion(1).ixesp And cboNivel.ListIndex + 1 = ColaDeGeneracion(1).Nivel And cboPer.ListIndex + 1 = ColaDeGeneracion(1).ixper Then
            interface.MessageDlg "Generador", "No se puede deshacer el horario que se está generando", vbCritical, "Aceptar"
            Exit Sub
        End If
    End If
    r = interface.MessageDlg("Deshacer horario", "¿Está seguro que desea deshacer este horario?" & Chr(13) & Chr(13) & "Especialidad:" & cboEsp.List(cboEsp.ListIndex) & Chr(13) & "Nivel:" & cboNivel.List(cboEsp.ListIndex) & Chr(13) & "Período: " & cboPer.List(cboEsp.ListIndex), vbQuestion, "No", "Sí")
    If r = 2 Then ancora.degenerar cboEsp.ListIndex + 1, cboNivel.ListIndex + 1, cboPer.ListIndex + 1

End Sub

Private Sub Form_Activate()
    Dim i As Long
    Refrescar = True
End Sub

Private Sub Form_Load()
    interface.SkinFor Me
End Sub

Private Sub Form_Terminate()
    Detener = True
    Set ColaDeGeneracion = Nothing

End Sub

Private Sub Form_Unload(Cancel As Integer)   'descarga del formulario
    If isGenerando Then
        Cancel = 1
    End If

End Sub


Private Sub Timer2_Timer()   'se activa el timer
    labTime2.Caption = "" & Time

    statusBar.Caption = "Procesos en cola: " & ColaDeGeneracion.Count & " | Actividades rechazadas: " & ancora.IMPOSIBLES_NOW
    Label14.Visible = Not Label14.Visible
    Timer2.Enabled = True
    ProgressBar2.value = ancora.ProgresoDelGenerador
End Sub

Public Sub limpia()
    ProgressBar2.value = 1
    Timer2.Enabled = False
    labTime1.Caption = ""
    labTime2.Caption = ""
    Command1.Enabled = True
    Command4.Enabled = False
End Sub

Public Sub refreshCola()
    Dim i As Long
    If Refrescar Then
        With ListView2.ListItems
            .clear
            For i = 1 To ColaDeGeneracion.Count
                .add , , interface.getRS_Especialidad(ColaDeGeneracion(i).ixesp), 1, 1
                .Item(ListView2.ListItems.Count).ListSubItems.add , , "" & ColaDeGeneracion(i).Nivel
                .Item(ListView2.ListItems.Count).ListSubItems.add , , interface.getRS_Periodo(ColaDeGeneracion(i).ixper)
            Next
        End With
        statusBar.Caption = "Procesos en cola: " & ColaDeGeneracion.Count & kernel.strings.subcadena(statusBar.Caption, 2, "|")
    End If
End Sub

Private Sub ucBtnSkinClasificaciones_Click()
    interface.goKernelDatosClasificaciones
End Sub
