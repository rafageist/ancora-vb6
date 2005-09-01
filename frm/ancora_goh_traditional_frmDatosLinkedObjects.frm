VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "Mscomctl.ocx"
Begin VB.Form frmDatosLinkedObjects 
   Caption         =   "Entrando datos"
   ClientHeight    =   8625
   ClientLeft      =   60
   ClientTop       =   465
   ClientWidth     =   10080
   Icon            =   "ancora_goh_traditional_frmDatosLinkedObjects.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   8625
   ScaleWidth      =   10080
   StartUpPosition =   2  'CenterScreen
   Visible         =   0   'False
   Begin VB.CommandButton statusBar 
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
      TabIndex        =   13
      Top             =   8160
      Width           =   10095
   End
   Begin VB.Frame frameOpciones2 
      Height          =   735
      Left            =   0
      TabIndex        =   10
      Top             =   7320
      Width           =   9975
      Begin VB.CommandButton cmdBusca 
         Caption         =   "Buscar"
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
         TabIndex        =   15
         Top             =   240
         Width           =   1815
      End
      Begin VB.CommandButton cmdBuscaSiguiente 
         Caption         =   "Buscar siguiente"
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
         TabIndex        =   14
         Top             =   240
         Width           =   1935
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
         Left            =   5640
         TabIndex        =   11
         Top             =   240
         Width           =   1935
      End
      Begin VB.CommandButton cmdTerminar 
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
         Left            =   7680
         TabIndex        =   12
         Top             =   240
         Width           =   2055
      End
   End
   Begin MSComctlLib.ImageList imgDesgloses 
      Left            =   3480
      Top             =   1440
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   16
      ImageHeight     =   16
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   2
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ancora_goh_traditional_frmDatosLinkedObjects.frx":0442
            Key             =   ""
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ancora_goh_traditional_frmDatosLinkedObjects.frx":0894
            Key             =   ""
         EndProperty
      EndProperty
   End
   Begin VB.Frame frameOpciones 
      Caption         =   " Opciones "
      Height          =   1335
      Left            =   0
      TabIndex        =   1
      Top             =   5880
      Width           =   4815
      Begin VB.CommandButton cmdEditar 
         Caption         =   "Editar"
         Height          =   375
         Left            =   1680
         TabIndex        =   16
         Top             =   360
         Width           =   1455
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
         Height          =   375
         Left            =   2880
         TabIndex        =   9
         Top             =   840
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
         Height          =   375
         Left            =   1440
         TabIndex        =   8
         Top             =   840
         Width           =   495
      End
      Begin VB.CommandButton cmdDel 
         Caption         =   "Eliminar"
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
         TabIndex        =   7
         Top             =   360
         Width           =   1455
      End
      Begin VB.CommandButton cmdAdd 
         Caption         =   "Insertar"
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
         TabIndex        =   6
         Top             =   360
         Width           =   1455
      End
      Begin VB.Label Label2 
         Alignment       =   2  'Center
         BackStyle       =   0  'Transparent
         Caption         =   "Prioridad"
         Height          =   255
         Left            =   2040
         TabIndex        =   2
         Top             =   960
         Width           =   735
      End
   End
   Begin MSComctlLib.ListView lstData 
      Height          =   6975
      Left            =   4920
      TabIndex        =   0
      Top             =   240
      Width           =   5055
      _ExtentX        =   8916
      _ExtentY        =   12303
      View            =   3
      LabelEdit       =   1
      MultiSelect     =   -1  'True
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
      NumItems        =   5
      BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         Text            =   "Identificación"
         Object.Width           =   2540
      EndProperty
      BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   1
         Text            =   "Descripción"
         Object.Width           =   7056
      EndProperty
      BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   2
         Text            =   "Especialidad"
         Object.Width           =   2540
      EndProperty
      BeginProperty ColumnHeader(4) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   3
         Text            =   "Nivel"
         Object.Width           =   2540
      EndProperty
      BeginProperty ColumnHeader(5) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   4
         Text            =   "Virtual"
         Object.Width           =   2540
      EndProperty
   End
   Begin MSComctlLib.ImageList imgList 
      Left            =   2760
      Top             =   1440
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
            Picture         =   "ancora_goh_traditional_frmDatosLinkedObjects.frx":0EE3
            Key             =   ""
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ancora_goh_traditional_frmDatosLinkedObjects.frx":1649
            Key             =   ""
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ancora_goh_traditional_frmDatosLinkedObjects.frx":1A9B
            Key             =   ""
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ancora_goh_traditional_frmDatosLinkedObjects.frx":1DB5
            Key             =   ""
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.TreeView tvwEspecialidades 
      Height          =   3135
      Left            =   0
      TabIndex        =   3
      Top             =   240
      Width           =   4815
      _ExtentX        =   8493
      _ExtentY        =   5530
      _Version        =   393217
      HideSelection   =   0   'False
      LabelEdit       =   1
      LineStyle       =   1
      Sorted          =   -1  'True
      Style           =   7
      Appearance      =   1
   End
   Begin VB.Label labEspec 
      BackStyle       =   0  'Transparent
      Caption         =   "Especialidades/Niveles"
      Height          =   255
      Left            =   120
      TabIndex        =   5
      Top             =   0
      Width           =   4935
   End
   Begin VB.Label LabObjects 
      BackStyle       =   0  'Transparent
      Caption         =   "Brigadas/Asignaturas"
      Height          =   255
      Left            =   5040
      TabIndex        =   4
      Top             =   0
      Width           =   4935
   End
   Begin VB.Menu popupObjetos 
      Caption         =   "PopUp"
      Visible         =   0   'False
      Begin VB.Menu popInsertar 
         Caption         =   "Insertar"
      End
      Begin VB.Menu popModificar 
         Caption         =   "Modificar"
      End
      Begin VB.Menu popEliminar 
         Caption         =   "Eliminar"
      End
   End
