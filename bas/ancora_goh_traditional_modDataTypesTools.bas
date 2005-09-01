Attribute VB_Name = "modDataTypesTools"
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"489BC2570114"
Option Explicit
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

'MODULO PARA EL TRABAJO CON LOS DATOS
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
Public Function cabe(brgs As TFiltro, lug As Long) As Boolean
    Dim i As Long, c As Long, l As Long
    If lug = 0 Then
        cabe = True
        Exit Function
    End If

    l = lugar(lug).capacidad
    If l = 0 Then
        cabe = True
        Exit Function
    End If

    For i = 1 To brgs.cant
        c = c + Brigada(brgs.id(i)).matricula
    Next
    

    If c <= l Or l = 0 Then cabe = True Else cabe = False
End Function

Public Function LugarMasCerca(grafo As TGrafo, nodo1 As Long, nodo2 As Long, posibles As TFiltro, sentido As Long) As Long
    Dim min As Long, pos As Long, i As Long, j As Long, camino As Long
    If sentido = 2 Then GoTo 10
20:
    'busco si el de arriba es posible

    For i = 1 To posibles.cant
        If posibles.id(i) = nodo1 Then
            LugarMasCerca = nodo1
            Exit Function
        End If

    Next

    If sentido = 2 Then GoTo 30
10:
    'busco si el de abajo es posible

    For i = 1 To posibles.cant
        If posibles.id(i) = nodo2 Then
            LugarMasCerca = nodo2
            Exit Function
        End If

    Next

    If sentido = 2 Then GoTo 20
30:
    If nodo2 = 0 Then 'busco el min as nodo1
        min = grafo.matrix(nodo1, posibles.id(1))
        pos = 1

        For i = 2 To posibles.cant
            j = grafo.matrix(nodo1, posibles.id(i))
            If min > j Then
                min = j
                pos = i
            End If

        Next

        LugarMasCerca = pos
        Exit Function
    End If

    'busco el camino mino con escala en un solo nodo> el que se busca
    min = grafo.matrix(nodo1, posibles.id(1)) + min = grafo.matrix(posibles.id(1), nodo2)
    pos = posibles.id(1)

    For i = 2 To posibles.cant
        camino = grafo.matrix(nodo1, posibles.id(i)) + min = grafo.matrix(posibles.id(i), nodo2)
        If min > camino Then
            min = camino
            pos = posibles.id(i)
        End If

    Next

    LugarMasCerca = pos
End Function

Public Function CantRestRecurso(res As TRecurso, per As Long) As Long
    Dim i As Long, suma As Long, d As Long, t As Long

    For i = 1 To ancora.periodos.Count
        If kernel.utils.idigual(res.rest(i).idperiodo, ancora.periodos(per).id) Then
            suma = 0

            For d = 1 To ancora.CD

                For t = 1 To ancora.ct
                    If res.rest(i).rest(d, t) Then suma = suma + 1
                Next

            Next

            Exit For
        End If

    Next

    CantRestRecurso = suma
End Function

