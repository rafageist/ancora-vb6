VERSION 5.00
Begin VB.Form frmHerramientasRedistribuir 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Redistribuir actividades"
   ClientHeight    =   3420
   ClientLeft      =   45
   ClientTop       =   450
   ClientWidth     =   5760
   ForeColor       =   &H00000000&
   Icon            =   "ancora_goh_traditional_frmHerramientasRedistribuir.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3420
   ScaleWidth      =   5760
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton Command2 
      Caption         =   "Restringir el período en este rango"
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
      Left            =   2520
      TabIndex        =   14
      Top             =   2160
      Width           =   3135
   End
   Begin VB.CommandButton btnCancelar 
      Caption         =   "Cancelar"
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
      Left            =   4200
      TabIndex        =   13
      Top             =   2880
      Width           =   1455
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Redistribuir"
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
      Left            =   2400
      TabIndex        =   12
      Top             =   2880
      Width           =   1695
   End
   Begin VB.CheckBox Check2 
      Caption         =   "Para todos los Niveles"
      Height          =   375
      Left            =   3720
      TabIndex        =   10
      Top             =   720
      Width           =   1815
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Para todas las especialidades"
      Height          =   375
      Left            =   120
      TabIndex        =   9
      Top             =   720
      Width           =   2535
   End
   Begin VB.ComboBox Combo5 
      Height          =   315
      Left            =   480
      Style           =   2  'Dropdown List
      TabIndex        =   8
      Top             =   2160
      Width           =   1455
   End
   Begin VB.ComboBox Combo4 
      Height          =   315
      Left            =   4560
      Style           =   2  'Dropdown List
      TabIndex        =   7
      Top             =   1680
      Width           =   1095
   End
   Begin VB.ComboBox Combo1 
      Height          =   315
      Left            =   120
      Style           =   2  'Dropdown List
      TabIndex        =   2
      Top             =   360
      Width           =   3495
   End
   Begin VB.ComboBox Combo2 
      Height          =   315
      ItemData        =   "ancora_goh_traditional_frmHerramientasRedistribuir.frx":0252
      Left            =   3720
      List            =   "ancora_goh_traditional_frmHerramientasRedistribuir.frx":0268
      Style           =   2  'Dropdown List
      TabIndex        =   1
      Top             =   360
      Width           =   1935
   End
   Begin VB.ComboBox Combo3 
      Height          =   315
      Left            =   840
      Style           =   2  'Dropdown List
      TabIndex        =   0
      Top             =   1200
      Width           =   3135
   End
   Begin VB.Line Line1 
      BorderColor     =   &H00FFFFFF&
      X1              =   0
      X2              =   9000
      Y1              =   2775
      Y2              =   2775
   End
   Begin VB.Line Line2 
      BorderColor     =   &H80000010&
      X1              =   0
      X2              =   9000
      Y1              =   2760
      Y2              =   2760
   End
   Begin VB.Label Label5 
      Alignment       =   2  'Center
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "y"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   195
      Left            =   180
      TabIndex        =   11
      Top             =   2160
      Width           =   135
   End
   Begin VB.Label Label4 
      BackStyle       =   0  'Transparent
      Caption         =   "Todas las actividades comprendidas entre los días"
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
      Left            =   120
      TabIndex        =   6
      Top             =   1680
      Width           =   4575
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Para la especialidad"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   195
      Left            =   120
      TabIndex        =   5
      Top             =   120
      Width           =   1740
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "y el Nivel"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   195
      Left            =   3720
      TabIndex        =   4
      Top             =   120
      Width           =   705
   End
   Begin VB.Label Label3 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Período"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   195
      Left            =   120
      TabIndex        =   3
      Top             =   1200
      Width           =   690
   End
End
Attribute VB_Name = "frmHerramientasRedistribuir"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"489BC22702EC"
Option Explicit

Private Sub btnCancelar_Click()
Hide
End Sub

Private Sub Combo1_Click()
    REDISTRIBUIR_ESP = Combo1.ListIndex + 1
End Sub

Private Sub Combo2_Click()
    REDISTRIBUIR_Nivel = Combo2.ListIndex + 1
