VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "clsReport"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
Option Explicit

Private leyenda() As String
Private cantley As Long
Private ModelosMatrixPer(1 To 5, 1 To 5) As Long

Public toolsExcelSheets As libExcelSheets

Public Sub setMatrixPer(fila As Long, col As Long, value As Long)
    ModelosMatrixPer(fila, col) = value
End Sub
Public Function getMatrixPer(fila As Long, col As Long) As Long
    getMatrixPer = ModelosMatrixPer(fila, col)
End Function

Public Sub CreateModel(parametro_id As Long, parametro_tipo As Long, modo As Long, fechaini As Date)

    Dim dia(1 To MAX_DIAS) As String * 1, hora(1 To MAX_TURNOS) As String * 5
    Dim k As Long, l As Long, i As Long, j As Long
    Dim y As Long, d As Long, m As Long
    Dim cantDias(1 To 12) As Long
    Dim meses(1 To 12) As String
    Dim semana As Long, iasig As Long, per As Long
    cantDias(1) = 31
    cantDias(2) = 28
    cantDias(3) = 31
    cantDias(4) = 30
    cantDias(5) = 31
    cantDias(6) = 30
    cantDias(7) = 31
    cantDias(8) = 31
    cantDias(9) = 30
    cantDias(10) = 31
    cantDias(11) = 30
    cantDias(12) = 31
    meses(1) = "Ene"
    meses(2) = "Feb"
    meses(3) = "Mar"
    meses(4) = "Abr"
    meses(5) = "May"
    meses(6) = "Jun"
    meses(7) = "Jul"
    meses(8) = "Ago"
    meses(9) = "Sep"
    meses(10) = "Oct"
    meses(11) = "Nov"
    meses(12) = "Dic"
    y = Year(fechaini)
    If y Mod 4 = 0 And y Mod 100 <> 0 Or y Mod 400 = 0 Then cantDias(2) = 29
    d = Day(fechaini)
    m = Month(Date)
    dia(1) = "L"
    dia(2) = "M"
    dia(3) = "M"
    dia(4) = "J"
    dia(5) = "V"
    dia(6) = "S"
    dia(7) = "D"
    hora(1) = "1"
    hora(2) = "2"
    hora(3) = "3"
    hora(4) = "4"
    hora(5) = "5"
    hora(6) = "6"
    hora(7) = "7"
    hora(8) = "8"
    hora(9) = "9"
    hora(10) = "10"
    ancora.updatehash
    

    With frmReportesCreaModelos.Spreadsheet1
        .Cells.clear
        .Cells.Delete

        Select Case parametro_tipo
            Case 1
                .Cells(1, 1) = "                                                    Modelo P3"
                .Cells(2, 1) = "                                                Horario de lugares"
                .Cells(3, 1) = "                                          Curso ____            Semestre_____"
                .Cells(4, 1) = "                                         Lugar: " + lugar(parametro_id).id + " - " + lugar(parametro_id).descrip
            Case 2
                .Cells(1, 1) = "                                                    Modelo P4"
                .Cells(2, 1) = "                                               Horario de brigadas"
                .Cells(3, 1) = "                                          Curso ____            Semestre_____"
                .Cells(4, 1) = "                                    Brigada: " + Brigada(parametro_id).comun.id + " - " + Brigada(parametro_id).comun.descrip
            Case 3
                .Cells(1, 1) = "                                                    Modelo P4"
                .Cells(2, 1) = "                                               Horario de profesores"
                .Cells(3, 1) = "                                          Curso ____            Semestre_____"
                .Cells(4, 1) = "                                     Profesor: " + profe(parametro_id).id + " - " + profe(parametro_id).descrip
        End Select

        .Range("A1:AX1").Select
        .Selection.Merge
        '.Selection.HorizontalAlignment = 3

        .Selection.Font.Bold = True

        With .Selection.Font
            .Name = "Arial"
            .Size = 14
        End With

        .Range("A2:AX2").Select
        '.Selection.HorizontalAlignment = 3
        .Selection.Merge
        .Selection.Font.Bold = True

        With .Selection.Font
            .Name = "Arial"
            .Size = 12
        End With

        .Range("A3:AX3").Select
        '.Selection.HorizontalAlignment = 3
        .Selection.Merge
        .Selection.Font.Bold = True

        With .Selection.Font
            .Name = "Arial"
            .Size = 10
        End With

        .Range("A4:AX4").Select
        '.Selection.HorizontalAlignment = 3
        .Selection.Merge
        .Selection.Font.Bold = True

        With .Selection.Font
            .Name = "Arial"
            .Size = 10
        End With

        For i = 1 To 5
            .Cells(5 + (i - 1) * (ancora.ct + 2) + 2, 1).Select
            .Cells(5 + (i - 1) * (ancora.ct + 2) + 2, 1) = "Hora"

            For j = 1 To 5
                interface.console.Progress "Creando Modelo", kernel.utils.Porciento((i - 1) * 5 + j, 25)

                For k = 1 To ancora.CD
                    .Cells(5 + (i - 1) * (ancora.ct + 2) + 2, (j - 1) * (ancora.CD * 2) + k * 2) = dia(k)
                    .Cells(5 + (i - 1) * (ancora.ct + 2) + 2, (j - 1) * (ancora.CD * 2) + k * 2 + 1) = Trim(Str(d))
                    If d + 1 > cantDias(m) Then
                        m = m + 1
                        d = 1
                        If m = 13 Then m = 1
                        y = y + 1
                        If y Mod 4 = 0 And y Mod 100 <> 0 Or y Mod 400 = 0 Then cantDias(2) = 29 Else cantDias(2) = 28
                    Else
                        d = d + 1
                    End If

                Next

                'encabezado periodo
                .Cells(5 + (i - 1) * (ancora.ct + 2) + 1, (j - 1) * (ancora.CD * 2) + 2) = Str((i - 1) * ancora.CD + j)
                .Cells(5 + (i - 1) * (ancora.ct + 2) + 1, (j - 1) * (ancora.CD * 2) + 3) = "(" + kernel.utils.trunca(ancora.periodos(ModelosMatrixPer(i, j)).id) + ")" + kernel.utils.trunca(ancora.periodos(ModelosMatrixPer(i, j)).descrip) + " >" + meses(m)
                .Range(toolsExcelSheets.CharacterOfColumn((j - 1) * (ancora.CD * 2) + 3) + Trim(Str(5 + (i - 1) * (ancora.ct + 2) + 1)) + ":" + toolsExcelSheets.CharacterOfColumn((j - 1) * (ancora.CD * 2) + 11) + Trim(Str(5 + (i - 1) * (ancora.ct + 2) + 1))).Select
                .Selection.Merge

                For k = 1 To ancora.ct
                    .Cells(5 + (i - 1) * (ancora.ct + 2) + 2 + k, 1) = hora(k)
                Next

            Next

        Next

        Dim ii As Long, a As String, b As String, kk As Long
        cantley = 0
        'colocando actividades

        Select Case parametro_tipo
            Case 1
                'P3 -lugares

                For k = 1 To 5

                    For l = 1 To 5
                        semana = (i - 1) * 5 + j

                        For i = 1 To ancora.cantAsignaciones

                            With Asignaciones(i)
                                If ancora.IndexById(dLUGAR, .idlugar, 0) = parametro_id And ancora.IndexById(dPERIODO, .idperiodo, 0) = ModelosMatrixPer(k, l) And kernel.utils.trunca(GetDeModelo(.dia, .turno, 1, k, l)) = "" Then
                                    addLeyenda kernel.utils.trunca(.idasig), kernel.utils.trunca(asig(ancora.IndexById(dASIG, .idasig, 0)).comun.descrip)
                                    ii = ancora.IndexById(dBRIGADA, .idbrigada, 0)
                                    Dim id As String, ali As String
                                    id = Brigada(ii).comun.id
                                    ali = Brigada(ii).comun.titulo
                                    If Trim(ali) = "" Then ali = id
                                    ColocaEnModelo .dia, .turno, 1, k, l, ali
                                    If KEYPRESS_PROGRESS Then If interface.Question_InterrumpirProceso Then GoTo 10
                                End If

                            End With

                        Next

                    Next

                Next

            Case 2
                'P4 -brigadas

                For k = 1 To 5

                    For l = 1 To 5
                        semana = (k - 1) * 5 + l

                        For i = 1 To ancora.cantAsignaciones

                            With Asignaciones(i)
                                If ancora.IndexById(dBRIGADA, .idbrigada, 0) = parametro_id And ancora.IndexById(dPERIODO, .idperiodo, 0) = ModelosMatrixPer(k, l) Then
                                    Rem And kernel.utils.trunca(GetDeModelo(.dia, .turno, 1, k, l)) = "" Then
                                    iasig = ancora.IndexById(dASIG, .idasig, 0)
                                    per = ancora.IndexById(dDESGLOSE, .idperiodo, iasig)
                                    addLeyenda kernel.utils.trunca(.idasig), kernel.utils.trunca(asig(iasig).comun.descrip)
                                    ii = ancora.IndexById(dASIG, .idasig, 0)
                                    
                                    id = asig(ii).comun.id
                                    ali = asig(ii).comun.titulo
                                    If Trim(ali) = "" Then ali = id
                                    
                                    a = ali
                                    
                                    b = Trim(GetDeModelo(.dia, .turno, 2, k, l))
                                    ii = ancora.IndexById(dLUGAR, .idlugar, 0)
                                    
                                        id = lugar(ii).id
                                        ali = lugar(ii).titulo
                                        If Trim(ali) = "" Then ali = id
                                    
                                    If b <> "" Then
                                        b = b + "/" + ali
                                    Else
                                        b = ali
                                    End If

                                    'prubas parciales
                                    If kernel.strings.BuscaSubCadena(asig(iasig).examenes, kernel.utils.trunca(Str(semana)), ",") <> 0 And .idact = asig(iasig).desglose(per).cantact Then b = "pp"
                                    If InStr(1, LCase(asig(iasig).desglose(per).act(.idact).idclasif), "cp") Then a = LCase(a)
                                    ColocaEnModelo .dia, .turno, 1, k, l, a
                                    ColocaEnModelo .dia, .turno, 2, k, l, b
                                End If

                            End With

                        Next

                    Next

                Next

            Case 3
                'P4 -profesores

                For k = 1 To 5

                    For l = 1 To 5
                        semana = (k - 1) * 5 + l

                        For i = 1 To ancora.cantAsignaciones

                            With Asignaciones(i)
                                If ancora.IndexById(dPROFE, .idprofe, 0) = parametro_id And ancora.IndexById(dPERIODO, .idperiodo, 0) = ModelosMatrixPer(k, l) Then
                                    addLeyenda kernel.utils.trunca(.idasig), kernel.utils.trunca(asig(ancora.IndexById(dASIG, .idasig, 0)).comun.descrip)
                                    Rem And kernel.utils.trunca(GetDeModelo(.dia, .turno, 1, k, l)) = "" Then
                                    a = ""
                                    b = ""

                                    
                                        ii = ancora.IndexById(dBRIGADA, .idbrigada, 0)
                                        id = Brigada(ii).comun.id
                                        ali = Brigada(ii).comun.titulo
                                        If Trim(ali) = "" Then ali = id

                                        a = a + ali
                                        
                                        ii = ancora.IndexById(dLUGAR, .idlugar, 0)
                                        b = Trim(GetDeModelo(.dia, .turno, 2, k, l))
                                        
                                        id = lugar(ii).id
                                        ali = lugar(ii).titulo
                                        If Trim(ali) = "" Then ali = id
                                        
                                        If b <> "" Then
                                            b = b + "/" + ali
                                        Else
                                            b = ali
                                        End If

                                    

                                    ColocaEnModelo .dia, .turno, 1, k, l, a
                                    ColocaEnModelo .dia, .turno, 2, k, l, b
                                End If

                            End With

                        Next

                    Next

                Next

        End Select

        'para P3
        If parametro_tipo = 1 Then

            For i = 1 To 5

                For j = 1 To 5

                    For k = 1 To ancora.CD

                        For l = 1 To ancora.ct
                            .Range(toolsExcelSheets.CharacterOfColumn((j - 1) * (ancora.CD * 2) + 2 + (k - 1) * 2) + Trim(Str(5 + (i - 1) * (ancora.ct + 2) + 2 + l)) + ":" + toolsExcelSheets.CharacterOfColumn((j - 1) * (ancora.CD * 2) + 3 + (k - 1) * 2) + Trim(Str(5 + (i - 1) * (ancora.ct + 2) + 2 + l))).Select
                            .Selection.Merge
                            DoEvents
                        Next

                    Next

                Next

            Next

        End If

        .Cells.EntireColumn.AutoFit
        .Range("B46:Z46").Merge
        .Cells(46, 2).FormulaLocal = "Leyenda"
        k = 1
        Dim ancho As Long, colu As Long
        colu = 1
        ancho = 10

        For i = 1 To cantley
            k = i
            'For j = 1 To colu
            .Range("B" & (46 + i) & ":" & toolsExcelSheets.CharacterOfColumn(3 + ancho) & (46 + i)).Merge
            .Cells(46 + i, 2).Select
            .Cells(46 + i, 2).FormulaLocal = "(" & kernel.strings.subcadena(leyenda(k), 1, ",") & ") " & kernel.strings.subcadena(leyenda(k), 2, ",")
            'If k = cantley Then goTo 10
            'k = k + 1
            'Next
        Next

    End With

