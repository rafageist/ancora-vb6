VERSION 5.00
Object = "{6B7E6392-850A-101B-AFC0-4210102A8DA7}#1.3#0"; "Comctl32.ocx"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "Mscomctl.ocx"
Begin VB.Form frmDatosActividadesSinAsignar
   Caption         =   "Actividades sin asignar"
   ClientHeight    =   5685
   ClientLeft      =   60
   ClientTop       =   750
   ClientWidth     =   6060
   Icon            =   "ancora_goh_traditional_frmDatosActividadesSinAsignar.frx":0000
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   NegotiateMenus  =   0   'False
   ScaleHeight     =   5685
   ScaleWidth      =   6060
   Visible         =   0   'False
   WindowState     =   2  'Maximized
   Begin ComctlLib.StatusBar StatusBar
      Align           =   2  'Align Bottom
      Height          =   375
      Left            =   0
      TabIndex        =   4
      Top             =   5310
      Width           =   6060
      _ExtentX        =   10689
      _ExtentY        =   661
      SimpleText      =   ""
      _Version        =   327682
      BeginProperty Panels {0713E89E-850A-101B-AFC0-4210102A8DA7}
         NumPanels       =   1
         BeginProperty Panel1 {0713E89F-850A-101B-AFC0-4210102A8DA7}
            Object.Width           =   15875
            MinWidth        =   15875
            Object.Tag             =   ""
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.ListView lvwActSinGenerar
      Height          =   2055
      Left            =   120
      TabIndex        =   1
      ToolTipText     =   "Estas actividades no fueron ubicadas o generadas"
      Top             =   3120
      Width           =   5775
      _ExtentX        =   10186
      _ExtentY        =   3625
      View            =   3
      LabelEdit       =   1
      LabelWrap       =   -1  'True
      HideSelection   =   0   'False
      FullRowSelect   =   -1  'True
      GridLines       =   -1  'True
      _Version        =   393217
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      BorderStyle     =   1
      Appearance      =   1
      NumItems        =   7
      BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628}
         Text            =   "Asignatura"
         Object.Width           =   2540
      EndProperty
      BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628}
         SubItemIndex    =   1
         Text            =   "Especialidad"
         Object.Width           =   2540
      EndProperty
      BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628}
         SubItemIndex    =   2
         Text            =   "Nivel"
         Object.Width           =   2540
      EndProperty
      BeginProperty ColumnHeader(4) {BDD1F052-858B-11D1-B16A-00C0F0283628}
         SubItemIndex    =   3
         Text            =   "Período"
         Object.Width           =   2540
      EndProperty
      BeginProperty ColumnHeader(5) {BDD1F052-858B-11D1-B16A-00C0F0283628}
         SubItemIndex    =   4
         Text            =   "# Actividad"
         Object.Width           =   2540
      EndProperty
      BeginProperty ColumnHeader(6) {BDD1F052-858B-11D1-B16A-00C0F0283628}
         SubItemIndex    =   5
         Text            =   "Clasif. Act."
         Object.Width           =   2540
      EndProperty
      BeginProperty ColumnHeader(7) {BDD1F052-858B-11D1-B16A-00C0F0283628}
         SubItemIndex    =   6
         Text            =   "Brigadas que faltan"
         Object.Width           =   2540
      EndProperty
   End
   Begin MSComctlLib.ImageList ImageList1
      Left            =   5280
      Top             =   0
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
            Picture         =   "ancora_goh_traditional_frmDatosActividadesSinAsignar.frx":08CA
            Key             =   ""
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628}
            Picture         =   "ancora_goh_traditional_frmDatosActividadesSinAsignar.frx":15C4
            Key             =   ""
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.ListView lvwActRechazadas
      Height          =   2415
      Left            =   120
      TabIndex        =   0
      ToolTipText     =   "Actividades rechazadas durante la generación de horarios"
      Top             =   360
      Width           =   5775
      _ExtentX        =   10186
      _ExtentY        =   4260
      View            =   3
      LabelEdit       =   1
      MultiSelect     =   -1  'True
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
      BorderStyle     =   1
      Appearance      =   1
      NumItems        =   11
      BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628}
         Text            =   "Fecha de generacion"
         Object.Width           =   2540
      EndProperty
      BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628}
         SubItemIndex    =   1
         Text            =   "Hora de generacion"
         Object.Width           =   2540
      EndProperty
      BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628}
         SubItemIndex    =   2
         Text            =   "Brigada"
         Object.Width           =   2540
      EndProperty
      BeginProperty ColumnHeader(4) {BDD1F052-858B-11D1-B16A-00C0F0283628}
         SubItemIndex    =   3
         Text            =   "Asignatura"
         Object.Width           =   2540
      EndProperty
      BeginProperty ColumnHeader(5) {BDD1F052-858B-11D1-B16A-00C0F0283628}
         SubItemIndex    =   4
         Text            =   "Período"
         Object.Width           =   2540
      EndProperty
      BeginProperty ColumnHeader(6) {BDD1F052-858B-11D1-B16A-00C0F0283628}
         SubItemIndex    =   5
         Text            =   "# Actividad"
         Object.Width           =   2540
      EndProperty
      BeginProperty ColumnHeader(7) {BDD1F052-858B-11D1-B16A-00C0F0283628}
         SubItemIndex    =   6
         Text            =   "Clasif. Act."
         Object.Width           =   2540
      EndProperty
      BeginProperty ColumnHeader(8) {BDD1F052-858B-11D1-B16A-00C0F0283628}
         SubItemIndex    =   7
         Text            =   "Máx. de Posibles Inicios en el momento de generación"
         Object.Width           =   2540
      EndProperty
      BeginProperty ColumnHeader(9) {BDD1F052-858B-11D1-B16A-00C0F0283628}
         SubItemIndex    =   8
         Text            =   "Rechazos por Restricciones"
         Object.Width           =   2540
      EndProperty
      BeginProperty ColumnHeader(10) {BDD1F052-858B-11D1-B16A-00C0F0283628}
         SubItemIndex    =   9
         Text            =   "Rechazos por falta de profesores"
         Object.Width           =   2540
      EndProperty
      BeginProperty ColumnHeader(11) {BDD1F052-858B-11D1-B16A-00C0F0283628}
         SubItemIndex    =   10
         Text            =   "Rechazos por falta de lugares"
         Object.Width           =   2540
      EndProperty
   End
   Begin VB.Label Label2
      Alignment       =   2  'Center
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "No se ha generado aún..."
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
      Left            =   1965
      TabIndex        =   3
      ToolTipText     =   "Se muestran las actividades que faltan por generar o fijar"
      Top             =   2880
      Width           =   2205
   End
   Begin VB.Label Label1
      Alignment       =   2  'Center
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "No se pudo generar..."
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
      Left            =   2055
      TabIndex        =   2
      ToolTipText     =   "Se muestran las actividades que fueron rechazadas durante la generación y una información para conocer su causa"
      Top             =   0
      Width           =   1905
   End
   Begin VB.Menu mnuOP
      Caption         =   "&Opciones"
      Begin VB.Menu mnuDelSel
         Caption         =   "Eliminar &seleccionada(s)"
         Shortcut        =   {DEL}
      End
      Begin VB.Menu mnuDelAll
         Caption         =   "Eliminar todas"
         Shortcut        =   +{DEL}
      End
      Begin VB.Menu mnuSaveExit
         Caption         =   "&Guardar y terminar"
         Shortcut        =   {F5}
      End
      Begin VB.Menu mnuCerrar
         Caption         =   "&Terminar"
         Shortcut        =   {F11}
      End
   End
   Begin VB.Menu aydua
      Caption         =   "Ayuda"
      Begin VB.Menu contenido
         Caption         =   "Contenido"
         Shortcut        =   ^{F1}
      End
      Begin VB.Menu help1
         Caption         =   "Actividades sin asignar"
         Shortcut        =   {F1}
      End
   End
