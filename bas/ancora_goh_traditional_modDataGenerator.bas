Attribute VB_Name = "modDataGenerator"
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"489BC2500164"
Option Explicit
Rem *************************************************************************
Rem **
Rem **                       GENERADORES
Rem **
Rem *************************************************************************

Type TActxProfexDia
    iasig As Long
    act As Long
    per As Long
    idprofe As Long
    cant(1 To MAX_DIAS) As Long
    priori(1 To MAX_DIAS) As Long
    gruposQueAtiende() As Long
    cantGrupos As Long
    rango As TRango
    misAct(1 To MAX_DIAS, 1 To MAX_TURNOS) As Boolean
End Type
Public ProfesoresEnCurso() As TActxProfexDia
Public cantProfesEnCurso As Long
Public MiDiaSegunProfe() As Long
Public GruposEnCurso() As TMPI1
Public MisGruposEnCurso() As TMPI1
Public cantMisGruposEnCurso As Long
Public ZprioriEnCurso(1 To MAX_DIAS, 1 To MAX_TURNOS) As Long
Public UsesOfResources As TAtom_arrVariant
Public Function CantRestriccionesPorDia(r As TRecurso, per As Long, dia As Long) As Long
    Dim i As Long, cant As Long, j As Long
    cant = 0

    For i = 1 To ancora.periodos.Count
        If kernel.utils.idigual(r.rest(i).idperiodo, ancora.periodos(per).id) Then

            For j = 1 To ancora.ct
                If r.rest(i).rest(dia, j) Then cant = cant + 1
            Next

            CantRestriccionesPorDia = cant
            Exit Function
        End If

    Next

    CantRestriccionesPorDia = 0
End Function

Public Function BuscaLugarMenosUtilizado(lug As TFiltro, per As Long, dia As Long) As Long
    Dim min As Long, pos As Long, i As Long, c As Long
    If lug.cant > 0 Then
        min = CantRestriccionesPorDia(lugar(lug.id(1)), per, dia)
        pos = 1

        For i = 2 To lug.cant
            c = CantRestriccionesPorDia(lugar(lug.id(i)), per, dia)
            If min > c Then
                min = c
                pos = i
            End If

        Next

        BuscaLugarMenosUtilizado = pos
        Exit Function
    End If

    BuscaLugarMenosUtilizado = 0
End Function

'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'Public Function PRIORIZA
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

Public Function prioris(arr As TFiltro) As TFiltro
    Dim marcado As TFiltro, i As Long, priori As Long, ini As Long, min As Long, cant As Long
    cant = arr.cant
    ReDim prioris.id(cant)
    ReDim marcado.id(cant)
    For i = 1 To cant
        marcado.id(i) = 0
    Next

    priori = 1
10

    For i = 1 To cant
        If marcado.id(i) = 0 Then
            ini = i
            min = arr.id(i)
            DoEvents
            Exit For
        End If

    Next

    For i = ini + 1 To cant
        If min > arr.id(i) And marcado.id(i) = 0 Then min = arr.id(i)
    Next

    For i = 1 To cant
        If arr.id(i) = min Then

            prioris.id(i) = priori
            marcado.id(i) = 1
            DoEvents
        End If

    Next

    For i = 1 To cant
        If marcado.id(i) = 0 Then
            priori = priori + 1
            DoEvents
            GoTo 10
        End If

    Next

    prioris.cant = cant
End Function

Public Function inviertePrioris(f As TFiltro) As TFiltro
    Dim i As Long, max As Long

    For i = 1 To f.cant
        If i = 1 Or f.id(i) > max Then max = f.id(i)
    Next

    For i = 1 To f.cant
        f.id(i) = max - (f.id(i) - 1)
    Next

    inviertePrioris = f
End Function

'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'CALCULO DE LA MATRIX DE POSIBLES INICIOS
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'Public Function MPI(per As Long, asg As Long, pact As Long, brg As Long, zona
'As Long) As TMPI
'Dim m As TMPI, turnos As Long, i As Long, j As Long, idclasifa As Long
'turnos = Clasif(idclasifa).CT
'For i = 1 To ancora.CD
'For j = 1 To ancora.CT - turnos
'm.MPI(i, j) = PosibleInicio(per, i, j, asg, pact, brg, zona)
'Next
'Next
'm.CT = turnos
'MPI = m
'End Function
Public Function MaxColocaciones(m As TMPI1, dia As Long) As Long
    Dim cant As Long, i As Long, inipi As Long, ini As Long
    cant = 0

    For i = 1 To ancora.ct
        If m.MPI(dia, i).valor = True Then
            inipi = i
            cant = 1
            DoEvents
            Exit For
        End If

    Next