End Sub

Private Sub Combo3_Click()
    REDISTRIBUIR_per = Combo3.ListIndex + 1
End Sub

Private Sub Combo4_Click()
    REDISTRIBUIR_dia1 = Combo4.ListIndex + 1
End Sub

Private Sub Combo5_Click()
    REDISTRIBUIR_dia2 = Combo4.ListIndex + 1
End Sub

Private Sub Check1_Click()
    REDISTRIBUIR_chk1 = Check1.value
    If Check1.value = 1 Then Combo1.Enabled = False Else Combo1.Enabled = True
End Sub

Private Sub Check2_Click()
    REDISTRIBUIR_chk2 = Check2.value
    If Check2.value = 1 Then Combo2.Enabled = False Else Combo2.Enabled = True
End Sub

Private Sub Command1_Click()
    Dim i As Long, j As Long, ii As Long, esp As String
    Dim Nivel As Long, ini As Long, k As Long
    Dim espe As TFiltro
    Dim ano As TFiltro
    Dim r As Variant
    ReDim espe.id(ancora.cantEsp)
    ReDim ano.id(6)
    If Check1.value = 1 And Check2.value = 0 Then
        If Combo2.ListIndex = -1 Then
            interface.MessageDlg "No se puede continuar", "Seleccione el Nivel", vbExclamation, "Aceptar"
            Exit Sub
        End If

        espe.cant = ancora.cantEsp

        For i = 1 To ancora.cantEsp
            espe.id(i) = i
            ano.id(i) = Combo2.ListIndex + 1
        Next

    End If

    If Check1.value = 0 And Check2.value = 1 Then
        If Combo1.ListIndex = -1 Then
            interface.MessageDlg "No se puede continuar", "Seleccione la especialidad", vbExclamation, "Aceptar"
            Exit Sub
        End If

        espe.cant = 6

        For i = 1 To ancora.cantNiveles
            espe.id(i) = Combo1.ListIndex + 1
            ano.id(i) = i
        Next

    End If

    If Check1.value = 1 And Check2.value = 1 Then
        espe.cant = 6 * ancora.cantEsp
        ReDim espe.id(espe.cant)
        k = 0

        For i = 1 To ancora.cantNiveles

            For j = 1 To ancora.cantEsp
                k = k + 1
                espe.id(k) = j
                ano.id(k) = i
            Next

        Next

    End If

    If Combo3.ListIndex = -1 Then
        interface.MessageDlg "No se puede continuar", "Seleccione el período", vbExclamation, "Aceptar"
        Exit Sub
    End If

    If Combo4.ListIndex = -1 Then
        interface.MessageDlg "No se puede continuar", "Seleccione el día inicial", vbExclamation, "Aceptar"
        Exit Sub
    End If

    If Combo5.ListIndex = -1 Then
        interface.MessageDlg "No se puede continuar", "Seleccione el día final", vbExclamation, "Aceptar"
        Exit Sub
    End If

    If Check1.value = 0 And Check2.value = 0 Then
        If Combo1.ListIndex = -1 Then
            interface.MessageDlg "No se puede continuar", "Seleccione la especialidad", vbExclamation, "Aceptar"
            Exit Sub
        End If

        If Combo2.ListIndex = -1 Then
            interface.MessageDlg "No se puede continuar", "Seleccione el Nivel", vbExclamation, "Aceptar"
            Exit Sub
        End If

        espe.cant = 1
        ReDim espe.id(1)
        ReDim ano.id(1)
        espe.id(1) = Combo1.ListIndex + 1
        ano.id(1) = Combo2.ListIndex + 1
    End If

    r = interface.MessageDlg("Antes de comenzar...", "Esta acción no se podrá revertir a no ser que salga de la aplicación sin guardar los cambios ¿Está seguro de continuar?", vbQuestion, "No", "Sí")
    If r = 2 Then

        For k = 1 To espe.cant
            interface.console.Progress "Trabajando...", kernel.utils.Porciento(k, espe.cant)
            ini = 1
