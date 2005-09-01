VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmReportesAsignaciones 
   Caption         =   "Asignaciones de actividades"
   ClientHeight    =   7185
   ClientLeft      =   165
   ClientTop       =   270
   ClientWidth     =   9960
   Icon            =   "ancora_goh_traditional_frmReportesAsignaciones.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   7185
   ScaleWidth      =   9960
   StartUpPosition =   2  'CenterScreen
   Visible         =   0   'False
   Begin VB.Frame frameOpciones 
      Height          =   735
      Left            =   120
      TabIndex        =   1
      Top             =   6360
      Width           =   9735
      Begin VB.CommandButton cmdCambios 
         Caption         =   "Cambios"
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
         TabIndex        =   6
         Top             =   240
         Width           =   1335
      End
      Begin VB.CommandButton cmdEliminarTodas 
         Caption         =   "Eliminar todas"
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
         Left            =   2880
         TabIndex        =   5
         Top             =   240
         Width           =   1695
      End
      Begin VB.CommandButton cmdGuardarTerminar 
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
         Left            =   4680
         TabIndex        =   4
         Top             =   240
         Width           =   1935
      End
      Begin VB.CommandButton cmdAyuda 
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
         Left            =   8160
         TabIndex        =   2
         Top             =   240
         Width           =   1335
      End
      Begin VB.CommandButton cmdTerminar 
         Caption         =   "Terminar"
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
         Left            =   6720
         TabIndex        =   3
         Top             =   240
         Width           =   1335
      End
   End
   Begin MSComctlLib.ImageList imgList 
      Left            =   9000
      Top             =   5040
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   16777215
      ImageWidth      =   16
      ImageHeight     =   16
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   5
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ancora_goh_traditional_frmReportesAsignaciones.frx":0252
            Key             =   ""
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ancora_goh_traditional_frmReportesAsignaciones.frx":0AE4
            Key             =   ""
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ancora_goh_traditional_frmReportesAsignaciones.frx":0DFE
            Key             =   ""
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ancora_goh_traditional_frmReportesAsignaciones.frx":1118
            Key             =   ""
         EndProperty
         BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ancora_goh_traditional_frmReportesAsignaciones.frx":1432
            Key             =   ""
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.ListView lvwDetail 
      Height          =   6015
      Left            =   120
      TabIndex        =   0
      ToolTipText     =   "Listado de todas las asignaciones de actividades (fijas y generadas)"
      Top             =   120
      Width           =   9735
      _ExtentX        =   17171
      _ExtentY        =   10610
      View            =   3
      LabelEdit       =   1
      LabelWrap       =   -1  'True
      HideSelection   =   0   'False
      FullRowSelect   =   -1  'True
      GridLines       =   -1  'True
      _Version        =   393217
      Icons           =   "imgList"
      SmallIcons      =   "imgList"
      ColHdrIcons     =   "imgList"
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      BorderStyle     =   1
      Appearance      =   1
      NumItems        =   11
      BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         Text            =   "Fecha de generación"
         Object.Width           =   2540
      EndProperty
      BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   1
         Text            =   "Hora de generación"
         Object.Width           =   2540
      EndProperty
      BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   2
         Text            =   "Brigada"
         Object.Width           =   2540
      EndProperty
      BeginProperty ColumnHeader(4) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   3
         Text            =   "Asignatura"
         Object.Width           =   2540
      EndProperty
      BeginProperty ColumnHeader(5) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   4
         Text            =   "Período"
         Object.Width           =   2540
      EndProperty
      BeginProperty ColumnHeader(6) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   5
         Text            =   "#Actividad"
         Object.Width           =   2540
      EndProperty
      BeginProperty ColumnHeader(7) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   6
         Text            =   "Clasif. Act"
         Object.Width           =   2540
      EndProperty
      BeginProperty ColumnHeader(8) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   7
         Text            =   "Profesor"
         Object.Width           =   2540
      EndProperty
      BeginProperty ColumnHeader(9) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   8
         Text            =   "Lugar"
         Object.Width           =   2540
      EndProperty
      BeginProperty ColumnHeader(10) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   9
         Text            =   "Dia"
         Object.Width           =   2540
      EndProperty
      BeginProperty ColumnHeader(11) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   10
         Text            =   "Turno"
         Object.Width           =   2540
      EndProperty
   End
End
Attribute VB_Name = "frmReportesAsignaciones"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"489BC1DE0084"
Option Explicit
'Form Asignaciones de Actividades, muestra todas las actividades generadas o fijadas

Dim termina As Boolean

Private Sub cmdAyuda_Click()
    interface.ShowHelp Name
End Sub

Private Sub cmdCambios_Click()
   Dim ii As Long, i As Long
   
   If Not lvwDetail.SelectedItem Is Nothing Then
        IDASIGNA_CAMBIANDO = lvwDetail.SelectedItem.Index
        frmDatosOpcionesAct.Show vbModal
        refresca
        
        If IDASIGNA_CAMBIANDO > ancora.cantAsignaciones Then ii = ancora.cantAsignaciones Else ii = IDASIGNA_CAMBIANDO
    
        For i = 1 To ancora.cantAsignaciones
            lvwDetail.ListItems(i).Selected = False
        Next
    
        If ii <> 0 Then
            lvwDetail.ListItems(ii).Selected = True
            lvwDetail.SelectedItem.EnsureVisible
            lvwDetail.SetFocus
        End If
    End If
End Sub

