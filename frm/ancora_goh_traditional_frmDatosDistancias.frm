VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "Comdlg32.ocx"
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "msflxgrd.ocx"
Begin VB.Form frmDatosDistancias 
   Caption         =   "Costos de traslado entre lugares"
   ClientHeight    =   6045
   ClientLeft      =   60
   ClientTop       =   465
   ClientWidth     =   10185
   Icon            =   "ancora_goh_traditional_frmDatosDistancias.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   6045
   ScaleWidth      =   10185
   StartUpPosition =   2  'CenterScreen
   Begin MSFlexGridLib.MSFlexGrid Tabla 
      Height          =   5175
      Left            =   3840
      TabIndex        =   0
      Top             =   120
      Width           =   6255
      _ExtentX        =   11033
      _ExtentY        =   9128
      _Version        =   393216
      Cols            =   3
      BackColor       =   16777215
      BackColorFixed  =   16761024
      ForeColorFixed  =   0
      BackColorSel    =   8388608
      ForeColorSel    =   16776960
      BackColorBkg    =   12632256
      ScrollTrack     =   -1  'True
      FillStyle       =   1
      GridLines       =   2
      AllowUserResizing=   3
      BorderStyle     =   0
      Appearance      =   0
      GridLineWidth   =   2
      MouseIcon       =   "ancora_goh_traditional_frmDatosDistancias.frx":0CCA
   End
   Begin MSComDlg.CommonDialog cdlg 
      Left            =   1080
      Top             =   1080
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.Shape marcador 
      BorderColor     =   &H000000FF&
      Height          =   615
      Left            =   1680
      Top             =   1080
      Visible         =   0   'False
      Width           =   735
   End
   Begin VB.Line lineas 
      Index           =   0
      Visible         =   0   'False
      X1              =   360
      X2              =   360
      Y1              =   1800
      Y2              =   2400
   End
   Begin VB.Label etiquetas 
      BackStyle       =   0  'Transparent
      Caption         =   "202"
      BeginProperty Font 
         Name            =   "Calibri"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   0
      Left            =   240
      TabIndex        =   1
      Top             =   1560
      Visible         =   0   'False
      Width           =   495
   End
   Begin VB.Image imgLug 
      DragMode        =   1  'Automatic
      Height          =   375
      Index           =   0
      Left            =   120
      Picture         =   "ancora_goh_traditional_frmDatosDistancias.frx":19A4
      Stretch         =   -1  'True
      Top             =   1080
      Visible         =   0   'False
      Width           =   495
   End
   Begin VB.Menu mnuOpciones 
      Caption         =   "Opciones"
      Visible         =   0   'False
      Begin VB.Menu mnuMostrarTabla 
         Caption         =   "Mostrar tabla de distancias"
         Checked         =   -1  'True
      End
      Begin VB.Menu mnuMostrarGrafico 
         Caption         =   "Mostrar gráfico"
      End
      Begin VB.Menu mnusep0 
         Caption         =   "-"
      End
      Begin VB.Menu mnuMostrarLineas 
         Caption         =   "Mostrar líneas"
         Checked         =   -1  'True
      End
      Begin VB.Menu mnuMostrarLineasSeleccionado 
         Caption         =   "Mostrar líneas del lugar seleccionado"
         Checked         =   -1  'True
      End
      Begin VB.Menu mnusep 
         Caption         =   "-"
      End
      Begin VB.Menu mnuImagen 
         Caption         =   "Imagen de fondo"
      End
      Begin VB.Menu mnuQuitarImagen 
         Caption         =   "Quitar imagen"
      End
      Begin VB.Menu mnusep1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuDistribuirAleatoriamente 
         Caption         =   "Distribuir aleatoriamente"
      End
      Begin VB.Menu mnuEstablecerDistancias 
         Caption         =   "Establecer distancias a partir del gráfico"
      End
      Begin VB.Menu mnusep10 
         Caption         =   "-"
      End
      Begin VB.Menu mnuNivelar 
         Caption         =   "Nivelar las distancias"
      End
      Begin VB.Menu mnuNivelarPorciento 
         Caption         =   "Nivelar las distancias con porcientos"
      End
      Begin VB.Menu mnusep2 
         Caption         =   "-"
      End
      Begin VB.Menu mnuGuardarTerminar 
         Caption         =   "Guardar y terminar"
      End
      Begin VB.Menu mnuTerminarSinGuardar 
         Caption         =   "Terminar sin guardar"
      End
   End
End
Attribute VB_Name = "frmDatosDistancias"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"489BC203039E"
Option Explicit

'Form Distancias entre lugares

'<!- ATRIBUTOS -!>

    Dim idlugar As Long
    Dim idlug As Long
    Dim refres As Boolean
    Dim creados As Boolean
    Dim pos As Long