10
    If m.ct + inipi > ancora.ct Then GoTo 20
    ini = m.ct + inipi
    If m.MPI(dia, ini).valor = False Then
        inipi = inipi + 1
        DoEvents
    Else
        cant = cant + 1
        inipi = ini
        DoEvents
    End If

    GoTo 10
20
    MaxColocaciones = cant
End Function

Public Function BuscaLugarProximoDif(per As Long, dia As Long, brg As Long, lugs As TFiltro) As Long
    Dim lugA As TFiltro, i As Long, j As Long
    'busca los lugares asignados para este dia, per, brg

    For i = 1 To ancora.cantAsignaciones

        With Asignaciones(i)
            If .dia = dia And kernel.utils.idigual(.idbrigada, Brigada(brg).comun.id) And kernel.utils.idigual(.idperiodo, ancora.periodos(per).id) Then
                lugA.cant = lugA.cant + 1
                ReDim Preserve lugA.id(lugA.cant)
                lugA.id(lugA.cant) = ancora.IndexById(dLUGAR, .idlugar, 0)
            End If

        End With

    Next

    'busca el lugar que no ha sido asignado este dia, brg, per

    For i = 1 To lugs.cant

        For j = 1 To lugA.cant
            If lugs.id(i) = lugA.id(j) Then GoTo 10
        Next

        BuscaLugarProximoDif = lugs.id(i)
        Exit Function
10
    Next

    BuscaLugarProximoDif = lugs.id(1)
End Function

Public Function BuscaLugarProximoIgual(per As Long, dia As Long, brg As Long, lugs As TFiltro) As Long
    Dim lugA As TFiltro, util As TFiltro, ii As Long, i As Long, j As Long
    'busca los lugares asignados para este dia, per, brg

    For i = 1 To ancora.cantAsignaciones

        With Asignaciones(i)
            If .dia = dia And kernel.utils.idigual(.idbrigada, Brigada(brg).comun.id) And kernel.utils.idigual(.idperiodo, ancora.periodos(per).id) Then
                ii = ancora.IndexById(dLUGAR, .idlugar, 0)

                For j = 1 To lugA.cant
                    If lugA.id(j) = ii Then
                        util.id(j) = util.id(j) + 1
                        GoTo 10
                    End If

                Next

                lugA.cant = lugA.cant + 1
                ReDim Preserve lugA.id(lugA.cant)
                ReDim Preserve util.id(lugA.cant)
                util.id(lugA.cant) = 1
                lugA.id(lugA.cant) = ii
10
            End If

        End With

    Next

    'ordeno por mas utilizado

    For i = 1 To lugA.cant

        For j = i + 1 To lugA.cant - 1
            If util.id(i) < util.id(j) Then
                ii = util.id(i)
                util.id(i) = util.id(j)
                util.id(j) = ii
                ii = lugA.id(i)
                lugA.id(i) = lugA.id(j)
                lugA.id(j) = ii
            End If

        Next

    Next

    'busca el lugar que ha sido asignado este dia, brg, per

    For i = 1 To lugs.cant

        For j = 1 To lugA.cant
            If lugs.id(i) = lugA.id(j) Then
                BuscaLugarProximoIgual = lugs.id(i)
                Exit Function
            End If

        Next

    Next

    BuscaLugarProximoIgual = 0
End Function

