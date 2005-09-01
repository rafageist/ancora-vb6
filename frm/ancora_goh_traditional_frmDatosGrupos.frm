VERSION 5.00
Object = "{90F3D7B3-92E7-44BA-B444-6A8E2A3BC375}#1.0#0"; "actskin4.ocx"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "Mscomctl.ocx"
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "msflxgrd.ocx"
Begin VB.Form frmDatosGrupos 
   Caption         =   "Grupos por clasificación de actividad"
   ClientHeight    =   8115
   ClientLeft      =   60
   ClientTop       =   465
   ClientWidth     =   11085
   Icon            =   "ancora_goh_traditional_frmDatosGrupos.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   8115
   ScaleWidth      =   11085
   StartUpPosition =   2  'CenterScreen
   Visible         =   0   'False
   Begin ACTIVESKINLibCtl.SkinLabel labGruposExistentes 
      Height          =   255
      Left            =   4920
      OleObjectBlob   =   "ancora_goh_traditional_frmDatosGrupos.frx":0442
      TabIndex        =   14
      Top             =   4080
      Width           =   2775
   End
   Begin MSComctlLib.ListView lvwGruposExistentes 
      Height          =   2775
      Left            =   4920
      TabIndex        =   13
      Top             =   4440
      Width           =   6015
      _ExtentX        =   10610
      _ExtentY        =   4895
      View            =   3
      LabelEdit       =   1
      LabelWrap       =   -1  'True
      HideSelection   =   -1  'True
      FullRowSelect   =   -1  'True
      GridLines       =   -1  'True
      _Version        =   393217
      Icons           =   "imlEspecialidades"
      SmallIcons      =   "imlEspecialidades"
      ColHdrIcons     =   "imlEspecialidades"
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      BorderStyle     =   1
      Appearance      =   1
      NumItems        =   0
   End
   Begin MSComctlLib.ImageList imlEspecialidades 
      Left            =   4680
      Top             =   6720
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   16
      ImageHeight     =   16
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   3
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ancora_goh_traditional_frmDatosGrupos.frx":04E8
            Key             =   ""
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ancora_goh_traditional_frmDatosGrupos.frx":093A
            Key             =   ""
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ancora_goh_traditional_frmDatosGrupos.frx":0F89
            Key             =   ""
         EndProperty
      EndProperty
   End
   Begin VB.Frame frameOpciones 
      Height          =   735
      Left            =   0
      TabIndex        =   6
      Top             =   7320
      Width           =   11055
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
         Left            =   6840
         TabIndex        =   7
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
         Left            =   8880
         TabIndex        =   8
         Top             =   240
         Width           =   2055
      End
   End
   Begin VB.Frame frameDatos 
      Height          =   7215
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   4695
      Begin ACTIVESKINLibCtl.SkinLabel SkinLabel1 
         Height          =   255
         Left            =   240
         OleObjectBlob   =   "ancora_goh_traditional_frmDatosGrupos.frx":28CB
         TabIndex        =   12
         Top             =   240
         Width           =   975
      End
      Begin MSComctlLib.TreeView tvwEspecialidades 
         Height          =   2175
         Left            =   240
         TabIndex        =   11
         Top             =   600
         Width           =   4215
         _ExtentX        =   7435
         _ExtentY        =   3836
         _Version        =   393217
         LabelEdit       =   1
         LineStyle       =   1
         Style           =   7
         ImageList       =   "imlEspecialidades"
         Appearance      =   1
      End
      Begin ACTIVESKINLibCtl.SkinLabel labLugaresProhibidos 
         Height          =   255
         Left            =   240
         OleObjectBlob   =   "ancora_goh_traditional_frmDatosGrupos.frx":293D
         TabIndex        =   10
         Top             =   3600
         Width           =   2295
      End
      Begin ACTIVESKINLibCtl.SkinLabel labLugaresFijos 
         Height          =   255
         Left            =   240
         OleObjectBlob   =   "ancora_goh_traditional_frmDatosGrupos.frx":29D5
         TabIndex        =   9
         Top             =   2880
         Width           =   855
      End
      Begin VB.CommandButton CMDquitarAulaFija 
         Caption         =   "Quitar"
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
         TabIndex        =   5
         Top             =   3120
         Width           =   1215
      End
      Begin VB.CommandButton Command1 
         Caption         =   "Detalles"
         Height          =   375
         Left            =   3600
         TabIndex        =   4
         Top             =   2880
         Visible         =   0   'False
         Width           =   975
      End
      Begin VB.ListBox lstAccesosProhibidos 
         Height          =   2535
         Left            =   240
         Style           =   1  'Checkbox
         TabIndex        =   2
         Top             =   3960
         Width           =   4215
      End
      Begin VB.ComboBox cboLugarFijo 
         Height          =   315
         Left            =   240
         Style           =   2  'Dropdown List
         TabIndex        =   1
         ToolTipText     =   "Lugar fijo para este grupo por clasificación"
         Top             =   3120
         Width           =   2895
      End
   End
   Begin MSFlexGridLib.MSFlexGrid Tabla 
      Height          =   3855
      Left            =   4920
      TabIndex        =   3
      ToolTipText     =   "Presione DELETE para quitar el grupo (ponerlo en cero)"
      Top             =   120
      Width           =   6015
      _ExtentX        =   10610
      _ExtentY        =   6800
      _Version        =   393216
      Cols            =   3
      BackColor       =   16777215
      BackColorFixed  =   12632256
      ForeColorFixed  =   0
      BackColorSel    =   8388608
      ForeColorSel    =   8421504
      ScrollTrack     =   -1  'True
      FocusRect       =   2
      GridLines       =   2
      AllowUserResizing=   3
      GridLineWidth   =   2
   End