End
Attribute VB_Name = "frmDatosLinkedObjects"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"489BC1E00036"
Option Explicit
'Form Alta, baja y actualizacion de objetos enlazados (brigadas, asignaturas)

'<!- ATRIBUTOS -!>
 
    Dim actualizando As Boolean
    Dim buscando As String
    Dim ibaja As Boolean
    Dim listaid() As Long
    Dim cantlistaid As Long
    Dim idesp As String
    Dim Nivel As Long
    Public resultbutton As Integer
    Public modo As Integer
    Public refrescando As Boolean

'<!- EVENTOS -!>

    Private Sub cmdEditar_Click()
        If itemPos > 0 Then interface.goDatosEditar modo, , listaid(itemPos)
    End Sub
    
    Private Sub cmdGuardarTerminar_Click()
        ancora.Save
        Hide
    End Sub
    
    Private Sub cmdTerminar_Click()
        Hide
    End Sub
    
    Private Sub Form_Load()
        interface.SkinFor Me
    End Sub
    
    Private Sub tvwEspecialidades_KeyDown(KeyCode As Integer, Shift As Integer)
        If KeyCode = 93 Then PopupMenu popupObjetos
    End Sub
    
    Private Sub tvwEspecialidades_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
        If Button = 2 Then PopupMenu popupObjetos, , x, y
    End Sub
    
    Private Sub tvwEspecialidades_NodeClick(ByVal Node As MSComctlLib.Node)
        Dim nod As String
        nod = Node.key
        If kernel.strings.subcadena(nod, 1, "_") = "esp" Then
            idesp = kernel.strings.subcadena(nod, 2, "_")
            Nivel = 0
        End If
    
        If kernel.strings.subcadena(nod, 1, "_") = "Nivel" Then
            idesp = kernel.strings.subcadena(nod, 4, "_")
            Nivel = Val(kernel.strings.subcadena(nod, 2, "_"))
        End If
    
        refresca
    End Sub
    
    Private Sub cmdAdd_Click()
        Dim r As Variant, a As String, ii As Long
        Select Case modo
            Case dBRIGADA: interface.goDataInsertarBrigadas
            Case dASIG: interface.goDataInsertarAsignaturas
        End Select
    
        refresca
    End Sub
    
    Private Sub cmdDel_Click()
        Dim r As Variant, ini As Long, i As Long, a As String
        
        If itemPos = 0 Then Exit Sub
        
        Select Case modo
            Case dBRIGADA: a = ancora.sePuedeEliminar(dBRIGADA, listaid(itemPos))
            Case dASIG: a = ancora.sePuedeEliminar(dASIG, listaid(itemPos))
        End Select
        
        r = interface.MessageDlg("Eliminar", "La eliminación de este(os) elemento(s) implicará la eliminación " & vbLf _
                 & "de toda la información que dependa de él(ellos). " & vbLf _
                 & IIf(a <> "", "Se ha detectado que: " & a, "") & vbLf _
                 & "¿Está seguro que desea eliminar?", vbQuestion, "No", "Sí")
        
        If r = 2 Then
            ini = 1
