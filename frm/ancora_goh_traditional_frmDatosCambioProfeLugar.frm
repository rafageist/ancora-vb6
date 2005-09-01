VERSION 5.00
Begin VB.Form frmDatosCambioProfeLugar 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Cambiando Profesor y/o lugar"
   ClientHeight    =   2115
   ClientLeft      =   45
   ClientTop       =   405
   ClientWidth     =   4425
   Icon            =   "ancora_goh_traditional_frmDatosCambioProfeLugar.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2115
   ScaleWidth      =   4425
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton cmdHelp 
      Caption         =   "Ayuda"
      Height          =   375
      Left            =   2880
      TabIndex        =   6
      Top             =   1560
      Width           =   1215
   End
   Begin VB.CommandButton cmdCancel 
      Caption         =   "Cancelar"
      Height          =   375
      Left            =   1680
      TabIndex        =   5
      Top             =   1560
      Width           =   1095
   End
   Begin VB.CommandButton cmdOK 
      Caption         =   "Aceptar"
      Height          =   375
      Left            =   360
      TabIndex        =   4
      Top             =   1560
      Width           =   1215
   End
   Begin VB.ComboBox cboProfes 
      Height          =   315
      Left            =   120
      Style           =   2  'Dropdown List
      TabIndex        =   1
      ToolTipText     =   "Profesores disponibles para esta actividad"
      Top             =   360
      Width           =   3975
   End
   Begin VB.ComboBox cboLug 
      Appearance      =   0  'Flat
      Height          =   315
      Left            =   120
      Style           =   2  'Dropdown List
      TabIndex        =   0
      ToolTipText     =   "Lugares disponibles para esta actividad"
      Top             =   960
      Width           =   3975
   End
   Begin VB.Line Line1 
      BorderColor     =   &H00FFFFFF&
      X1              =   4320
      X2              =   -720
      Y1              =   1455
      Y2              =   1455
   End
   Begin VB.Line Line2 
      BorderColor     =   &H80000010&
      X1              =   -720
      X2              =   4320
      Y1              =   1440
      Y2              =   1440
   End
   Begin VB.Label Label2 
      BackStyle       =   0  'Transparent
      Caption         =   "Posibles profesores"
      ForeColor       =   &H80000008&
      Height          =   255
      Left            =   120
      TabIndex        =   3
      Top             =   120
      Width           =   1455
   End
   Begin VB.Label Label3 
      BackStyle       =   0  'Transparent
      Caption         =   "Posibles lugares"
      ForeColor       =   &H80000008&
      Height          =   255
      Left            =   120
      TabIndex        =   2
      Top             =   720
      Width           =   1335
   End
End
Attribute VB_Name = "frmDatosCambioProfeLugar"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"489BC2090049"
Option Explicit
'Form Cambios Profe y Lugar

'<!- ATRIBUTOS -!>

'<!- EVENTOS -!>

    Private Sub cmdCancel_Click()
        Hide
    End Sub
    
    Private Sub cmdHelp_Click()
        interface.ShowHelp Name
    End Sub
    
    Private Sub cmdOK_Click()
        Dim r As Variant, i As Long, j As Long, k As Long
        Dim idp As String, idl As String, iper As Long
        Dim a As String, b As String
        If cboProfes.ListIndex = -1 Then interface.MessageDlg "Ignorando su error", "Se mantendrá el mismo profesor", vbInformation, "Aceptar"
        If cboLug.ListIndex = -1 Then interface.MessageDlg "Se mantendrá el mismo lugar", vbInformation, "Aceptar"
        r = interface.MessageDlg("Eliminar", "¿Está seguro que desa cambiar la actividad con este profesor y este lugar?", vbQuestion, "No", "Sí")
        If r = 2 Then
    
            With Asignaciones(IDASIGNA_CAMBIANDO)
                If cboProfes.ListIndex <> -1 And cboLug.ListIndex <> -1 Then
                    a = "idprofe,idlugar"
                    b = profe(Posi_profe.id(cboProfes.ListIndex + 1)).id & "," & lugar(Posi_lug.id(cboLug.ListIndex + 1)).id
                Else
                    a = ""
                    b = ""
                    If cboProfes.ListIndex <> -1 Then
                        a = a + "idprofe,"
                        b = profe(Posi_profe.id(cboProfes.ListIndex + 1)).id & ","
                    End If
    
                    If cboLug.ListIndex <> -1 Then
                        a = a & "idlugar"
                        b = b & lugar(Posi_lug.id(cboLug.ListIndex + 1)).id
                    End If
    
                End If
    
                ancora.updateAsignaciones "idperiodo,idasig,idact,grupo", .idperiodo & "," & .idasig & "," & .idact & "," & ancora.getGrupoAsignacion(IDASIGNA_CAMBIANDO), a, b
            End With
    
            r = interface.MessageDlg("Proceso terminado", "Se hicieron los cambios a esta actividad. ¿Desea guardarlos?", vbQuestion, "No", "Sí")
            If r = 2 Then ancora.GuardarTodo
            Hide
        End If
    
    End Sub
    
    Private Sub Form_Load()
        interface.SkinFor Me
    End Sub