10

            For i = ini To ancora.cantAsignaciones
                Dim asigna As TActAsignada
                asigna = Asignaciones(i)
                With asigna
                    ii = ancora.IndexById(dASIG, .idasig, 0)
                    If kernel.utils.idigual(asig(ii).idesp, Especialidad(espe.id(k)).id) And asig(ii).Nivel = ano.id(k) And .dia >= Combo4.ListIndex + 1 And .dia <= Combo5.ListIndex + 1 And kernel.utils.idigual(.idperiodo, ancora.periodos(Combo3.ListIndex + 1).id) And Not .fija Then
                        ancora.destruyeAsignacion i
                        ini = i
                        GoTo 10
                    End If

                End With

            Next

        Next

        
        
        If Not ColaDeGeneracion Is Nothing Then Set ColaDeGeneracion = Nothing
        Set ColaDeGeneracion = New TKernel_arrProcesoEnCola
    
        With frmGeneradorGenerar
            interface.fillCboEspecialidades .cboEsp
            interface.fillCboNiveles .cboNivel
            interface.fillCboPer .cboPer
      
        End With

        frmGeneradorGenerar.limpia
        frmGeneradorGenerar.ListView2.ListItems.clear
        For k = 1 To espe.cant
            
            frmGeneradorGenerar.cboEsp.ListIndex = espe.id(k) - 1
            frmGeneradorGenerar.cboNivel.ListIndex = ano.id(k) - 1
            frmGeneradorGenerar.cboPer.ListIndex = Combo3.ListIndex
            frmGeneradorGenerar.agregar
        Next

        interface.MessageDlg "Primera etapa del proceso terminada", "El sistema eliminó todas las actividades que cumplen la condición que usted introdujo. " + Chr(13) + "Los horarios que seleccionó para redistribuir se agregaron a la cola de procesos. " + Chr(13) + "Siga los mismos pasos para generar horarios.", vbInformation, "Aceptar"
        frmGeneradorGenerar.Show vbModal
    End If

End Sub

Public Sub refre()  'refrescamiento
    Dim i As Long
    Combo1.clear
    Combo3.clear
    Combo4.clear
    Combo5.clear

    For i = 1 To ancora.cantEsp
        Combo1.AddItem "(" + kernel.utils.trunca(Especialidad(i).id) + ") " + kernel.utils.trunca(Especialidad(i).descrip)
    Next

    For i = 1 To ancora.periodos.Count
        Combo3.AddItem "(" + kernel.utils.trunca(ancora.periodos(i).id) + ") " + kernel.utils.trunca(ancora.periodos(i).descrip)
    Next

    For i = 1 To ancora.CD
        Combo4.AddItem "" & i
        Combo5.AddItem "" & i
    Next

End Sub

Private Sub Command2_Click()
    Dim i As Long, j As Long
    If Combo3.ListIndex <> -1 And Combo4.ListIndex <> -1 And Combo5.ListIndex <> -1 Then

        For i = Combo4.ListIndex + 1 To Combo5.ListIndex + 1

            For j = 1 To ancora.ct
                ancora.periodos(Combo3.ListIndex + 1).setTimeRequest i, j, True
                'Periodo(Combo3.ListIndex).rest(i, j) = True
            Next

        Next

        interface.MessageDlg "Finalizada la restricción", "Proceso terminado satisfactotiamente", vbInformation, "Aceptar"
    Else
        interface.MessageDlg "Imposible continuar", "Asegúrese de haber seleccionado el período y el intervalo de días", vbExclamation, "Aceptar"
    End If

End Sub

Private Sub Form_Activate()
    refre
    Combo1.ListIndex = REDISTRIBUIR_ESP - 1
    Combo2.ListIndex = REDISTRIBUIR_Nivel - 1
    Combo3.ListIndex = REDISTRIBUIR_per - 1
    Combo4.ListIndex = REDISTRIBUIR_dia1 - 1
    Combo5.ListIndex = REDISTRIBUIR_dia2 - 1
    Check1.value = REDISTRIBUIR_chk1
    Check2.value = REDISTRIBUIR_chk2
End Sub

Private Sub Form_Load()
    interface.SkinFor Me
End Sub