10
    Cuadricular
End Sub

Public Sub Cuadricular()

    Dim i As Long, j As Long, k As Long

    With frmReportesCreaModelos.Spreadsheet1
        .Range("A6:BS65").Select

        For i = 1 To 4

            With .Selection.Borders(i)
                .Weight = 1
                .LineStyle = 1
            End With

        Next

        For i = 1 To 5
            .Range("A" + Trim(Str(5 + (i - 1) * (ancora.ct + 2) + 2)) + ":AY" + Trim(Str(5 + (i - 1) * (ancora.ct + 2) + 2))).Select

            With .Selection
                .Font.Bold = True
                .HorizontalAlignment = 1
                .Borders(xlInsideVertical).Weight = 3
                .Borders(xlInsideVertical).LineStyle = 1
            End With

        Next

        For i = 1 To 5

            For j = 1 To 5

                For k = 1 To 4

                    Select Case k
                        Case 1
                            .Range(toolsExcelSheets.CharacterOfColumn((j - 1) * (ancora.CD * 2) + 2) + Trim(Str(5 + (i - 1) * (ancora.ct + 2) + 2)) + ":" + toolsExcelSheets.CharacterOfColumn((j - 1) * (ancora.CD * 2) + 2) + Trim(Str(5 + (i - 1) * (ancora.ct + 2) + 2) + ancora.ct)).Select
                        Case 2
                            .Range(toolsExcelSheets.CharacterOfColumn((j - 1) * (ancora.CD * 2) + (ancora.CD * 2) + 1) + Trim(Str(5 + (i - 1) * (ancora.ct + 2) + 2)) + ":" + toolsExcelSheets.CharacterOfColumn((j - 1) * (ancora.CD * 2) + (ancora.CD * 2) + 1) + Trim(Str(5 + (i - 1) * (ancora.ct + 2) + 2) + ancora.ct)).Select
                        Case 3
                            .Range(toolsExcelSheets.CharacterOfColumn((j - 1) * (ancora.CD * 2) + 2) + Trim(Str(5 + (i - 1) * (ancora.ct + 2) + 2)) + ":" + toolsExcelSheets.CharacterOfColumn((j - 1) * (ancora.CD * 2) + (ancora.CD * 2) + 1) + Trim(Str(5 + (i - 1) * (ancora.ct + 2) + 2))).Select
                        Case 4
                            .Range(toolsExcelSheets.CharacterOfColumn((j - 1) * (ancora.CD * 2) + 2) + Trim(Str(5 + (i - 1) * (ancora.ct + 2) + 2 + ancora.ct)) + ":" + toolsExcelSheets.CharacterOfColumn((j - 1) * (ancora.CD * 2) + (ancora.CD * 2) + 1) + Trim(Str(5 + (i - 1) * (ancora.ct + 2) + 2) + ancora.ct)).Select
                    End Select

                    With .Selection.Borders(k)
                        .Weight = 3
                        .LineStyle = 1
                    End With

                Next

            Next

        Next

    End With