'<!- EVENTOS !->
    
    Private Sub Form_Activate()
        refre
        pos = 1
    End Sub

    Private Sub Form_Load()
        creados = False
        refre
        interface.SkinFor Me
    End Sub
    
    Private Sub Form_Resize()
    
        On Error Resume Next
       
        With tabla
            .Top = 0
            .Left = 0
            .Width = Width - 200
            .Height = Height - 500
        End With
    End Sub

    Private Sub Form_Terminate()
        Unload Me
        creados = False
    End Sub
    
    Private Sub Form_Unload(Cancel As Integer)
        creados = False
    End Sub

    Private Sub form_DragDrop(Source As Control, x As Single, y As Single)
    
        Dim i As Long
        If TypeName(Source) = "Image" Then
            Source.Left = x - Source.Width / 2
            Source.Top = y - Source.Height / 2
            marcador.Visible = False
        
            ancora.getLugaresCoordenadas(lugar(Val(Source.Tag)).id).x = Source.Left
            ancora.getLugaresCoordenadas(lugar(Val(Source.Tag)).id).y = Source.Top
        
            etiquetas(Val(Source.Tag)).Top = Source.Top + imgLug(Val(Source.Tag)).Height
            etiquetas(Val(Source.Tag)).Left = Source.Left
        
            If mnuMostrarLineasSeleccionado.Checked Then pos = Source.index
            refreLines
        End If
    End Sub
    
    Private Sub form_DragOver(Source As Control, x As Single, y As Single, State As Integer)
     form_DragDrop Source, x, y
    End Sub
    
    Private Sub Form_MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)
        marcador.Visible = False
        
        Dim i As Long
        For i = 1 To lineas.Count - 1
            With lineas(i)
                If interface.Pertenece_a_la_linea(.X1, .Y1, .X2, .Y2, x, y) Then
                    .BorderWidth = 2
                    .BorderColor = vbRed
                Else
                    .BorderColor = vbBlack
                    .BorderWidth = 1
                End If
            End With
        Next
    End Sub
    
    Private Sub form_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
        Dim i As Long
        If Button = 2 Then
            PopupMenu mnuOpciones, , x, y
        Else
            If mnuMostrarLineas.Checked And mnuMostrarTabla.Checked = False Then
                For i = 1 To lineas.Count - 1
                    With lineas(i)
                        If interface.Pertenece_a_la_linea(.X1, .Y1, .X2, .Y2, x, y) Then
                            Dim v As Long, r As Variant
                            v = ancora.DistanciaEntre(lugar(pos).id, lugar(Val(.Tag)).id)
                            r = interface.getFromImputBox("Establecer distancia entre lugares", "Distancia entre " & interface.getRS_Lugar(pos) & " y " & interface.getRS_Lugar(Val(.Tag)), "1234567890", "" & v, 6)
                            v = Val(r)
                            ancora.setDistancia lugar(pos).id, lugar(Val(.Tag)).id, v
                            Exit Sub
                        End If
                    End With
                Next
            End If
        End If
    End Sub
    
    Private Sub mnuGuardarTerminar_Click()
        ancora.GuardarTodo
        Hide
    End Sub
    
    Private Sub mnuMostrarGrafico_Click()
        tabla.Visible = False
        mnuMostrarTabla.Checked = False
        mnuMostrarGrafico.Checked = True
    End Sub
    
    Private Sub mnuMostrarTabla_Click()
        Refresca1
        tabla.Visible = True
        mnuMostrarTabla.Checked = True
        mnuMostrarGrafico.Checked = False
    End Sub

    Private Sub mnuNivelar_Click()
        Dim r As Integer
        r = interface.MessageDlg("Se procede a nivelar las distancias", "Esta acción no se podrá revertir. ¿Está seguro que desea proceder?", vbQuestion, "No", "Sí")
        If r = 2 Then
            ancora.NivelarDistancias
            refre
            Refresca1
        End If
    End Sub
    
    Private Sub mnuNivelarPorciento_Click()
        Dim r As Integer
        r = interface.MessageDlg("Se procede a nivelar las distancias por por cientos", "Esta acción nivela las distancias por porcientos con respecto a la distancia más larga, y no se podrá revertir. ¿Está seguro que desea proceder?", vbQuestion, "No", "Sí")
        If r = 2 Then
            ancora.NivelarDistancias True
            Refresca1
        End If
    End Sub
    
    Private Sub mnuTerminarSinGuardar_Click()
        Hide
    End Sub
    
    Private Sub Tabla_KeyDown(KeyCode As Integer, Shift As Integer)
        If KeyCode = 93 Then
            PopupMenu mnuOpciones
            Exit Sub
        End If
        If tabla.row = tabla.col Then Exit Sub
        If KeyCode = 46 Then
            tabla.Text = "0"
            Tabla_KeyPress Asc("0")
        End If
        
    End Sub
    
    Private Sub Tabla_KeyPress(KeyAscii As Integer)
        Dim r As Long, c As Long, a As String
        If tabla.row = tabla.col Then Exit Sub
        If Not refres Then
            If (KeyAscii < Asc("0") Or KeyAscii > Asc("9")) And KeyAscii <> 8 And KeyAscii <> 13 Then Exit Sub
            If KeyAscii <> 13 Then
                If tabla.row > 0 Then
                    If KeyAscii = 8 Then
                        If Len(tabla.Text) > 0 Then
                            tabla.Text = Mid$(tabla.Text, 1, Len(tabla.Text) - 1)
                            tabla.Text = kernel.utils.trunca(Str(Val(tabla.Text)))
                        End If
    
                    Else
                        If Len(tabla.Text) < 6 Then
                            r = tabla.row
                            c = tabla.col
                            a$ = tabla.Text
                            tabla.Text = tabla.Text + Chr(KeyAscii)
                            tabla.Text = kernel.utils.trunca(Str(Val(tabla.Text)))
                            a$ = tabla.Text
                            tabla.row = tabla.col
                            tabla.col = r
                            tabla.Text = a
                            tabla.row = r
                            tabla.col = c
                            ancora.setDistancia lugar(tabla.row).id, lugar(tabla.col).id, Val(tabla.Text)
                        End If
    
                    End If
    
                End If
    
            Else
                If tabla.row < tabla.Rows - 1 Then tabla.row = tabla.row + 1
            End If
    
        End If
    
    End Sub
    
    Private Sub imgLug_MouseMove(index As Integer, Button As Integer, Shift As Integer, x As Single, y As Single)
        If Not marcador.Visible Then
            marcador.Visible = True
            With imgLug(index)
                marcador.Top = .Top - 100
                marcador.Left = .Left - 100
                marcador.Width = .Width + 200
                marcador.Height = .Height + 200
            End With
        End If
    End Sub
    
    Private Sub mnuDistribuirAleatoriamente_Click()
        ReDistribuye
        refre
        Refresca1
    End Sub
    
    Private Sub mnuEstablecerDistancias_Click()
        Dim i As Long, j As Long
        Dim r As Variant
        r = interface.MessageDlg("Establecer distancias automáticamente a partir del gráfico", "Esta acción no se podrá revertir. ¿Está seguro que desea proceder?", vbQuestion, "No", "Sí")
        
        tabla.Enabled = False
        
        If r = 2 Then
        
            For i = 1 To ancora.cantLug - 1
                interface.console.Progress "Calculando distancias a partir del gráfico...", i / ancora.cantLug * 100
                For j = i + 1 To ancora.cantLug
                    DoEvents
                    Dim d As Long
                    d = Sqr(Abs(etiquetas(i).Left - etiquetas(j).Left) ^ 2 + Abs(etiquetas(i).Top - etiquetas(j).Top) ^ 2)
                    ancora.setDistancia lugar(i).id, lugar(j).id, d
                    ancora.setDistancia lugar(j).id, lugar(i).id, d
                    DoEvents
                    tabla.TextMatrix(j, i) = "" & d
                    tabla.TextMatrix(i, j) = "" & d
                Next
            Next
            refre
        End If
        tabla.Enabled = True
        interface.console.Hide
    End Sub
    
    Private Sub mnuImagen_Click()
        On Error GoTo errdep
        With cdlg
            .CancelError = True
            .ShowOpen
            If .FileName <> "" Then Picture = LoadPicture(.FileName)
        End With
    
