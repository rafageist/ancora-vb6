VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "Mscomctl.ocx"
Begin VB.Form frmDatosObjects 
   Caption         =   "Entrada de datos"
   ClientHeight    =   5640
   ClientLeft      =   60
   ClientTop       =   -330
   ClientWidth     =   9570
   Icon            =   "ancora_goh_traditional_frmDatosObjects.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   5640
   ScaleWidth      =   9570
   StartUpPosition =   2  'CenterScreen
   Visible         =   0   'False
   Begin VB.Frame frameOpciones 
      Height          =   5055
      Left            =   0
      TabIndex        =   1
      Top             =   0
      Width           =   2415
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
         Left            =   240
         TabIndex        =   11
         Top             =   4560
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
         Height          =   375
         Left            =   1560
         TabIndex        =   10
         Top             =   4560
         Width           =   495
      End
      Begin VB.CommandButton cmdEditar 
         Caption         =   "Editar"
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
         TabIndex        =   9
         Top             =   720
         Width           =   2100
      End
      Begin VB.CommandButton btnOpinion 
         Caption         =   "Opinión del generador"
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
         TabIndex        =   2
         Top             =   2640
         Width           =   2100
      End
      Begin VB.CommandButton btnTerminar 
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
         Left            =   120
         TabIndex        =   3
         Top             =   3600
         Width           =   2100
      End
      Begin VB.CommandButton btnBuscarSiguiente 
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
         Left            =   120
         TabIndex        =   4
         Top             =   2160
         Width           =   2100
      End
      Begin VB.CommandButton btnBuscar 
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
         TabIndex        =   5
         Top             =   1680
         Width           =   2100
      End
      Begin VB.CommandButton btnGuardarTerminar 
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
         Left            =   120
         TabIndex        =   6
         Top             =   3120
         Width           =   2100
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
         Left            =   120
         TabIndex        =   7
         Top             =   1200
         Width           =   2100
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
         TabIndex        =   8
         Top             =   255
         Width           =   2100
      End
      Begin VB.Label labPriority 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Prioridad"
         Height          =   195
         Left            =   840
         TabIndex        =   12
         Top             =   4560
         Width           =   645
      End
   End
   Begin MSComctlLib.ImageList lstImg 
      Left            =   0
      Top             =   4920
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   16
      ImageHeight     =   16
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   9
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ancora_goh_traditional_frmDatosObjects.frx":0442
            Key             =   ""
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ancora_goh_traditional_frmDatosObjects.frx":0ADC
            Key             =   ""
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ancora_goh_traditional_frmDatosObjects.frx":1153
            Key             =   ""
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ancora_goh_traditional_frmDatosObjects.frx":174C
            Key             =   ""
         EndProperty
         BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ancora_goh_traditional_frmDatosObjects.frx":1DE1
            Key             =   ""
         EndProperty
         BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ancora_goh_traditional_frmDatosObjects.frx":2576
            Key             =   ""
         EndProperty
         BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ancora_goh_traditional_frmDatosObjects.frx":2B8C
            Key             =   ""
         EndProperty
         BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ancora_goh_traditional_frmDatosObjects.frx":2EA6
            Key             =   ""
         EndProperty
         BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ancora_goh_traditional_frmDatosObjects.frx":31C0
            Key             =   ""
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.ListView lstData 
      Height          =   5415
      Left            =   2520
      TabIndex        =   0
      Top             =   120
      Width           =   6975
      _ExtentX        =   12303
      _ExtentY        =   9551
      View            =   3
      LabelEdit       =   1
      MultiSelect     =   -1  'True
      LabelWrap       =   -1  'True
      HideSelection   =   0   'False
      FullRowSelect   =   -1  'True
      GridLines       =   -1  'True
      _Version        =   393217
      SmallIcons      =   "lstImg"
      ColHdrIcons     =   "lstImg"
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      BorderStyle     =   1
      Appearance      =   1
      NumItems        =   3
      BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         Text            =   "Identificación"
         Object.Width           =   2540
      EndProperty
      BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   1
         Text            =   "Descripción"
         Object.Width           =   14111
      EndProperty
      BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   2
         Text            =   "Virtual"
         Object.Width           =   2540
      EndProperty
   End
End
Attribute VB_Name = "frmDatosObjects"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"489BC1D60317"
Option Explicit

'Form Alta, baja y actualizacion de objetos (periodos, especialidades, brigadas, asignaturas, ...)

'<!- ATRIBUTOS -!>

    Private refrescando As Boolean
    Private actualizando As Boolean
    Private buscando As String
    Private refre As Boolean
    Public resultbutton As Integer
    Public modo As Long

'<!- EVENTOS -!>

    Private Sub btnBuscar_Click()
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

    Private Sub btnBuscarSiguiente_Click()
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

    Private Sub btnGuardarTerminar_Click()
        resultbutton = 1
        Hide
    End Sub
    
    Private Sub btnOpinion_Click()
        frmGeneradorOpinion.Show vbModal
    End Sub
    
    Private Sub btnTerminar_Click()
        resultbutton = 2
        Hide
    End Sub
    
    Private Sub cmdEditar_Click()
        interface.goDatosEditar modo, , itemPos
    End Sub

    Private Sub cmdAdd_Click()
        Dim cant As Long
        interface.goDataInsertarObjeto modo
        cant = ancora.getCantOf(modo)
        refresca cant
    End Sub
    
    Private Sub cmdDel_Click()
        
        Dim ini As Long, i As Long, a As String, r As Variant
        
        If itemPos = 0 Then Exit Sub
        a = ancora.sePuedeEliminar(modo, itemPos)
            
        r = interface.MessageDlg("Eliminar", "La eliminación de este(os) elemento(s) implicará la eliminación " & vbLf _
                 & "de toda la información que dependa de él(ellos). " & vbLf & vbLf _
                 & IIf(a <> "", "Se ha detectado que: " & vbLf & a & vbLf & vbLf, "") _
                 & "¿Está seguro que desea eliminar?", vbInformation, "No", "Sí")
        
        If r = 2 Then
            ini = 1