End Sub

Public Sub ColocaEnModelo(dia As Long, turno As Long, parte As Long, filaper As Long, colper As Long, texto As String)

    With frmReportesCreaModelos.Spreadsheet1
        .Cells(5 + (filaper - 1) * (ancora.ct + 2) + 2 + turno, (colper - 1) * (ancora.CD * 2) + dia * 2 + parte - 1).Select
        .Cells(5 + (filaper - 1) * (ancora.ct + 2) + 2 + turno, (colper - 1) * (ancora.CD * 2) + dia * 2 + parte - 1) = texto
    End With

End Sub

Public Function GetDeModelo(dia As Long, turno As Long, parte As Long, filaper As Long, colper As Long) As String

    With frmReportesCreaModelos.Spreadsheet1
        GetDeModelo = .Cells(5 + (filaper - 1) * (ancora.ct + 2) + 2 + turno, (colper - 1) * (ancora.CD * 2) + dia * 2 + parte - 1).Text
    End With

End Function

Public Sub addLeyenda(id As String, descrip As String)

    Dim i As Long

    For i = 1 To cantley
        If kernel.utils.idigual(kernel.strings.subcadena(leyenda(i), 1, ","), id) Then Exit Sub
    Next

    cantley = cantley + 1
    ReDim Preserve leyenda(cantley)
    leyenda(cantley) = id & "," & descrip
