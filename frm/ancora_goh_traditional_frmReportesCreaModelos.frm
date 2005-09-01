VERSION 5.00
Object = "{8E27C92E-1264-101C-8A2F-040224009C02}#7.0#0"; "MSCAL.OCX"
Object = "{0002E550-0000-0000-C000-000000000046}#1.1#0"; "OWC10.dll"
Begin VB.Form frmReportesCreaModelos 
   Caption         =   "Confeccionando modelos"
   ClientHeight    =   8160
   ClientLeft      =   3420
   ClientTop       =   1815
   ClientWidth     =   11880
   Icon            =   "ancora_goh_traditional_frmReportesCreaModelos.frx":0000
   LinkTopic       =   "Form2"
   ScaleHeight     =   8160
   ScaleWidth      =   11880
   Visible         =   0   'False
   WindowState     =   2  'Maximized
   Begin VB.Frame Frame1 
      Height          =   6615
      Left            =   1800
      TabIndex        =   0
      Top             =   840
      Visible         =   0   'False
      Width           =   9375
      Begin VB.CommandButton Command2 
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
         Left            =   7920
         TabIndex        =   35
         Top             =   6120
         Width           =   1215
      End
      Begin VB.CommandButton Command1 
         Caption         =   "Aceptar"
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
         TabIndex        =   38
         Top             =   6120
         Width           =   1215
      End
      Begin VB.CommandButton Command3 
         Caption         =   "Alternar períodos"
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
         Left            =   2280
         TabIndex        =   37
         Top             =   5280
         Width           =   1815
      End
      Begin VB.CommandButton casModelo 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         Height          =   615
         Index           =   24
         Left            =   3360
         Style           =   1  'Graphical
         TabIndex        =   34
         Top             =   4560
         Width           =   735
      End
      Begin VB.CommandButton casModelo 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         Height          =   615
         Index           =   23
         Left            =   2640
         Style           =   1  'Graphical
         TabIndex        =   33
         Top             =   4560
         Width           =   735
      End
      Begin VB.CommandButton casModelo 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         Height          =   615
         Index           =   22
         Left            =   1920
         Style           =   1  'Graphical
         TabIndex        =   32
         Top             =   4560
         Width           =   735
      End
      Begin VB.CommandButton casModelo 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         Height          =   615
         Index           =   21
         Left            =   1200
         Style           =   1  'Graphical
         TabIndex        =   31
         Top             =   4560
         Width           =   735
      End
      Begin VB.CommandButton casModelo 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         Height          =   615
         Index           =   20
         Left            =   480
         Style           =   1  'Graphical
         TabIndex        =   30
         Top             =   4560
         Width           =   735
      End
      Begin VB.CommandButton casModelo 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         Height          =   615
         Index           =   19
         Left            =   3360
         Style           =   1  'Graphical
         TabIndex        =   29
         Top             =   3960
         Width           =   735
      End
      Begin VB.CommandButton casModelo 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         Height          =   615
         Index           =   18
         Left            =   2640
         Style           =   1  'Graphical
         TabIndex        =   28
         Top             =   3960
         Width           =   735
      End
      Begin VB.CommandButton casModelo 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         Height          =   615
         Index           =   17
         Left            =   1920
         Style           =   1  'Graphical
         TabIndex        =   27
         Top             =   3960
         Width           =   735
      End
      Begin VB.CommandButton casModelo 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         Height          =   615
         Index           =   16
         Left            =   1200
         Style           =   1  'Graphical
         TabIndex        =   26
         Top             =   3960
         Width           =   735
      End
      Begin VB.CommandButton casModelo 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         Height          =   615
         Index           =   15
         Left            =   480
         Style           =   1  'Graphical
         TabIndex        =   25
         Top             =   3960
         Width           =   735
      End
      Begin VB.CommandButton casModelo 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         Height          =   615
         Index           =   14
         Left            =   3360
         Style           =   1  'Graphical
         TabIndex        =   24
         Top             =   3360
         Width           =   735
      End
      Begin VB.CommandButton casModelo 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         Height          =   615
         Index           =   13
         Left            =   2640
         Style           =   1  'Graphical
         TabIndex        =   23
         Top             =   3360
         Width           =   735
      End
      Begin VB.CommandButton casModelo 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         Height          =   615
         Index           =   12
         Left            =   1920
         Style           =   1  'Graphical
         TabIndex        =   22
         Top             =   3360
         Width           =   735
      End
      Begin VB.CommandButton casModelo 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         Height          =   615
         Index           =   11
         Left            =   1200
         Style           =   1  'Graphical
         TabIndex        =   21
         Top             =   3360
         Width           =   735
      End
      Begin VB.CommandButton casModelo 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         Height          =   615
         Index           =   10
         Left            =   480
         Style           =   1  'Graphical
         TabIndex        =   20
         Top             =   3360
         Width           =   735
      End
      Begin VB.CommandButton casModelo 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         Height          =   615
         Index           =   9
         Left            =   3360
         Style           =   1  'Graphical
         TabIndex        =   9
         Top             =   2760
         Width           =   735
      End
      Begin VB.CommandButton casModelo 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         Height          =   615
         Index           =   8
         Left            =   2640
         Style           =   1  'Graphical
         TabIndex        =   19
         Top             =   2760
         Width           =   735
      End
      Begin VB.CommandButton casModelo 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         Height          =   615
         Index           =   7
         Left            =   1920
         Style           =   1  'Graphical
         TabIndex        =   18
         Top             =   2760
         Width           =   735
      End
      Begin VB.CommandButton casModelo 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         Height          =   615
         Index           =   6
         Left            =   1200
         Style           =   1  'Graphical
         TabIndex        =   17
         Top             =   2760
         Width           =   735
      End
      Begin VB.CommandButton casModelo 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         Height          =   615
         Index           =   5
         Left            =   480
         Style           =   1  'Graphical
         TabIndex        =   16
         Top             =   2760
         Width           =   735
      End
      Begin VB.CommandButton casModelo 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         Height          =   615
         Index           =   4
         Left            =   3360
         Style           =   1  'Graphical
         TabIndex        =   10
         Top             =   2160
         Width           =   735
      End
      Begin VB.CommandButton casModelo 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         Height          =   615
         Index           =   3
         Left            =   2640
         Style           =   1  'Graphical
         TabIndex        =   11
         Top             =   2160
         Width           =   735
      End
      Begin VB.CommandButton casModelo 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         Height          =   615
         Index           =   2
         Left            =   1920
         Style           =   1  'Graphical
         TabIndex        =   12
         Top             =   2160
         Width           =   735
      End
      Begin VB.CommandButton casModelo 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         Height          =   615
         Index           =   1
         Left            =   1200
         Style           =   1  'Graphical
         TabIndex        =   13
         Top             =   2160
         Width           =   735
      End
      Begin VB.CommandButton casModelo 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         Height          =   615
         Index           =   0
         Left            =   480
         Style           =   1  'Graphical
         TabIndex        =   14
         Top             =   2160
         Width           =   735
      End
      Begin VB.ComboBox cboPer 
         Height          =   315
         Left            =   2040
         Style           =   2  'Dropdown List
         TabIndex        =   8
         Top             =   1680
         Width           =   2295
      End
      Begin VB.ComboBox cboItem 
         Height          =   315
         Left            =   3600
         Style           =   2  'Dropdown List
         TabIndex        =   7
         Top             =   840
         Width           =   2655
      End
      Begin MSACAL.Calendar Calendar1 
         Height          =   3255
         Left            =   4920
         TabIndex        =   4
         Top             =   1920
         Width           =   4215
         _Version        =   524288
         _ExtentX        =   7435
         _ExtentY        =   5741
         _StockProps     =   1
         BackColor       =   14737632
         Year            =   2006
         Month           =   5
         Day             =   9
         DayLength       =   1
         MonthLength     =   1
         DayFontColor    =   0
         FirstDay        =   1
         GridCellEffect  =   0
         GridFontColor   =   10485760
         GridLinesColor  =   -2147483632
         ShowDateSelectors=   -1  'True
         ShowDays        =   -1  'True
         ShowHorizontalGrid=   -1  'True
         ShowTitle       =   -1  'True
         ShowVerticalGrid=   -1  'True
         TitleFontColor  =   10485760
         ValueIsNull     =   0   'False
         BeginProperty DayFont {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         BeginProperty GridFont {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         BeginProperty TitleFont {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   12
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
      End
      Begin VB.OptionButton Option3 
         Caption         =   "Horairo de profesores"
         ForeColor       =   &H00808000&
         Height          =   375
         Left            =   6720
         TabIndex        =   3
         Top             =   360
         Width           =   1935
      End
      Begin VB.OptionButton Option2 
         Caption         =   "Modelo P4 - Horario de brigadas"
         ForeColor       =   &H00808000&
         Height          =   375
         Left            =   3240
         TabIndex        =   2
         Top             =   360
         Width           =   3015
      End
      Begin VB.OptionButton Option1 
         Caption         =   "Modelo P3 - Horario de lugares"
         ForeColor       =   &H00808000&
         Height          =   375
         Left            =   480
         TabIndex        =   1
         Top             =   360
         Width           =   2655
      End
      Begin VB.Label Label2 
         Alignment       =   2  'Center
         Caption         =   "Generar modelo"
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
         Left            =   3960
         TabIndex        =   36
         Top             =   120
         Width           =   1815
      End
      Begin VB.Line Line1 
         BorderColor     =   &H80000010&
         X1              =   120
         X2              =   9240
         Y1              =   6000
         Y2              =   6000
      End
      Begin VB.Shape Shape2 
         BorderColor     =   &H80000010&
         Height          =   1095
         Left            =   120
         Top             =   240
         Width           =   9135
      End
      Begin VB.Label labPeriodo 
         BackStyle       =   0  'Transparent
         Caption         =   "Periodo de la casilla"
         Height          =   255
         Left            =   360
         TabIndex        =   15
         Top             =   1680
         Width           =   2175
      End
      Begin VB.Shape Shape1 
         BackStyle       =   1  'Opaque
         BorderColor     =   &H80000010&
         FillColor       =   &H0080FFFF&
         Height          =   4455
         Left            =   120
         Top             =   1440
         Width           =   4455
      End
      Begin VB.Label labItem 
         AutoSize        =   -1  'True
         Caption         =   "Item"
         ForeColor       =   &H00000000&
         Height          =   195
         Left            =   2880
         TabIndex        =   6
         Top             =   840
         Width           =   300
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "A partir de la fecha..."
         ForeColor       =   &H00400000&
         Height          =   255
         Left            =   6240
         TabIndex        =   5
         Top             =   1560
         Width           =   1695
      End
      Begin VB.Shape Shape3 
         BackStyle       =   1  'Opaque
         BorderColor     =   &H80000010&
         FillColor       =   &H0080FFFF&
         Height          =   4455
         Left            =   4680
         Top             =   1440
         Width           =   4575
      End
   End
   Begin OWC10.Spreadsheet Spreadsheet1 
      Height          =   7335
      Left            =   120
      OleObjectBlob   =   "ancora_goh_traditional_frmReportesCreaModelos.frx":0442
      TabIndex        =   39
      Top             =   120
      Width           =   9375
   End
   Begin VB.Menu mnuOpciones 
      Caption         =   "&Modelo"
      Begin VB.Menu mnuGuardar 
         Caption         =   "&Guardar"
         Shortcut        =   {F5}
      End
      Begin VB.Menu mnuGuardarComo 
         Caption         =   "Guardar &como"
         Shortcut        =   {F6}
      End
      Begin VB.Menu mnuExcel 
         Caption         =   "&Abrir en Microsoft Excel"
         Shortcut        =   {F7}
      End
      Begin VB.Menu mnuGo 
         Caption         =   "Generar &modelos..."
         Shortcut        =   {F8}
      End
      Begin VB.Menu mnuCerrar 
         Caption         =   "&Terminar"
         Shortcut        =   {F11}
      End
   End
   Begin VB.Menu mnuHoja 
      Caption         =   "&Hoja"
      Begin VB.Menu mnuAddSheet 
         Caption         =   "&Agregar"
         Shortcut        =   ^A
      End
      Begin VB.Menu mnuDelSheet 
         Caption         =   "&Eliminar"
         Shortcut        =   ^X
      End
      Begin VB.Menu mnuChangeName 
         Caption         =   "&Cambiar nombre"
         Shortcut        =   ^N
      End
   End
End
Attribute VB_Name = "frmReportesCreaModelos"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"489BC20002D1"
Option Explicit
Dim alternando As Boolean
Private colModel As Long
Private filModel As Long
Dim modoModelo As Long
Dim fichero As String
Dim coloresPer() As Long
Public Sub CalculaColoresPer()
    Dim i As Long

    For i = 1 To ancora.periodos.Count
        ReDim Preserve coloresPer(i)
        coloresPer(i) = RGB(100 + Int(Rnd * 155), 100 + Int(Rnd * 155), 100 + Int(Rnd * 155))
    Next

End Sub

Private Sub Form_Load()
    'interface.SkinFor Me
End Sub

Private Sub mnuCerrar_Click()
    Hide
End Sub

Private Sub Command2_Click()
    Frame1.Visible = False
End Sub

Public Sub RefrescaCasillasPeriodos()
    Dim i As Long
    Dim ix As Long
    Dim k As Long, fila As Long, col As Long

    For i = 0 To 24
        k = i + 1
        fila = Int(((k - 1) / 5) + 1)
        col = Int((fila - 1) * 5 + 1)
        col = k - col + 1
        casModelo(i).BackColor = coloresPer(reports.getMatrixPer(fila, col))
    Next

End Sub

Private Sub casModelo_Click(index As Integer)
    Dim k As Long, fila As Long, col As Long
    Dim i As Long

    For i = 0 To 24
        casModelo(i).BackColor = vbWhite
    Next

    casModelo(index).BackColor = vbYellow
    k = index + 1
    fila = Int(((k - 1) / 5) + 1)
    col = Int((fila - 1) * 5 + 1)
    col = k - col + 1
    reports.setMatrixPer fila, col, cboPer.ListIndex + 1
    If cboPer.ListIndex > -1 Then casModelo(index).Caption = UCase(kernel.utils.trunca(ancora.periodos(cboPer.ListIndex + 1).id))
    filModel = fila
    colModel = col
    RefrescaCasillasPeriodos
End Sub

Private Sub cboPer_Click()
    Dim ind As Long
    If Not alternando Then
        ind = (filModel - 1) * 5 + colModel - 1
        If cboPer.ListIndex > -1 Then casModelo(ind).Caption = UCase(kernel.utils.trunca(ancora.periodos(cboPer.ListIndex + 1).id))
    End If

End Sub

Private Sub Command1_Click()
    Dim fecha As Date, r As Variant, b As String, id As Long, tipo As Long
    If Calendar1.Day = 0 Or Calendar1.Month = 0 Or Calendar1.Year = 0 Then
        interface.MessageDlg "No se puede continuar", "Seleccione la fecha", vbExclamation, "Aceptar"
        Exit Sub
    End If

    fecha = Str(Calendar1.Day) + "/" + Str(Calendar1.Month) + "/" + Str(Calendar1.Year)
    id = cboItem.ListIndex + 1
    tipo = modoModelo
    If Weekday(fecha) = vbMonday Then
10
        r = interface.MessageDlg("Para continuar...", "¿Desea crear el modelo en una hoja nueva?", vbQuestion, "No", "Sí")
        If r = 2 Then
            Spreadsheet1.Sheets.add , Spreadsheet1.Sheets.Count
            Spreadsheet1.Sheets(Spreadsheet1.Sheets.Count).Select
        End If

        Select Case tipo
            Case 1:   b = "Lugar_" + kernel.utils.trunca(lugar(id).id) + "_" + kernel.utils.trunca(lugar(id).descrip)
            Case 2:   b = "Brigada_" + kernel.utils.trunca(Brigada(id).comun.id) + "_" + kernel.utils.trunca(Brigada(id).comun.descrip)
            Case 3:   b = "Profesor_" + kernel.utils.trunca(profe(id).id) + "_" + kernel.utils.trunca(profe(id).descrip)
        End Select

        cambiaNombreHoja b
        Frame1.Visible = False
        Form_Resize
        reports.CreateModel id, tipo, modoModelo, fecha
    Else
        r = interface.MessageDlg("Para continuar...", "Se recomienda seleccionar en la fecha de inicio un Lunes. " + Chr(13) + "¿Desea continuar de todas formas?", vbQuestion, "No", "Sí")
        If r = 2 Then GoTo 10
    End If

End Sub

Private Sub Command3_Click()
    Dim r As Variant
    r = interface.MessageDlg("Alternar períodos", "Esta acción restablecerá el diseño que actual. ¿Está seguro que desea continuar?", vbQuestion, "No", "Sí")
    If r = 2 Then alterna
End Sub

Private Sub Form_Activate()
    Dim i As Long
    cboPer.clear
    colModel = 1
    filModel = 1

    For i = 1 To ancora.periodos.Count
        cboPer.AddItem (ancora.periodos(i).id + "-" + ancora.periodos(i).descrip)
    Next

    CalculaColoresPer
    alterna
End Sub

Private Sub Form_Resize()

    On Error Resume Next

    Spreadsheet1.Top = 0
    Spreadsheet1.Left = 0
    Spreadsheet1.Height = Height - 400 - frmKernelMain.statusBar.Height
    Spreadsheet1.Width = Width - 200
    Frame1.Top = (Height - Frame1.Height) / 2
    Frame1.Left = (Width - Frame1.Width) / 2
End Sub

Private Sub mnuaddSheet_Click()
    Spreadsheet1.Sheets.add , Spreadsheet1.Sheets.Count
    Spreadsheet1.Sheets(Spreadsheet1.Sheets.Count).Select
    mnuChangeName_Click
End Sub

Private Sub mnuChangeName_Click()
    Dim s As String, r As Variant
    r = InputBox("Introduzca el nombre de la hoja y recuerde que no puede contener los caracteres: \/[]*, ni repetir un nombre existente", "Nombre de hoja", s)
    If r = vbCancel Or kernel.utils.trunca(r) = "" Then Exit Sub
    s = r
    cambiaNombreHoja s
End Sub

Private Sub mnuDelSheet_Click()
    If Spreadsheet1.Sheets.Count > 1 Then
        If interface.Question_Eliminar Then Spreadsheet1.ActiveSheet.Delete
    Else
        interface.MessageDlg "Imposible eliminar", "Debe haber almenos una hoja", vbCritical, "Aceptar"
    End If

End Sub

Private Sub mnuExcel_Click()
    interface.MessageDlg "Sistema", "Antes de abrir el documento en Miscrosoft Excel, es necesario guardarlo", vbInformation, "Aceptar"
    Dim sFile As String

    With frmKernelMain.dlgCommonDialog
        .DialogTitle = "Guardar como"
        .CancelError = False
        .FileName = ""
        .Filter = "Documento HTML (*.htm)|*.htm"
        .ShowSave
        If Len(.FileName) = 0 Then
            Exit Sub
        End If

        sFile = .FileName
    End With

    fichero = sFile
    Spreadsheet1.Export sFile, ssExportActionOpenInExcel
End Sub

Private Sub mnugo_Click()
    Frame1.Visible = True
    Option1.value = True
    Form_Resize
End Sub

Private Sub mnuGuardar_Click()
    If fichero = "" Then Exit Sub
    Spreadsheet1.Export fichero, ssExportActionNone
End Sub

Private Sub mnuGuardarComo_Click()
    Dim sFile As String

    With frmKernelMain.dlgCommonDialog
        .DialogTitle = "Guardar como"
        .CancelError = False
        .FileName = ""
        .Filter = "Documento HTML (*.htm)|*.htm"
        .ShowSave
        If Len(.FileName) = 0 Then
            Exit Sub
        End If

        sFile = .FileName
    End With

    fichero = sFile
    Spreadsheet1.Export sFile, ssExportActionNone, ssExportXMLSpreadsheet
End Sub

Private Sub Option1_Click()
    Dim i As Long
    modoModelo = 1
    cboItem.clear

    For i = 1 To ancora.cantLug
        cboItem.AddItem "(" & kernel.utils.trunca(lugar(i).id) & ")" + kernel.utils.trunca(lugar(i).descrip)
    Next

    labItem.Caption = "Lugar"
    cboItem.ListIndex = 0
End Sub

Private Sub Option2_Click()
    Dim i As Long
    modoModelo = 2
    cboItem.clear

    For i = 1 To ancora.cantBrg
        cboItem.AddItem "(" & kernel.utils.trunca(Brigada(i).comun.id) + ") " + kernel.utils.trunca(Brigada(i).comun.descrip)
    Next

    labItem.Caption = "Brigada"
    cboItem.ListIndex = 0
End Sub

Private Sub Option3_Click()
    Dim i As Long
    modoModelo = 3
    cboItem.clear

    For i = 1 To ancora.cantProfe
        cboItem.AddItem "(" & kernel.utils.trunca(profe(i).id) & ") " & kernel.utils.trunca(profe(i).descrip)
    Next

    labItem.Caption = "Profesor"
    cboItem.ListIndex = 0
End Sub

Public Sub alterna()
    Dim j As Long, i As Integer
    alternando = True
    j = 0

    For i = 0 To 24
        j = j + 1
        If j > ancora.periodos.Count Then j = 1
        cboPer.ListIndex = j - 1
        casModelo_Click i
    Next

    RefrescaCasillasPeriodos
    alternando = False
End Sub

Public Sub cambiaNombreHoja(s As String)
    Dim r As Variant

    On Error GoTo errdep

re:     Spreadsheet1.ActiveSheet.Name = s
finish:
    Exit Sub
errdep:
    r = InputBox("El nombre de la hoja no puede contener los caracteres: \/[]*, o ya existe. Por favor introduzca un nombre para la hoja", "Nombre de hoja no valido", s)
    If r = vbCancel Or kernel.utils.trunca(r) = "" Then Exit Sub
    s = r
    Resume re
End Sub