Private Sub cmdEliminarTodas_Click()
    Dim i As Long
    If interface.Question_Eliminar Then
        ancora.cantAsignaciones = 0
        interface.MessageDlg "Proceso terminado", "Asignaciones eliminadas satisfactoriamente", vbInformation, "Aceptar"
    End If
End Sub

Private Sub cmdGuardarTerminar_Click()
    ancora.GuardarTodo
    Hide
End Sub

Private Sub cmdTerminar_Click()
    Hide
End Sub

Private Sub Form_Load()
    interface.SkinFor Me
End Sub

Private Sub Form_Unload(Cancel As Integer)   'descarga del formulario
    termina = True
End Sub

Private Sub lvwDetail_DblClick()   'doble click en
    cmdCambios_Click
End Sub

Private Sub Form_Activate()
    Form_Resize
    If termina Then
        termina = False
        Hide
        Exit Sub
    End If
    
    If ancora.cantAsignaciones = 0 Then
        interface.MessageDlg "Asignaciones de actividades", "No se ha asignado actividades", vbInformation, "Aceptar"
        Hide
    End If
    refresca
    
End Sub

Private Sub Form_Resize()

    On Error Resume Next

    lvwDetail.Height = Height - frameOpciones.Height
    lvwDetail.Top = 60
    lvwDetail.Left = 0
    lvwDetail.Width = Width - 200
    frameOpciones.Top = Height - frameOpciones.Height - 500
    frameOpciones.Left = 0
    frameOpciones.Width = Width - 150
    cmdAyuda.Left = frameOpciones.Width - cmdAyuda.Width - 180
    cmdTerminar.Left = cmdAyuda.Left - cmdTerminar.Width - 100
    cmdGuardarTerminar.Left = cmdTerminar.Left - cmdGuardarTerminar.Width - 100
    cmdEliminarTodas.Left = cmdGuardarTerminar.Left - cmdEliminarTodas.Width - 100
    cmdCambios.Left = cmdEliminarTodas.Left - cmdCambios.Width - 100
    
End Sub

Public Function itemPos() As Long
    Dim i As Long

    For i = 1 To lvwDetail.ListItems.Count
        If lvwDetail.ListItems.Item(i).Selected Then
            itemPos = i
            Exit Function
        End If

    Next

End Function

Public Sub refresca()
    Dim iasig As Long, idesglose As Long, i As Long, j As Long
    

    With lvwDetail
        .ListItems.clear
        .Visible = False

        For i = 1 To ancora.cantAsignaciones
            interface.console.Progress "Trabajando...", kernel.utils.Porciento(i, ancora.cantAsignaciones)
            If termina Then Exit Sub
            DoEvents
            .ListItems.add
            refrescaitem i
        Next

        .Visible = True
    End With

    showCantidad


End Sub

Public Sub refrescaitem(i As Long)
    Dim iasig As Long, idesglose As Long, j As Long

    With frmReportesAsignaciones.lvwDetail
        .ListItems(i).Text = Asignaciones(i).fecha
        .ListItems(i).SmallIcon = 1
        .ListItems.Item(i).ListSubItems.clear
        .ListItems.Item(i).ListSubItems.add , , Asignaciones(i).hora
        .ListItems.Item(i).ListSubItems.add , , Asignaciones(i).idbrigada
        If Mid(Asignaciones(i).idbrigada, 1, 1) = "_" Then .ListItems.Item(i).ListSubItems(2).ReportIcon = 2
        .ListItems.Item(i).ListSubItems.add , , Asignaciones(i).idasig
        .ListItems.Item(i).ListSubItems.add , , Asignaciones(i).idperiodo
        .ListItems.Item(i).ListSubItems.add , , Asignaciones(i).idact
        .ListItems.Item(i).ListSubItems.add
        iasig = ancora.IndexById(dASIG, Asignaciones(i).idasig, 0)
        If iasig <> 0 Then
            idesglose = ancora.IndexById(dDESGLOSE, Asignaciones(i).idperiodo, iasig)
            .ListItems.Item(i).ListSubItems.Item(6) = asig(iasig).desglose(idesglose).act(Asignaciones(i).idact).idclasif
        End If

        .ListItems.Item(i).ListSubItems.add , , Asignaciones(i).idprofe
        If Mid(Asignaciones(i).idprofe, 1, 1) = "_" Then .ListItems.Item(i).ListSubItems(7).ReportIcon = 3
        .ListItems.Item(i).ListSubItems.add , , Asignaciones(i).idlugar
        If Mid(Asignaciones(i).idlugar, 1, 1) = "_" Then .ListItems.Item(i).ListSubItems(7).ReportIcon = 4
        .ListItems.Item(i).ListSubItems.add , , ancora.NombresDias(Asignaciones(i).dia).value
        .ListItems.Item(i).ListSubItems.add , , Asignaciones(i).turno
        If Asignaciones(i).fija Then
            .ListItems.Item(i).Bold = True
            .ListItems.Item(i).ForeColor = vbBlue
            .ListItems(i).Text = "[fija]"
            .ListItems(i).SmallIcon = 5

            For j = 1 To 11
                .ListItems.Item(i).ListSubItems(j).Bold = True
                .ListItems.Item(i).ListSubItems(j).ForeColor = vbBlue
            Next

        End If

    End With

End Sub

Public Sub showCantidad()
    frmKernelMain.labProgress.Caption = Str(ancora.cantAsignaciones) + " actividad(es) asignada(s)"
End Sub

