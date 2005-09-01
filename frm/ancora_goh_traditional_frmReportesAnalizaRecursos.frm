VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmReportesAnalizaRecursos 
   Caption         =   "Analisis de los recursos"
   ClientHeight    =   7170
   ClientLeft      =   60
   ClientTop       =   465
   ClientWidth     =   8175
   Icon            =   "ancora_goh_traditional_frmReportesAnalizaRecursos.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   7170
   ScaleWidth      =   8175
   Begin VB.Frame frameOpciones 
      Height          =   735
      Left            =   120
      TabIndex        =   1
      Top             =   6360
      Width           =   7935
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
         TabIndex        =   3
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
         Left            =   5040
         TabIndex        =   2
         Top             =   240
         Width           =   1335
      End
   End
   Begin MSComctlLib.ImageList ImageList1 
      Left            =   7560
      Top             =   5520
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
            Picture         =   "ancora_goh_traditional_frmReportesAnalizaRecursos.frx":0252
            Key             =   ""
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ancora_goh_traditional_frmReportesAnalizaRecursos.frx":0B2C
            Key             =   ""
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.ListView lvwDetail 
      Height          =   5895
      Left            =   120
      TabIndex        =   0
      Top             =   240
      Width           =   7935
      _ExtentX        =   13996
      _ExtentY        =   10398
      View            =   3
      LabelEdit       =   1
      LabelWrap       =   -1  'True
      HideSelection   =   0   'False
      FullRowSelect   =   -1  'True
      GridLines       =   -1  'True
      _Version        =   393217
      Icons           =   "ImageList1"
      SmallIcons      =   "ImageList1"
      ColHdrIcons     =   "ImageList1"
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      Appearance      =   1
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      NumItems        =   7
      BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         Text            =   "Asignatura"
         Object.Width           =   2540
      EndProperty
      BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   1
         Text            =   "Período"
         Object.Width           =   2540
      EndProperty
      BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   2
         Text            =   "# actividad"
         Object.Width           =   2540
      EndProperty
      BeginProperty ColumnHeader(4) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   3
         Text            =   "Clasificación de actividad"
         Object.Width           =   2540
      EndProperty
      BeginProperty ColumnHeader(5) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   4
         Text            =   "Sin lugar"
         Object.Width           =   2540
      EndProperty
      BeginProperty ColumnHeader(6) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   5
         Text            =   "Sin profesor"
         Object.Width           =   2540
      EndProperty
      BeginProperty ColumnHeader(7) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   6
         Text            =   "Grupos sin profesor"
         Object.Width           =   2540
      EndProperty
   End
End
Attribute VB_Name = "frmReportesAnalizaRecursos"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"489BC20B01F1"
Option Explicit
'Análisis de recursos
'actividades faltantes de recursos

Private Sub cmdAyuda_Click()
    interface.ShowHelp Name
End Sub

Private Sub cmdTerminar_Click()
    Hide
End Sub

'ayuda
Private Sub contenido_Click()
    interface.ShowHelp
End Sub

Private Sub Form_Load()
    interface.SkinFor Me
End Sub

Private Sub Form_Terminate()
    Unload Me
End Sub

Private Sub Form_Activate()
    If Not EstadoApp Then Exit Sub
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
    
End Sub

Sub go(ByRef analisis As TAna_arrRecursos, Optional modal As Variant = 0)

    Dim ite As TAna_Recursos

    With lvwDetail.ListItems
        .clear
        For Each ite In analisis
            .add , , ite.idasig, 1, 1
            .Item(.Count).ListSubItems.add , , ite.idper
            .Item(.Count).ListSubItems.add , , Str(ite.idact)
            .Item(.Count).ListSubItems.add , , ite.idclasif
            .Item(.Count).ListSubItems.add
            .Item(.Count).ListSubItems.add
            If ite.sinLugar Then .Item(.Count).ListSubItems(4).ReportIcon = 2
            If ite.sinProfe Then .Item(.Count).ListSubItems(5).ReportIcon = 2
            .Item(.Count).ListSubItems.add , , ite.gruposSinProfe
        Next
    End With

    Show modal
End Sub

