VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmDatosOpcionesAct 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Cambios en esta actividad"
   ClientHeight    =   4455
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   7680
   Icon            =   "ancora_goh_traditional_frmDatosOpcionesAct.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4455
   ScaleWidth      =   7680
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
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
      Left            =   6480
      TabIndex        =   7
      Top             =   3960
      Width           =   1095
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
      Left            =   5160
      TabIndex        =   6
      Top             =   3960
      Width           =   1215
   End
   Begin VB.Frame frameOpciones 
      Caption         =   "Opciones"
      Height          =   3615
      Left            =   120
      TabIndex        =   1
      Top             =   120
      Width           =   2415
      Begin VB.CommandButton cmdEliminar 
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
         TabIndex        =   5
         Top             =   1800
         Width           =   2175
      End
      Begin VB.CommandButton cmdFijar 
         Caption         =   "Fijar"
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
         Top             =   1320
         Width           =   2175
      End
      Begin VB.CommandButton cambioRecursos 
         Caption         =   "Cambio de recursos"
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
         Top             =   840
         Width           =   2175
      End
      Begin VB.CommandButton cambioTurno 
         Caption         =   "Cambiar turno"
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
         Top             =   360
         Width           =   2175
      End
   End
   Begin VB.ListBox lstDatos 
      BackColor       =   &H00FFFFFF&
      ForeColor       =   &H00000000&
      Height          =   2595
      Left            =   2640
      TabIndex        =   0
      Top             =   600
      Width           =   4935
   End
   Begin MSComctlLib.ImageList imlToolbarIcons 
      Left            =   1200
      Top             =   3960
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
            Picture         =   "ancora_goh_traditional_frmDatosOpcionesAct.frx":0442
            Key             =   ""
            Object.Tag             =   "1"
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ancora_goh_traditional_frmDatosOpcionesAct.frx":0D1C
            Key             =   ""
            Object.Tag             =   "2"
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ancora_goh_traditional_frmDatosOpcionesAct.frx":717E
            Key             =   ""
            Object.Tag             =   "3"
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ancora_goh_traditional_frmDatosOpcionesAct.frx":75D0
            Key             =   ""
            Object.Tag             =   "4"
         EndProperty
         BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ancora_goh_traditional_frmDatosOpcionesAct.frx":78EA
            Key             =   ""
            Object.Tag             =   "5"
         EndProperty
      EndProperty
   End
   Begin VB.Label labDatosActividad 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Datos de la actividad"
      Height          =   195
      Left            =   2640
      TabIndex        =   8
      Top             =   240
      Width           =   1500
   End
   Begin VB.Line Line2 
      BorderColor     =   &H80000010&
      X1              =   0
      X2              =   9000
      Y1              =   3840
      Y2              =   3840
   End
   Begin VB.Line Line1 
      BorderColor     =   &H00FFFFFF&
      X1              =   0
      X2              =   9000
      Y1              =   3855
      Y2              =   3855
   End
End
Attribute VB_Name = "frmDatosOpcionesAct"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"489BC2290186"
Option Explicit

'Form Opciones de la actividad

'<!- ATRIBUTOS -!>

    Dim eliminada As Boolean

'<!- EVENTOS -!>

    Private Sub cmdAyuda_Click()
        interface.ShowHelp Name
    End Sub

    Private Sub cmdEliminar_Click()
        eliminar
    End Sub
    
    Private Sub cmdFijar_Click()
        ActiveFija
    End Sub
    
    Private Sub Terminar_Click()
        Hide
    End Sub
    
    Private Sub Form_Activate()
        Dim idc As Long, i As Long
        lstDatos.clear
        If IDASIGNA_CAMBIANDO = 0 Or eliminada Then Exit Sub
    
        With Asignaciones(IDASIGNA_CAMBIANDO)
            lstDatos.AddItem "Fecha de generación: " + .fecha
            lstDatos.AddItem "Hora de generación: " + .fecha
            lstDatos.AddItem ""
            lstDatos.AddItem "Brigada: " + interface.getRS_Brigada(ancora.IndexById(dBRIGADA, .idbrigada))
            lstDatos.AddItem "Grupo por clasificación de actividad: " & ancora.getGrupoAsignacion(IDASIGNA_CAMBIANDO)
            lstDatos.AddItem ""
            lstDatos.AddItem "Asignatura: " + interface.getRS_Asignatura(ancora.IndexById(dASIG, .idasig))
            lstDatos.AddItem "Actividad: " & .idact
            lstDatos.AddItem "Clasificación de Actividad: " & interface.getRS_Clasificacion(ancora.getClasifOfActivity(.idasig, .idperiodo, .idact))
            lstDatos.AddItem ""
            lstDatos.AddItem "Profesor: " + interface.getRS_Profe(ancora.IndexById(dPROFE, .idprofe))
            lstDatos.AddItem "Lugar: " + interface.getRS_Lugar(ancora.IndexById(dLUGAR, .idlugar))
    
            lstDatos.AddItem "Recursos asignados: "
            For i = 1 To .cantrecursos
                Dim ix As Long
                ix = ancora.IndexById(dRECURSO, .recursos(i))
                lstDatos.AddItem i & " - " & interface.getRS_Recurso(ix)
            Next
    
            lstDatos.AddItem ""
            lstDatos.AddItem "Dia: " & .dia
            lstDatos.AddItem "Turno: " & .turno
    
            idc = ancora.getClasifOfActivity(.idasig, .idperiodo, .idact)
    
        End With
    End Sub
    
    Private Sub Form_Load()
        interface.SkinFor Me
        eliminada = False
    End Sub
    
    Private Sub cambioTurno_Click()
        CambioTPL
    End Sub
    
    Private Sub cambioRecursos_Click()
        CambioPL
    End Sub