restart:
    
            For i = ini To lstData.ListItems.Count
                If lstData.ListItems(i).Selected Then
                        Elimina listaid(i)
                        lstData.ListItems.Remove (i)
                        ini = i
                        GoTo restart
                End If
            Next
    
            refresca
        End If
    
    End Sub
    
    Private Sub Form_Resize()
    
        On Error Resume Next
    
        tvwEspecialidades.Left = 0
        labEspec.Top = 0
        LabObjects.Top = 0
        LabObjects.Width = Width - LabObjects.Left
        tvwEspecialidades.Top = labEspec.Height
        frameOpciones.Top = Height - frameOpciones.Height - 300 - labEspec.Height - StatusBar.Height - frameOpciones2.Height
        tvwEspecialidades.Height = frameOpciones.Top
        frameOpciones.Left = 0
        lstData.Top = tvwEspecialidades.Top
        tvwEspecialidades.Width = frameOpciones.Width
        lstData.Left = frameOpciones.Width
        lstData.Width = Width - 100 - frameOpciones.Width
        lstData.Height = Height - StatusBar.Height - labEspec.Height - frameOpciones2.Height - 500
        StatusBar.Top = Height - 500 - StatusBar.Height
        StatusBar.Left = -50
        StatusBar.Width = Width
        frameOpciones2.Top = Height - StatusBar.Height - 500 - frameOpciones2.Height
        frameOpciones2.Left = 0
        frameOpciones2.Width = Width - 150
        cmdTerminar.Left = frameOpciones2.Width - cmdTerminar.Width - 180
        cmdGuardarTerminar.Left = cmdTerminar.Left - cmdGuardarTerminar.Width - 100
        cmdBuscaSiguiente.Left = cmdGuardarTerminar.Left - cmdBuscaSiguiente.Width - 100
        cmdBusca.Left = cmdBuscaSiguiente.Left - cmdBusca.Width - 100
        
    End Sub
    
    Private Sub cmdDown_Click()
        Dim i As Long, c As Long
        i = itemPos
        c = lstData.ListItems.Count
        If i < c Then
            intercambia i, i + 1
            refrescaitem i
            refrescaitem i + 1
            lstData.ListItems(i).Selected = False
            lstData.ListItems(i + 1).Selected = True
            lstData.SelectedItem.EnsureVisible
        End If
    
    End Sub
    
    Private Sub cmdUp_Click()
        Dim i As Long
        i = itemPos
        If i > 1 Then
            intercambia i, i - 1
            refresca
            lstData.ListItems(i).Selected = False
            lstData.ListItems(i - 1).Selected = True
            lstData.SelectedItem.EnsureVisible
        End If
    
    End Sub
    
    Private Sub Form_Activate()
        IDEnterData = 1
        refresca
    End Sub

    Private Sub cmdBuscaSiguiente_Click()
        Dim s As Variant, i As Long
        s = buscando
    
        For i = lstData.SelectedItem.index + 1 To lstData.ListItems.Count
            If InStr(1, kernel.utils.trunca(LCase(lstData.ListItems(i).Text)), kernel.utils.trunca(LCase(s))) <> 0 Then
                lstData.ListItems(i).Selected = True
                lstData.SelectedItem.EnsureVisible
                Exit Sub
            End If
    
        Next
    End Sub
    
    Private Sub cmdBusca_Click()
        Dim s As Variant, i As Long
        s = InputBox("Entre la identificación", "Buscar")
        If s = vbCancel Or kernel.utils.trunca(s) = "" Then Exit Sub
    
        For i = 1 To lstData.ListItems.Count
            If InStr(1, kernel.utils.trunca(LCase(lstData.ListItems(i).Text)), kernel.utils.trunca(LCase(s))) <> 0 Then
                lstData.ListItems(i).Selected = True
                lstData.SelectedItem.EnsureVisible
                buscando = s
                Exit Sub
            End If
        Next
    End Sub