End Sub

Public Sub GuardarHorarioRTF(f As String)

    Dim k As Long, a As String, b As String, c As String
    Dim i As Long, j As Long
    Dim ccc As Long
    Close
    Open f For Output As #1
    Dim max As Long
    max = 10
    ccc = 0

    For i = 1 To ancora.CD

        For j = 1 To ancora.ct
            HorarioImprimir(i, j) = kernel.utils.trunca(HorarioImprimir(i, j))
            HorarioImprimir(i, j) = Replace(HorarioImprimir(i, j), Chr(13), ",")
            If kernel.utils.trunca(HorarioImprimir(i, j)) <> "" Then
                ccc = kernel.strings.cantsubcadenas(HorarioImprimir(i, j), ",")

                For k = 1 To ccc
                    If Len(kernel.strings.subcadena(HorarioImprimir(i, j), k, ",")) > max Then max = Len(kernel.strings.subcadena(HorarioImprimir(i, j), k, ","))
                Next

            End If

        Next

    Next

    Select Case DatosImprimir.tipo
        Case 1
            Print #1, "                            HORARIO DE BRIGADA"
        Case 2
            Print #1, "                            HORARIO DE PROFESOR"
        Case 3
            Print #1, "                            HORARIO DE LUGAR"
        Case 4
            Print #1, "                            HORARIO DE RECURSO"
    End Select
    

    Print #1, String(max * ancora.CD, "-")
    If DatosImprimir.tipo = 1 Then
        Print #1, " Especialidad: (" + kernel.utils.trunca(Especialidad(DatosImprimir.esp).id) + ")" + Especialidad(DatosImprimir.esp).descrip
        Print #1, " Nivel: " + Str(DatosImprimir.Nivel)
    End If

    Print #1, " Período: (" + kernel.utils.trunca(ancora.periodos(DatosImprimir.per).id) + ")" + ancora.periodos(DatosImprimir.per).descrip
    Print #1, String(max * ancora.CD, "-")

    Select Case DatosImprimir.tipo
        Case 1
            Print #1, " Brigada: " & interface.getRS_Brigada(DatosImprimir.id)
        Case 2
            Print #1, " Profesor: " & interface.getRS_Profe(DatosImprimir.id)
        Case 3
            Print #1, " Lugar: " & interface.getRS_Lugar(DatosImprimir.id)
        Case 4
            Print #1, " Recurso: " & interface.getRS_Recurso(DatosImprimir.id)
    End Select

    Print #1, String(max * ancora.CD, "-")
    Print #1, " "
    b$ = "+----+"
    c$ = "|    |"
If max = 0 Then max = 15
    For i = 1 To ancora.CD
    
        c$ = c$ + "" & i & Space(max - Len("" & i)) & "|"
        b$ = b$ + String(max, "-") + "+"
    Next

    Print #1, b$
    Print #1, c$
    Print #1, b$

    For j = 1 To ancora.ct
        Print #1, "|" + Str(j) + Space(4 - Len(Str(j))) + "|";

        For k = 1 To ccc
            If k <> 1 Then Print #1, "|" + Space(Len(Str(j))) + Space(4 - Len(Str(j))) + "|";

            For i = 1 To ancora.CD
                If HorarioImprimir(i, j) <> "" Then
                    a = kernel.strings.subcadena(HorarioImprimir(i, j), k, ",")
                    Print #1, kernel.utils.trunca(a) + Space(max - Len(kernel.utils.trunca(a))) + "|";
                Else
                    Print #1, Space(max) + "|";
                End If

            Next

            Print #1, " "
        Next

        Print #1, b$
    Next

    Print #1, " "
    Print #1, "                      "; Date
    Close
