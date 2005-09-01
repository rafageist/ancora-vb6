VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "Mscomctl.ocx"
Begin VB.Form frmReportesAnalizaRestricciones
   Caption         =   "Análisis de las restricciones"
   ClientHeight    =   3765
   ClientLeft      =   60
   ClientTop       =   750
   ClientWidth     =   7590
   Icon            =   "ancora_goh_traditional_frmReportesAnalizaRestricciones.frx":0000
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   ScaleHeight     =   3765
   ScaleWidth      =   7590
   WindowState     =   2  'Maximized
   Begin MSComctlLib.ImageList ImageList1
      Left            =   5520
      Top             =   0
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
            Picture         =   "ancora_goh_traditional_frmReportesAnalizaRestricciones.frx":030A
            Key             =   ""
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628}
            Picture         =   "ancora_goh_traditional_frmReportesAnalizaRestricciones.frx":0BE4
            Key             =   ""
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628}
            Picture         =   "ancora_goh_traditional_frmReportesAnalizaRestricciones.frx":1036
            Key             =   ""
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628}
            Picture         =   "ancora_goh_traditional_frmReportesAnalizaRestricciones.frx":1870
            Key             =   ""
         EndProperty
         BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628}
            Picture         =   "ancora_goh_traditional_frmReportesAnalizaRestricciones.frx":3782
            Key             =   ""
         EndProperty
         BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628}
            Picture         =   "ancora_goh_traditional_frmReportesAnalizaRestricciones.frx":405C
            Key             =   ""
         EndProperty
         BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628}
            Picture         =   "ancora_goh_traditional_frmReportesAnalizaRestricciones.frx":A8BE
            Key             =   ""
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.ListView lvwDetail
      CausesValidation=   0   'False
      Height          =   3135
      Left            =   -3600
      TabIndex        =   0
      Top             =   -360
      Width           =   7335
      _ExtentX        =   12938
      _ExtentY        =   5530
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
      NumItems        =   6
      BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628}
         Text            =   "Información"
         Object.Width           =   2117
      EndProperty
      BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628}
         SubItemIndex    =   1
         Text            =   "Identificación"
         Object.Width           =   8819
      EndProperty
      BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628}
         SubItemIndex    =   2
         Text            =   "Descripción"
         Object.Width           =   2540
      EndProperty
      BeginProperty ColumnHeader(4) {BDD1F052-858B-11D1-B16A-00C0F0283628}
         SubItemIndex    =   3
         Text            =   "Períodos"
         Object.Width           =   2540
      EndProperty
      BeginProperty ColumnHeader(5) {BDD1F052-858B-11D1-B16A-00C0F0283628}
         SubItemIndex    =   4
         Text            =   "Total de restricciones"
         Object.Width           =   2540
      EndProperty
      BeginProperty ColumnHeader(6) {BDD1F052-858B-11D1-B16A-00C0F0283628}
         SubItemIndex    =   5
         Text            =   "Porcentaje de restricción"
         Object.Width           =   2540
      EndProperty
   End
   Begin VB.Menu opciones
      Caption         =   "Opciones"
      Begin VB.Menu restricc
         Caption         =   "Ver y modificar restricciones"
         Shortcut        =   {F2}
      End
      Begin VB.Menu resumen
         Caption         =   "Resumen"
      End
      Begin VB.Menu guardar
         Caption         =   "Guardar y terminar"
         Shortcut        =   {F5}
      End
      Begin VB.Menu terminar
         Caption         =   "Terminar"
         Shortcut        =   {F11}
      End
   End
   Begin VB.Menu ayuda
      Caption         =   "Ayuda"
      Begin VB.Menu contenido
         Caption         =   "Contenido"
         Shortcut        =   +{F1}
      End
      Begin VB.Menu help
         Caption         =   "Análisis de las restricciones"
         Shortcut        =   {F1}
      End
   End