Public Sub duplicar(per1 As Long, per2 As Long, info As TFiltro)

    Dim i As Long, j As Long, k As Long
    Dim p1 As Long, p2 As Long, ini As Long
    Dim ii As Long, cc As Long

    

    For ii = 1 To info.cant

        Select Case info.id(ii)
            Case 1
                'periodos

                For i = 1 To ancora.CD
                    interface.console.Progress "Duplicando restricciones del período", kernel.utils.Porciento(i, ancora.CD)

                    For j = 1 To ancora.ct
                        ancora.periodos(per2).setTimeRequest i, j, ancora.periodos(per1).getTimeRequest(i, j)
                    Next

                Next

            Case 2
                'especialidades

                For i = 1 To ancora.cantEsp
                    interface.console.Progress "Duplicando restricciones de las especialidades", kernel.utils.Porciento(i, ancora.cantEsp)

                    For j = 1 To ancora.periodos.Count
                        If kernel.utils.idigual(Especialidad(i).rest(j).idperiodo, ancora.periodos(per1).id) Then
                            p1 = j
                            Exit For
                        End If

                    Next

                    For j = 1 To ancora.periodos.Count
                        If kernel.utils.idigual(Especialidad(i).rest(j).idperiodo, ancora.periodos(per2).id) Then
                            p2 = j
                            Exit For
                        End If

                    Next

                    For j = 1 To ancora.CD

                        For k = 1 To ancora.ct
                            Especialidad(i).rest(p2).rest(j, k) = Especialidad(i).rest(p1).rest(j, k)
                        Next

                    Next

                Next

            Case 3
                'clasif

                For i = 1 To ancora.cantClasif
                    interface.console.Progress "Duplicando restricciones de las clasificaciones", kernel.utils.Porciento(i, ancora.cantClasif)

                    For j = 1 To ancora.periodos.Count
                        If kernel.utils.idigual(clasif(i).comun.rest(j).idperiodo, ancora.periodos(per1).id) Then
                            p1 = j
                            Exit For
                        End If

                    Next

                    For j = 1 To ancora.periodos.Count
                        If kernel.utils.idigual(clasif(i).comun.rest(j).idperiodo, ancora.periodos(per2).id) Then
                            p2 = j
                            Exit For
                        End If

                    Next

                    For j = 1 To ancora.CD

                        For k = 1 To ancora.ct
                            clasif(i).comun.rest(p2).rest(j, k) = clasif(i).comun.rest(p1).rest(j, k)
                        Next

                    Next

                Next

                Rem zpriori
            Case 4

                For i = 1 To ancora.cantClasif
                    interface.console.Progress "Duplicando zonas de prioridad de las clasificaciones", kernel.utils.Porciento(i, ancora.cantClasif)

                    For j = 1 To ancora.periodos.Count
                        If kernel.utils.idigual(clasif(i).zpriori(j).idperiodo, ancora.periodos(per1).id) Then
                            p1 = j
                            Exit For
                        End If

                    Next

                    For j = 1 To ancora.periodos.Count
                        If kernel.utils.idigual(clasif(i).zpriori(j).idperiodo, ancora.periodos(per2).id) Then
                            p2 = j
                            Exit For
                        End If

                    Next

                    For j = 1 To ancora.CD

                        For k = 1 To ancora.ct
                            clasif(i).zpriori(p2).rest(j, k) = clasif(i).zpriori(p1).rest(j, k)
                        Next

                    Next

                Next

            Case 5
                'brigadas

                For i = 1 To ancora.cantBrg
                    interface.console.Progress "Duplicando restricciones de las brigadas", kernel.utils.Porciento(i, ancora.cantBrg)

                    For j = 1 To ancora.periodos.Count
                        If kernel.utils.idigual(Brigada(i).comun.rest(j).idperiodo, ancora.periodos(per1).id) Then
                            p1 = j
                            Exit For
                        End If

                    Next

                    For j = 1 To ancora.periodos.Count
                        If kernel.utils.idigual(Brigada(i).comun.rest(j).idperiodo, ancora.periodos(per2).id) Then
                            p2 = j
                            Exit For
                        End If

                    Next

                    For j = 1 To ancora.CD

                        For k = 1 To ancora.ct
                            Brigada(i).comun.rest(p2).rest(j, k) = Brigada(i).comun.rest(p1).rest(j, k)
                        Next

                    Next

                Next

            Case 6
                'asignaturas

                For i = 1 To ancora.cantAsig
                    interface.console.Progress "Duplicando restricciones de las asignaturas", kernel.utils.Porciento(i, ancora.cantAsig)

                    For j = 1 To ancora.periodos.Count
                        If kernel.utils.idigual(asig(i).comun.rest(j).idperiodo, ancora.periodos(per1).id) Then
                            p1 = j
                            Exit For
                        End If

                    Next

                    For j = 1 To ancora.periodos.Count
                        If kernel.utils.idigual(asig(i).comun.rest(j).idperiodo, ancora.periodos(per2).id) Then
                            p2 = j
                            Exit For
                        End If

                    Next

                    For j = 1 To ancora.CD

                        For k = 1 To ancora.ct
                            asig(i).comun.rest(p2).rest(j, k) = asig(i).comun.rest(p1).rest(j, k)
                        Next

                    Next

                Next

                'desglose
            Case 7

                For i = 1 To ancora.cantAsig
                    interface.console.Progress "Duplicando el desglose de actividades", kernel.utils.Porciento(i, ancora.cantAsig)

                    For j = 1 To ancora.periodos.Count
                        If kernel.utils.idigual(asig(i).desglose(j).idperiodo, ancora.periodos(per1).id) Then
                            p1 = j
                            Exit For
                        End If

                    Next

                    For j = 1 To ancora.periodos.Count
                        If kernel.utils.idigual(asig(i).desglose(j).idperiodo, ancora.periodos(per2).id) Then
                            p2 = j
                            Exit For
                        End If

                    Next

                    asig(i).desglose(p2) = asig(i).desglose(p1)
                    asig(i).desglose(p2).idperiodo = ancora.periodos(per2).id
                Next

                'profe
            Case 8

                For i = 1 To ancora.cantProfe
                    interface.console.Progress "Duplicando restricciones de los profesores", kernel.utils.Porciento(i, ancora.cantProfe)

                    For j = 1 To ancora.periodos.Count
                        If kernel.utils.idigual(profe(i).rest(j).idperiodo, ancora.periodos(per1).id) Then
                            p1 = j
                            Exit For
                        End If

                    Next

                    For j = 1 To ancora.periodos.Count
                        If kernel.utils.idigual(profe(i).rest(j).idperiodo, ancora.periodos(per2).id) Then
                            p2 = j
                            Exit For
                        End If

                    Next

                    For j = 1 To ancora.CD

                        For k = 1 To ancora.ct
                            profe(i).rest(p2).rest(j, k) = profe(i).rest(p1).rest(j, k)
                        Next

                    Next

                Next

                'lugar
            Case 9

                For i = 1 To ancora.cantLug
                    interface.console.Progress "Duplicando restricciones de los lugares", kernel.utils.Porciento(i, ancora.cantLug)

                    For j = 1 To ancora.periodos.Count
                        If kernel.utils.idigual(lugar(i).rest(j).idperiodo, ancora.periodos(per1).id) Then
                            p1 = j
                            Exit For
                        End If

                    Next

                    For j = 1 To ancora.periodos.Count
                        If kernel.utils.idigual(lugar(i).rest(j).idperiodo, ancora.periodos(per2).id) Then
                            p2 = j
                            Exit For
                        End If

                    Next

                    For j = 1 To ancora.CD

                        For k = 1 To ancora.ct
                            lugar(i).rest(p2).rest(j, k) = lugar(i).rest(p1).rest(j, k)
                        Next

                    Next

                Next


            'recursos
            Case 10

                For i = 1 To ancora.recursos.Count
                    interface.console.Progress "Duplicando restricciones de los Otros recursos", kernel.utils.Porciento(i, ancora.recursos.Count)

                    For j = 1 To ancora.CD
                        For k = 1 To ancora.ct
                            ancora.recursos(i).setRestriccion ancora.periodos(per2).id, j, k, ancora.recursos(i).getRestriccion(ancora.periodos(per1).id, j, k)
                        Next
                    Next
                Next

                'pxact
            Case 11
                ancora.clearPxActOfPeriod ancora.periodos(per2).id

                cc = ancora.cantPxAct

                For i = 1 To cc
                    interface.console.Progress "Duplicando profesores por actividad", kernel.utils.Porciento(i, cc)
                    ancora.duplicatePxAct i, ancora.periodos(per1).id, ancora.periodos(per2).id
                Next

                'lxact
            Case 12
                ancora.clearLxActOfPeriod ancora.periodos(per2).id

                cc = ancora.cantLxAct

                For i = 1 To cc
                    interface.console.Progress "Duplicando lugares por actividad", kernel.utils.Porciento(i, cc)
                    ancora.duplicateLxAct i, ancora.periodos(per1).id, ancora.periodos(per2).id
                Next

                
                'recursos x act
            Case 13
                ancora.clearRxActOfPeriod ancora.periodos(per2).id

                cc = ancora.recursosXact.Count

                For i = 1 To cc
                    interface.console.Progress "Duplicando otros recursos por actividad", kernel.utils.Porciento(i, cc)
                    ancora.duplicateRxAct i, ancora.periodos(per1).id, ancora.periodos(per2).id
                Next
                
                'asignaciones
            Case 14
                ancora.clearAsignacionesOfPeriod ancora.periodos(per2).id

                cc = ancora.cantAsignaciones

                For i = 1 To cc
                    interface.console.Progress "Duplicando asignaciones de actividades", kernel.utils.Porciento(i, cc)
                    ancora.duplicateAsignacionAct i, ancora.periodos(per1).id, ancora.periodos(per2).id
                Next

        End Select

    Next

    