End Sub

Public Sub Convert(f As String, f1 As String)

    Dim a As String
    Open f For Input As #1
    Open f1 For Output As #2
    While Not EOF(1)
        Line Input #1, a$
        Print #2, "Print #1," + Chr$(34) + a$ + Chr$(34)
    Wend
    Close
End Sub

Private Sub Class_Initialize()
    Set toolsExcelSheets = New libExcelSheets
End Sub

Private Sub Class_Terminate()
    Set toolsExcelSheets = Nothing
End Sub

Public Sub CreateHTMLSchedule(path As String, idperiodos As Variant, cantperiodos As Long, tipo As Integer, id As String, dia As Integer, mes As Integer, Nivel As Integer, showbrg As Boolean, showprofe As Boolean, showlugar As Boolean, showasig As Boolean, showclas As Boolean)
    Dim i As Long, j As Long, k As Long
    Dim colores() As Long
    ReDim colores(ancora.cantAsig)
    Dim meses As Variant
    meses = Array("", "Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre")
    For i = 1 To ancora.cantAsig
        colores(i) = RGB(100 + Int(Rnd * 150), 100 + Int(Rnd * 150), 100 + Int(Rnd * 150))
    Next
    
    Close
    Open path For Output As #1
        Print #1, "<html><head><style> td.casilla{height:100px;width:100px;}</style></head><body><h2>Horario</h2>"
        Select Case tipo
            Case dBRIGADA
                Print #1, "<h1><b>Brigada:</b> " & interface.getRS_Brigada(0, id) & "</h1>"
            Case dPROFE
                Print #1, "<h1><b>Profesor: " & interface.getRS_Profe(0, id) & "</h1>"
            Case dLUGAR
                Print #1, "<h1><b>Lugar: " & interface.getRS_Lugar(0, id) & "</h1>"
            Case dRECURSO
                Print #1, "<h1><b>Recurso: " & interface.getRS_Recurso(0, id) & "</h1>"
        End Select
        Print #1,
        Print #1, "<table border = 2>"
        
        Dim tabla() As String
        ReDim tabla(4 + ancora.ct, 1 + cantperiodos * MAX_DIAS)
        
        tabla(1, 1) = "<td>A&ntilde;o</td>"
        tabla(2, 1) = "<td>Mes</td>"
        tabla(3, 1) = "<td>D&iacute;a</td>"
        tabla(4, 1) = "<td>T</td>"
        
        For i = 1 To ancora.ct
            tabla(i + 4, 1) = "<td>" & i & "</td>"
        Next
        
        Dim d As Date
        d = dia & "/" & mes & "/" & Nivel 'formato dd/mm/aaaa
        
        If Month(d) <> mes Then d = mes & "/" & dia & "/" & Nivel 'formato mm/dd/aaaa
        
        Dim ames As Long, aNivel As Long
        Dim umes As Long, uNivel As Long
        umes = 1
        uNivel = 1
        For i = 1 To cantperiodos * MAX_DIAS
            
            If i > 1 Then
                If Month(d + (i - 1)) <> ames Then
                    tabla(2, umes + 1) = "<td colspan='" & (i - umes) & "'>" & meses(ames) & "</td>"
                    For j = umes + 2 To i - 1
                        tabla(2, j) = ""
                    Next
                    umes = i
                    If Year(d + (i - 1)) <> aNivel Then
                        tabla(1, uNivel + 1) = "<td colspan ='" & (i - uNivel) & "'>" & aNivel & "</td>"
                        For j = uNivel + 2 To i - 1
                            tabla(1, j) = ""
                        Next
                        uNivel = i
                        GoTo detodasformas
                    End If
                Else