End
Attribute VB_Name = "frmReportesAnalizaRestricciones"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
     Option Explicit
     '@module_name = Análisis de las restricciones
     '@module_type = form
     '@module_description = detalles de las restricciones por objetos

     Private Sub lvwDetail_ColumnClick(ByVal ColumnHeader As MSComctlLib.ColumnHeader)
     'la columna de la tabla, hace que se ordenen las filas por el criterio
          Dim k As Long, inter As Boolean, i As Long, j As Long

          For i = 1 To cantPercentRestricc - 1

               For j = i + 1 To cantPercentRestricc
                    inter = False

                    Select Case ColumnHeader.Index
                         Case 1: If PercentRestricc(idPercentRestricc(i)).dato > PercentRestricc(idPercentRestricc(j)).dato Then inter = True
                         Case 2: If PercentRestricc(idPercentRestricc(i)).id > PercentRestricc(idPercentRestricc(j)).id Then inter = True
                         Case 4: If PercentRestricc(idPercentRestricc(i)).idper > PercentRestricc(idPercentRestricc(j)).idper Then inter = True
                         Case 5: If PercentRestricc(idPercentRestricc(i)).parte > PercentRestricc(idPercentRestricc(j)).parte Then inter = True
                    End Select

                    If inter Then
                         k = idPercentRestricc(i)
                         idPercentRestricc(i) = idPercentRestricc(j)
                         idPercentRestricc(j) = k
                    End If

               Next

          Next

          refre
     End Sub

     Private Sub resumen_Click()
     'mostrar resumen de las restricciones
          CreaResumenRestricc
     End Sub

     Private Sub terminar_Click()
          Me.Hide
     End Sub

     Private Sub contenido_Click()
          ShowHelp
     End Sub

     Private Sub help_Click()
          ShowHelp Me.Name
     End Sub

     Private Sub lvwDetail_DblClick()   'doble click en una fila de la tabla
          restricc_Click
     End Sub

     Private Sub guardar_Click()
          GuardarTodo
          Me.Hide
     End Sub

     Private Sub restricc_Click()
     'mostrar y modificar restricciones del objeto(fila) seleccionado

          With PercentRestricc(lvwDetail.SelectedItem.Index)

               Select Case .dato
                    Case dPERIODO:   interface.GoKernelRestricciones 1, .id, "Restricciones de Período: " + ancora.periodos(.id).id, ancora.periodos(.id).id
                    Case dESPECIALIDAD:   interface.GoKernelRestricciones 8, .id, "Restricciones de la Especialidad: " + Especialidad(.id).id, ancora.periodos(.idper).id
                    Case dCLASIF:   interface.GoKernelRestricciones 2, .id, "Restricciones de la Clasificación de actividades: " + clasif(.id).comun.id, ancora.periodos(.idper).id
                    Case dBRIGADA:   interface.GoKernelRestricciones 3, .id, "Restricciones de la Brigada: " + Brigada(.id).comun.id, ancora.periodos(.idper).id
                    Case dASIG:   interface.GoKernelRestricciones 7, .id, "Restricciones de la Asignatura: " + asig(.id).comun.id, ancora.periodos(.idper).id
                    Case dPROFE:   interface.GoKernelRestricciones 4, .id, "Restricciones del Profesor: " + profe(.id).id, ancora.periodos(.idper).id
                    Case dLUGAR:   interface.GoKernelRestricciones 5, .id, "Restricciones del Lugar: " + lugar(.id).id, ancora.periodos(.idper).id
               End Select

          End With

     End Sub

     Private Sub Form_Activate()
          ancora.AnalisisPrecentRestricc
          refre
     End Sub

     Private Sub Form_Resize()

          On Error Resume Next 'ignorar errores en tiempo de ejecución

          lvwDetail.Top = 0
          lvwDetail.Left = 0
          lvwDetail.Height = Me.Height - 500
          lvwDetail.Width = Me.Width - 200
     End Sub

     Public Sub refre()  'refrescamiento
          Dim i As Long, ii As Long, a As String
          Dim b As String, c As String, p As String, j As Long
          lvwDetail.ListItems.Clear
          lvwDetail.SmallIcons = Me.ImageList1

          For j = 1 To cantPercentRestricc
               lvwDetail.ListItems.Add , , "", , 0
          Next

          For j = 1 To cantPercentRestricc
               i = idPercentRestricc(j)

               With PercentRestricc(i)

                    Select Case .dato
                         Case dPERIODO:
                              c = "Período"
                              a = Trunca(ancora.periodos(.id).id)
                              b = Trunca(ancora.periodos(.id).descrip)
                              ii = 1
                         Case dESPECIALIDAD:
                              c = "Especialidad"
                              a = Trunca(Especialidad(.id).id)
                              b = Trunca(Especialidad(.id).descrip)
                              ii = 2
                         Case dCLASIF:
                              c = "Clasificación de actividad"
                              a = Trunca(clasif(.id).comun.id)
                              b = Trunca(clasif(.id).comun.descrip)
                              ii = 3
                         Case dBRIGADA:
                              c = "Brigada"
                              a = Trunca(Brigada(.id).comun.id)
                              b = Trunca(Brigada(.id).comun.descrip)
                              ii = 4
                         Case dASIG:
                              c = "Asignatura"
                              a = Trunca(asig(.id).comun.id)
                              b = Trunca(asig(.id).comun.descrip)
                              ii = 5
                         Case dPROFE:
                              c = "Profesor"
                              a = Trunca(profe(.id).id)
                              b = Trunca(profe(.id).descrip)
                              ii = 6
                         Case dLUGAR:
                              c = "Lugar"
                              a = Trunca(lugar(.id).id)
                              b = Trunca(lugar(.id).descrip)
                              ii = 7
                    End Select

                    If .dato = dPERIODO Then p = "" Else p = "(" + Trunca(ancora.periodos(.idper).id) + ")" + Trunca(ancora.periodos(.idper).descrip)
                    lvwDetail.ListItems(j).Text = c
                    lvwDetail.ListItems(j).SmallIcon = ii
                    lvwDetail.ListItems(j).ListSubItems.Add , , a
                    lvwDetail.ListItems(j).ListSubItems.Add , , b
                    lvwDetail.ListItems(j).ListSubItems.Add , , p
                    lvwDetail.ListItems(j).ListSubItems.Add , , Str(.parte)
                    lvwDetail.ListItems(j).ListSubItems.Add , , Str(Int(.parte * 100 / (IGeneral.cd * IGeneral.ct))) + " %"
               End With

          Next

     End Sub