'<!- METODOS -!>

    Sub go(per As Long, asg As Long, act As Long, dia As Long, turno As Long, brg As Long, fija As Boolean)
        Dim temp As TFiltro, gxc As Long, clas As Long, esp As Long
        Dim r As Variant, p As Long, i As Long, j As Long
    
        ancora.updateHash_objects
        ancora.BeginIDX
    
        p = ancora.IndexById(dDESGLOSE, ancora.periodos(per).id, asg)
        clas = ancora.IndexById(dCLASIF, asig(asg).desglose(p).act(act).idclasif, 0)
        esp = ancora.IndexById(dESPECIALIDAD, asig(asg).idesp, 0)
        gxc = ancora.IndexGrupoxClasif(brg, clasif(clas).comun.id)
        ancora.FiltraIDPxAct esp, asig(asg).Nivel, per
        ancora.FiltraIDLxAct esp, asig(asg).Nivel, per
        
        interface.console.Progress "Calculando ... Espere un momento", 0
    
        With MPI_frm
            .listabrg = BrigadasDeGrupo(clas, esp, asig(asg).Nivel, Brigada(brg).GrupoXClasif(gxc).grupo)
            .asg = asg
            .act = act
            .per = per
            .iddesglose = p
            .clas = clas
            .gxc = Brigada(brg).GrupoXClasif(gxc).grupo
            .fija = fija
        End With
    
        cboProfes.clear
        cboLug.clear
        temp = FiltraProfexAct(per, asg, act, gxc)
        temp = FiltraProfeQuePermanece(per, temp, dia, turno, clasif(clas).ct)
        Posi_profe = temp
    
        For i = 1 To temp.cant
            cboProfes.AddItem profe(temp.id(i)).id
        Next
    
        temp = FiltraLugxAct(per, asg, act)
        temp = FiltraLugarQuePermanece(per, temp, dia, turno, clasif(clas).ct)
        Posi_lug = temp
    
        For i = 1 To temp.cant
            cboLug.AddItem lugar(temp.id(i)).id
        Next
    
        DIA_SEL = dia
        TURNO_SEL = turno
        
        cboProfes.Enabled = True
        cboLug.Enabled = True
        If cboProfes.ListCount = 0 And cboLug.ListCount > 0 Then
            cboProfes.Enabled = False
            r = interface.MessageDlg("Cambio de profe y/o lugar", "No se pudo encontrar profesor disponible para este turno pero sí lugar." + Chr$(13) + "¿Desea continuar?", vbQuestion, "No", "Sí")
            If r = 1 Then Exit Sub
        End If
    
        If cboProfes.ListCount > 0 And cboLug.ListCount = 0 Then
            cboLug.Enabled = False
            r = interface.MessageDlg("Cambio de profe y/o lugar", "No se pudo encontrar lugar disponible para este turno pero sí profesor." + Chr$(13) + "¿Desea continuar?", vbQuestion, "No", "Sí")
            If r = 1 Then Exit Sub
        End If
    
        If cboProfes.ListCount = 0 And cboLug.ListCount = 0 Then
            interface.MessageDlg "Cambio de profe y/o lugar", "No se pudo encontrar lugar ni profesor disponible para este turno", vbExclamation, "Aceptar"
            Exit Sub
        End If
    
final:
        Show vbModal
    End Sub
