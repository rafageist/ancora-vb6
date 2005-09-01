VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "Mscomctl.ocx"
Begin VB.Form frmReportesResumenRestricc
   Caption         =   "Resumen del Análisis de las restricciones"
   ClientHeight    =   7275
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   9345
   Icon            =   "ancora_goh_traditional_frmReportesResumenRestricc.frx":0000
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   ScaleHeight     =   7275
   ScaleWidth      =   9345
   WindowState     =   2  'Maximized
   Begin MSComctlLib.ImageList ImageList1
      Left            =   5400
      Top             =   360
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   16
      ImageHeight     =   16
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628}
         NumListImages   =   7
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628}
            Picture         =   "ancora_goh_traditional_frmReportesResumenRestricc.frx":058A
            Key             =   ""
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628}
            Picture         =   "ancora_goh_traditional_frmReportesResumenRestricc.frx":0E64
            Key             =   ""
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628}
            Picture         =   "ancora_goh_traditional_frmReportesResumenRestricc.frx":12B6
            Key             =   ""
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628}
            Picture         =   "ancora_goh_traditional_frmReportesResumenRestricc.frx":1AF0
            Key             =   ""
         EndProperty
         BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628}
            Picture         =   "ancora_goh_traditional_frmReportesResumenRestricc.frx":3A02
            Key             =   ""
         EndProperty
         BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628}
            Picture         =   "ancora_goh_traditional_frmReportesResumenRestricc.frx":42DC
            Key             =   ""
         EndProperty
         BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628}
            Picture         =   "ancora_goh_traditional_frmReportesResumenRestricc.frx":AB3E
            Key             =   ""
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.ListView ListView3
      CausesValidation=   0   'False
      Height          =   6855
      Left            =   0
      TabIndex        =   0
      Top             =   240
      Width           =   9255
      _ExtentX        =   16325
      _ExtentY        =   12091
      View            =   3
      LabelEdit       =   1
      MultiSelect     =   -1  'True
      LabelWrap       =   -1  'True
      HideSelection   =   0   'False
      FullRowSelect   =   -1  'True
      GridLines       =   -1  'True
      TextBackground  =   -1  'True
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
      NumItems        =   4
      BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628}
         Text            =   "Información"
         Object.Width           =   2117
      EndProperty
      BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628}
         SubItemIndex    =   1
         Text            =   "Cantidad con este porciento"
         Object.Width           =   2540
      EndProperty
      BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628}
         SubItemIndex    =   2
         Text            =   "Total de restricciones"
         Object.Width           =   2540
      EndProperty
      BeginProperty ColumnHeader(4) {BDD1F052-858B-11D1-B16A-00C0F0283628}
         SubItemIndex    =   3
         Text            =   "Porcentaje de restricción"
         Object.Width           =   2540
      EndProperty
   End
End
Attribute VB_Name = "frmReportesResumenRestricc"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
     Public Sub refre()  'refrescamiento
          Dim i As Long, ii As Long, a As String
          Dim b As String, c As String, p As String, j As Long
          ListView3.ListItems.Clear
          ListView3.SmallIcons = Me.ImageList1

          For j = 1 To cantResumenRestricc
               ListView3.ListItems.Add , , "", , 0
          Next

          For j = 1 To cantResumenRestricc
               i = j

               With ResumenRestricc(i)

                    Select Case .dato
                         Case dPERIODO:
                              c = "Período"
                              ii = 1
                         Case dESPECIALIDAD:
                              c = "Especialidad"
                              ii = 2
                         Case dCLASIF:
                              c = "Clasificación de actividad"
                              ii = 3
                         Case dBRIGADA:
                              c = "Brigada"
                              ii = 4
                         Case dASIG:
                              c = "Asignatura"
                              ii = 5
                         Case dPROFE:
                              c = "Profesor"
                              ii = 6
                         Case dLUGAR:
                              c = "Lugar"
                              ii = 7
                    End Select

                    ListView3.ListItems(j).Text = c
                    ListView3.ListItems(j).SmallIcon = ii
                    ListView3.ListItems(j).ListSubItems.Add , , Str(.cantidad)
                    ListView3.ListItems(j).ListSubItems.Add , , Str(.parte)
                    ListView3.ListItems(j).ListSubItems.Add , , Str(Int(.parte * 100 / (IGeneral.cd * IGeneral.ct))) + " %"
               End With

          Next

     End Sub

     Private Sub Form_Resize()

          On Error Resume Next 'ignorar errores en tiempo de ejecución

          ListView3.Top = 0
          ListView3.Left = 0
          ListView3.Height = Me.Height - 500
          ListView3.Width = Me.Width - 200
     End Sub


     