End
Attribute VB_Name = "frmDatosGrupos"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"489BC1F2033F"
Option Explicit

'Form Grupos por clasificacion de actividad

'<!- ATRIBUTOS -!>

    Dim sePuedeTocar() As Boolean
    Dim refres As Boolean
    Public resultbutton As Integer
    Public modo As Integer
    Dim listaids() As Long
    Dim cantlistaids As Long

'<!- EVENTOS -!>
    
    Private Sub cmdGuardarTerminar_Click()
        resultbutton = 1
        Hide
    End Sub
    Private Sub cmdTerminar_Click()
        resultbutton = 2
        Hide
    End Sub

    Private Sub CMDquitarAulaFija_Click()
        Dim i As Long, k As Long
        For i = 1 To ancora.cantfijas
            With AulasFijas(i)
                If kernel.utils.idigual(.idclasif, clasif(tabla.col).comun.id) And Val(DameTexto(tabla.row, tabla.col)) = .idgrupo Then
                    .idlug = lugar(cboLugarFijo.ListIndex + 1).id
                    If k <> ancora.cantfijas Then
    
                        For k = i To ancora.cantfijas - 1
                            AulasFijas(k) = AulasFijas(k + 1)
                        Next
    
                    End If
                    ancora.cantfijas = ancora.cantfijas - 1
                    refre
                    Exit Sub
                End If
            End With
        Next
    End Sub

    Private Sub cboLugarFijo_Click()
        Dim i As Long
        If tabla.row < 1 Then tabla.row = 1
        If tabla.col < 1 Then tabla.col = 1
        Rem busco si esta
        If refres = False Then
    
            For i = 1 To ancora.cantfijas
    
                With AulasFijas(i)
                    If kernel.utils.idigual(.idclasif, clasif(tabla.col).comun.id) And Val(DameTexto(tabla.row, tabla.col)) = .idgrupo Then
                        .idlug = lugar(cboLugarFijo.ListIndex + 1).id
                    End If
    
                End With
    
            Next
    
            Rem si no lo agrego
            ancora.cantfijas = ancora.cantfijas + 1
            ReDim Preserve AulasFijas(ancora.cantfijas)
    
            With AulasFijas(ancora.cantfijas)
                .idclasif = clasif(tabla.col).comun.id
                .idgrupo = Val(DameTexto(tabla.row, tabla.col))
                .idlug = lugar(cboLugarFijo.ListIndex + 1).id
            End With
    
        End If
    
    End Sub
    
    Private Sub Form_Activate()
        interface.fillTvwEspecialidadesNiveles tvwEspecialidades, 1, 2
    End Sub

    Private Sub Form_Load()
        interface.SkinFor Me
    End Sub
    
    Private Sub Form_Resize()
    
        On Error Resume Next
    
        tabla.Top = 0
        tabla.Left = frameDatos.Left + frameDatos.Width
        tabla.Width = Width - frameDatos.Width - 200
        frameDatos.Top = 0
        frameDatos.Left = 0
        frameDatos.Height = Height - frameOpciones.Height
        
        tabla.Height = (Height - 120 - frameOpciones.Height) / 2 - labGruposExistentes.Height
        labGruposExistentes.Top = tabla.Top + tabla.Height
        With lvwGruposExistentes
            .Top = labGruposExistentes.Top + labGruposExistentes.Height
            .Left = tabla.Left
            .Width = tabla.Width
            .Height = tabla.Height
        End With
        
        
        lstAccesosProhibidos.Height = frameDatos.Height - lstAccesosProhibidos.Top - 200 - frameOpciones.Height
        frameOpciones.Top = Height - frameOpciones.Height - 500
        frameOpciones.Width = Width - 200
        frameOpciones.Left = 0
        cmdTerminar.Left = frameOpciones.Width - cmdTerminar.Width - 180
        cmdGuardarTerminar.Left = cmdTerminar.Left - cmdGuardarTerminar.Width - 100
    
    End Sub
    
    Private Sub lstAccesosProhibidos_Click()
        Dim i As Long, j As Long
        If tabla.row < 1 Then tabla.row = 1
        If tabla.col < 1 Then tabla.col = 1
        If refres = False Then
    
            For i = 1 To ancora.cantAccesos
    
                With AccesosProhibidos(i)
                    'busco si esta
                    If kernel.utils.idigual(.idclasif, clasif(tabla.col).comun.id) And Val(DameTexto(tabla.row, tabla.col)) = .idgrupo Then
                        .cantLugs = 0
    
                        For j = 1 To ancora.cantLug
                            If lstAccesosProhibidos.Selected(j - 1) Then
                                .cantLugs = .cantLugs + 1
                                ReDim Preserve .idlugs(.cantLugs)
                                .idlugs(.cantLugs) = lugar(j).id
                            End If
    
                        Next
    
                        Exit Sub
                    End If
    
                End With
    
            Next
    
            'si no lo agrego
            ancora.cantAccesos = ancora.cantAccesos + 1
            ReDim Preserve AccesosProhibidos(ancora.cantAccesos)
    
            With AccesosProhibidos(ancora.cantAccesos)
                .idclasif = clasif(tabla.col).comun.id
                .idgrupo = Val(DameTexto(tabla.row, tabla.col))
                .cantLugs = 0
    
                For j = 1 To ancora.cantLug
                    If lstAccesosProhibidos.Selected(j - 1) Then
                        .cantLugs = .cantLugs + 1
                        ReDim Preserve .idlugs(.cantLugs)
                        .idlugs(.cantLugs) = lugar(j).id
                    End If
    
                Next
    
            End With
    
        End If
    
    End Sub
    
    Private Sub Tabla_KeyDown(KeyCode As Integer, Shift As Integer)
        If sePuedeTocar(listaids(tabla.row), tabla.col) Then
            interface.MessageDlg "Imposible modificar", "No se puede modificar este grupo por clasificación pues exiten actividades asignadas a él", vbCritical, "Aceptar"
            Exit Sub
        End If
        If KeyCode = 46 Then
            tabla.Text = "0"
            Tabla_KeyPress Asc("0")
        End If
    
    End Sub
    
    Private Sub Tabla_KeyPress(KeyAscii As Integer)
        Dim r As Long, c As Long, a As String
        If sePuedeTocar(listaids(tabla.row), tabla.col) Then
            interface.MessageDlg "Imposible modificar", "No se puede modificar este grupo por clasificación pues exiten actividades asignadas a él", vbCritical, "Aceptar"
            Exit Sub
        End If
        If Len(tabla.Text) > 4 Then Exit Sub
        If (KeyAscii < Asc("0") Or KeyAscii > Asc("9")) And KeyAscii <> 8 And KeyAscii <> 13 Then Exit Sub
        If KeyAscii <> 13 Then
            If tabla.row > 0 Then
                If KeyAscii = 8 Then
                    If Len(tabla.Text) > 0 Then tabla.Text = Mid$(tabla.Text, 1, Len(tabla.Text) - 1)
                    tabla.Text = Str(Val(tabla.Text))
                Else
                    tabla.Text = tabla.Text + Chr(KeyAscii)
                    tabla.Text = Trim(tabla.Text)
                End If
    
                If Len(tabla.Text) < 3 Then
                    r = tabla.row
                    c = tabla.col
                    a = tabla.Text
    
                    tabla.Text = Trim(tabla.Text)
                    Brigada(listaids(r)).GrupoXClasif(c).grupo = Val(tabla.Text)
                    
                End If
    
            End If
    
        Else
            If tabla.row < tabla.Rows - 1 Then tabla.row = tabla.row + 1
        End If
        tabla.Text = Trim(Str(Val(tabla.Text)))
        
    End Sub
    
    Private Sub Tabla_EnterCell()
        If Not refres Then refre
    End Sub
    
    Private Sub tvwEspecialidades_NodeClick(ByVal Node As MSComctlLib.Node)
        Dim Nivel As Long, idesp As String, i As Long
        Nivel = Val(kernel.strings.subcadena(Node.key, 2, "_"))
        idesp = kernel.strings.subcadena(Node.key, 4, "_")
        
        cantlistaids = 0
        
        For i = 1 To ancora.cantBrg
            With Brigada(i)
                If kernel.utils.idigual(.idesp, idesp) And .Nivel = Nivel Then
                    cantlistaids = cantlistaids + 1
                    ReDim Preserve listaids(cantlistaids)
                    listaids(cantlistaids) = i
                End If
            End With
        Next
        Refresca1
    End Sub
    