'<!- METODOS -!>

    Public Sub CambioTPL()
        Dim k As Long, fila As Long, col As Long
        Dim asg As Long, act As Long, per As Long, brg As Long
        Dim fija As Boolean
    
        With Asignaciones(IDASIGNA_CAMBIANDO)
            asg = ancora.IndexById(dASIG, .idasig, 0)
            ESPEC_GENERANDO = ancora.IndexById(dESPECIALIDAD, asig(asg).idesp, 0)
            act = .idact
            per = ancora.IndexById(dPERIODO, .idperiodo, 0)
            brg = ancora.IndexById(dBRIGADA, .idbrigada, 0)
            fija = .fija
        End With
    
        Hide
        ancora.updateHash_objects
        ancora.BeginIDX
        ShowedMsg_frmDatosgoMPI_HideCboProfe_Y_Lug = False
        interface.ShowFrmMPI asg, act, per, brg, fija
    End Sub
    
    Public Sub ActiveFija()
        Dim r As Variant, a As String
        If IDASIGNA_CAMBIANDO = 0 Then Exit Sub
    
        If Asignaciones(IDASIGNA_CAMBIANDO).fija Then interface.MessageDlg "Fijar actividad", "Esta actividad ya ha sido fijada", vbInformation, "Aceptar"
        r = interface.MessageDlg("Seguridad", "Esta acción provocará el mismo efecto para todas " + Chr(13) + "las demás brigadas del mismo grupo por clasificación de actividad " + Chr(13) + "¿Está seguro que desea continuar?", vbQuestion, "No", "Sí")
        If r = 2 Then
            Hide
    
            With Asignaciones(IDASIGNA_CAMBIANDO)
                If .fija Then a = "0" Else a = "1"
                ancora.updateAsignaciones "idperiodo,idasig,idact,grupo", .idperiodo & "," & .idasig & "," & .idact & "," & ancora.getGrupoAsignacion(IDASIGNA_CAMBIANDO), "fija", a
            End With
    
            interface.showMsg_ProcesoTerminado
            Hide
        End If
    
    End Sub
    
    Public Sub CambioPL()
        Dim k As Long, fila As Long, col As Long
        Dim asg As Long, act As Long, per As Long, brg As Long
        Dim fija As Boolean
    
        ancora.updateHash
        ancora.updateHash_objects
        ancora.BeginIDX
        
    
        With Asignaciones(MatrixAsignaciones_frmExplorerSchedule(DIA_CAMBIO, TURNO_CAMBIO))
            asg = ancora.IndexById(dASIG, .idasig, 0)
            ESPEC_GENERANDO = ancora.IndexById(dESPECIALIDAD, asig(asg).idesp, 0)
            act = .idact
            per = ancora.IndexById(dPERIODO, .idperiodo, 0)
            brg = ancora.IndexById(dBRIGADA, .idbrigada, 0)
            fija = .fija
        End With
    
        Hide
        interface.ShowCambioProfeLugar per, asg, act, DIA_CAMBIO, TURNO_CAMBIO, brg, fija
    End Sub

    Public Sub eliminar()
        Dim r As Variant
        r = interface.MessageDlg("Seguridad", "Al eliminar esta actividad de esta brigada, se eliminarán las actividades de todas " + Chr(13) + "las demás brigadas del mismo grupo por clasificación de actividad " + Chr(13) + "¿Está seguro que desea eliminar la actividad?", vbQuestion, "No", "Sí")
        If r = 2 Then
            ancora.destruyeAsignacion IDASIGNA_CAMBIANDO
            interface.MessageDlg "Proceso terminado", "Actividad eliminada satisfactoriamente", vbInformation, "Aceptar"
            eliminada = True
            Hide
        End If
    
    End Sub