detodasformas:
                   If i = cantperiodos * MAX_DIAS Then
                        tabla(1, i + 1) = "<td colspan ='" & (i - uNivel + IIf(uNivel < i, 1, 0)) & "'>" & Year(d + (i - 1)) & "</td>"
                        tabla(2, i + 1) = "<td colspan='" & (i - umes + IIf(umes < i, 1, 0)) & "'>" & meses(Month(d + (i - 1))) & "</td>"
                    End If
               
                End If
            End If
            ames = Month(d + (i - 1))
            aNivel = Year(d + (i - 1))
            
            tabla(3, i + 1) = "<td>" & Day(d + (i - 1)) & "</td>"
            
            Select Case Weekday(d + (i - 1))
                Case vbMonday:    tabla(4, i + 1) = "<td>L</td>"
                Case vbThursday:  tabla(4, i + 1) = "<td>J</td>"
                Case vbFriday:    tabla(4, i + 1) = "<td>V</td>"
                Case vbWednesday: tabla(4, i + 1) = "<td>M</td>"
                Case vbTuesday:   tabla(4, i + 1) = "<td>M</td>"
                Case vbSaturday:  tabla(4, i + 1) = "<td>S</td>"
                Case vbSunday:    tabla(4, i + 1) = "<td>D</td>"
            End Select
        Next
        
        For i = 1 To ancora.ct
            For j = 1 To cantperiodos
                For k = 1 To MAX_DIAS
                    If k <= ancora.CD Then
                        tabla(i + 4, (j - 1) * MAX_DIAS + k + 1) = "<td><button style='background:transparent;border:0px;height:50px;width:50px;'></button></td>"
                    Else
                        tabla(i + 4, (j - 1) * MAX_DIAS + k + 1) = "<td style='background:silver;'><button style='background:transparent;border:0px;height:50px;width:50px;'></button></td>"
                    End If
                Next
            Next
        Next
        
                
        
        Dim ix As Long
        ix = ancora.IndexById(tipo, id)
                
        For i = 1 To ancora.cantAsignaciones
            With Asignaciones(i)
                
                Dim puederecurso As Boolean
                puederecurso = True
                If tipo = dRECURSO Then
                    For j = 1 To .cantrecursos
                        If kernel.utils.idigual(.recursos(j), id) Then
                            puederecurso = True
                            Exit For
                        End If
                    Next
                End If
            
                If (tipo = dBRIGADA And kernel.utils.idigual(.idbrigada, id)) _
                  Or (tipo = dPROFE And kernel.utils.idigual(.idprofe, id)) _
                  Or (tipo = dLUGAR And kernel.utils.idigual(.idlugar, id)) _
                  Or (tipo = dRECURSO And puederecurso) Then
                    Dim iclas As Long, iasg As Long
                    iclas = ancora.getClasifOfActivity(.idasig, .idperiodo, .idact)
                    iasg = ancora.IndexById(dASIG, .idasig)
                    For j = 1 To cantperiodos
                        If kernel.utils.idigual("" & idperiodos(j), .idperiodo) Or kernel.utils.idigual("" & idperiodos(j), ancora.periodos(ancora.IndexById(dPERIODO, .idperiodo)).template) Then
                            tabla(4 + .turno, 1 + (j - 1) * MAX_DIAS + .dia) = "<td style='background:#" & Hex(colores(iasg)) & "' rowspan = '" & clasif(iclas).ct & "'><button class='casilla' style='border:0px;width:50px;height:50px;background:#" & Hex(colores(iasg)) & "' onmouseout=""document.getElementById('comentario').value='';"" onmousemove=""document.getElementById('comentario').value='" & interface.getTextOfAsignacion(i) & ";'"" onclick=""document.getElementById('comentario').value='" & interface.getTextOfAsignacion(i) & ";'"" > " & interface.getTextOfCasilla(tipo <> dBRIGADA And showbrg, tipo <> dPROFE And showprofe, tipo <> dLUGAR And showlugar, showclas, showasig, i, "<br>") & "</button></td>"
                            For k = 1 To clasif(iclas).ct - 1
                                tabla(4 + .turno + k, 1 + (j - 1) * MAX_DIAS + .dia) = ""
                            Next
                        End If
                    Next
                End If
            End With
            
        Next
    
        
        For i = 1 To 4 + ancora.ct
            Print #1, "<tr>"
                For j = 1 To 1 + cantperiodos * MAX_DIAS
                    Print #1, tabla(i, j)
                Next
            Print #1, "</tr>"
        Next
        
        Print #1, "</table><input id = 'comentario' value='' type ='text' style='width:100%;display:block;border:0px;' onkeypress='return false;'></body></html>"
    Close
