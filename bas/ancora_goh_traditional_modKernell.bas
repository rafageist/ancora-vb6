Attribute VB_Name = "modKernel"
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"489BC2450168"
Option Explicit
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'''' Modulo Principal
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

' Database connection string - MOVED TO EXTERNAL CONFIG FOR SECURITY
' Original contained sensitive credentials (removed from history)
' TODO: Implement external config loading

Public Const CHARACTERS_STRING As String = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
Public Const CHARACTERS_INTEGER As String = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
Public Const FILE_SERVER_CONF As String = "server.conf"

Private Declare Sub InitCommonControls Lib "Comctl32" ()

Declare Sub setCursorPos Lib "user32" (ByVal x As Long, ByVal y As Long)

' PostgreSQL native call - legacy, not currently used
' Declare Function pg_query Lib "postgres.dll" (ByVal instruction As String) As String

Public ancora As clsAncora
Public interface As clsInterface
Public kernel As clsKernel
Public reports As clsReport

Public cacheID(dCantArreglos) As TCacheID

Public RutaArchivo As String
Public GuardarAlSalir As Boolean

Public Sub Main()

    Call InitCommonControls

    Dim OK As Boolean, c As String
    Dim i As Long

    frmSplash.Show

    Set kernel = New clsKernel

    kernel.Ancora_Inicia

    For i = 1 To 3

        With MUESTRA_EN_HORARIO(i)
            .asig = True
            .brg = True
            .clasif = True
            .lugar = True
            .profe = True
        End With

    Next

    frmKernelMain.Show
    If kernel.utils.trunca(Command) = "" Then
        interface.goKernelBienvenido
    Else
        interface.abrir Mid(Command, 2, Len(Command) - 2)
    End If

End Sub

Public Function BuscaProfeXAct(idasig As String, idper As String, idact As Long, idprofe As String, ByVal excepto As Long) As Long
    Dim i As Long

    For i = 1 To ancora.cantPxAct
        If i <> excepto Then

            With ProfeXAct(i)
                If kernel.utils.idigual(.para.idasig, idasig) And kernel.utils.idigual(.para.idper, idper) And .para.idact = idact And .idprofes = idprofe Then
                    BuscaProfeXAct = i
                    Exit Function
                End If

            End With

        End If

    Next

    BuscaProfeXAct = 0
End Function

Public Function ID_USER() As String
    Dim a As String
    Open App.path + "\server.dll" For Input As #1
    Line Input #1, a
    Close
    Dim id As String, k As Long, i As Long
    id = ""
    k = 0
    For i = 1 To Len(a)
        k = k + 1
        If k = 5 Then
            id = id + Mid(a, i, 1)
            k = 0
        End If
    Next
    ID_USER = id
End Function


Function searchInArray(arr As Variant, itm As Variant, cant As Long, Optional ini As Long = 0) As Long
    Dim i As Long
    For i = ini To cant
        If arr(i) = itm Then
            searchInArray = i
            Exit Function
        End If
    Next
    searchInArray = -1
End Function

Sub GenerarFicheroJuegoDeDatos(path As String, Optional nivelrestricciones As Long = 2, Optional maxper As Long = 20, Optional maxesp As Long = 7, Optional maxclasif As Long = 10, Optional maxbrgbyesp As Long = 15, Optional years As Long = 6, Optional maxasigbyesp As Long = 10, Optional maxprofes As Long = 40, Optional maxlugares As Long = 30, Optional maxrecursos As Long = 40)

    Dim cant As Long, i As Long, j As Long, k As Long, l As Long
    Dim ll As Long, lll As Long, llll As Long

    Randomize Timer

    kernel.Ancora_Finaliza
    kernel.Ancora_Inicia

    Debug.Print "Generando archivo de horarios con aleatorios " & path

    Debug.Print "datos generales"

    'datos generales
    ancora.CD = 1 + Int(Rnd * MAX_DIAS)
    ancora.ct = 1 + Int(Rnd * MAX_TURNOS)

    Debug.Print "periodos"

    'periodos
    cant = 1 + Int(Rnd * maxper)
    For i = 1 To cant

        Dim temp As String
        Dim ix As Long

        ix = 1 + Int(Rnd * cant)
        If ix <> i Then temp = "per" & ix Else temp = ""

        ancora.periodos.add "per" & i, "descrip" & i, New TarrRowRest, "per" & i, temp

        'restricciones de los periodos
        For j = 1 To ancora.CD
            For k = 1 To ancora.ct
                ancora.periodos(i).setTimeRequest j, k, IIf(1 + Int(Rnd * nivelrestricciones) = 1, True, False)
            Next
        Next

    Next

    Debug.Print "especialidades"

    'especialidades
    cant = 1 + Int(Rnd * maxesp)
    For i = 1 To cant
        ancora.insertEspecialidad "esp" & i, "descrip" & i, "esp" & i
        For l = 1 To ancora.periodos.Count
            Especialidad(i).rest(l).idperiodo = "per" & l
            For j = 1 To ancora.CD
                For k = 1 To ancora.ct
                    Especialidad(i).rest(l).rest(j, k) = IIf(1 + Int(Rnd * nivelrestricciones) = 1, True, False)
                Next
            Next
        Next
    Next

    Debug.Print "clasificaciones"

    'clasificaciones

    cant = 1 + Int(Rnd * maxclasif)
    For i = 1 To cant
        ancora.insertClasifAct "clasif" & i, "descrip" & i, 1 + Int(Rnd * ancora.ct), IIf(1 + Int(Rnd * nivelrestricciones) = 1, True, False)
        For l = 1 To ancora.periodos.Count
            clasif(i).comun.rest(l).idperiodo = "per" & l
            For j = 1 To ancora.CD
                For k = 1 To ancora.ct
                    clasif(i).comun.rest(l).rest(j, k) = IIf(1 + Int(Rnd * nivelrestricciones) = 1, True, False)
                Next
            Next
        Next
        For l = 1 To ancora.periodos.Count
            clasif(i).zpriori(l).idperiodo = "per" & l
            For j = 1 To ancora.CD
                For k = 1 To ancora.ct
                    clasif(i).zpriori(l).rest(j, k) = 1 + Int(Rnd * (ancora.CD * ancora.ct))
                Next
            Next
        Next
    Next

    Debug.Print "brigadas"

    'brigadas

    For i = 1 To ancora.cantEsp
        For j = 1 To years
            cant = 1 + Int(Rnd * maxbrgbyesp)
            For k = 1 To cant
                ancora.insertBrigada "esp" & i & "ano" & j & "brg" & k, "descrip" & k, "esp" & i, j, , 1 + Int(Rnd * 30)
                For l = 1 To ancora.periodos.Count
                    Brigada(ancora.cantBrg).comun.rest(l).idperiodo = "per" & l
                    For ll = 1 To ancora.CD
                        For lll = 1 To ancora.ct
                            Brigada(ancora.cantBrg).comun.rest(l).rest(ll, lll) = IIf(1 + Int(Rnd * nivelrestricciones) = 1, True, False)
                            Brigada(ancora.cantBrg).cantGxClasif = ancora.cantClasif
                            ReDim Brigada(ancora.cantBrg).GrupoXClasif(ancora.cantClasif)
                            For llll = 1 To ancora.cantClasif
                                Brigada(ancora.cantBrg).GrupoXClasif(llll).idclasif = clasif(llll).comun.id
                                Brigada(ancora.cantBrg).GrupoXClasif(llll).grupo = 1 + Int(Rnd * ancora.cantBrg)
                            Next
                        Next
                    Next
                Next
            Next
        Next
    Next

    Debug.Print "asignaturas"

    'asignaturas

    For i = 1 To ancora.cantEsp
        For j = 1 To years
            cant = 1 + Int(Rnd * maxasigbyesp)
            For k = 1 To cant
                ancora.insertAsignatura "esp" & i & "ano" & j & "asig" & k, "descrip" & k, "esp" & i, j
                For l = 1 To ancora.periodos.Count
                    asig(ancora.cantAsig).comun.rest(l).idperiodo = "per" & l
                    For ll = 1 To ancora.CD
                        For lll = 1 To ancora.ct
                            asig(ancora.cantAsig).comun.rest(l).rest(ll, lll) = IIf(1 + Int(Rnd * nivelrestricciones) = 1, True, False)
                        Next
                    Next

                    With asig(ancora.cantAsig).desglose(l)
                        .idperiodo = "per" & i
                        .max = 1 + Int(Rnd * ancora.CD)
                        .min = 1 + Int(Rnd * (ancora.CD - 2))
                        .mismodia = IIf(1 + Int(Rnd * nivelrestricciones) = 1, True, False)
                        .RespetarOrden = IIf(1 + Int(Rnd * nivelrestricciones) = 1, True, False)
                        .cantact = 1 + Int(Rnd * 5)
                        For ll = 1 To .cantact
                            .act(ll).idclasif = "clasif" & (1 + Int(Rnd * ancora.cantClasif))
                        Next
                    End With

                Next
            Next
        Next
    Next

    Debug.Print "profesores"

    'profesores
    cant = 1 + Int(Rnd * maxprofes)
    For i = 1 To cant
        ancora.insertProfe "profe" & i, "descrip" & i
        For l = 1 To ancora.periodos.Count
            profe(ancora.cantProfe).rest(l).idperiodo = "per" & l
            For j = 1 To ancora.CD
                For k = 1 To ancora.ct
                    profe(ancora.cantProfe).rest(l).rest(j, k) = IIf(1 + Int(Rnd * nivelrestricciones) = 1, True, False)
                Next
            Next
        Next
    Next

    Debug.Print "lugares"

    'lugares
    cant = 1 + Int(Rnd * maxlugares)
    For i = 1 To cant
        ancora.insertLugar "lugar" & i, "descrip" & i, , 1 + Int(Rnd * 90)
        For l = 1 To ancora.periodos.Count
            lugar(ancora.cantLug).rest(l).idperiodo = "per" & l
            For j = 1 To ancora.CD
                For k = 1 To ancora.ct
                    lugar(ancora.cantLug).rest(l).rest(j, k) = IIf(1 + Int(Rnd * nivelrestricciones) = 1, True, False)
                Next
            Next
        Next
    Next

    Debug.Print "recursos"

    'recursos
    cant = 1 + Int(Rnd * maxrecursos)
    For i = 1 To cant
        ancora.recursos.add New TGOH_arrRestriccion, "recurso" & i, "recurso" & i, "descrip" & i, 0, ""
        For l = 1 To ancora.periodos.Count
            For j = 1 To ancora.CD
                For k = 1 To ancora.ct
                    ancora.recursos(i).setRestriccion "per" & l, j, k, IIf(1 + Int(Rnd * nivelrestricciones) = 1, True, False)
                Next
            Next
        Next
    Next

    Debug.Print "distancias"

    'distancias

    ReDim Distancias(ancora.cantLug)
    For i = 1 To ancora.cantLug
        ReDim Preserve Distancias(i).colum(ancora.cantLug)
    Next
    For i = 1 To ancora.cantLug - 1
        Distancias(i).id = "lugar" & i
        For j = i + 1 To ancora.cantLug
            Distancias(i).colum(j).id = "lugar" & j
            Distancias(i).colum(j).dist = 0 + Int(Rnd * ancora.cantLug)
            Distancias(j).colum(i).dist = Distancias(i).colum(j).dist
        Next
    Next

    Debug.Print "recursos para actiidades"

    'recursos para actividades
    For i = 1 To ancora.cantAsig
        Debug.Print kernel.utils.Porciento(i, ancora.cantAsig); " ";
        For j = 1 To ancora.periodos.Count
            For k = 1 To asig(i).desglose(j).cantact

                'lugxact
                ancora.insertLugXAct k, "asig" & i, "per" & j
                Dim cantl As Long
                cantl = 1 + Int(Rnd * ancora.cantLug)
                For l = 1 To cantl
                    ancora.insertLxAct_lug ancora.cantLxAct, "lugar" & (1 + Int(Rnd * ancora.cantLug))
                Next

                'profexact

                cantl = 1 + Int(Rnd * ancora.cantProfe)
                For l = 1 To cantl / 3
                    ancora.insertProfexAct "asig" & i, "per" & j, k, "profe" & (1 + Int(Rnd * ancora.cantProfe))
                    Dim grupos As TFiltro

                    Dim esp As Long, cla As Long
                    cla = ancora.IndexById(dCLASIF, asig(i).desglose(j).act(k).idclasif)
                    grupos = CantGruposxClasif(esp, asig(i).Nivel, cla)
                    ProfeXAct(ancora.cantPxAct).cantGrupos = 1 + Int(Rnd * grupos.cant)
                    ReDim ProfeXAct(ancora.cantPxAct).grupos(ProfeXAct(ancora.cantPxAct).cantGrupos)
                    For ll = 1 To ProfeXAct(ancora.cantPxAct).cantGrupos
                        ProfeXAct(ancora.cantPxAct).grupos(ll) = 1 + Int(Rnd * grupos.cant)
                    Next
                Next

                'recursosxact
                ancora.recursosXact.add k, "per" & j, "asig" & i, New TGOH_arrGroupRest

                Dim cantl1 As Long
                cantl1 = 1 + Int(Rnd * (ancora.recursos.Count / 3))
                For ll = 1 To cantl1
                    With ancora.recursosXact(ancora.recursosXact.Count)
                        .gruposRecursos.add New TAtom_arrVariant, New TAtom_arrVariant, 1 + Int(Rnd * cantl1), IIf(1 + Int(Rnd * nivelrestricciones) = 1, True, False), 1 + Int(Rnd * cantl1)
                        cantl = 1 + Int(Rnd * ancora.recursos.Count / 3)
                        For l = 1 To cantl
                            .gruposRecursos(.gruposRecursos.Count).recursos.add "recurso" & 1 + Int(Rnd * ancora.recursos.Count)
                            .gruposRecursos(.gruposRecursos.Count).prioridades.add 1 + Int(Rnd * cantl)
                        Next
                    End With
                Next
            Next
        Next
    Next

    Debug.Print

    Debug.Print "lugares fijos"
    'lugares fijos
    cant = 1 + Int(Rnd * ancora.cantBrg)
    ReDim AulasFijas(cant)
    For i = 1 To cant
        With AulasFijas(i)
            .idclasif = "clasif" & (1 + Int(Rnd * ancora.cantClasif))
            .idgrupo = 1 + Int(Rnd * ancora.cantBrg)
            .idlug = "lugar" & (1 + Int(Rnd * ancora.cantLug))
        End With
    Next

    Debug.Print "Guardando"

    ancora.GuardaTXT path

End Sub
