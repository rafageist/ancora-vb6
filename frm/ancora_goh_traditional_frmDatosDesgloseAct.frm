VERSION 5.00
Object = "{90F3D7B3-92E7-44BA-B444-6A8E2A3BC375}#1.0#0"; "actskin4.ocx"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "Mscomctl.ocx"
Begin VB.Form frmDatosDesgloseAct 
   Caption         =   "Desglose de actividades por períodos"
   ClientHeight    =   9225
   ClientLeft      =   255
   ClientTop       =   2265
   ClientWidth     =   12690
   Icon            =   "ancora_goh_traditional_frmDatosDesgloseAct.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   9225
   ScaleWidth      =   12690
   StartUpPosition =   2  'CenterScreen
   Visible         =   0   'False
   Begin VB.Frame frameOpciones 
      Height          =   735
      Left            =   120
      TabIndex        =   15
      Top             =   8400
      Width           =   12495
      Begin VB.CommandButton cmdGuardarTerminar 
         Caption         =   "Guardar y terminar"
         Height          =   375
         Left            =   8280
         TabIndex        =   16
         Top             =   240
         Width           =   1935
      End
      Begin VB.CommandButton cmdTerminar 
         Caption         =   "Terminar sin guardar"
         Height          =   375
         Left            =   10320
         TabIndex        =   17
         Top             =   240
         Width           =   2055
      End
   End
   Begin VB.Frame frameDatos 
      Caption         =   "Desglose"
      DragMode        =   1  'Automatic
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   3015
      Left            =   120
      TabIndex        =   1
      Top             =   5280
      Width           =   12495
      Begin VB.CheckBox chkRespetaOrden 
         Caption         =   "Respetar orden de actividades"
         Height          =   255
         Left            =   9000
         TabIndex        =   23
         Top             =   2520
         Width           =   2655
      End
      Begin VB.CheckBox chkMismodia 
         Caption         =   "Permitir más de una actividad el mismo día"
         Height          =   255
         Left            =   5040
         TabIndex        =   22
         Top             =   2520
         Width           =   3375
      End
      Begin VB.ListBox lstActivities 
         Height          =   1425
         Left            =   840
         TabIndex        =   21
         Top             =   1200
         Width           =   3375
      End
      Begin VB.Frame frameDiasEntreAct 
         Caption         =   "Días entre actividades"
         Height          =   1455
         Left            =   10320
         TabIndex        =   18
         Top             =   240
         Width           =   2055
         Begin ACTIVESKINLibCtl.SkinLabel labMinimo 
            Height          =   255
            Left            =   240
            OleObjectBlob   =   "ancora_goh_traditional_frmDatosDesgloseAct.frx":0442
            TabIndex        =   24
            Top             =   360
            Width           =   855
         End
         Begin VB.TextBox txtMaximo 
            Height          =   375
            Left            =   1080
            MaxLength       =   1
            TabIndex        =   20
            Top             =   840
            Width           =   615
         End
         Begin VB.TextBox txtMinimo 
            Height          =   375
            Left            =   1080
            MaxLength       =   1
            TabIndex        =   19
            Top             =   360
            Width           =   615
         End
         Begin ACTIVESKINLibCtl.SkinLabel labMaximo 
            Height          =   255
            Left            =   240
            OleObjectBlob   =   "ancora_goh_traditional_frmDatosDesgloseAct.frx":04AC
            TabIndex        =   25
            Top             =   840
            Width           =   615
         End
      End
      Begin VB.CommandButton cmdAdd 
         Caption         =   ">"
         Height          =   375
         Left            =   120
         TabIndex        =   11
         Top             =   1560
         Width           =   495
      End
      Begin VB.ComboBox lstClasif 
         Height          =   315
         Left            =   120
         Style           =   2  'Dropdown List
         TabIndex        =   10
         Top             =   600
         Width           =   4815
      End
      Begin VB.Frame frameGruposXClasifs 
         Caption         =   "Grupos por clasificación de esta actividad"
         Height          =   2055
         Left            =   5040
         TabIndex        =   3
         Top             =   240
         Width           =   5175
         Begin VB.ListBox lstGC 
            Height          =   1620
            Left            =   120
            TabIndex        =   4
            Top             =   240
            Width           =   4935
         End
      End
      Begin VB.CommandButton cmdDel 
         Caption         =   "<"
         Height          =   375
         Left            =   120
         TabIndex        =   12
         Top             =   2040
         Width           =   495
      End
      Begin VB.CommandButton cmdUp 
         Caption         =   "^"
         Height          =   375
         Left            =   4320
         TabIndex        =   13
         Top             =   1560
         Width           =   495
      End
      Begin VB.CommandButton cmdDown 
         Caption         =   "v"
         Height          =   375
         Left            =   4320
         TabIndex        =   14
         Top             =   2040
         Width           =   495
      End
      Begin VB.Label labClasifs 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Clasificaciones de actividades"
         Height          =   195
         Left            =   120
         TabIndex        =   5
         Top             =   360
         Width           =   2130
      End
      Begin VB.Label labActivities 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Actividades"
         Height          =   195
         Left            =   720
         TabIndex        =   2
         Top             =   960
         Width           =   825
      End
   End
   Begin VB.PictureBox picSplitter 
      BackColor       =   &H00404040&
      BorderStyle     =   0  'None
      FillColor       =   &H00808080&
      Height          =   5040
      Left            =   3000
      MousePointer    =   9  'Size W E
      ScaleHeight     =   2194.632
      ScaleMode       =   0  'User
      ScaleWidth      =   1404
      TabIndex        =   7
      Top             =   240
      Visible         =   0   'False
      Width           =   135
   End
   Begin MSComctlLib.ImageList imgDesgloses 
      Left            =   8640
      Top             =   360
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   16
      ImageHeight     =   16
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   4
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ancora_goh_traditional_frmDatosDesgloseAct.frx":0516
            Key             =   ""
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ancora_goh_traditional_frmDatosDesgloseAct.frx":0968
            Key             =   ""
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ancora_goh_traditional_frmDatosDesgloseAct.frx":0FB7
            Key             =   ""
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ancora_goh_traditional_frmDatosDesgloseAct.frx":1409
            Key             =   ""
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.TreeView tvwDesgloses 
      Height          =   5055
      Left            =   120
      TabIndex        =   6
      Top             =   240
      Width           =   2895
      _ExtentX        =   5106
      _ExtentY        =   8916
      _Version        =   393217
      HideSelection   =   0   'False
      LabelEdit       =   1
      LineStyle       =   1
      Sorted          =   -1  'True
      Style           =   7
      Appearance      =   1
   End
   Begin MSComctlLib.ListView lstDesglose 
      Height          =   5055
      Left            =   3120
      TabIndex        =   0
      Top             =   240
      Width           =   9495
      _ExtentX        =   16748
      _ExtentY        =   8916
      View            =   3
      LabelEdit       =   1
      LabelWrap       =   -1  'True
      HideSelection   =   0   'False
      FullRowSelect   =   -1  'True
      GridLines       =   -1  'True
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
      NumItems        =   6
      BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         Text            =   "Asignatura"
         Object.Width           =   8819
      EndProperty
      BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   1
         Text            =   "1"
         Object.Width           =   1235
      EndProperty
      BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   2
         Text            =   "2"
         Object.Width           =   1235
      EndProperty
      BeginProperty ColumnHeader(4) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   3
         Text            =   "3"
         Object.Width           =   1235
      EndProperty
      BeginProperty ColumnHeader(5) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   4
         Text            =   "4"
         Object.Width           =   1235
      EndProperty
      BeginProperty ColumnHeader(6) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   5
         Text            =   "5"
         Object.Width           =   1235
      EndProperty
   End
   Begin VB.Label labExplorador 
      BackStyle       =   0  'Transparent
      Caption         =   "Desgloses"
      Height          =   255
      Left            =   0
      TabIndex        =   9
      Top             =   0
      Width           =   2895
   End
   Begin VB.Label labDesgloses 
      BackStyle       =   0  'Transparent
      Caption         =   "Asignaturas"
      Height          =   255
      Left            =   3000
      TabIndex        =   8
      Top             =   0
      Width           =   9495
   End
   Begin VB.Image imgSplitter 
      Height          =   4995
      Left            =   2880
      MousePointer    =   9  'Size W E
      Top             =   240
      Width           =   105
   End