Public Function SelectLugarOptimo(listaidbrg As TFiltro, posibles As TFiltro, dia As Long, per As Long, turno As Long, sentido As Long) As Long

    Dim anteriores As TFiltro, sgtes As TFiltro, FL(1 To 2) As TFiltro
    Dim m As Long, i As Long, p As Long, min As Long, l As Long
    Dim k As Long, j As Long, util() As Long
    ReDim util(ancora.cantLug)

    anteriores = SelectAnterioresSgtes(listaidbrg, dia, per, turno, 1)
    sgtes = SelectAnterioresSgtes(listaidbrg, dia, per, turno, 2)
    Dim pos As Long
    If sentido = 1 Then
        FL(1) = anteriores
        FL(2) = sgtes
    Else
        FL(2) = anteriores
        FL(1) = sgtes
    End If

    If FL(1).cant = 0 And FL(2).cant = 0 Then

        For i = 1 To posibles.cant
            util(i) = 0

            For k = 1 To ancora.periodos.Count
                If kernel.utils.idigual(lugar(posibles.id(i)).rest(k).idperiodo, ancora.periodos(k).id) Then

                    For j = 1 To ancora.ct
                        If lugar(posibles.id(i)).rest(k).rest(dia, j) Then util(i) = util(i) + 1
                    Next

                End If

            Next

        Next

        For i = 1 To posibles.cant
            If i = 1 Or util(i) < min Then
                min = util(i)
                pos = i
            End If

        Next

        SelectLugarOptimo = posibles.id(pos)
        Exit Function
    End If

    For i = 1 To 2
        m = MasSeRepite(FL(i))
        p = SearchFiltro(posibles, m)
        If p <> 0 Then
            SelectLugarOptimo = m
            Exit Function
        End If

    Next

    min = 0
    l = 0

    For i = 1 To posibles.cant
        m = 0

        For k = 1 To 2

            For j = 1 To FL(k).cant
                m = m + ancora.DistanciaEntre(lugar(FL(k).id(j)).id, lugar(posibles.id(i)).id)
            Next

        Next

        If i = 1 Then
            min = m
            l = 1
        Else
            If m < min Then
                min = m
                l = i
            End If

        End If

    Next

    SelectLugarOptimo = posibles.id(l)
End Function

Public Function SearchFiltro(f As TFiltro, e As Long) As Long

    Dim i As Long

    For i = 1 To f.cant
        If f.id(i) = e Then
            SearchFiltro = i
            Exit Function
        End If

    Next

    SearchFiltro = 0
End Function

Public Function SelectAnterioresSgtes(listaidbrg As TFiltro, dia As Long, per As Long, turno As Long, sentido As Long) As TFiltro

    Dim temp As TFiltro, i As Long
    Dim l As Long
    temp.cant = 0

    For i = 1 To listaidbrg.cant
        l = ancora.LugarAnteriorSgte(dia, listaidbrg.id(i), per, turno, sentido)
        If l <> 0 Then
            temp.cant = temp.cant + 1
            ReDim Preserve temp.id(temp.cant)
            temp.id(temp.cant) = l
        End If

    Next

    SelectAnterioresSgtes = temp
End Function

Public Function MasSeRepite(f As TFiltro) As Long

    Dim m As Long, suma As Long, sumamax As Long, i As Long
    Dim j As Long
    sumamax = 0

    For i = 1 To f.cant
        suma = 0

        For j = 1 To f.cant
            If f.id(i) = f.id(j) Then suma = suma + 1
        Next

        If suma > sumamax Then
            m = i
            sumamax = suma
        End If

    Next

    MasSeRepite = m
End Function

Public Function RestriccByBrg(brg As TFiltro, per As Long) As TFiltro

    Dim t As TFiltro, i As Long
    t.cant = brg.cant
    ReDim Preserve t.id(t.cant)
    For i = 1 To t.cant

        t.id(i) = PercentRestriccion(Brigada(brg.id(i)).comun, per).parte
    Next

    RestriccByBrg = t
End Function

Public Function RestriccByGrupo(per As Long, iclasif As Long, esp As Long, Nivel As Long) As TFiltro

    Dim grupos As TFiltro, brgs As TFiltro, temp As TFiltro, bb As Long
    Dim i As Long
    grupos = CantGruposxClasif(esp, Nivel, iclasif)
    bb = 0

    For i = 1 To grupos.cant
        brgs = BrigadasDeGrupo(iclasif, esp, Nivel, grupos.id(i))
        bb = bb + brgs.cant
        ReDim Preserve temp.id(i)
        temp.id(i) = SumaFiltro(RestriccByBrg(brgs, per))
    Next

    temp.cant = grupos.cant

    For i = 1 To temp.cant
        temp.id(i) = kernel.utils.Porciento(temp.id(i), bb * ancora.CD * ancora.ct)
    Next

    RestriccByGrupo = temp
End Function

Public Function SumaFiltro(f As TFiltro) As Long

    Dim i As Long, s As Long

    For i = 1 To f.cant
        s = s + f.id(i)
    Next

    SumaFiltro = s
End Function

Public Function CantEnArrIntDifCero(f As TArrInt) As Long
    Dim cant As Long, i As Long
    cant = 0

    For i = 1 To f.cant
        If f.arr(i) <> 0 Then cant = cant + 1
    Next

    CantEnArrIntDifCero = cant
End Function