End Sub

Public Function EliminaDeFiltro(f As TFiltro, i As Long) As TFiltro
    Dim j As Long
    If i < f.cant Then

        For j = i To f.cant - 1
            f.id(j) = f.id(j + 1)
        Next

    End If

    f.cant = f.cant - 1
    EliminaDeFiltro = f
End Function

Public Function IDFiltro(f As TFiltro, n As Long) As Long

    Dim j As Long

    For j = 1 To f.cant
        If f.id(j) = n Then
            IDFiltro = j
        End If

    Next

    IDFiltro = 0
End Function

'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'Devuelve algunos datos como Per, Brg, Asg como
'un TRecurso segun el id
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
Public Function DameComoRecurso(dato As Long, id As Long) As TRecurso

    Dim temp As TRecurso, i As Long, j As Long, k As Long

    Select Case dato
        Case dPERIODO
            temp.id = "---"
            temp.descrip = "---"

            For i = 1 To ancora.periodos.Count
                ReDim Preserve temp.rest(i)
                temp.rest(i).idperiodo = ancora.periodos(i).id

                For j = 1 To ancora.CD

                    For k = 1 To ancora.ct
                        temp.rest(i).rest(j, k) = ancora.periodos(i).getTimeRequest(j, k)
                    Next

                Next

            Next

        Case dCLASIF
            temp = clasif(id).comun
        Case dBRIGADA
            temp = Brigada(id).comun
    End Select

    DameComoRecurso = temp
