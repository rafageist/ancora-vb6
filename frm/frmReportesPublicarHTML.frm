VERSION 5.00
Object = "{90F3D7B3-92E7-44BA-B444-6A8E2A3BC375}#1.0#0"; "actskin4.ocx"
Object = "{8E27C92E-1264-101C-8A2F-040224009C02}#7.0#0"; "MSCAL.OCX"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "Mscomctl.ocx"
Begin VB.Form frmReportesPublicarHTML 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Generar sitio web para publicar los horarios"
   ClientHeight    =   8310
   ClientLeft      =   45
   ClientTop       =   390
   ClientWidth     =   8760
   Icon            =   "frmReportesPublicarHTML.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   8310
   ScaleWidth      =   8760
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.Frame framePrincipal 
      Height          =   6975
      Index           =   2
      Left            =   240
      TabIndex        =   19
      Top             =   480
      Visible         =   0   'False
      Width           =   8295
      Begin MSComctlLib.ListView lvwListaPeriodos 
         Height          =   5895
         Left            =   4200
         TabIndex        =   27
         Top             =   840
         Width           =   3255
         _ExtentX        =   5741
         _ExtentY        =   10398
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
            Text            =   "Perídos seleccionados"
            Object.Width           =   2540
         EndProperty
      End
      Begin ACTIVESKINLibCtl.SkinLabel labListaPeriodos 
         Height          =   375
         Left            =   4200
         OleObjectBlob   =   "frmReportesPublicarHTML.frx":000C
         TabIndex        =   26
         Top             =   360
         Width           =   3375
      End
      Begin ACTIVESKINLibCtl.SkinLabel labPeriodos 
         Height          =   375
         Left            =   120
         OleObjectBlob   =   "frmReportesPublicarHTML.frx":00F2
         TabIndex        =   25
         Top             =   360
         Width           =   2895
      End
      Begin VB.CommandButton cmdAbajoPeriodo 
         Caption         =   "v"
         Height          =   375
         Left            =   7560
         TabIndex        =   24
         ToolTipText     =   "Mover abajo"
         Top             =   3720
         Width           =   495
      End
      Begin VB.CommandButton cmdArribaPeriodo 
         Caption         =   "^"
         Height          =   375
         Left            =   7560
         TabIndex        =   23
         ToolTipText     =   "Mover arriba"
         Top             =   3240
         Width           =   495
      End
      Begin VB.CommandButton cmdQuitarPeriodo 
         Caption         =   "<"
         Height          =   375
         Left            =   3600
         TabIndex        =   22
         ToolTipText     =   "Eliminar período seleccionado en la derecha"
         Top             =   3720
         Width           =   495
      End
      Begin VB.CommandButton cmdAddPeriodo 
         Caption         =   ">"
         Height          =   375
         Left            =   3600
         TabIndex        =   21
         ToolTipText     =   "Agregar período seleccionado en la izquierda"
         Top             =   3240
         Width           =   495
      End
      Begin MSComctlLib.ListView lvwPeriodos 
         Height          =   5895
         Left            =   120
         TabIndex        =   20
         Top             =   840
         Width           =   3375
         _ExtentX        =   5953
         _ExtentY        =   10398
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
            Text            =   "Períodos"
            Object.Width           =   15875
         EndProperty
      End
   End
   Begin VB.Frame framePrincipal 
      Caption         =   "NO publicar los horarios de..."
      Height          =   6975
      Index           =   1
      Left            =   240
      TabIndex        =   8
      Top             =   480
      Width           =   8295
      Begin ACTIVESKINLibCtl.SkinLabel labProfesores 
         Height          =   255
         Left            =   4080
         OleObjectBlob   =   "frmReportesPublicarHTML.frx":01C4
         TabIndex        =   9
         Top             =   360
         Width           =   1095
      End
      Begin MSComctlLib.ListView lvwProfesores 
         Height          =   3015
         Left            =   4080
         TabIndex        =   10
         Top             =   600
         Width           =   4095
         _ExtentX        =   7223
         _ExtentY        =   5318
         View            =   3
         LabelEdit       =   1
         LabelWrap       =   -1  'True
         HideSelection   =   -1  'True
         Checkboxes      =   -1  'True
         FullRowSelect   =   -1  'True
         GridLines       =   -1  'True
         _Version        =   393217
         ForeColor       =   -2147483640
         BackColor       =   -2147483643
         BorderStyle     =   1
         Appearance      =   1
         NumItems        =   0
      End
      Begin MSComctlLib.ListView lvwBrigadas 
         Height          =   3015
         Left            =   120
         TabIndex        =   11
         Top             =   600
         Width           =   3855
         _ExtentX        =   6800
         _ExtentY        =   5318
         View            =   3
         LabelEdit       =   1
         LabelWrap       =   -1  'True
         HideSelection   =   -1  'True
         Checkboxes      =   -1  'True
         FullRowSelect   =   -1  'True
         GridLines       =   -1  'True
         _Version        =   393217
         ForeColor       =   -2147483640
         BackColor       =   -2147483643
         BorderStyle     =   1
         Appearance      =   1
         NumItems        =   0
      End
      Begin ACTIVESKINLibCtl.SkinLabel labBrigadas 
         Height          =   255
         Left            =   120
         OleObjectBlob   =   "frmReportesPublicarHTML.frx":0238
         TabIndex        =   12
         Top             =   360
         Width           =   1095
      End
      Begin MSComctlLib.ListView lvwLugares 
         Height          =   2895
         Left            =   120
         TabIndex        =   13
         Top             =   3960
         Width           =   3855
         _ExtentX        =   6800
         _ExtentY        =   5106
         View            =   3
         LabelEdit       =   1
         LabelWrap       =   -1  'True
         HideSelection   =   -1  'True
         Checkboxes      =   -1  'True
         FullRowSelect   =   -1  'True
         GridLines       =   -1  'True
         _Version        =   393217
         ForeColor       =   -2147483640
         BackColor       =   -2147483643
         BorderStyle     =   1
         Appearance      =   1
         NumItems        =   0
      End
      Begin ACTIVESKINLibCtl.SkinLabel labLugares 
         Height          =   255
         Left            =   120
         OleObjectBlob   =   "frmReportesPublicarHTML.frx":02A8
         TabIndex        =   14
         Top             =   3720
         Width           =   1095
      End
      Begin MSComctlLib.ListView lvwRecursos 
         Height          =   2895
         Left            =   4080
         TabIndex        =   15
         Top             =   3960
         Width           =   4095
         _ExtentX        =   7223
         _ExtentY        =   5106
         LabelEdit       =   1
         LabelWrap       =   -1  'True
         HideSelection   =   -1  'True
         Checkboxes      =   -1  'True
         FullRowSelect   =   -1  'True
         GridLines       =   -1  'True
         _Version        =   393217
         ForeColor       =   -2147483640
         BackColor       =   -2147483643
         BorderStyle     =   1
         Appearance      =   1
         NumItems        =   0
      End
      Begin ACTIVESKINLibCtl.SkinLabel SkinLabel3 
         Height          =   255
         Left            =   4080
         OleObjectBlob   =   "frmReportesPublicarHTML.frx":0316
         TabIndex        =   16
         Top             =   3720
         Width           =   1095
      End
   End
   Begin VB.Frame framePrincipal 
      Height          =   6975
      Index           =   0
      Left            =   240
      TabIndex        =   2
      Top             =   480
      Width           =   8295
      Begin ACTIVESKINLibCtl.SkinLabel SkinLabel2 
         Height          =   255
         Left            =   3360
         OleObjectBlob   =   "frmReportesPublicarHTML.frx":0386
         TabIndex        =   18
         Top             =   1080
         Width           =   3375
      End
      Begin MSACAL.Calendar calendario 
         Height          =   2895
         Left            =   3240
         TabIndex        =   17
         Top             =   1440
         Width           =   4815
         _Version        =   524288
         _ExtentX        =   8493
         _ExtentY        =   5106
         _StockProps     =   1
         BackColor       =   -2147483633
         Year            =   2009
         Month           =   1
         Day             =   9
         DayLength       =   1
         MonthLength     =   1
         DayFontColor    =   0
         FirstDay        =   1
         GridCellEffect  =   1
         GridFontColor   =   10485760
         GridLinesColor  =   -2147483632
         ShowDateSelectors=   -1  'True
         ShowDays        =   -1  'True
         ShowHorizontalGrid=   -1  'True
         ShowTitle       =   -1  'True
         ShowVerticalGrid=   -1  'True
         TitleFontColor  =   10485760
         ValueIsNull     =   0   'False
         BeginProperty DayFont {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         BeginProperty GridFont {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         BeginProperty TitleFont {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   12
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
      End
      Begin VB.TextBox txtTitulo 
         Height          =   375
         Left            =   3240
         TabIndex        =   6
         Top             =   600
         Width           =   4815
      End
      Begin VB.DirListBox carpeta 
         Height          =   5715
         Left            =   120
         TabIndex        =   5
         Top             =   1080
         Width           =   3015
      End
      Begin VB.DriveListBox disco 
         Height          =   315
         Left            =   120
         TabIndex        =   4
         Top             =   600
         Width           =   3015
      End
      Begin ACTIVESKINLibCtl.SkinLabel labCarpeta 
         Height          =   375
         Left            =   120
         OleObjectBlob   =   "frmReportesPublicarHTML.frx":042C
         TabIndex        =   3
         Top             =   240
         Width           =   3015
      End
      Begin ACTIVESKINLibCtl.SkinLabel SkinLabel1 
         Height          =   255
         Left            =   3240
         OleObjectBlob   =   "frmReportesPublicarHTML.frx":04CC
         TabIndex        =   7
         Top             =   240
         Width           =   1215
      End
   End
   Begin MSComctlLib.ImageList iml 
      Left            =   4320
      Top             =   7680
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   16
      ImageHeight     =   16
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   5
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmReportesPublicarHTML.frx":054C
            Key             =   ""
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmReportesPublicarHTML.frx":0CB2
            Key             =   ""
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmReportesPublicarHTML.frx":1104
            Key             =   ""
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmReportesPublicarHTML.frx":1556
            Key             =   ""
         EndProperty
         BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmReportesPublicarHTML.frx":1B6C
            Key             =   ""
         EndProperty
      EndProperty
   End
   Begin VB.CommandButton cmdTerminar 
      Caption         =   "Terminar"
      Height          =   375
      Left            =   7200
      TabIndex        =   1
      Top             =   7800
      Width           =   1335
   End
   Begin VB.CommandButton cmdGenerar 
      Caption         =   "Generar sitio web"
      Height          =   375
      Left            =   5160
      TabIndex        =   0
      Top             =   7800
      Width           =   1815
   End
   Begin MSComctlLib.TabStrip tabStripPrincipal 
      Height          =   7575
      Left            =   120
      TabIndex        =   28
      Top             =   120
      Width           =   8535
      _ExtentX        =   15055
      _ExtentY        =   13361
      _Version        =   393216
      BeginProperty Tabs {1EFB6598-857C-11D1-B16A-00C0F0283628} 
         NumTabs         =   3
         BeginProperty Tab1 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            Caption         =   "Generales"
            ImageVarType    =   2
         EndProperty
         BeginProperty Tab2 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            Caption         =   "Objetos"
            ImageVarType    =   2
         EndProperty
         BeginProperty Tab3 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            Caption         =   "Períodos"
            ImageVarType    =   2
         EndProperty
      EndProperty
   End
   Begin VB.Line Line2 
      BorderColor     =   &H80000010&
      X1              =   -480
      X2              =   8518
      Y1              =   7680
      Y2              =   7680
   End
   Begin VB.Line Line1 
      BorderColor     =   &H00FFFFFF&
      X1              =   -480
      X2              =   8518
      Y1              =   7695
      Y2              =   7695
   End
End
Attribute VB_Name = "frmReportesPublicarHTML"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim pers() As String
Dim cantpers As Long

Private Sub cmdAbajoPeriodo_Click()
    If Not lvwListaPeriodos.SelectedItem Is Nothing Then
        Dim ix As Long
        ix = lvwListaPeriodos.SelectedItem.index
        If ix < cantpers Then
            Dim temp As String
            temp = pers(ix)
            pers(ix) = pers(ix + 1)
            pers(ix + 1) = temp
            RefrescaPeriodosSeleccionados
        End If
    End If
End Sub

Private Sub cmdaddPeriodo_Click()
    If Not lvwPeriodos.SelectedItem Is Nothing Then
        cantpers = cantpers + 1
        ReDim Preserve pers(cantpers)
        pers(cantpers) = ancora.periodos(lvwPeriodos.SelectedItem.index).id
        RefrescaPeriodosSeleccionados
    End If
End Sub

Private Sub cmdArribaPeriodo_Click()
    If Not lvwListaPeriodos.SelectedItem Is Nothing Then
        Dim ix As Long
        ix = lvwListaPeriodos.SelectedItem.index
        If ix > 1 Then
            Dim temp As String
            temp = pers(ix)
            pers(ix) = pers(ix - 1)
            pers(ix - 1) = temp
            RefrescaPeriodosSeleccionados
        End If
    End If
End Sub

Private Sub cmdGenerar_Click()
    Dim idbrgs() As Long, idprofes() As Long, idlugs() As Long, idrecurs() As Long
    Dim cantidbrgs As Long, cantidprofes As Long, cantidlugs As Long, cantidrecurs As Long
    
    Dim i As Long
    
    If Trim(txtTitulo.Text) = "" Then
        interface.MessageDlg "Faltan datos por introducir", "Ponga un título a la publicación", vbCritical, "Aceptar"
        tabStripPrincipal.Tabs(1).Selected = True
        tabStripPrincipal_Click
        txtTitulo.SetFocus
        Exit Sub
    End If
    
    If cantpers = 0 Then
        interface.MessageDlg "Faltan datos por introducir", "Establezca al menos un período a mostrar en los horarios", vbCritical, "Aceptar"
        tabStripPrincipal.Tabs(3).Selected = True
        tabStripPrincipal_Click
        Exit Sub
    End If
    
    cantidbrgs = 0
    cantidlugs = 0
    cantidprofes = 0
    cantidrecurs = 0
    For i = 1 To ancora.cantBrg
        If Not lvwBrigadas.ListItems(i).Checked Then
            cantidbrgs = cantidbrgs + 1
            ReDim Preserve idbrgs(cantidbrgs)
            idbrgs(cantidbrgs) = i
        End If
    Next
    For i = 1 To ancora.cantProfe
        If Not lvwProfesores.ListItems(i).Checked Then
            cantidprofes = cantidprofes + 1
            ReDim Preserve idprofes(cantidprofes)
            idprofes(cantidprofes) = i
        End If
    Next
    For i = 1 To ancora.cantLug
        If Not lvwLugares.ListItems(i).Checked Then
            cantidlugs = cantidlugs + 1
            ReDim Preserve idlugs(cantidlugs)
            idlugs(cantidlugs) = i
        End If
    Next
    For i = 1 To ancora.recursos.Count
        If Not lvwRecursos.ListItems(i).Checked Then
            cantidrecurs = cantidrecurs + 1
            ReDim Preserve idrecurs(cantidrecurs)
            idrecurs(cantidrecurs) = i
        End If
    Next
    If cantidbrgs = 0 And cantidlugs = 0 And cantidprofes = 0 And cantidrecurs = 0 Then
        interface.MessageDlg "Faltan datos por introducir", "Establezca al menos un objeto (brigada,profesor,lugar o recurso) para publicar sus horarios", vbCritical, "Aceptar"
        tabStripPrincipal.Tabs(2).Selected = True
        tabStripPrincipal_Click
        Exit Sub
    End If
    reports.CreateHTMLSchedulePublish carpeta.path, txtTitulo.Text, pers, cantpers, calendario.Day, calendario.Month, calendario.Year, idbrgs, cantidbrgs, idprofes, cantidprofes, idlugs, cantidlugs, idrecurs, cantidrecurs
    interface.MessageDlg "Publicación terminada", "Publicación terminada con éxito. Para ver la publicación, abra el archivo index.html, que se encuentra en la carpeta que seleccionó en la ficha Generales, con un navegador web (Ejemplo: Internet Explorer, Firefox, Opera).", vbInformation, "Aceptar"
End Sub


Private Sub cmdQuitarPeriodo_Click()
    If Not lvwListaPeriodos.SelectedItem Is Nothing Then
        Dim i As Long
        For i = lvwListaPeriodos.SelectedItem.index To cantpers - 1
            pers(i) = pers(i + 1)
        Next
        cantpers = cantpers - 1
        ReDim Preserve pers(cantpers)
        RefrescaPeriodosSeleccionados
    End If
End Sub

Private Sub cmdTerminar_Click()
    Hide
End Sub

Private Sub disco_Change()
    On Error GoTo errdep
    carpeta.path = disco.Drive
finish:
    Exit Sub
errdep:
    interface.MessageDlg "Dispositivo no disponible", "Dispositivo no disponible", vbCritical, "Aceptar"
    Resume finish
End Sub

Private Sub Form_Load()
    interface.SkinFor Me
    
    With lvwBrigadas
        .Icons = iml
        .SmallIcons = iml
    End With
    
    With lvwProfesores
        .Icons = iml
        .SmallIcons = iml
    End With
    
    With lvwLugares
        .Icons = iml
        .SmallIcons = iml
    End With
    
    With lvwRecursos
        .Icons = iml
        .SmallIcons = iml
    End With
    
    With lvwPeriodos
        .Icons = iml
        .SmallIcons = iml
    End With
    
    With lvwListaPeriodos
        .Icons = iml
        .SmallIcons = iml
    End With
    
    interface.fillLvwBrigadas lvwBrigadas, 1
    interface.fillLvwProfe lvwProfesores, 2
    interface.fillLvwLugar lvwLugares, 3
    interface.fillLvwRecurso lvwRecursos, 4
    interface.fillLvwPeriodo lvwPeriodos, 5
    
    cantpers = 0
    OcultarFramesPrincipal
    
    tabStripPrincipal.Tabs(1).Selected = True
    
End Sub

Private Sub tabStripPrincipal_Click()
    If Not tabStripPrincipal.SelectedItem Is Nothing Then
        OcultarFramesPrincipal
        framePrincipal(tabStripPrincipal.SelectedItem.index - 1).Visible = True
    End If
End Sub

Sub OcultarFramesPrincipal()
    Dim i As Long
    For i = 1 To framePrincipal.Count
        framePrincipal(i - 1).Visible = False
    Next
End Sub
Sub RefrescaPeriodosSeleccionados()
   
    
    Dim i As Long
    
    For i = 1 To cantpers
        lvwListaPeriodos.ListItems.add , , interface.getRS_Periodo(0, pers(i)), , 5
    Next
End Sub