End
Attribute VB_Name = "frmDatosActividadesSinAsignar"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
'Actividades sin asignar
'Actividades rechazadas durante la generacion y actividades que faltan por generar

Dim termina As Boolean

Private Sub contenido_Click()
     ShowHelp
End Sub

Private Sub Form_Resize()
     Refresca1
End Sub

Private Sub Form_Terminate()
     termina = True
End Sub

Private Sub help1_Click()
     ShowHelp Me.Name
End Sub

Private Sub mnuCerrar_Click()
     Me.Hide
End Sub

Private Sub Form_Activate()
     If termina Then
          Hide
          termina = False
          Exit Sub
     End If

     Refresca1
     refresca
End Sub

Private Sub Form_Unload(Cancel As Integer)   'descarga del formulario
     termina = True
     Me.Hide
End Sub

Private Sub mnuDelAll_Click()
     If Question_Eliminar Then
          ancora.cleanImposibles
          interface.showMsg_ProcesoTerminado
          refresca
     End If

End Sub

Private Sub mnuDelSel_Click()
     Dim i As Long
     If itemPos = 0 Then Exit Sub
     If Question_Eliminar Then
10

          For i = 1 To lvwActRechazadas.ListItems.Count
               If lvwActRechazadas.ListItems.Item(i).Selected Then
                    ancora.deleteImposible i
                    lvwActRechazadas.ListItems.Remove i
                    GoTo 10
               End If

          Next

          interface.showMsg_ProcesoTerminado
     End If
End Sub

Private Sub mnuSaveExit_Click()
     ancora.Save
     Hide
End Sub

Public Function itemPos() As Long
     Dim i As Long
     For i = 1 To lvwActRechazadas.ListItems.Count
          If lvwActRechazadas.ListItems.Item(i).Selected Then
               itemPos = i
               Exit Function
          End If

     Next
End Function

Public Sub refresca()
     termina = False
     interface.filllvwImposibles lvwActRechazadas
     interface.filllvwActividadesSinGenerar lvwActSinGenerar
     showCantidad
End Sub

Public Sub showCantidad()
     StatusBar.Panels(1).Text = interface.getRS_TotalActSinGenerar
End Sub

Public Sub Refresca1()

     With Label1
          .Top = 0
          .Left = 0
          .Width = Me.Width
          .Height = 300
     End With

     With lvwActRechazadas
          .Top = Label1.Height + Label1.Top
          .Left = 0
          .Height = (Me.Height / 2) - 500
          .Width = Me.Width - 200
     End With

     With Label2
          .Top = lvwActRechazadas.Top + lvwActRechazadas.Height
          .Left = 0
          .Width = Me.Width
          .Height = 300
     End With

     With lvwActSinGenerar
          .Top = Label2.Top + Label2.Height
          .Left = 0
          .Width = Me.Width - 200
          .Height = Me.Height - lvwActRechazadas.Height - Label1.Height - Label2.Height - 700
     End With

End Sub