End Function

'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'Devuelve la cantidad de grupos que pertenecen a una especialidad y Nivel,
'segun una clasif
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
Public Function CantGruposxClasif(esp As Long, Nivel As Long, idclasif As Long) As TFiltro
    Dim temp As TFiltro, g As Long, igc As Long, i As Long
    Dim j As Long
    temp.cant = 0
    If esp = 0 Then Exit Function

    For i = 1 To ancora.cantBrg
        If kernel.utils.idigual(Brigada(i).idesp, Especialidad(esp).id) And Brigada(i).Nivel = Nivel Then
            igc = ancora.IndexGrupoxClasif(i, clasif(idclasif).comun.id)
            If igc <> 0 Then
                If Brigada(i).GrupoXClasif(igc).grupo <> 0 Then g = Brigada(i).GrupoXClasif(igc).grupo
            End If

            If g = 0 Then GoTo 10

            For j = 1 To temp.cant
                If temp.id(j) = g Then GoTo 10
            Next

            temp.cant = temp.cant + 1
            ReDim Preserve temp.id(temp.cant)
            temp.id(temp.cant) = g
        End If

10
    Next

    CantGruposxClasif = temp
End Function

'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'Devuelve las brigadas que pertenecen a un grupo determinado a partir de una
'clasificacion
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
Public Function BrigadasDeGrupo(clasifa As Long, esp As Long, Nivel As Long, grupo As Long) As TFiltro

    Dim temp As TFiltro, j As Long, igc As Long, g As Long

    For j = 1 To ancora.cantBrg
        igc = ancora.IndexGrupoxClasif(j, clasif(clasifa).comun.id)
        If igc <> 0 Then g = Brigada(j).GrupoXClasif(igc).grupo
        If kernel.utils.idigual(Brigada(j).idesp, Especialidad(esp).id) And Brigada(j).Nivel = Nivel And grupo = g Then
            temp.cant = temp.cant + 1
            ReDim Preserve temp.id(temp.cant)
            temp.id(temp.cant) = j
        End If

    Next

    BrigadasDeGrupo = temp
End Function

Public Function ProfesoresSinUso(Optional reporter As Boolean = False) As TFiltro
    Dim f As TFiltro, i As Long, j As Long
    f.cant = 0

    For i = 1 To ancora.cantProfe

        For j = 1 To ancora.cantPxAct
            If kernel.utils.idigual(ProfeXAct(j).idprofes, profe(i).id) Then GoTo 10
        Next

        f.cant = f.cant + 1
        ReDim Preserve f.id(f.cant)
        f.id(f.cant) = i
10
    Next

    ProfesoresSinUso = f
    If reporter Then
        Open App.path + "\AncoraInforme_ProfesSinUso.txt" For Output As #1
        Print #1, "-------------------------------------------------------"
        Print #1, "INFORME DE Áncora ------------- Profesores sin Uso: " & f.cant
        Print #1, "-------------------------------------------------------"

        For i = 1 To f.cant
            Print #1, f.id(i), profe(f.id(i)).id, profe(f.id(i)).descrip
        Next
    End If
    Close
End Function

Public Sub deleteRestriccionRecurso(ByRef rec As TRecurso, per As String)
    Dim j As Long, k As Long

        With rec
           For j = 1 To ancora.periodos.Count
                    If kernel.utils.idigual(ancora.periodos(j).id, .rest(j).idperiodo) Then
                        For k = j To ancora.periodos.Count - 1
                            .rest(k) = .rest(k + 1)
                        Next
                        ReDim Preserve .rest(ancora.periodos.Count - 1)
                        Exit For
                    End If
           Next
        End With

End Sub

Public Sub addResumenRestricc(parte As Long, dato As Long)

    Dim i As Long

    For i = 1 To cantResumenRestricc
        If ResumenRestricc(i).dato = dato And ResumenRestricc(i).parte = parte Then
            ResumenRestricc(i).cantidad = ResumenRestricc(i).cantidad + 1
            Exit Sub
        End If

    Next

    cantResumenRestricc = cantResumenRestricc + 1
    ReDim Preserve ResumenRestricc(cantResumenRestricc)

    With ResumenRestricc(cantResumenRestricc)
        .dato = dato
        .cantidad = 1
        .parte = parte
    End With

End Sub