End
Attribute VB_Name = "frmDatosDesgloseAct"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"489BC1CE0302"
Option Explicit

'Form Desgloses

'<!- ATRIBUTOS !->

    Private refre As Boolean
    Private id_asig As Long
    Private id_desglose As Long
    Private id_per As Long
    Private mostrandoAsigs() As Long
    Private cantMostrandoAsigs As Long
    Public resultbutton As Integer
    Private mbMoving As Long
    Private mostrandoGrupos() As Long
    Public cantMostrandoGrupos As Long

'<!- EVENTOS !->
    
    Private Sub chkMismodia_Click()
        If Not refre Then
            asig(id_asig).desglose(id_desglose).mismodia = (chkMismodia.value = 1)
        End If
    End Sub
    
    Private Sub chkRespetaOrden_Click()
        If Not refre Then asig(id_asig).desglose(id_desglose).RespetarOrden = (chkRespetaOrden.value = 1)
        chkMismodia.Enabled = Not chkRespetaOrden.value = 1
        chkMismodia.value = IIf(chkMismodia.Enabled, chkMismodia.value, 0)
    End Sub
    
    Private Sub cmdGuardarTerminar_Click()
        resultbutton = 1
        Hide
    End Sub
    
    Private Sub cmdTerminar_Click()
        resultbutton = 2
        Hide
    End Sub
    
    Private Sub Form_Load()
        interface.SkinFor Me
    End Sub
    
    Private Sub tvwDesgloses_NodeClick(ByVal Node As MSComctlLib.Node)
        Dim nod As String
        nod = Node.key
        If kernel.strings.subcadena(nod, 1, "_") = "per" Then
            id_per = ancora.IndexById(dPERIODO, kernel.strings.subcadena(nod, 2, "_"), 0)
            refresca kernel.strings.subcadena(nod, 4, "_"), Val(kernel.strings.subcadena(nod, 5, "_"))
            If lstDesglose.ListItems.Count > 0 Then
                lstDesglose.ListItems(1).Selected = True
                id_desglose = ancora.IndexById(dDESGLOSE, ancora.periodos(id_per).id, id_asig)
            End If
        End If
        frameDatos.Visible = False
        Form_Resize
    End Sub

    Private Sub lstActivities_Click()
        refrescaLstGC
    End Sub


    Private Sub cmdAdd_Click()
        If sePuedeTocar And lstDesglose.SelectedItem.index > 0 Then
            id_desglose = ancora.IndexById(dDESGLOSE, ancora.periodos(id_per).id, id_asig)
            If asig(id_asig).desglose(id_desglose).cantact < MAX_ACT Then
                asig(id_asig).desglose(id_desglose).cantact = asig(id_asig).desglose(id_desglose).cantact + 1
                asig(id_asig).desglose(id_desglose).act(asig(id_asig).desglose(id_desglose).cantact).idclasif = clasif(lstClasif.ListIndex + 1).comun.id
                refrescalstActivities
                refrescaLstGC
                refrescaitem (lstDesglose.SelectedItem.index)
                lstActivities.ListIndex = lstActivities.ListCount - 1
            Else
                interface.MessageDlg "No se puede agregar", "No se pueden introducir más actividades para esta asignatura en este período", vbInformation, "Aceptar"
            End If
    
        End If
    
    End Sub

    Private Sub cmdDel_Click()
        Dim r As Variant, i As Long
        If sePuedeTocar Then
            Beep
            Beep
            Beep
            r = interface.MessageDlg("!Atento antes de Eliminar!", "Lo que usted intenta hacer no podrá deshacerse a menos que cierre la " & Chr(13) & Chr(10) & "aplicación sin guardar los cambios, " & Chr(13) & Chr(10) & "lo que incluye salir de esta ventana de la misma forma. " & Chr(13) & Chr(10) & _
            Chr(13) & Chr(10) & "Eliminar una actividad del desglose significa:" & Chr(13) & Chr(10) & _
            "1. Eliminar todos sus recursos asignados" & Chr(13) & Chr(10) & _
            "2. Eliminar todas sus asignaciones (horarios)" & Chr(13) & Chr(10) & _
            "¿Está seguro que desea eliminar?", vbQuestion, "No", "Sí")
            If r = 2 Then
                If lstActivities.ListIndex >= 0 Then
                    ancora.deleteActivityFromDesglose id_asig, id_desglose, lstActivities.ListIndex + 1
                    refrescalstActivities
                End If
            End If
        End If
    
    End Sub

    Private Sub cmdDown_Click()
        Dim i As Long, c As Long, r As Variant
        If sePuedeTocar Then
            r = interface.MessageDlg("!Atento antes de continuar!", "Lo que usted intenta hacer no podrá deshacerse a menos que haga la operación inversa. " & Chr(13) & Chr(10) & _
            Chr(13) & Chr(10) & "Cambiar el orden de las actividades en el desglose NO cambia el orden en que se encuentran en el horario." & Chr(13) & Chr(10) & _
            "¿Está seguro que desea alterar el orden?", vbInformation, "No", "Sí")
            If r = 2 Then
                i = lstActivities.ListIndex
                c = lstActivities.ListCount
                If i < c - 1 Then
                    intercambia i + 1, i + 2
                    refrescalstActivities
                    refrescaLstGC
                    lstActivities.ListIndex = i + 1
                    refrescaitem lstDesglose.SelectedItem.index
                End If
            End If
        End If
    
    End Sub

    

    Private Sub cmdUp_Click()
        Dim i As Long, r As Long
        If sePuedeTocar Then
            r = interface.MessageDlg("!Atento antes de continuar!", "Lo que usted intenta hacer no podrá deshacerse a menos que haga la operación inversa. " & Chr(13) & Chr(10) & _
            Chr(13) & Chr(10) & "Cambiar el orden de las actividades en el desglose NO cambia el orden en que se encuentran en el horario." & Chr(13) & Chr(10) & _
            "¿Está seguro que desea alterar el orden?", vbQuestion, "No", "Sí")
            If r = 2 Then
    
                i = lstActivities.ListIndex
                If i > 0 Then
                    intercambia i + 1, i
                    refrescalstActivities
                    refrescaLstGC
                    lstActivities.ListIndex = i - 1
                    refrescaitem lstDesglose.SelectedItem.index
                End If
            End If
        End If
    
    End Sub

    Private Sub Form_Activate()
        Dim i As Long, msg As String
        
        frameDatos.Visible = False
        Form_Resize
        
        lstDesglose.SmallIcons = imgDesgloses
        lstDesglose.Icons = imgDesgloses
        
        
        ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
        'Comprobando que exista la información de dependencia
        ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
            msg = ""
            If ancora.periodos.Count = 0 Then msg = "No se ha introducido períodos"
            If ancora.cantAsig = 0 Then msg = "No se ha introducido asignaturas"
            If ancora.cantClasif = 0 Then msg = "No se ha introducido clasificaciones"
            
            If msg <> "" Then
                interface.MessageDlg "Imposible continuar", msg, vbExclamation, "Aceptar"
                Hide
                Exit Sub
            End If
        '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
        
        FillTvwDesgloses
        refre = True
        interface.fillCboClasif lstClasif
        lstClasif.ListIndex = 0
        If id_per = 0 Then id_per = 1
        refre = False
    End Sub
    
    Private Sub Form_Resize()
    
        On Error Resume Next
    
        labExplorador.Left = 0
        labExplorador.Top = 0
        tvwDesgloses.Left = 0
        tvwDesgloses.Top = labExplorador.Top + labExplorador.Height
        lstDesglose.Top = tvwDesgloses.Top
        lstDesglose.Left = tvwDesgloses.Left + tvwDesgloses.Width + imgSplitter.Width
        lstDesglose.Width = Width - 100 - tvwDesgloses.Width - tvwDesgloses.Left
        tvwDesgloses.Height = Height - tvwDesgloses.Top - frameOpciones.Height - 500
        labExplorador.Width = tvwDesgloses.Width
        labDesgloses.Left = labExplorador.Left + labExplorador.Width + imgSplitter.Width
        lstDesglose.Height = tvwDesgloses.Height
        imgSplitter.Top = labExplorador.Top + labExplorador.Height
        imgSplitter.Left = tvwDesgloses.Left + tvwDesgloses.Width
        imgSplitter.Height = tvwDesgloses.Height
        picSplitter.Left = imgSplitter.Left
        picSplitter.Height = imgSplitter.Height
        picSplitter.Top = imgSplitter.Top
        tvwDesgloses.Height = lstDesglose.Height
        SizeControls picSplitter.Left
        If frameDatos.Visible Then
            frameDatos.Left = 0
            frameDatos.Width = Width - 200
            tvwDesgloses.Height = tvwDesgloses.Height - frameDatos.Height
            lstDesglose.Height = lstDesglose.Height - frameDatos.Height
            imgSplitter.Height = imgSplitter.Height - frameDatos.Height
            picSplitter.Height = picSplitter.Height - frameDatos.Height
            frameDatos.Top = tvwDesgloses.Height + tvwDesgloses.Top
        End If
        frameOpciones.Top = Height - frameOpciones.Height - 500
        frameOpciones.Width = Width - 200
        frameOpciones.Left = 0
        cmdTerminar.Left = frameOpciones.Width - cmdTerminar.Width - 180
        cmdGuardarTerminar.Left = cmdTerminar.Left - cmdGuardarTerminar.Width - 100
    
    End Sub
    
    Private Sub lstDesglose_ItemClick(ByVal Item As MSComctlLib.ListItem)
        id_asig = mostrandoAsigs(lstDesglose.SelectedItem.index)
        id_desglose = ancora.IndexById(dDESGLOSE, ancora.periodos(id_per).id, id_asig)
        refrescalstActivities
        refrescaLstGC
        refrescaPropiedades
        lstDesglose.SelectedItem.EnsureVisible
        frameDatos.Visible = True
        Form_Resize
    End Sub

    Private Sub imgSplitter_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
    
        With imgSplitter
            picSplitter.Move .Left, .Top, .Width \ 2, .Height - 20
        End With
    
        picSplitter.Visible = True
        mbMoving = True
    End Sub
    
    Private Sub imgSplitter_MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)
        Dim sglPos As Single, sglSplitLimit As Long
        
        sglSplitLimit = 500
        
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
    End Sub
    
    Private Sub tvwDesgloses_DragDrop(Source As Control, x As Single, y As Single)
        If Source = imgSplitter Then SizeControls x
    End Sub
    
    Private Sub txtMaximo_Change()
        If Not refre Then asig(id_asig).desglose(id_desglose).max = Val(txtMaximo.Text)
    End Sub
    
    Private Sub txtMinimo_Change()
        If Not refre Then asig(id_asig).desglose(id_desglose).min = Val(txtMinimo.Text)
    End Sub
    
    Private Sub txtMinimo_KeyPress(KeyAscii As Integer)
        If KeyAscii < Asc("1") Or KeyAscii > Asc("9") Then KeyAscii = 0
    End Sub
    
    Private Sub txtMaximo_KeyPress(KeyAscii As Integer)
        If KeyAscii < Asc("1") Or KeyAscii > Asc("9") Then KeyAscii = 0
    End Sub