End Sub
Public Sub CreateHTMLIndexSchedule(path As String, titulo As String, idbrgs As Variant, cantidbrgs As Long, idprofes As Variant, cantidprofes As Long, idlugs As Variant, cantidlugs As Long, idrecurs As Variant, cantidrecurs As Long)
    Close
    Open path & "\index.html" For Output As #1
        Print #1, "<!DOCTYPE html PUBLIC '-//W3C//DTD XHTML 1.0 Frameset//EN' 'DTD/xhtml1-frameset.dtd'>"
        Print #1, "     <!-- "
        Print #1, "                   Áncora GOH, generación y organización de horarios, versión 2.0 "
        Print #1, "                   Sitio web para la publicación de horarios"
        Print #1, "                   Generado automáticamente el: 1/1/2000 a las 12:00:00 hrs"
        Print #1, "            !-->"
        Print #1, "<html xmlns='http://www.w3.org/1999/xhtml'><head><!-- Template: Copyright, ZZEE, 2001-2005. All rights reserved. -->"
        Print #1, "<meta http-equiv='Content-Type' content='text/html; charset=ISO-8859-1'>"
        Print #1, "<title>" & titulo & "</title></head>"
        Print #1, "<frameset cols='40%,60%' style=''>"
        Print #1, "<frame src='navegador.html' name='navegador' scrolling='auto'>"
        Print #1, "<frame src='about:blank' name='detalle' scrolling='auto'>"
        Print #1, "</frameset>"
        Print #1, "</html>"
    Close
    
    Open path & "\navegador.html" For Output As #1
    Print #1, "<html>"
    Print #1, "    <head>"
    Print #1, "     <!-- "
    Print #1, "                   Áncora GOH, generación y organización de horarios, versión 2.0 "
    Print #1, "                   Sitio web para la publicación de horarios"
    Print #1, "                   Generado automáticamente el: 1/1/2000 a las 12:00:00 hrs"
    Print #1, "            !-->"
    Print #1, "    <title>" & titulo & ":: &Iacute;ndice </title>"
    Print #1, "    <style>"
    Print #1, "        body{font-family: Century gothic;}"
    Print #1, "        label.year{background:blue;color:white;}"
    Print #1, "        button.objeto{border:0px;background:transparent;font-size:10px;}"
    Print #1, "        button.opcion{border:0px;background:transparent;}"
    Print #1, "    </style>"
    Print #1, "    <script>"
    Print #1, "        function MostrarNavegadorDe(tipo){"
    Print #1, "           document.getElementById('brigadas').style.display   = (tipo==1)?'block':'none';"
    Print #1, "           document.getElementById('profesores').style.display = (tipo==2)?'block':'none';"
    Print #1, "           document.getElementById('lugares').style.display    = (tipo==3)?'block':'none';"
    Print #1, "           document.getElementById('recursos').style.display   = (tipo==4)?'block':'none';"
    Print #1, "        }"
    Print #1, "    </script>"
    Print #1, "    </head>"
    Print #1, "    <body>"
    Print #1, "        <table width='100%' height ='100%'>"
    Print #1, "            <tr height=30>"
    Print #1, "                <td colspan=2>"
    Print #1, "                    <div style='margin: 0 ;background: #92B3EF; color: white;'>"
    Print #1, "                        <b class='rtop' style='display:block;background: #FFF'>"
    Print #1, "                            <b class='r1' style='display:block;height: 1px; overflow: hidden; background:#92B3EF;margin: 0 5px'></b>"
    Print #1, "                            <b class='r2' style='display:block;height: 1px; overflow: hidden; background:#92B3EF;margin: 0 3px'></b>"
    Print #1, "                            <b class='r3' style='display:block;height: 1px; overflow: hidden; background:#92B3EF;margin: 0 2px'></b>"
    Print #1, "                            <b class='r4' style='display:block;height: 2px; overflow: hidden; background:#92B3EF;margin: 0 1px'></b>"
    Print #1, "                        </b>"
    Print #1, "                              &nbsp;&nbsp;&nbsp;  <b> " & titulo & " </b>,<br>  publicado el 1/1/2000 a las 12:00:00 hrs"
    Print #1, "                        <b class='rbottom'  style='display:block;background: #FFF'>"
    Print #1, "                            <b class='r4' style='display:block;height: 2px; overflow: hidden; background:#92B3EF;margin: 0 1px'></b>"
    Print #1, "                            <b class='r3' style='display:block;height: 1px; overflow: hidden; background:#92B3EF;margin: 0 2px'></b>"
    Print #1, "                            <b class='r2' style='display:block;height: 1px; overflow: hidden; background:#92B3EF;margin: 0 3px'></b>"
    Print #1, "                            <b class='r1' style='display:block;height: 1px; overflow: hidden; background:#92B3EF;margin: 0 5px'></b>"
    Print #1, "                        </b>"
    Print #1, "                    </div>"
    Print #1, "                </td>"
    Print #1, "            </tr>"
    Print #1, "            <tr height=30>"
    Print #1, "                <td colspan=2>"
    Print #1, "                    <button class='opcion' onmousemove='this.style.background=""#FFD1A8""' onmouseout ='this.style.background=""transparent""' onclick='MostrarNavegadorDe(1)'>Brigadas</button>"
    Print #1, "                    <button class='opcion' onmousemove='this.style.background=""#FFD1A8""' onmouseout ='this.style.background=""transparent""' onclick='MostrarNavegadorDe(2)'>Profesores</button>"
    Print #1, "                    <button class='opcion' onmousemove='this.style.background=""#FFD1A8""' onmouseout ='this.style.background=""transparent""' onclick='MostrarNavegadorDe(3)'>Lugares</button>"
    Print #1, "                    <button class='opcion' onmousemove='this.style.background=""#FFD1A8""' onmouseout ='this.style.background=""transparent""' onclick='MostrarNavegadorDe(4)'>Otros recursos</button>"
    Print #1, "                </td>"
    Print #1, "            </tr>"
    Print #1, "            <tr>"
    Print #1, "                <td valign='top'>"
    Print #1, "                        <div id='tdnavigator'><table id = 'navigator' width =100% height=100%>"
    Print #1, "                            <tr>"
    Print #1, "                                <td valign='top'>"
    Print #1, "                                    <table id ='brigadas' style='display:block' width='100%'>"
    Print #1, "                                        <tr>"
    Print #1, "                                            <td>"
    Print #1, "                                               <b>Brigadas</b><table width='100%'><tr>"
    
    Dim ponesp As Boolean, ponNivel As Boolean, i As Long, j As Long, k As Long
    
    For i = 1 To ancora.cantEsp
        ponesp = False
    
        For k = 1 To ancora.cantNiveles
            ponNivel = False
            For j = 1 To cantidbrgs
                If kernel.utils.idigual(Brigada(idbrgs(j)).idesp, Especialidad(i).id) And Brigada(idbrgs(j)).Nivel = k Then
                      If ponesp = False Then
                        Print #1, "                                                 <b>" & Especialidad(i).descrip & "</b>"
                        ponesp = True
                       End If
                      If ponNivel = False Then
                        Print #1, "                                                   <br><label class='year'>&nbsp; " & k & " &nbsp;</label>"
                        ponNivel = True
                       End If
                      Print #1, "<a class='objeto'  onmousemove='this.style.background=""#B0E0E6""' onmouseout ='this.style.background=""transparent""' href='brigada" & idbrgs(j) & ".html' target='detalle'> " & IIf(Brigada(idbrgs(j)).comun.titulo = "", Brigada(idbrgs(j)).comun.id, Brigada(idbrgs(j)).comun.titulo) & "</a>"
                      
                End If
            Next
            
        Next
        Print #1, "<br>"
    Next
    
    
    Print #1, " </td>    </tr>    </table></td>    </tr>    </table>"
    Print #1, "                                    <table id ='profesores' style='display:none' width='100%'>"
    Print #1, "                                        <tr>"
    Print #1, "                                            <td>"
    Print #1, "                                             <b>Profesores</b><table width='100%'>"
    
    For i = 1 To cantidprofes
        Print #1, "<tr><td style='border-style: dotted; border-color: silver;border-width: 1px;' onmousemove='this.style.background=""#B0E0E6""' onmouseout ='this.style.background=""transparent""' ><a class='objeto' href='profesor" & idprofes(i) & ".html' target='detalle'> " & profe(idprofes(i)).descrip & " </a><br>"
    Next
    
    Print #1, "</table> </td>    </tr>    </table>"
    
    Print #1, "                                    <table id ='lugares' style='display:none' width='100%'>"
    Print #1, "                                        <tr>"
    Print #1, "                                            <td>"
    Print #1, "                                             <b>Lugares</b><table width='100%'>"
    
    For i = 1 To cantidlugs
        Print #1, "<tr><td style='border-style: dotted; border-color: silver;border-width: 1px;' onmousemove='this.style.background=""#B0E0E6""' onmouseout ='this.style.background=""transparent""' ><a class='objeto' href='lugar" & idlugs(i) & ".html' target='detalle'> " & lugar(idlugs(i)).descrip & " </a></td></tr>"
    Next
        
    Print #1, "</table> </td>    </tr>    </table>"
    
    Print #1, "                                    <table id ='recursos' style='display:none' width='100%'>"
    Print #1, "                                        <tr>"
    Print #1, "                                            <td>"
    Print #1, "                                             <b>Recursos</b>"
    
    For i = 1 To cantidrecurs
        Print #1, "<tr><td style='border-style: dotted; border-color: silver;border-width: 1px;' onmousemove='this.style.background=""#B0E0E6""' onmouseout ='this.style.background=""transparent""' ><a class='objeto' href='recurso" & idrecurs(i) & ".html' target='detalle'> " & ancora.recursos(idrecurs(i)).descrip & " </a><br>"
    Next
        
    Print #1, "</table> </td>    </tr>    </table>"
    Print #1, " </td>    </tr>    </table></div>"
    
    Print #1, "                "
    Print #1, "                </td>"
    Print #1, "            </tr>"
    Print #1, "        </table>"
    Print #1, "    </body>"
    Print #1, "</html>"
    Close