Public Function RangoV2(n As Long, arr As TArrInt, min As Long, max As Long) As TRango
    Dim temp As TRango, i As Long, db As Long, da As Long, dif As Long
    Dim caso As Long
    If CantEnArrIntDifCero(arr) = 0 Then caso = 1 'caso 1: todos ceros
    If CantEnArrIntDifCero(arr) = 1 Then caso = 2 'una sola actividad
    If CantEnArrIntDifCero(arr) > 1 Then caso = 3 'varias actividades
    temp.ini = 1
    temp.fin = arr.cant

    Select Case caso
        Case 1
            temp.ini = 1
            temp.fin = arr.cant
        Case 2

            For i = 1 To arr.cant
                If arr.arr(i) <> 0 Then
                    If arr.arr(i) < n Then
                        temp.ini = i + min
                        temp.fin = arr.cant
                    Else
                        temp.ini = 1
                        temp.fin = i - min
                    End If

                    Exit For
                End If

            Next

        Case 3
            da = 0
            db = arr.cant + 1

            For i = 1 To arr.cant
                If arr.arr(i) = n - 1 And arr.arr(i) <> 0 Then
                    da = i
                    Exit For
                End If

            Next

            For i = 1 To arr.cant
                If arr.arr(i) = n + 1 And arr.arr(i) <> 0 Then
                    db = i
                    Exit For
                End If

            Next

            dif = db - da
            temp.ini = da + min
            If dif <= max * 2 Then
                temp.fin = db - min
            Else
                temp.fin = da + max
            End If

    End Select

    RangoV2 = temp
End Function

'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'Multiplicación Logica: devuelve una matriz MPI1
'A partir de un conjunto de brigadas, calcula los posibles inicios en comun para
'todas ellas
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

Public Function AND_MPI(brgs As TFiltro, per As Long, asg As Long, act As Long, zona As Long) As TMPI1
    Dim PI1 As TMPI_Casilla, PI2 As TMPI_Casilla, temp As TMPI1
    Dim i As Long, j As Long, k As Long, ll As Long

    For j = 1 To ancora.CD

        For k = 1 To ancora.ct
            temp.MPI(j, k).valor = True
        Next

    Next

    For i = 1 To brgs.cant

        For j = 1 To ancora.CD

            For k = 1 To ancora.ct
                Rem PI1 = PosibleInicio(per, j, k, asg, act, brgs.id(1), zona)
                PI2 = PosibleInicio(per, j, k, asg, act, brgs.id(i), zona)
                If parche_AND_MPI_EXCEPTO Then
                    Rem EXCEPTO
                    'compruebo que la actividad no esté en asignada para el turno en curso

                    For ll = 1 To cantFiltroAsignaciones

                        With Asignaciones(FiltroAsignaciones(ll))
                            Rem kernel.utils.idigual(.idbrigada, Brigada(brgs.id(i)).comun.id) And
                            If kernel.utils.idigual(.idperiodo, ancora.periodos(per).id) And .idact = act And kernel.utils.idigual(.idasig, asig(asg).comun.id) And .dia = j And .turno = k Then
                                PI2.valor = True
                                GoTo 20
                            End If

                        End With

                    Next

20
                End If

                PI2.lug = QuitaSegunCapacidad(brgs, PI2.lug)
                If PI2.lug.cant = 0 Then PI2.valor = False
                Rem If Not (PI1.valor And PI2.valor) Then temp.MPI(j, k).valor = False
                If Not PI2.valor Then temp.MPI(j, k).valor = False
            Next

        Next

    Next

    AND_MPI = temp
End Function

Public Function rango(n As Long, arr As TArrInt) As TRango
    Dim temp As TRango, i As Long
    temp.ini = 1
    temp.fin = arr.cant

    For i = 1 To arr.cant
        If arr.arr(i) = n - 1 And arr.arr(i) <> 0 Then temp.ini = i + 1
        If arr.arr(i) = n + 1 And arr.arr(i) <> 0 Then temp.fin = i - 1
    Next

    rango = temp
End Function

'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'Asigna una actividad: agrega un elemento al arreglo Asignaciones
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