'<!- METODOS -!>
    
    Public Sub intercambia(id1 As Long, id2 As Long)
        id_desglose = ancora.IndexById(dDESGLOSE, ancora.periodos(id_per).id, id_asig)
        ancora.swapActivityFromDesglose id_asig, id_desglose, id1, id2
        lstActivities.ListIndex = id2 - 1
    End Sub
    
    Public Sub refresca(esp As String, Nivel As Long)
        Dim grupos() As Long, cant As Long, id As Long, i As Long
        ReDim grupos(ancora.getCantBrg)
        If ancora.cantAsig = 0 Then Exit Sub
        refre = True
        lstDesglose.ListItems.clear
    
        cantMostrandoAsigs = 0
    
        For i = 1 To ancora.cantAsig
            If kernel.utils.idigual(asig(i).idesp, esp) And asig(i).Nivel = Nivel Then
                cantMostrandoAsigs = cantMostrandoAsigs + 1
                ReDim Preserve mostrandoAsigs(cantMostrandoAsigs)
                mostrandoAsigs(cantMostrandoAsigs) = i
                lstDesglose.ListItems.add
                Dim ii As Long
                ii = cantMostrandoAsigs
                refrescaitem ii
            End If
    
        Next
    
        If id_asig = 0 Or id_asig > ancora.cantAsig Then id_asig = 1
    
        refrescalstActivities
        refrescaLstGC
        refre = False
    End Sub

    Public Sub refrescaitem(i As Long)
        On Error Resume Next
        Dim j As Long
        id_desglose = ancora.IndexById(dDESGLOSE, ancora.periodos(id_per).id, i)
        lstDesglose.ListItems(i).Text = "(" & kernel.utils.trunca(asig(mostrandoAsigs(i)).comun.id) & ") " & kernel.utils.trunca(asig(mostrandoAsigs(i)).comun.descrip)
        lstDesglose.ListItems(i).SmallIcon = 3
        lstDesglose.ListItems(i).ListSubItems.clear
    
        For j = 1 To asig(mostrandoAsigs(i)).desglose(id_desglose).cantact
            lstDesglose.ListItems(i).ListSubItems.add
            Dim ic As Long
            ic = ancora.IndexById(dCLASIF, asig(mostrandoAsigs(i)).desglose(id_desglose).act(j).idclasif, 0)
            lstDesglose.ListItems(i).ListSubItems(j).Text = "(" & kernel.utils.trunca(clasif(ic).comun.id) & ") " & kernel.utils.trunca(clasif(ic).comun.descrip)
        Next
    
        'lstDesglose.ListItems(i).EnsureVisible
    End Sub
    
    Public Sub refrescaLstGC()
        Dim grupo As TFiltro, a As String
        Dim esp As Long, iclasif As Long, Nivel As Long
        Dim lstbrg As TFiltro, j As Long, k As Long
        refre = True
        lstGC.clear
        If lstActivities.ListIndex <> -1 Then
            esp = ancora.IndexById(dESPECIALIDAD, asig(id_asig).idesp, 0)
            iclasif = ancora.IndexById(dCLASIF, asig(id_asig).desglose(ancora.IndexById(dDESGLOSE, ancora.periodos(id_per).id, id_asig)).act(lstActivities.ListIndex + 1).idclasif, 0)
            Nivel = asig(id_asig).Nivel
            grupo = CantGruposxClasif(esp, Nivel, iclasif)
    
    
            ReDim mostrandoGrupos(grupo.cant)
            cantMostrandoGrupos = grupo.cant
            
            For j = 1 To grupo.cant
                lstbrg = BrigadasDeGrupo(iclasif, esp, Nivel, grupo.id(j))
                a = Str(grupo.id(j)) + ">"
    
                For k = 1 To lstbrg.cant
                    a = a + kernel.utils.trunca(Brigada(lstbrg.id(k)).comun.id) + ", "
                Next
    
                lstGC.AddItem (a)
                mostrandoGrupos(j) = grupo.id(j)
            Next
    
        End If
    
        refre = False
    End Sub

    Public Sub refrescalstActivities()
        Dim j As Long
        lstActivities.clear
    
        For j = 1 To asig(id_asig).desglose(id_desglose).cantact
            lstActivities.AddItem kernel.utils.trunca(asig(id_asig).desglose(id_desglose).act(j).idclasif) + " - " + kernel.utils.trunca(clasif(ancora.IndexById(dCLASIF, asig(id_asig).desglose(id_desglose).act(j).idclasif, 0)).comun.descrip)
        Next
    
        If lstActivities.ListCount > 0 Then lstActivities.ListIndex = 0
    End Sub
    
    Public Function sePuedeTocar() As Boolean
        sePuedeTocar = True
        Exit Function
        sePuedeTocar = Not ancora.AsigAsignada(lstDesglose.SelectedItem.index, id_per)
        If sePuedeTocar = False Then interface.MessageDlg "Imposible modificar", "No se puede realizar cambios al desglose de esta asignatura porque posee actividades asignadas.", vbCritical, "Aceptar"
    End Function

    Public Sub FillTvwDesgloses()
        Dim i As Long, j As Long, k As Long, l As Long, localNiveles() As Boolean
    
    
        ReDim Preserve localNiveles(ancora.cantNiveles)
        
        Set tvwDesgloses.ImageList = imgDesgloses
        tvwDesgloses.Nodes.clear
        
        For i = 1 To ancora.cantEsp
            tvwDesgloses.Nodes.add , , "esp_" + kernel.utils.trunca(Especialidad(i).id), "(" + kernel.utils.trunca(Especialidad(i).id) + ") " + kernel.utils.trunca(Especialidad(i).descrip), 1, 1
    
            For l = 1 To ancora.cantNiveles
                localNiveles(l) = False
            Next
    
            For j = 1 To ancora.cantAsig
                If kernel.utils.idigual(asig(j).idesp, Especialidad(i).id) Then
                    If Not localNiveles(asig(j).Nivel) Then
                        tvwDesgloses.Nodes.add "esp_" + kernel.utils.trunca(Especialidad(i).id), tvwChild, "esp_" + kernel.utils.trunca(Especialidad(i).id) + "_" & asig(j).Nivel, "" & asig(j).Nivel, 2, 2
                        localNiveles(asig(j).Nivel) = True
                    End If
                End If
            Next
    
            For j = 1 To ancora.cantNiveles
                If localNiveles(j) Then
    
                    For k = 1 To ancora.periodos.Count
                        tvwDesgloses.Nodes.add "esp_" + kernel.utils.trunca(Especialidad(i).id) + "_" & j, tvwChild, "per_" + kernel.utils.trunca(ancora.periodos(k).id) & "_esp_" & kernel.utils.trunca(Especialidad(i).id) & "_" & j, "(" + kernel.utils.trunca(ancora.periodos(k).id) + ") " + kernel.utils.trunca(ancora.periodos(k).descrip), 4, 4
                    Next
    
                End If
    
            Next
    
        Next
    
    End Sub
    

    Public Sub SizeControls(x As Single)
        
        'establecer el ancho
        
        If x < 1500 Then x = 1500
        If x > (Width - 1500) Then x = Width - 1500
        tvwDesgloses.Width = x
        imgSplitter.Left = x
        lstDesglose.Left = x + imgSplitter.Width
        lstDesglose.Width = Width - tvwDesgloses.Width - imgSplitter.Width - 200
        
        'establecer la coordenada superior
        
        lstDesglose.Top = tvwDesgloses.Top
        imgSplitter.Top = tvwDesgloses.Top
        imgSplitter.Height = tvwDesgloses.Height
        labExplorador.Width = tvwDesgloses.Width
        labDesgloses.Left = labExplorador.Left + labExplorador.Width + imgSplitter.Width
        labDesgloses.Width = Width - labDesgloses.Left
    End Sub
    
    Public Sub refrescaPropiedades()
        refre = True
        chkRespetaOrden.value = 0
        chkMismodia.value = 0
    
        With asig(id_asig).desglose(id_desglose)
            If .RespetarOrden Then chkRespetaOrden.value = 1
            If .mismodia Then chkMismodia.value = 1
            txtMinimo.Text = kernel.utils.trunca(Str(.min))
            txtMaximo.Text = kernel.utils.trunca(Str(.max))
        End With
    
        refre = False
    End Sub