End Sub
Public Sub CreateHTMLSchedulePublish(path As String, titulo As String, idperiodos As Variant, cantperiodos As Long, dia As Integer, mes As Integer, Nivel As Integer, idbrgs As Variant, cantidbrgs As Long, idprofes As Variant, cantidprofes As Long, idlugs As Variant, cantidlugs As Long, idrecurs As Variant, cantidrecurs As Long)
    Dim i As Long
    interface.console.Progress "Preparando la publicación de horarios en páginas HTML...esto puede tardar varios minutos", 1
    CreateHTMLIndexSchedule path, titulo, idbrgs, cantidbrgs, idprofes, cantidprofes, idlugs, cantidlugs, idrecurs, cantidrecurs

    For i = 1 To cantidbrgs
        interface.console.Progress "Publicando horarios de las brigadas...", kernel.utils.Porciento(idbrgs(i), cantidbrgs)
        CreateHTMLSchedule path & "\brigada" & idbrgs(i) & ".html", idperiodos, cantperiodos, dBRIGADA, Brigada(idbrgs(i)).comun.id, dia, mes, Nivel, False, False, False, True, True
    Next
    For i = 1 To cantidprofes
        interface.console.Progress "Publicando horarios de los profesores...", kernel.utils.Porciento(idprofes(i), cantidprofes)
        CreateHTMLSchedule path & "\profesor" & idprofes(i) & ".html", idperiodos, cantperiodos, dPROFE, profe(idprofes(i)).id, dia, mes, Nivel, True, False, False, True, True
    Next
    For i = 1 To cantidlugs
        interface.console.Progress "Publicando horarios de los lugares...", kernel.utils.Porciento(idlugs(i), cantidlugs)
        CreateHTMLSchedule path & "\lugar" & idlugs(i) & ".html", idperiodos, cantperiodos, dLUGAR, lugar(idlugs(i)).id, dia, mes, Nivel, True, False, False, True, True
    Next
    For i = 1 To cantidrecurs
        interface.console.Progress "Publicando horarios de los otros recursos...", kernel.utils.Porciento(idrecurs(i), cantidrecurs)
        CreateHTMLSchedule path & "\recurso" & idrecurs(i) & ".html", idperiodos, cantperiodos, dRECURSO, ancora.recursos(idrecurs(i)).id, dia, mes, Nivel, False, False, False, True, True
    Next
End Sub