Public Sub AsignaActividad(per As Long, brgs As TFiltro, asg As String, act As Long, dia As Long, turno As Long, prof As String, lug As String, cturnos As Long, Optional ByRef freerecursos As TGOH_arrGroupRest)
    Dim pudo As Boolean

    Dim p As Long, ll As Long
    Dim dd As String, tt As String
    Dim iper As Long, i As Long, j As Long, k As Long
    Dim temprecursos As TGOH_arrGroupRest

    Dim columna As TAtom_arrVariant
    Dim prioriza As TPrioriza

    Set temprecursos = New TGOH_arrGroupRest

    If Not freerecursos Is Nothing Then

        For j = 1 To freerecursos.Count
            With freerecursos(j)
                Dim cant As Long
                cant = 0
                temprecursos.add New TAtom_arrVariant, New TAtom_arrVariant, .cantNecesarios, .imprescindibles, .prioridad
                While cant < .cantNecesarios And .recursos.Count > 0

                    Set prioriza = Nothing
                    Set prioriza = New TPrioriza
                    
                    prioriza.agregarParametro "uso", 1, True
                    prioriza.agregarParametro "distancia", 2, True
                    
                    Dim min As Long
                    min = .MinPrioridad()

                    'lleno la tabla prioriza con uso y distancia

                    Dim rescurso() As String
                    Dim cantres As Long
                    cantres = 0
                    For k = 1 To .recursos.Count
                        If .prioridades(k) = min Then cantres = cantres + 1
                    Next
                    
                    ReDim Preserve rescurso(cantres)
                    prioriza.cantElementos = cantres
                    prioriza.cantParametros = 2
                    prioriza.Redimensiona
                    
                    For k = 1 To .recursos.Count
                        If .prioridades(k) = min Then
                            rescurso(cantres) = .recursos(k).value
                            prioriza.ponValor cantres, 1, UsesOfResources(.recursos(k).value).value
                            prioriza.ponValor cantres, 2, ancora.getDistanciaResource(.recursos(k).value, lug, ancora.periodos(per).id, dia, turno)
                        End If
                    Next
                    
                    k = prioriza.Priorizado

                    'lo añado
                    temprecursos(j).recursos.add .recursos(k).value
                    .recursos.Remove k
                    .prioridades.Remove k
                    cant = cant + 1
                Wend
            End With
        Next
    End If

    dd = Date$
    tt = Time$
    p = per

    For i = 1 To brgs.cant
        'restringir recursos

        ancora.setNativeRestriccion dBRIGADA, Brigada(brgs.id(i)).comun.id, ancora.periodos(per).id, dia, turno, True, cturnos
        ancora.setNativeRestriccion dPROFE, prof, ancora.periodos(per).id, dia, turno, True, cturnos
        ancora.setNativeRestriccion dLUGAR, lug, ancora.periodos(per).id, dia, turno, True, cturnos

        'agregar asignacion
        cantFiltroAsignaciones = cantFiltroAsignaciones + 1
        ReDim Preserve FiltroAsignaciones(cantFiltroAsignaciones)
        FiltroAsignaciones(cantFiltroAsignaciones) = ancora.cantAsignaciones
        pudo = ancora.insertAsignacionAct(dia, dd, False, tt, act, asg, Brigada(brgs.id(i)).comun.id, lug, ancora.periodos(per).id, prof, turno)

        With Asignaciones(ancora.cantAsignaciones)
            'asignando recursos
            'esto hay que mejorarlo
            .cantrecursos = 0
            For j = 1 To temprecursos.Count
                For k = 1 To temprecursos(j).recursos.Count
                    .cantrecursos = .cantrecursos + 1
                    ReDim Preserve .recursos(.cantrecursos)
                    .recursos(.cantrecursos) = temprecursos(j).recursos(k).value
                    ancora.setNativeRestriccion dRECURSO, temprecursos(j).recursos(k).value, .idperiodo, .dia, .turno, True, cturnos
                Next
            Next

        End With

    Next

End Sub

'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'Sumatoria Lógica
'A partir de dos MPI1 devuelve la suma logica de las dos
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

Public Function OR_MPI(mpi1 As TMPI1, mpi2 As TMPI1) As TMPI1
    Dim temp As TMPI1, j As Long, k As Long

    For j = 1 To ancora.CD

        For k = 1 To ancora.ct
            temp.MPI(j, k).valor = False
        Next

    Next

    For j = 1 To ancora.CD

        For k = 1 To ancora.ct
            If mpi1.MPI(j, k).valor Or mpi2.MPI(j, k).valor Then temp.MPI(j, k).valor = True
        Next

    Next

    OR_MPI = temp
End Function

'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'Busqueda de asignacion de recursos
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