finish:
        Exit Sub
    
errdep:
        Resume finish
    End Sub
    
    Private Sub mnuMostrarLineas_Click()
        Dim i As Long
        mnuMostrarLineas.Checked = Not mnuMostrarLineas.Checked
        For i = 1 To lineas.Count - 1
             lineas(i).Visible = mnuMostrarLineas.Checked
        Next
    End Sub
    
    Private Sub mnuMostrarLineasSeleccionado_Click()
        mnuMostrarLineasSeleccionado.Checked = Not mnuMostrarLineasSeleccionado.Checked
    End Sub
    
    Private Sub mnuQuitarImagen_Click()
        Set Picture = Nothing
    End Sub
    
    Private Sub tabla_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
        If Button = 2 Then PopupMenu mnuOpciones, , x, y
    End Sub


'<!- METODOS -!>

    Public Sub Refresca1()
        Dim i As Long, j As Long
        refres = True
        limpia
        tabla.Rows = ancora.cantLug + 1
        tabla.cols = ancora.cantLug + 1
        
        tabla.Visible = False
        
        For i = 1 To ancora.cantLug
            interface.console.Progress "Trabajando...espere...", kernel.utils.Porciento(i, ancora.cantLug)
            DoEvents
            ColocaText 0, i, lugar(i).id
            ColocaText i, 0, lugar(i).id
    
            For j = i To ancora.cantLug
                If i = j Then
                    ColocaText i, j, "-----"
                Else
                    Dim d As String
                    d = kernel.utils.trunca(Str(ancora.DistanciaEntre(lugar(i).id, lugar(j).id)))
                    ColocaText i, j, d
                    ColocaText j, i, d
                End If
            Next
        Next
        
        If mnuMostrarTabla.Checked Then tabla.Visible = True
        refres = False
        
    End Sub
    
    Public Sub limpia()
        On Error Resume Next
        Dim i As Long
        If tabla.Rows > 2 Then
    
            For i = 1 To tabla.Rows - 2
                tabla.RemoveItem (1)
            Next
    
        End If
    
        tabla.FixedCols = 1
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

    Private Sub refreLines()
        Dim i As Long, k As Long, xx As Long, yy As Long, tope As Long, lefta As Long
        k = 0
        
        For i = 1 To ancora.cantLug
            If i <> pos Then
                k = k + 1
                If lineas(k) Is Nothing Then Load lineas(k)
                lineas(k).X1 = imgLug(pos).Left + imgLug(pos).Width / 2
                lineas(k).Y1 = imgLug(pos).Top + imgLug(pos).Height / 2
                lineas(k).X2 = imgLug(i).Left + imgLug(i).Width / 2
                lineas(k).Y2 = imgLug(i).Top + imgLug(i).Height / 2
                lineas(k).Tag = "" & i
            End If
        Next
    
        For i = 1 To ancora.cantLug - 1
            If i <> pos Then
                imgLug(i).Tag = "" & i
                tope = (lineas(i).Y1 - lineas(i).Y2) / 2
                lefta = (lineas(i).X1 - lineas(i).X2) / 2
                If tope < 0 Then tope = tope * -1
                If lefta < 0 Then lefta = lefta * -1
                xx = lineas(i).X1
                If xx > lineas(i).X2 Then xx = lineas(i).X2
                yy = lineas(i).Y1
                If yy > lineas(i).Y2 Then yy = lineas(i).Y2
            End If
        Next
    
    End Sub

    Public Sub refre()
        Dim i As Long, tope As Long, lefta As Long
        Dim x As Long, y As Long
        If Not creados Then
    
            For i = 1 To ancora.cantLug
                Load etiquetas(i)
                etiquetas(i).Tag = "" & i
                Load imgLug(i)
                imgLug(i).Tag = "" & i
                Randomize Timer
                etiquetas(i).Visible = True
                etiquetas(i).Left = ancora.getLugaresCoordenadas(lugar(i).id).x
                etiquetas(i).Top = ancora.getLugaresCoordenadas(lugar(i).id).y
                etiquetas(i).Caption = lugar(i).id
                etiquetas(i).BackColor = BackColor
                
                
                etiquetas(i).ForeColor = vbBlack
                etiquetas(i).Font.Bold = True
                etiquetas(i).BorderStyle = 0
                etiquetas(i).AutoSize = True
                imgLug(i).Top = etiquetas(i).Top - imgLug(i).Height
                imgLug(i).Left = etiquetas(i).Left
                imgLug(i).Visible = True
                imgLug(i).Picture = imgLug(0).Picture
            Next
    
            For i = 1 To ancora.cantLug - 1
                If lineas.Count < i + 1 Then Load lineas(i)
                lineas(i).Visible = True
            Next
    
            For i = 1 To ancora.cantLug - 1
                tope = lineas(i).X1 - lineas(i).X2
                lefta = lineas(i).Y1 - lineas(i).Y2
                If tope < 0 Then tope = tope * -1
                If lefta < 0 Then lefta = lefta * -1
                x = lineas(i).X1
                If x < lineas(i).X2 Then x = lineas(i).X2
                y = lineas(i).Y1
                If y < lineas(i).Y2 Then y = lineas(i).Y2
            Next
    
            pos = 1
            refreLines
        End If
        creados = True
    End Sub
    
    Private Sub ReDistribuye()
        Dim i As Long
    
        For i = 1 To ancora.cantLug
            etiquetas(i).Left = 1 + Int(Rnd * (Width - etiquetas(i).Width - 100))
            etiquetas(i).Top = 1 + Int(Rnd * (Height - etiquetas(i).Height - 400))
            imgLug(i).Top = etiquetas(i).Top - imgLug(i).Height
            imgLug(i).Left = etiquetas(i).Left
        Next
        refreLines
    refre
    End Sub
