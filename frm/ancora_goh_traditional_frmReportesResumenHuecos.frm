VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Begin VB.Form frmReportesResumenHuecos 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Resumen de huecos y turnos extremos"
   ClientHeight    =   7575
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   7410
   Icon            =   "ancora_goh_traditional_frmReportesResumenHuecos.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   7575
   ScaleWidth      =   7410
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.Frame frameOpciones 
      Height          =   735
      Left            =   120
      TabIndex        =   4
      Top             =   6600
      Width           =   7215
      Begin VB.CommandButton cmdHuecosComunes 
         Caption         =   "Huecos comunes"
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
         Top             =   240
         Width           =   1695
      End
      Begin VB.CommandButton cmdPrimeraActividad 
         Caption         =   "Primera actividad"
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
         Left            =   1920
         TabIndex        =   7
         Top             =   240
         Width           =   1815
      End
      Begin VB.CommandButton cmdUltimaActividad 
         Caption         =   "Última actividad"
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
         Left            =   3840
         TabIndex        =   6
         Top             =   240
         Width           =   1695
      End
      Begin VB.CommandButton cmdOK 
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
         Left            =   5640
         TabIndex        =   5
         Top             =   240
         Width           =   1455
      End
   End
   Begin VB.ComboBox cboPer 
      Height          =   315
      Left            =   960
      Style           =   2  'Dropdown List
      TabIndex        =   0
      Top             =   120
      Width           =   3135
   End
   Begin MSFlexGridLib.MSFlexGrid flexCasillero 
      Height          =   5895
      Left            =   120
      TabIndex        =   2
      Top             =   600
      Width           =   7215
      _ExtentX        =   12726
      _ExtentY        =   10398
      _Version        =   393216
      BackColorFixed  =   14737632
      GridColor       =   16636865
      Appearance      =   0
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "Luego de analizar, haga doble clic en una casilla para ver los detalles"
      Height          =   495
      Left            =   4440
      TabIndex        =   3
      Top             =   0
      Width           =   2775
   End
   Begin VB.Label Label3 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Período"
      Height          =   195
      Left            =   120
      TabIndex        =   1
      Top             =   120
      Width           =   570
   End
End
Attribute VB_Name = "frmReportesResumenHuecos"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"489BC2330357"
Option Explicit
Dim habilitados() As Boolean

Public Sub refre()  'refrescamiento
    Dim i As Long, j As Long, k As Long

    LimpiaCasillero
    flexCasillero.ToolTipText = "Haga click aquí para ver los detalles de los elementos implicados"
    ReDim habilitados(ancora.ct, ancora.CD)

    For i = 1 To ancora.CD
        For j = 1 To ancora.ct
            habilitados(j, i) = True
            If ResumenHueco(i, j).cantLug <> 0 And ResumenHueco(i, j).cantprof <> 0 And ResumenHueco(i, j).cantBrg <> 0 Then
                flexCasillero.row = j
                flexCasillero.col = i
                flexCasillero.CellBackColor = RGB(100 + Int(Rnd * 150), 100 + Int(Rnd * 150), 100 + Int(Rnd * 150))

                Dim texto As String

                If ResumenHueco(i, j).cantLug <> 0 Then texto = "L: " + Str(ResumenHueco(i, j).cantLug)
                If ResumenHueco(i, j).cantprof <> 0 Then texto = texto + Chr(13) + "P: " + Str(ResumenHueco(i, j).cantprof)
                If ResumenHueco(i, j).cantBrg <> 0 Then texto = texto + Chr(13) + "B: " + Str(ResumenHueco(i, j).cantBrg)

                flexCasillero.TextMatrix(j, i) = texto
            End If
        Next

    Next

End Sub

Private Sub cmdHuecosComunes_Click()
    interface.goResumenhueco cboPer.ListIndex + 1
    refre
End Sub

Private Sub cmdOK_Click()
    Hide
End Sub

Private Sub cmdPrimeraActividad_Click()
    interface.goTurnosExtremos cboPer.ListIndex + 1, 1
    refre
End Sub

Private Sub cmdUltimaActividad_Click()
    interface.goTurnosExtremos cboPer.ListIndex + 1, 2
    refre
End Sub

Private Sub flexCasillero_DblClick()
Dim turno As Long, dia As Long, i As Long
    If flexCasillero.row > 0 And flexCasillero.col > 0 Then
        turno = flexCasillero.row
        dia = flexCasillero.col
        With ResumenHueco(dia, turno)
            If .cantLug <> 0 And .cantprof <> 0 And .cantBrg <> 0 Then
                Dim frm As frmList
                Set frm = New frmList
                frm.Caption = "Listado de los elementos implicados el día " & dia & " en el turno " & turno
                frm.ListView1.ListItems.clear
                frm.ListView1.ColumnHeaders.clear
                frm.ListView1.ColumnHeaders.add , , "Elemento"
                frm.ListView1.View = lvwList

                For i = 1 To .cantBrg
                    Set frm.ListView1.Icons = frm.ImageList1
                    Set frm.ListView1.SmallIcons = frm.ImageList1
                    frm.ListView1.ListItems.add , "B" + kernel.utils.trunca(Brigada(.idbrg(i)).comun.id), "Brigada: " & interface.getRS_Brigada(.idbrg(i)), 3, 3
                Next

                For i = 1 To .cantLug
                    frm.ListView1.ListItems.add , "L" + kernel.utils.trunca(lugar(.idlug(i)).id), "Lugar: " & interface.getRS_Lugar(.idlug(i)), 2, 2
                Next

                For i = 1 To .cantprof
                    frm.ListView1.ListItems.add , "P" + kernel.utils.trunca(profe(.idprof(i)).id), "Profesor: " & interface.getRS_Profe(.idprof(i)), 1, 1
                Next

                frm.Show vbModal
            End If
        End With
    End If
End Sub

Private Sub Form_Activate()
    If ancora.periodos.Count > 0 Then
        interface.fillCboPer cboPer
    Else
        interface.MessageDlg "Algo que hacer...", "No se ha definido los Períodos", vbInformation, "Aceptar"
    End If
End Sub

Public Sub LimpiaCasillero()
Dim i As Long, j As Long
    With flexCasillero
        .Rows = ancora.ct + 1
        .cols = ancora.CD + 1
        For i = 1 To ancora.ct
            For j = 1 To ancora.CD
                .row = i
                .col = j
                .TextMatrix(i, j) = ""
            Next
        Next

        .WordWrap = True

        .ColWidth(0) = 300
        .RowHeight(0) = 300

        For i = 1 To ancora.CD
            .ColWidth(i) = 1000
            .TextMatrix(0, i) = "" & i
        Next
        For i = 1 To ancora.ct
            .RowHeight(i) = 1000
            .TextMatrix(i, 0) = "" & i
        Next

        For i = 1 To ancora.ct
            .row = i
            For j = 1 To ancora.CD
                .col = j
                .CellBackColor = vbWhite
            Next
        Next
    End With
End Sub

Private Sub Form_Load()
    interface.SkinFor Me
End Sub