Public Function FiltraProfexAct(per As Long, asg As Long, act As Long, grp As Long) As TFiltro
    Dim temp As TFiltro, i As Long, k As Long
    temp.cant = 0

    'For i = 1 To cantIDPxAct
    'DoEvents
    'If kernel.utils.idigual(ProfeXAct(ListaIDPxAct(i)).para.idasig, asig(asg).comun.id) And ProfeXAct(ListaIDPxAct(i)).para.idact = act And kernel.utils.idigual(ProfeXAct(ListaIDPxAct(i)).para.idper, ancora.periodos(per).id) Then
    'For k = 1 To ProfeXAct(ListaIDPxAct(i)).cantGrupos
    'If ProfeXAct(ListaIDPxAct(i)).grupos(k) = grp Then
    'temp.cant = temp.cant + 1
    'ReDim Preserve temp.id(temp.cant)
    'temp.id(temp.cant) = ProfeXAct(ListaIDPxAct(i)).idxprofe
    ''IndexById(dPROFE, ProfeXAct(ListaIDPxAct(i)).IDProfes, 0)
    'Exit For
    'End If
    'Next
    'End If
    'Next

    Dim idprofes As TKernel_HashPxAct_idprofes
    Dim lista As TKernel_HashPxAct_arr_idprofes

    If ancora.hashPxact.Existe(asig(asg).comun.id, ancora.periodos(per).id, act) = -1 Then
        Set lista = ancora.hashPxact(asig(asg).comun.id).idper(ancora.periodos(per).id).idact("" & act).idprofes
        If Not lista Is Nothing Then
            For Each idprofes In lista
                i = idprofes.index
                For k = 1 To ProfeXAct(i).cantGrupos
                    If ProfeXAct(i).grupos(k) = grp Then
                        temp.cant = temp.cant + 1
                        ReDim Preserve temp.id(temp.cant)
                        temp.id(temp.cant) = ProfeXAct(i).idxprofe
                        'IndexById(dPROFE, ProfeXAct(ListaIDPxAct(i)).IDProfes, 0)
                        Exit For
                    End If

                Next
            Next
        End If
    End If
    FiltraProfexAct = temp
End Function

Public Function FiltraLugxAct(per As Long, asg As Long, act As Long) As TFiltro
    Dim temp As TFiltro, i As Long, k As Long
    temp.cant = 0

    For i = 1 To cantIDLxAct
        DoEvents
        If kernel.utils.idigual(LugXact(ListaIDLxAct(i)).para.idasig, asig(asg).comun.id) And LugXact(ListaIDLxAct(i)).para.idact = act And kernel.utils.idigual(LugXact(ListaIDLxAct(i)).para.idper, ancora.periodos(per).id) Then

            For k = 1 To LugXact(ListaIDLxAct(i)).cantLug
                temp.cant = temp.cant + 1
                ReDim Preserve temp.id(temp.cant)
                temp.id(temp.cant) = LugXact(ListaIDLxAct(i)).idxlug(k)
                'ancora.IndexByid(dLUGAR, LugXact(ListaIDLxAct(i)).idlug(k), 0)
                If temp.cant > cantPRIORI_LXACT_segunPI Then
                    cantPRIORI_LXACT_segunPI = temp.cant
                    ReDim Preserve PRIORI_LXACT_segunPI(temp.cant)
                End If
                PRIORI_LXACT_segunPI(temp.cant) = LugXact(ListaIDLxAct(i)).priori(k)
            Next

        End If

    Next

    FiltraLugxAct = temp
End Function

'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'Busqueda de profes y lug que esten disponibles en un intervalo de turnos
'determinados
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

Public Function FiltraLugarQuePermanece(per As Long, plug As TFiltro, dia As Long, turno As Long, cantturnos As Long) As TFiltro
    Dim temp As TFiltro, l As Long
    Dim pp() As Long, i As Long
    ReDim pp(plug.cant)
    For i = 1 To plug.cant
        pp(i) = PRIORI_LXACT_segunPI(i)
    Next

    temp.cant = 0

    For i = 1 To plug.cant
        DoEvents
        l = plug.id(i)
        If l <> 0 Then
            If RecursoPermanece(per, lugar(l), dia, turno, cantturnos) _
            And Not ancora.estaRestringidoPorHerencia(ancora.periodos(per).id, dia, turno, dLUGAR, lugar(l).id) _
            And Not ancora.estaRestringidoPorHerencia(ancora.periodos(per).id, dia, turno, dLUGAR, lugar(l).id, , , False) Then
                temp.cant = temp.cant + 1
                ReDim Preserve temp.id(temp.cant)
                temp.id(temp.cant) = plug.id(i)
                If temp.cant > cantPRIORI_LXACT_segunPI Then
                    cantPRIORI_LXACT_segunPI = temp.cant
                    ReDim Preserve PRIORI_LXACT_segunPI(temp.cant)
                End If
                PRIORI_LXACT_segunPI(temp.cant) = pp(i)
            End If

        End If

    Next

    FiltraLugarQuePermanece = temp