'<!- METODOS -!>

    Public Sub go(m As Long)
        Dim i As Long
        FillTvwEspecialidades
        modo = m
          
        Caption = interface.getNameOfArreglo(m)
    
        If ancora.cantEsp = 0 Then
            interface.MessageDlg "No se puede continuar", "No existen Especialidades", vbCritical, "Aceptar"
            Hide
            Exit Sub
        End If
    
        If ancora.cantAsig > 0 And modo = dASIG Then
            refresca
            IDEnterData2 = 1
        End If
    
        If ancora.cantBrg > 0 And modo = dBRIGADA Then
            refresca
            IDEnterData2 = 1
        End If
    
        Show vbModal
    End Sub
    
    Public Sub Elimina(id As Long)
        Select Case modo
            Case dBRIGADA: ancora.deleteObjeto dBRIGADA, , id
            Case dASIG: ancora.deleteObjeto dASIG, , id
        End Select
    End Sub
    
    Public Sub intercambia(id1 As Long, id2 As Long)
        Select Case modo
            Case dBRIGADA: ancora.swapBrigadas listaid(id1), listaid(id2)
            Case dASIG: ancora.swapAsignaturas listaid(id1), listaid(id2)
        End Select
    
        Dim temp As Long
        temp = listaid(id1)
        listaid(id1) = listaid(id2)
        listaid(id2) = temp
        refresca
    End Sub
    
    Public Sub refresca()
        
        Dim a As String, b As String, c As String, d As String
        Dim cant As Long, i As Long
        
        If refrescando Then Exit Sub
        
        On Error Resume Next ' cuando se tiene abierto las restricciones en forma modal
                             ' y se cambia de periodo entonces se activa este form y se
                             ' lanza refresca. Entonces el dim preserve a listaid da y error y
                             ' me dice que la matriz esta en uso
        
        refrescando = True
        lstData.ListItems.clear
        cantlistaid = 0
    
        Select Case modo
            Case dBRIGADA
    
                For i = 1 To ancora.cantBrg
    
                    With Brigada(i)
                        If kernel.utils.idigual(.idesp, idesp) And (.Nivel = Nivel Or Nivel = 0) Then
                            cantlistaid = cantlistaid + 1
                            ReDim Preserve listaid(cantlistaid)
                            listaid(cantlistaid) = i
                            lstData.ListItems.add
                            refrescaitem cantlistaid
                        End If
    
                    End With
    
                Next
                StatusBar.Caption = ancora.cantBrg & " brigada" & IIf(ancora.cantBrg > 1, "s", "")
            Case dASIG
    
                For i = 1 To ancora.cantAsig
    
                    With asig(i)
                        If kernel.utils.idigual(.idesp, idesp) And (.Nivel = Nivel Or Nivel = 0) Then
                            cantlistaid = cantlistaid + 1
                            ReDim Preserve listaid(cantlistaid)
                            listaid(cantlistaid) = i
                            lstData.ListItems.add
                            refrescaitem cantlistaid
                        End If
    
                    End With
    
                Next
                StatusBar.Caption = ancora.cantAsig & " asignatura" & IIf(ancora.cantAsig > 1, "s", "")
        End Select
    
        For i = 1 To lstData.ListItems.Count
            lstData.ListItems(i).Selected = False
        Next
        If lstData.ListItems.Count > 0 Then
            lstData.ListItems(1).Selected = True
            lstData.SelectedItem.EnsureVisible
        End If
        
        refrescando = False
    End Sub
    
    Public Sub refrescaitem(ByVal idx As Long)
        Dim i As Long
        i = listaid(idx)
    
        Select Case modo
            Case dBRIGADA
    
                With lstData
                    .ListItems(idx).Text = Brigada(i).comun.id
                    .ListItems(idx).SmallIcon = 1
                    .ListItems(idx).ListSubItems.clear
                    .ListItems(idx).ListSubItems.add
                    .ListItems(idx).ListSubItems(1).Text = Brigada(i).comun.descrip
                    .ListItems(idx).ListSubItems.add
                    .ListItems(idx).ListSubItems(2).Text = Brigada(i).idesp
                    .ListItems(idx).ListSubItems.add
                    .ListItems(idx).ListSubItems(3).Text = Brigada(i).Nivel
                    If Brigada(i).comun.virtual Then
                        .ListItems(idx).SmallIcon = 3
                        .ListItems(idx).ListSubItems.add , , , 4
                    End If
    
                End With
    
            Case dASIG
    
                With lstData
                    .ListItems(idx).Text = asig(i).comun.id
                    .ListItems(idx).SmallIcon = 2
                    .ListItems(idx).ListSubItems.clear
                    .ListItems(idx).ListSubItems.add
                    .ListItems(idx).ListSubItems(1).Text = asig(i).comun.descrip
                    .ListItems(idx).ListSubItems.add
                    .ListItems(idx).ListSubItems(2).Text = asig(i).idesp
                    .ListItems(idx).ListSubItems.add
                    .ListItems(idx).ListSubItems(3).Text = asig(i).Nivel
                End With
    
        End Select
    
    End Sub
    
    Public Function Existe(id As String, Optional exceptoint As Long = 0, Optional exceptostr As String = "") As Boolean
        Dim i As Long, arreglo As Long
        If modo = 1 Then arreglo = dBRIGADA Else arreglo = dASIG
        If ancora.ExisteID(arreglo, id, 0, exceptoint, exceptostr) Then
            interface.MessageDlg "Replicación de identificación", "Esa identificación ya existe, no puede ser repetida", vbCritical, "Aceptar"
            Existe = True
            Exit Function
        End If
    
        Existe = False
    End Function
    
    Public Sub FillTvwEspecialidades()
        Dim i As Long, j As Long, k As Long, l As Long
        Set tvwEspecialidades.ImageList = imgDesgloses
        tvwEspecialidades.Nodes.clear
    
        For i = 1 To ancora.cantEsp
            tvwEspecialidades.Nodes.add , , "esp_" + kernel.utils.trunca(Especialidad(i).id), "(" + kernel.utils.trunca(Especialidad(i).id) + ") " + kernel.utils.trunca(Especialidad(i).descrip), 1, 1
    
            For l = 1 To ancora.cantNiveles
                tvwEspecialidades.Nodes.add "esp_" + kernel.utils.trunca(Especialidad(i).id), tvwChild, "Nivel_" & l & "_esp_" + kernel.utils.trunca(Especialidad(i).id), "" & l, 2, 2
            Next
    
        Next
    
    End Sub

    Public Function itemPos() As Long
        If lstData.ListItems.Count > 0 And Not lstData.SelectedItem Is Nothing Then itemPos = lstData.SelectedItem.index
    End Function