'<!- METODOS !->

    Public Sub refresca()
        Dim i As Long
        refres = True
        lstAccesosProhibidos.clear
        cboLugarFijo.clear
    
        For i = 1 To ancora.cantLug
            lstAccesosProhibidos.AddItem kernel.utils.trunca(lugar(i).id) + " - " + kernel.utils.trunca(lugar(i).descrip)
            cboLugarFijo.AddItem kernel.utils.trunca(lugar(i).id) + " - " + kernel.utils.trunca(lugar(i).descrip)
        Next
    
        refre
    End Sub
    
    Public Sub refre()  'refrescamiento
        Dim i As Long, j As Long
        If tabla.row < 0 Then tabla.row = 1
        If tabla.col < 0 Then tabla.col = 1
        refres = True
    
        For i = 1 To ancora.cantLug
            lstAccesosProhibidos.Selected(i - 1) = False
        Next
    
        For i = 1 To ancora.cantAccesos
    
            With AccesosProhibidos(i)
                If kernel.utils.idigual(.idclasif, clasif(tabla.col).comun.id) And Val(DameTexto(tabla.row, tabla.col)) = .idgrupo Then
    
                    For j = 1 To .cantLugs
                        lstAccesosProhibidos.Selected(ancora.IndexById(dLUGAR, .idlugs(j), 0) - 1) = True
                    Next
    
                    Exit For
                End If
    
            End With
    
        Next
    
        cboLugarFijo.ListIndex = -1
    
        For i = 1 To ancora.cantfijas
    
            With AulasFijas(i)
                If kernel.utils.idigual(.idclasif, clasif(tabla.col).comun.id) And Val(DameTexto(tabla.row, tabla.col)) = .idgrupo Then
                    cboLugarFijo.ListIndex = ancora.IndexById(dLUGAR, .idlug, 0) - 1
                    refres = False
                    Exit Sub
                End If
    
            End With
    
        Next
    
        cboLugarFijo.ListIndex = -1
        refres = False
    End Sub
    
    Public Sub Refresca1()
        Dim id As Long
        Dim i As Long, j As Long, k As Long
        limpia
        refres = True
            
        tabla.cols = ancora.cantClasif + 1
        tabla.Rows = cantlistaids + 1
        For i = 1 To ancora.cantClasif
            tabla.TextMatrix(0, i) = clasif(i).comun.id
        Next
    
        For k = 1 To cantlistaids
            i = listaids(k)
            tabla.TextMatrix(k, 0) = Brigada(i).comun.id
            For j = 1 To ancora.cantClasif
                id = ancora.IndexGrupoxClasif(i, clasif(j).comun.id)
                If id <> 0 Then tabla.TextMatrix(k, j) = "" & Brigada(i).GrupoXClasif(id).grupo
            Next
        Next
    

        tabla.FixedCols = 1
    
        ColocaText 0, 0, "Brigadas"
    
        For j = 1 To tabla.cols
            tabla.ColWidth(j - 1) = 1000
        Next
    
        interface.fillLvwGruposXClasif lvwGruposExistentes, 3
    
        refres = False
        
    End Sub
    
    Public Sub limpia()
        Dim i As Long
        If tabla.Rows > 2 Then
    
            For i = 1 To tabla.Rows - 2
                tabla.RemoveItem (1)
            Next
    
        End If
    
        tabla.FixedCols = 0
    End Sub
    
    Public Sub ColocaText(i As Long, j As Long, s As String)
        tabla.row = i
        tabla.col = j
        tabla.Text = s
    End Sub
    
    Public Function DameTexto(i As Long, j As Long) As String
        tabla.row = i
        tabla.col = j
        DameTexto = tabla.Text
    End Function
    
    
    Public Sub creaMatrixSePuedeTocar(ByVal filas As Long, ByVal cols As Long)
        ReDim sePuedeTocar(filas, cols)
    End Sub
    
    Public Sub setSePuedeTocar(ByVal fila As Long, ByVal col As Long, Optional value As Boolean = True)
        sePuedeTocar(fila, col) = value
    End Sub
    