restart:
            For i = ini To lstData.ListItems.Count
                If lstData.ListItems(i).Selected Then
                    ancora.deleteObjeto modo, , i
                    lstData.ListItems.Remove (i)
                    ini = i
                    GoTo restart
                End If
            Next
    
            refresca 1
        End If
    
    End Sub
    
    Private Sub Form_Load()
        interface.SkinFor Me
    End Sub

    Private Sub Form_Resize()
    
        On Error Resume Next
    
        lstData.Top = 0
        lstData.Left = frameOpciones.Width + 10
        lstData.Width = Width - frameOpciones.Width - 200
        lstData.Height = Height - 500
        frameOpciones.Height = Height - 200
    End Sub
    
    Private Sub lstData_ItemClick(ByVal Item As MSComctlLib.ListItem)
        Dim pos As Long
        refrescando = True
        IDEnterData = pos
        refrescando = False
    End Sub
    
    Private Sub cmdDown_Click()
        Dim i As Long, c As Long
        i = itemPos
        c = lstData.ListItems.Count
        If i < c Then
            ancora.swapClasif i, i + 1
            refresca i + 1
            lstData.ListItems(i).Selected = False
            lstData.ListItems(i + 1).Selected = True
            lstData.SelectedItem.EnsureVisible
        End If
    
    End Sub
    
    Private Sub cmdUp_Click()
        Dim i As Long
        i = itemPos
        If i > 1 Then
            ancora.swapClasif i, i - 1
            refresca i - 1
            lstData.ListItems(i).Selected = False
            lstData.ListItems(i - 1).Selected = True
            lstData.SelectedItem.EnsureVisible
        End If
    
    End Sub
    
    Private Sub Form_Activate()
        IDEnterData = 1
        refrescando = False
        refresca IDEnterData
    
    End Sub

'<!- METODOS -!>

    Public Function itemPos() As Long
        If lstData.ListItems.Count > 0 And Not lstData.SelectedItem Is Nothing Then itemPos = lstData.SelectedItem.index
    End Function
    
    Public Sub refresca(pos As Long)
        Dim a As String, b As String, cant As Long, i As Long
        If refrescando Or pos = 0 Then Exit Sub
        refrescando = True
    
        cant = ancora.getCantOf(modo)
    
        lstData.ListItems.clear
        If cant > 0 Then
    
            For i = 1 To cant
    
                Dim virtual As Boolean
                virtual = False
                Select Case modo
                    Case dPERIODO
                        a = ancora.periodos(i).id
                        b = ancora.periodos(i).descrip
                    Case dESPECIALIDAD
                        a = Especialidad(i).id
                        b = Especialidad(i).descrip
                    Case dCLASIF
                        a = clasif(i).comun.id
                        b = clasif(i).comun.descrip
                    Case dPROFE
                        a = profe(i).id
                        b = profe(i).descrip
                        virtual = profe(i).virtual
                    Case dLUGAR
                        a = lugar(i).id
                        b = lugar(i).descrip
                        virtual = lugar(i).virtual
                    Case dRECURSO
                        a = ancora.recursos(i).id
                        b = ancora.recursos(i).descrip
                        virtual = ancora.recursos(i).virtual
                End Select
    
                lstData.ListItems.add
                refrescaitem i, a, b, virtual
            Next
    
            For i = 1 To lstData.ListItems.Count
                lstData.ListItems(i).Selected = False
            Next
    
            lstData.ListItems(pos).Selected = True
            lstData.SelectedItem.EnsureVisible
            lstData_ItemClick lstData.SelectedItem
        End If
    
        refrescando = False
    End Sub

    Public Sub refrescaitem(i As Long, a As String, b As String, Optional virtual As Boolean = False)
        cmdUp.Visible = (modo = dCLASIF) 'solo clasificacion de actividad; sujeto a cambios
        cmdDown.Visible = cmdUp.Visible
        labPriority.Visible = cmdUp.Visible
    
        With lstData
            .ListItems(i).Text = a
            .ListItems(i).SmallIcon = modo
            .ListItems(i).ListSubItems.clear
            .ListItems(i).ListSubItems.add
            .ListItems(i).ListSubItems(1).Text = b
            .ListItems(i).ForeColor = vbBlack
            .ListItems(i).ListSubItems(1).ForeColor = vbBlack
            If modo = dPROFE Or modo = dLUGAR Then
                If virtual Then
                    .ListItems(i).ForeColor = vbBlue
                    .ListItems(i).ListSubItems(1).ForeColor = vbBlue
                    .ListItems(i).ListSubItems.add , , , 8
                    .ListItems(i).SmallIcon = modo + 3
                End If
    
            End If
    
        End With
    
    End Sub
    
    Public Sub go(ByVal mode As Long)
        refrescando = True
        With Me
            .modo = mode
            .Caption = interface.getNameOfArreglo(mode, True)
            .lstData.ListItems.clear
            .refresca 1
            .resultbutton = 2
            .Show vbModal
        End With
    End Sub
    