End Function

Public Function FiltraProfeQuePermanece(per As Long, pProfes As TFiltro, dia As Long, turno As Long, cantturnos As Long) As TFiltro
    Dim temp As TFiltro, p As Long, i As Long
    temp.cant = 0
    For i = 1 To pProfes.cant
        DoEvents
        p = pProfes.id(i)
        If p <> 0 Then
            If RecursoPermanece(per, profe(p), dia, turno, cantturnos) _
            And Not ancora.estaRestringidoPorHerencia(ancora.periodos(per).id, dia, turno, dPROFE, profe(p).id) _
            And Not ancora.estaRestringidoPorHerencia(ancora.periodos(per).id, dia, turno, dPROFE, profe(p).id, , , False) Then
                temp.cant = temp.cant + 1
                ReDim Preserve temp.id(temp.cant)
                temp.id(temp.cant) = pProfes.id(i)
            End If
        End If
    Next
    FiltraProfeQuePermanece = temp
End Function

Public Function PosibleInicio(per As Long, dia As Long, turno As Long, asg As Long, act As Long, brg As Long, zona As Long, Optional ByRef freerecursos As TGOH_arrGroupRest) As TMPI_Casilla
    Dim PI As TMPI_Casilla, clasifa As String, turnos As Long, k As Long
    Dim i As Long, j As Long, g As Long, tempProfes As TFiltro
    Dim tempLug As TFiltro, perSTR As String, p As Long
    Dim tempRest As TRecurso, ll As Long, motivo As Long
    Dim perCla As Long, idclasifa As Long

    perSTR = kernel.utils.trunca(LCase(ancora.periodos(per).id))
    PI.valor = False
    clasifa = asig(asg).desglose(per).act(act).idclasif
    idclasifa = ancora.IndexById(dCLASIF, clasifa, 0)
    turnos = clasif(idclasifa).ct

    If turno + turnos - 1 > ancora.ct Then Exit Function
    i = dia
    j = turno
    motivo = 1
    'verifico las restricciones y zona
    Dim tiene As Boolean

    For k = 1 To turnos
        DoEvents
        
        'analizando restricciones propias
        
        If ancora.getRestriccion(dPERIODO, perSTR, "", i, j + k - 1) _
        Or ancora.getRestriccion(dCLASIF, clasif(idclasifa).comun.id, perSTR, i, j + k - 1) _
        Or ancora.getRestriccion(dBRIGADA, Brigada(brg).comun.id, perSTR, i, j + k - 1) _
        Or ancora.getRestriccion(dASIG, asig(asg).comun.id, perSTR, i, j + k - 1) Then GoTo 10
        
        If zona <> 0 Then If ancora.getEstadoZPriori(idclasifa, i, j + k - 1, per) <> zona Then GoTo 10
        
        'analizando herencias de restricciones
    Next

    p = ancora.IndexGrupoxClasif(brg, clasifa)
    
    If p = 0 Then GoTo 10
    
    g = Brigada(brg).GrupoXClasif(p).grupo
    tempProfes = FiltraProfexAct(per, asg, act, g)
    tempLug = FiltraLugxAct(per, asg, act)
    tempProfes = FiltraProfeQuePermanece(per, tempProfes, i, j, turnos)
    tempLug = FiltraLugarQuePermanece(per, tempLug, i, j, turnos)
    tempLug = QuitaSegunProhibidos(tempLug, clasifa, g)
    If tempProfes.cant <> 0 And tempLug.cant <> 0 Then
        PI.valor = True
        PI.prof = tempProfes
        PI.lug = tempLug
        motivo = 0
    End If
    
    Dim puede As Boolean

    Set freerecursos = ancora.getFreeRecursos(asig(asg).comun.id, ancora.periodos(per).id, act, dia, turno, turnos, puede)
    
    PI.valor = PI.valor And puede
    
    If tempProfes.cant = 0 And tempLug.cant >= 1 Then motivo = 2
    If tempProfes.cant >= 1 And tempLug.cant = 0 Then motivo = 3
    If tempProfes.cant = 0 And tempLug.cant = 0 Then motivo = 4
10
    PI.motivo = motivo
    PosibleInicio = PI
End Function

Public Function QuitaSegunCapacidad(brgs As TFiltro, lugs As TFiltro) As TFiltro
    Dim temp As TFiltro, l As Long, ll As Long, ini As Long
    temp = lugs
    ini = 1
10

    For l = ini To temp.cant
        If Not cabe(brgs, temp.id(l)) Then

            For ll = l To temp.cant - 1
                temp.id(ll) = temp.id(ll + 1)
            Next

            temp.cant = temp.cant - 1
            ini = l
            GoTo 10
        End If

    Next

    QuitaSegunCapacidad = temp
End Function

Public Function QuitaSegunProhibidos(f As TFiltro, iclasif As String, g As Long) As TFiltro
    Dim ff As TFiltro, ini As Long, i As Long, j As Long, k As Long, l As Long
    ff = f
    ini = 1
10

    For i = ini To ff.cant

        For j = 1 To ancora.cantAccesos

            With AccesosProhibidos(j)
                If kernel.utils.idigual(.idclasif, iclasif) And .idgrupo = g Then

                    For k = 1 To .cantLugs
                        If kernel.utils.idigual(lugar(ff.id(i)).id, .idlugs(k)) Then
                            If i <> ff.cant Then

                                For l = i To ff.cant - 1
                                    ff.id(l) = ff.id(l + 1)
                                Next

                                ini = i
                                GoTo 10
                            End If

                            ff.cant = ff.cant - 1
                        End If

                    Next

                End If

            End With

        Next

    Next

    QuitaSegunProhibidos = ff
End Function

Public Function RecursoPermanece(per As Long, recurso As TRecurso, dia As Long, turno As Long, cantturnos As Long) As Boolean
    Dim p As Long, i As Long
    
    If recurso.virtual Then
        RecursoPermanece = True
        Exit Function
    End If
    
    p = IndexRestRecurso(ancora.periodos(per).id, recurso)

    For i = 1 To cantturnos
        If recurso.rest(p).rest(dia, turno + i - 1) = True Then
            RecursoPermanece = False
            Exit Function
        End If

    Next

    RecursoPermanece = True
End Function

Public Sub setMiDiaSegunProfe(grupos As TFiltro, iasig As Long, act As Long, per As Long, rango As TRango)

    Dim j As Long, i As Long, k As Long, l As Long
    cantMisGruposEnCurso = 0

    For j = 1 To cantProfesEnCurso

        With ProfesoresEnCurso(j)
            If .iasig = iasig And .act = act And .per = per Then
                Rem obtengo los mpi de cada grupo de este profesor

                For i = 1 To grupos.cant

                    For k = 1 To .cantGrupos
                        If .gruposQueAtiende(k) = grupos.id(i) Then
                            cantMisGruposEnCurso = cantMisGruposEnCurso + 1
                            ReDim Preserve MisGruposEnCurso(cantMisGruposEnCurso)
                            MisGruposEnCurso(cantMisGruposEnCurso) = GruposEnCurso(i)
                        End If

                    Next

                Next

                Rem busco el dia donde puedan el profe y sus grupos
                ReDim MiDiaSegunProfe(grupos.cant)
                For k = 1 To ancora.CD
                    If .priori(k) <> 0 Then
                        If ancora.PuedenGrupos(.priori(k)) And .priori(k) >= .rango.ini And .priori(k) <= .rango.fin Then

                           
                            For i = 1 To grupos.cant

                                For l = 1 To .cantGrupos
                                    If .gruposQueAtiende(l) = grupos.id(i) Then
                                        MiDiaSegunProfe(i) = .priori(k)
                                    End If

                                Next

                            Next

                            GoTo 20
                        End If

                    End If

                Next

            End If

        End With

20
    Next

End Sub

Public Sub setRangosProfesEnCurso(iasig As Long, per As Long, act As Long, grupo As Long, rango As TRango)

    Dim i As Long, j As Long

    For i = 1 To cantProfesEnCurso

        With ProfesoresEnCurso(i)
            If .iasig = iasig And .per = per And .act = act Then

                For j = 1 To .cantGrupos
                    If .gruposQueAtiende(j) = grupo Then
                        .rango = rango
                        GoTo 10
                    End If

                Next

            End If

        End With

10
    Next

End Sub

