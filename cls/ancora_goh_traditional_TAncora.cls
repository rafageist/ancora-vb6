VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "clsAncora"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"489BC264022B"
Option Explicit
'Clase controladora de Áncora
 
Public HoraInicialGeneracion As String
Public IMPOSIBLES_NOW As Long
Public BuscaPorHASH As Boolean
Public ProgresoDelGenerador As Long
Private mvarPeriodos As TarrPeriodo
Private mvarrecursos As TGOH_arrRecurso
Private mvarConsole As TConsole
Private mvarRecursosXAct As TGOH_arrRecursoXAct
Private mvarHash As TKernel_HashCollection
Private mvarLugaresCoordenadas As TarrLugar_Coordenadas
Public hashPxact As TKernel_HashPxAct
Public hashLxact As TKernel_HashPxAct

Public cantNiveles As Long
Public cantImposibles As Long
Public cantEsp As Long
Public cantClasif As Long
Public cantProfe As Long
Public cantLug As Long
Public cantBrg As Long
Public cantLxAct As Long
Public cantPxAct As Long
Public cantAsig As Long
Public cantAsignaciones As Long
Public cantAccesos As Long
Public cantfijas As Long

Public hashPer As TKernel_Hash_arrIndexOf
Public hashEsp As TKernel_Hash_arrIndexOf
Public hashBrg As TKernel_Hash_arrIndexOf
Public hashLug As TKernel_Hash_arrIndexOf
Public hashRes As TKernel_Hash_arrIndexOf
Public hashAsg As TKernel_Hash_arrIndexOf
Public hashPrf As TKernel_Hash_arrIndexOf
Public hashCls As TKernel_Hash_arrIndexOf

Public hashAsignaciones_asig As TAtom_arrVariant

'IGeneral
Public CD As Long 'Cantidad de dias
Public ct As Long 'Cantidad de turnos por día
Public hrt As TGOH_arrHRT

Public Sub deleteAsignatura(ByVal id As String)
        
        Dim temp() As Long, cant As Long, i As Long
        
        'pxact
        
        cant = 0
        For i = 1 To cantPxAct
            With ProfeXAct(i)
                If kernel.utils.idigual(.para.idasig, id) Then
                    cant = cant + 1
                    ReDim Preserve temp(cant)
                    temp(cant) = i
                End If
            End With
        Next
        
        deleteSomes_pxact temp, cant
                
        'lxact
        cant = 0
        For i = 1 To cantLxAct
            With LugXact(i)
                If kernel.utils.idigual(.para.idasig, id) Then
                    cant = cant + 1
                    ReDim Preserve temp(cant)
                    temp(cant) = i
                End If
            End With
        Next
        
        deleteSomes_lxact temp, cant
        
        'asignaciones
        cant = 0
        For i = 1 To cantAsignaciones
            With Asignaciones(i)
                If kernel.utils.idigual(.idasig, id) Then
                    cant = cant + 1
                    ReDim Preserve temp(cant)
                    temp(cant) = i
                End If
            End With
        Next
        
        destruyeAsignaciones temp, cant
        
        'elimino la asignatura
        
        Dim ix As Long
        
        ix = IndexById(dASIG, id)
        
        If ix = 0 Then Exit Sub
        
        For i = ix To cantAsig - 1
            asig(i) = asig(i + 1)
        Next
        
        cantAsig = cantAsig - 1
        ReDim Preserve asig(cantAsig)
        
        updateHash_objects
        
End Sub

Public Sub deleteBrigada(ByVal id As String)
    
    Dim ix As Long, i As Long, j As Long, k As Long, l As Long, cla As Long
    
    ix = IndexById(dBRIGADA, id)
    If ix = 0 Then Exit Sub
    
    'grupos x clasif
        'pxact.grupos
    
        'busco si la brigada define un gxclasif que es unico
        ' y luego lo busco en profexact.grupos y si existe lo elimino
    
    With Brigada(ix)
        For i = 1 To .cantGxClasif
            Dim g As Long
            g = .GrupoXClasif(i).grupo
            
            'busco si existe el grupo para las demas brigadas
            For j = 1 To getCantBrg
                If Not kernel.utils.idigual(id, Brigada(j).comun.id) Then
                    For k = 1 To Brigada(j).cantGxClasif
                        If Brigada(j).GrupoXClasif(k).grupo = g _
                        And kernel.utils.idigual(.GrupoXClasif(i).idclasif, Brigada(j).GrupoXClasif(k).idclasif) _
                        And kernel.utils.idigual(Brigada(j).idesp, .idesp) _
                        And Brigada(j).Nivel = .Nivel Then GoTo yaexiste
                    Next
                End If
            Next
            
            'si no existe entonces lo elimino de pxact
            
            For j = 1 To cantPxAct
                cla = getClasifOfActivity(ProfeXAct(j).para.idasig, ProfeXAct(j).para.idper, ProfeXAct(j).para.idact)
                If kernel.utils.idigual(clasif(cla).comun.id, .GrupoXClasif(i).idclasif) Then
                    For k = 1 To ProfeXAct(j).cantGrupos
                        If ProfeXAct(j).grupos(k) = g Then
                            For l = k To ProfeXAct(j).cantGrupos - 1
                                ProfeXAct(j).grupos(l) = ProfeXAct(j).grupos(l + 1)
                            Next
                            ProfeXAct(j).cantGrupos = ProfeXAct(j).cantGrupos - 1
                            ReDim Preserve ProfeXAct(j).grupos(ProfeXAct(j).cantGrupos)
                            Exit For
                        End If
                    Next
                End If
            Next
yaexiste:
        Next
    End With
    
        
        'asignaciones de actividades
        
        Dim temp() As Long, canttemp As Long
        
        canttemp = 0
        
        For i = 1 To cantAsignaciones
            With Asignaciones(i)
                If kernel.utils.idigual(.idbrigada, id) Then
                    canttemp = canttemp + 1
                    ReDim Preserve temp(canttemp)
                    temp(canttemp) = i
                End If
            End With
        Next
        
        destruyeAsignaciones temp, canttemp
        
        canttemp = 0

        For i = 1 To cantImposibles
            With Imposibles(i)
                If kernel.utils.idigual(.idbrigada, id) Then
                    canttemp = canttemp + 1
                    ReDim Preserve temp(canttemp)
                End If
            End With
        Next
        
        deleteSomes_imposibles temp, canttemp
       
        'herencia de restricciones
        
        hrt.deleteRelativoA dBRIGADA, id
        
        'elimino la brigada
        For i = ix To cantBrg - 1
            Brigada(i) = Brigada(i + 1)
        Next
        cantBrg = cantBrg - 1
        ReDim Preserve Brigada(cantBrg)
        
        updateHash_objects
End Sub

Public Sub deleteClasif(ByVal id As String)
        Dim i As Long, j As Long, k As Long, ini As Long
        
        
        'gxclasif
        ini = 1
restart1:
        For i = ini To getCantBrg
            With Brigada(i)
                For j = 1 To .cantGxClasif
                    If kernel.utils.idigual(.GrupoXClasif(j).idclasif, id) Then
                        For k = j To .cantGxClasif - 1
                            .GrupoXClasif(k) = .GrupoXClasif(k + 1)
                        Next
                        .cantGxClasif = .cantGxClasif - 1
                        ReDim Preserve .GrupoXClasif(.cantGxClasif)
                        ini = j
                        GoTo restart1
                    End If
                Next
            End With
        Next
        
        'desgloses.act
        For i = 1 To getCantAsig
            With asig(i)
                For j = 1 To periodos.Count
restart:
                    For k = 1 To .desglose(j).cantact
                        If kernel.utils.idigual(.desglose(j).act(k).idclasif, id) Then
                            ' esta funcion se encarga de borrar en lxact, pxact, rxact,asignaciones, imposibles
                            deleteActivityFromDesglose i, j, k
                            GoTo restart
                        End If
                    Next
                Next
            End With
        Next
        
        
        Dim ix As Long
        ix = IndexById(dCLASIF, id)
        If ix = 0 Then Exit Sub
        
        For i = ix To cantClasif - 1
            clasif(i) = clasif(i + 1)
        Next
        cantClasif = cantClasif - 1
        ReDim Preserve clasif(cantClasif)
        
        updateHash_objects
End Sub

Public Sub deleteEspecialidad(ByVal id As String)
        
        Dim i As Long, ini As Long
        
        'brigadas de la especialidad
        ini = 1
restart:
        For i = ini To getCantBrg
        
            If kernel.utils.idigual(Brigada(i).idesp, id) Then
                deleteBrigada Brigada(i).comun.id
                ini = i
                GoTo restart
            End If
        Next
        
        'asignaturas de la especialidad
        ini = 1
restart1:
        For i = ini To getCantAsig
            
            If kernel.utils.idigual(asig(i).idesp, id) Then
                deleteAsignatura asig(i).comun.id
                ini = i
                GoTo restart1
            End If
        Next
        
        'hrt
        hrt.deleteRelativoA dESPECIALIDAD, id
        
        Dim ix As Long
        
        ix = IndexById(dESPECIALIDAD, id)
        If ix = 0 Then Exit Sub
        
        For i = ix To cantEsp - 1
            Especialidad(i) = Especialidad(i + 1)
        Next
        
        cantEsp = cantEsp - 1
        ReDim Preserve Especialidad(cantEsp)
        
        updateHash_objects
End Sub

Public Sub deleteLugar(ByVal id As String)
        
        Dim i As Long, j As Long, k As Long, c As Long, ini As Long
        
        'distancias
        
        c = cantLug
        ini = 1
        
restart:
        For i = ini To c
            If kernel.utils.idigual(Distancias(i).id, id) Then
                For j = i To cantLug - 1
                    Distancias(j) = Distancias(j + 1)
                Next
                ReDim Preserve Distancias(cantLug - 1)
                c = c - 1
                ini = i
                GoTo restart
            Else
                For j = 1 To cantLug
                    If kernel.utils.idigual(Distancias(i).colum(j).id, id) Then
                        For k = j To cantLug - 1
                            Distancias(i).colum(j) = Distancias(i).colum(j + 1)
                        Next
                        ReDim Preserve Distancias(i).colum(cantLug - 1)
                        Exit For
                    End If
                Next
            End If
        Next
        
        'asignaciones
        
        Dim temp() As Long, cant As Long
        
        cant = 0
        For i = 1 To cantAsignaciones
            With Asignaciones(i)
                If kernel.utils.idigual(.idlugar, id) Then
                    cant = cant + 1
                    ReDim Preserve temp(cant)
                    temp(cant) = i
                End If
            End With
        Next
        
        destruyeAsignaciones temp, cant
        
        'lxact
        
        cant = 0
        For i = 1 To cantLxAct
            With LugXact(i)
                ini = 1
restart1:
                For j = ini To .cantLug
                    If kernel.utils.idigual(.idlug(j), id) Then
                        For k = j To .cantLug - 1
                            .idlug(k) = .idlug(k + 1)
                            .priori(k) = .priori(k + 1)
                        Next
                        .cantLug = .cantLug - 1
                        GoTo restart1
                    End If
                Next
            End With
        Next
                
        'hrt
        
        hrt.deleteRelativoA dLUGAR, id
        
        Dim ix As Long
        
        ix = IndexById(dLUGAR, id)
        If ix = 0 Then Exit Sub
        
        For i = ix To cantLug - 1
            lugar(i) = lugar(i + 1)
        Next
        cantLug = cantLug - 1
        ReDim Preserve lugar(cantLug)
        
        updateHash_objects
End Sub

Public Sub deleteObjeto(ByVal tipo As Long, Optional id As String = "", Optional ByVal idx As Long = 0)
    If idx = 0 And id = "" Then Exit Sub
    If idx = 0 Then idx = IndexById(tipo, id)
    If idx = 0 Then Exit Sub
    id = getIdGenerico(tipo, idx)
    Select Case tipo
        Case dPERIODO: deletePeriodo id
        Case dESPECIALIDAD: deleteEspecialidad id
        Case dBRIGADA: deleteBrigada id
        Case dASIG: deleteAsignatura id
        Case dLUGAR: deleteLugar id
        Case dPROFE: deleteProfe id
        Case dRECURSO: deleteRecurso id
        Case dCLASIF: deleteClasif id
    End Select
    updateHash_objects tipo = dPERIODO, tipo = dCLASIF, tipo = dESPECIALIDAD, tipo = dBRIGADA, tipo = dASIG, tipo = dPROFE, tipo = dLUGAR, tipo = dRECURSO
End Sub

Public Function getMatrixOf_Distancias() As Variant
    Dim m() As Long
    Dim i As Long, j As Long
    
    ReDim m(cantLug, cantLug)
    For i = 1 To cantLug
        For j = 1 To cantLug
            m(i, j) = DistanciaEntre(lugar(i).id, lugar(j).id)
        Next
    Next
    getMatrixOf_Distancias = m
End Function




Public Sub swapAsignaturas(ByVal ix1 As Long, ByVal ix2 As Long)
    Dim temp As TAsig
    temp = asig(ix1)
    asig(ix1) = asig(ix2)
    asig(ix2) = temp
    cacheID(dASIG).Remove LCase(kernel.utils.trunca(asig(ix1).comun.id))
    cacheID(dASIG).Remove LCase(kernel.utils.trunca(asig(ix2).comun.id))
    updateHash_objects
End Sub

Public Sub swapBrigadas(ByVal ix1 As Long, ByVal ix2 As Long)
    Dim temp As TBrigada
    temp = Brigada(ix1)
    Brigada(ix1) = Brigada(ix2)
    Brigada(ix2) = temp
    cacheID(dBRIGADA).Remove LCase(kernel.utils.trunca(Brigada(ix1).comun.id))
    cacheID(dBRIGADA).Remove LCase(kernel.utils.trunca(Brigada(ix2).comun.id))
    updateHash_objects
End Sub

Public Sub swapClasif(ByVal ix1 As Long, ByVal ix2 As Long)
    Dim temp As TClasif
    temp = clasif(ix1)
    clasif(ix1) = clasif(ix2)
    clasif(ix2) = temp
    cacheID(dCLASIF).Remove clasif(ix1).comun.id
    cacheID(dCLASIF).Remove clasif(ix2).comun.id
    updateHash_objects
End Sub

Public Sub deleteProfe(ByVal id As String)
        
        Dim i As Long, j As Long, k As Long
               
        'asignaciones
        
        Dim temp() As Long, cant As Long
        
        cant = 0
        For i = 1 To cantAsignaciones
            With Asignaciones(i)
                If kernel.utils.idigual(.idprofe, id) Then
                    cant = cant + 1
                    ReDim Preserve temp(cant)
                    temp(cant) = i
                End If
            End With
        Next
        
        destruyeAsignaciones temp, cant
        
        'pxact
        
        cant = 0
        For i = 1 To cantPxAct
            With ProfeXAct(i)
               If kernel.utils.idigual(.idprofes, id) Then
                    cant = cant + 1
                    ReDim Preserve temp(cant)
                    temp(cant) = i
               End If
            End With
        Next
                
        deleteSomes_pxact temp, cant
                
        'hrt
        
        hrt.deleteRelativoA dPROFE, id
        
        Dim ix As Long
        ix = IndexById(dPROFE, id)
        If ix = 0 Then Exit Sub
        
        For i = ix To cantProfe - 1
            profe(i) = profe(i + 1)
        Next
        cantProfe = cantProfe - 1
        ReDim Preserve profe(cantProfe)
        
        updateHash_objects
End Sub



Public Sub deleteRecurso(ByVal id As String)
        'rxact
        
        Dim temp() As Long, cant As Long, i As Long, j As Long, k As Long
        
        cant = 0
        
        Dim r As TGOH_RecursoXAct
        
        For Each r In recursosXact
            Dim gr As TGOH_GroupRest
            For Each gr In r.gruposRecursos
                Dim v As TAtom_Variant
restart:
                i = 0
                For Each v In gr.recursos
                    i = i + 1
                    If kernel.utils.idigual("" & v.value, id) Then
                        gr.recursos.Remove i
                        gr.prioridades.Remove i
                        GoTo restart
                    End If
                Next
            Next
        Next
        
        'asignaciones
        
        cant = 0
        For i = 1 To cantAsignaciones
            With Asignaciones(i)
                For j = 1 To .cantrecursos
                    If kernel.utils.idigual(.recursos(j), id) Then
                        For k = j To .cantrecursos - 1
                            .recursos(k) = .recursos(k + 1)
                        Next
                        .cantrecursos = .cantrecursos - 1
                        ReDim Preserve .recursos(.cantrecursos)
                        
                        Exit For
                    End If
                Next
            End With
        Next
        
        'hrt
        
        hrt.deleteRelativoA dRECURSO, id
        
        Dim ix As Long
        
        ix = IndexById(dRECURSO, id)
        If ix = 0 Then Exit Sub
        
        recursos.Remove ix
        
        updateHash_objects
End Sub

Public Sub updateHash_objects(Optional pers As Boolean = True, Optional cla As Boolean = True, Optional esps As Boolean = True, Optional brgs As Boolean = True, Optional asgs As Boolean = True, Optional prfs As Boolean = True, Optional lugs As Boolean = True, Optional res As Boolean = True)
    
    Dim i As Long
    
    If pers Then
        Set hashPer = New TKernel_Hash_arrIndexOf
        For i = 1 To ancora.periodos.Count
            hashPer.add ancora.periodos(i).id, i
        Next
    End If
        
    If esps Then
        Set hashEsp = New TKernel_Hash_arrIndexOf
        For i = 1 To cantEsp
            hashEsp.add Especialidad(i).id, i
        Next
    End If
    
    If brgs Then
        Set hashBrg = New TKernel_Hash_arrIndexOf
        For i = 1 To cantBrg
            hashBrg.add Brigada(i).comun.id, i
        Next
    End If
    
    If lugs Then
        Set hashLug = New TKernel_Hash_arrIndexOf
        For i = 1 To cantLug
            hashLug.add lugar(i).id, i
        Next
    End If
    
    If res Then
        Set hashRes = New TKernel_Hash_arrIndexOf
        For i = 1 To ancora.recursos.Count
            hashRes.add ancora.recursos(i).id, i
        Next
    End If
    
    If asgs Then
        Set hashAsg = New TKernel_Hash_arrIndexOf
        For i = 1 To cantAsig
            hashAsg.add asig(i).comun.id, i
        Next
    End If
    
    If prfs Then
        Set hashPrf = New TKernel_Hash_arrIndexOf
        For i = 1 To cantProfe
            hashPrf.add profe(i).id, i
        Next
    End If
    
    If cla Then
        Set hashCls = New TKernel_Hash_arrIndexOf
        For i = 1 To cantClasif
            hashCls.add clasif(i).comun.id, i
        Next
    End If
End Sub

Private Sub Class_Initialize()
    Set mvarHash = New TKernel_HashCollection
    Set mvarPeriodos = New TarrPeriodo
    Set mvarrecursos = New TGOH_arrRecurso
    Set mvarConsole = New TConsole
    Set mvarRecursosXAct = New TGOH_arrRecursoXAct
    Set mvarLugaresCoordenadas = New TarrLugar_Coordenadas
    Set hrt = New TGOH_arrHRT
End Sub

Private Sub Class_Terminate()
    Set mvarHash = Nothing
    Set mvarPeriodos = Nothing
    Set mvarConsole = Nothing
    Set mvarrecursos = Nothing
    Set mvarRecursosXAct = Nothing
    Set mvarLugaresCoordenadas = Nothing
    Set hrt = Nothing
End Sub

Public Property Get getLugaresCoordenadas() As TarrLugar_Coordenadas
    Set getLugaresCoordenadas = mvarLugaresCoordenadas
End Property

Public Property Get recursos() As TGOH_arrRecurso
    Set recursos = mvarrecursos
End Property

Public Property Set recursos(ByVal vData As TGOH_arrRecurso)
    Set mvarrecursos = vData
End Property

Public Property Get recursosXact() As TGOH_arrRecursoXAct
    Set recursosXact = mvarRecursosXAct
End Property

Public Property Set recursosXact(ByVal vData As TGOH_arrRecursoXAct)
    Set mvarRecursosXAct = vData
End Property

Public Property Set periodos(ByVal vData As TarrPeriodo)
    Set mvarPeriodos = vData
End Property

Public Property Get periodos() As TarrPeriodo
    Set periodos = mvarPeriodos
End Property

Public Property Get console() As TConsole
    Set console = mvarConsole
End Property

Public Sub insertPeriodo(id As String, descrip As String, Optional Caption As String = "", Optional template As String = "", Optional expandirtodos As Boolean = True)
    Dim tr As TarrRowRest
    Set tr = New TarrRowRest
    periodos.add id, descrip, tr, Caption, template
    'expandir todos los arrays que dependen de los periodos
    reparaArrays
End Sub

Public Function getIndexOfLxAct(ByVal asg As String, ByVal per As String, ByVal act As Long) As Long

    Dim i As Long

    For i = 1 To cantLxAct

        With LugXact(i)

            If kernel.utils.idigual(.para.idasig, asg) And kernel.utils.idigual(.para.idper, per) And .para.idact _
                = act _
                Then

                getIndexOfLxAct = i
                Exit Function
            End If

        End With

    Next

    getIndexOfLxAct = 0
End Function

Public Function getIndexOfPxAct(ByVal asg As String, ByVal per As String, ByVal act As Long, Optional ByVal idprofe As String = "", Optional hashing As Boolean = False) As Long

    Dim i As Long

    If hashing Then
        'previamente debe haberse llamado al método updatehashpxact
        getIndexOfPxAct = hashPxact(asg).idper(per).idact(act).idprofes(idprofe).index
        Exit Function
    End If

    For i = 1 To cantPxAct

        With ProfeXAct(i)

            If kernel.utils.idigual(.para.idasig, asg) And kernel.utils.idigual(.para.idper, per) And .para.idact _
                = act _
                Then

                If idprofe = "" Or kernel.utils.idigual(idprofe, .idprofes) Then
                    getIndexOfPxAct = i
                    Exit Function
                End If

            End If

        End With

    Next

    getIndexOfPxAct = 0
End Function

Public Sub insertLxAct_lug(ByVal ix As Long, ByVal idlug As String, Optional priority As Long, Optional ByVal asg As String, Optional ByVal per As String, Optional ByVal act As Long)

    Dim p As Long, i As Long

    If ix <= 0 Then ix = getIndexOfLxAct(asg, per, act)

    If ix = 0 Then
        cantLxAct = cantLxAct + 1
        ReDim Preserve LugXact(cantLxAct)
        ix = cantLxAct
    End If

    For i = 1 To LugXact(ix).cantLug

        If kernel.utils.idigual(LugXact(ix).idlug(i), idlug) And LugXact(ix).priori(i) = priority _
        Then Exit _
        Sub

    Next

    LugXact(ix).cantLug = LugXact(ix).cantLug + 1
    ReDim Preserve LugXact(ix).idlug(LugXact(ix).cantLug)
    LugXact(ix).idlug(LugXact(ix).cantLug) = idlug

    If priority = -1 Then priority = getLxAct_Priority(ix, LugXact(ix).cantLug)

    If priority = 0 Then priority = 1
    setLugxAct_Priori ix, LugXact(ix).cantLug, priority
End Sub

Public Sub deleteImposible(ix As Long)
    Dim i As Long

    If ix < cantImposibles Then

        For i = ix To cantImposibles - 1
            Imposibles(i) = Imposibles(i + 1)
        Next

    End If

    cantImposibles = cantImposibles - 1
    ReDim Preserve Imposibles(cantImposibles)
End Sub

Public Sub clearImposibles()
    cantImposibles = 0
    ReDim Preserve Imposibles(0)
End Sub

Public Function getCantImposibles() As Long
    getCantImposibles = cantImposibles
End Function

Public Sub Save()
    GuardarTodo
End Sub

Public Function getIndexOfBrigadas(Optional esp As String = "", Optional Nivel As Long = 0) As TAtom_arrVariant

    Dim result As TAtom_arrVariant
    Set result = New TAtom_arrVariant
    Dim i As Long

    For i = 1 To getCantBrg

        With Brigada(i)

            If (kernel.utils.idigual(.idesp, esp) Or kernel.utils.idigual(esp, "")) And (Nivel = .Nivel Or Nivel = _
                0) _
                Then

                result.add i
            End If

        End With

    Next

    Set getIndexOfBrigadas = result
    Set result = Nothing
End Function

Public Function getCantActSinGenerar() As Long
End Function

Public Function getCantEspecialidades() As Long
    getCantEspecialidades = cantEsp
End Function


Public Function insertAsignacionAct(ByVal dia As Long, ByVal fecha As String, ByVal fija As Boolean, ByVal hora As String, ByVal idact As Long, idasig As String, ByVal idbrigada As String, ByVal idlugar As String, ByVal idperiodo As String, ByVal idprofe As String, ByVal turno As Long) As Boolean
 
        cantAsignaciones = cantAsignaciones + 1
        ReDim Preserve Asignaciones(cantAsignaciones)

        With Asignaciones(cantAsignaciones)
            .dia = dia
            .fecha = fecha
            .fija = fija
            .hora = hora
            .idact = idact
            .idasig = idasig
            .idbrigada = idbrigada
            .idlugar = idlugar
            .idperiodo = idperiodo
            .idprofe = idprofe
            .turno = turno
        End With

End Function

Public Sub insertProfexAct(ByVal asg As String, ByVal per As String, ByVal act As Long, ByVal prf As String)

    cantPxAct = cantPxAct + 1
    ReDim Preserve ProfeXAct(cantPxAct)

    With ProfeXAct(cantPxAct)
        .para.idact = act
        .para.idasig = asg
        .para.idper = per
        .idprofes = prf
    End With

End Sub

Public Sub deleteProfexAct(ByVal index As Long)
    Dim i As Long

    If index < cantPxAct Then

        For i = index To cantPxAct - 1
            ProfeXAct(i) = ProfeXAct(i + 1)
        Next

    End If

    cantPxAct = cantPxAct - 1
End Sub

Public Sub XCHANGE_Profexact(ByVal index1 As Long, ByVal index2 As Long)
    Dim pxact As TProfeXAct
    pxact = ProfeXAct(index1)
    ProfeXAct(index1) = ProfeXAct(index2)
    ProfeXAct(index2) = pxact
End Sub

Public Sub XCHANGE_LxAct_Lug(ByVal ix As Long, ByVal index1 As Long, ByVal index2 As Long)

    Dim id As String

    With LugXact(ix)
        id = .idlug(index1)
        .idlug(index1) = .idlug(index2)
        .idlug(index2) = id
    End With

End Sub

'devuelve cantidad a partir de arreglo

Public Function getCantOf(ByVal arreglo As Long) As Long

    Select Case arreglo

        Case dPERIODO, dDESGLOSE
            getCantOf = periodos.Count

        Case dESPECIALIDAD
            getCantOf = cantEsp

        Case dCLASIF
            getCantOf = cantClasif

        Case dPROFE
            getCantOf = cantProfe

        Case dLUGAR
            getCantOf = cantLug

        Case dBRIGADA
            getCantOf = cantBrg

        Case dASIG
            getCantOf = cantAsig

        Case dRECURSO
            getCantOf = recursos.Count
    End Select

End Function

'devuelve id segun arreglo y idx

Public Function getIdOf(ByVal arreglo As Long, ByVal i As Long, Optional pasig As Long = 0) As String

    Select Case arreglo

        Case dPERIODO
            getIdOf = periodos(i).id

        Case dESPECIALIDAD
            getIdOf = Especialidad(i).id

        Case dCLASIF
            getIdOf = clasif(i).comun.id

        Case dPROFE
            getIdOf = profe(i).id

        Case dLUGAR
            getIdOf = lugar(i).id

        Case dBRIGADA
            getIdOf = Brigada(i).comun.id

        Case dASIG
            getIdOf = asig(i).comun.id

        Case dDESGLOSE
            getIdOf = asig(pasig).desglose(i).idperiodo

        Case dRECURSO
            getIdOf = recursos(i).id
    End Select
End Function

'Devuelve el indice de un elemento de un arreglo segun su id

Public Function IndexById(ByVal arreglo As Long, ByVal pid As String, Optional ByVal pasig As Long = 0) As Long
    Dim kk As Long
    If arreglo = dDESGLOSE Then
        If pasig <> 0 Then
            For kk = 1 To periodos.Count
                If kernel.utils.idigual(asig(pasig).desglose(kk).idperiodo, pid) Then
                    IndexById = kk
                    Exit For
                End If
            Next
        End If
        Exit Function
    End If
        
    Dim reintento As Boolean
otra_vez:
    
        If (arreglo = dPERIODO And hashPer Is Nothing) _
            Or (arreglo = dESPECIALIDAD And hashEsp Is Nothing) _
            Or (arreglo = dBRIGADA And hashBrg Is Nothing) _
            Or (arreglo = dASIG And hashAsg Is Nothing) _
            Or (arreglo = dLUGAR And hashLug Is Nothing) _
            Or (arreglo = dRECURSO And hashRes Is Nothing) _
            Or (arreglo = dPROFE And hashPrf Is Nothing) _
            Or (arreglo = dCLASIF And hashCls Is Nothing) Then
            updateHash_objects
            reintento = True
        End If
         
        Select Case arreglo
            Case dPERIODO:                If hashPer.Existe(pid) Then IndexById = hashPer(pid).idx
            Case dESPECIALIDAD:           If hashEsp.Existe(pid) Then IndexById = hashEsp(pid).idx
            Case dBRIGADA:                If hashBrg.Existe(pid) Then IndexById = hashBrg(pid).idx
            Case dASIG:                   If hashAsg.Existe(pid) Then IndexById = hashAsg(pid).idx
            Case dLUGAR:                  If hashLug.Existe(pid) Then IndexById = hashLug(pid).idx
            Case dRECURSO:                If hashRes.Existe(pid) Then IndexById = hashRes(pid).idx
            Case dPROFE:                  If hashPrf.Existe(pid) Then IndexById = hashPrf(pid).idx
            Case dCLASIF:                 If hashCls.Existe(pid) Then IndexById = hashCls(pid).idx
        End Select
    
        If IndexById > 0 Or reintento Then Exit Function
    
        updateHash_objects
        reintento = True
        GoTo otra_vez
        
Exit Function
    
    Dim i As Long, id As String, cant As Long, jj As Long
    Dim idd As Long
    IndexById = 0
    pid = kernel.utils.trunca(LCase(pid))
    'busco en la caché
    idd = -1
    idd = cacheID(arreglo).Item(pid).idx

    If idd > 0 Then
        IndexById = idd

        Dim idcheck As String
        idcheck = ""

        Select Case arreglo

            Case dPERIODO:      If idd <= periodos.Count Then idcheck = periodos(idd).id
            Case dESPECIALIDAD: If idd <= getCantEspecialidades Then idcheck = Especialidad(idd).id
            Case dBRIGADA:      If idd <= getCantBrg Then idcheck = Brigada(idd).comun.id
            Case dASIG:         If idd <= getCantAsig Then idcheck = asig(idd).comun.id
            Case dLUGAR:        If idd <= getCantLug Then idcheck = lugar(idd).id
            Case dRECURSO:      If idd <= recursos.Count Then idcheck = recursos(idd).id
            Case dPROFE:        If idd <= cantProfe Then idcheck = profe(idd).id
            Case dCLASIF:       If idd <= cantClasif Then idcheck = clasif(idd).comun.id
        End Select

        If kernel.utils.idigual(idcheck, pid) Then
            Exit Function
        Else
            cacheID(arreglo).Remove pid 'botando chatarra de la cache
        End If
    End If

    If BuscaPorHASH And arreglo <> dDESGLOSE Then 'BUSQUEDA POR HASH

        If kernel.utils.trunca(pid) <> "" Then
            jj = Asc(Mid(pid, 1, 1))

            If Not mvarHash("" & arreglo) Is Nothing Then

                If Not mvarHash("" & arreglo).BeginWith("" & jj) Is Nothing Then

                    If Not mvarHash("" & arreglo).BeginWith("" & jj).IndexOf(kernel.utils.trunca(pid)) Is Nothing Then

                        IndexById = mvarHash("" & arreglo).BeginWith("" & jj).IndexOf(kernel.utils.trunca(pid)).idx

                    End If

                End If

            End If

            If IndexById <> 0 Then cacheID(arreglo).add pid, IndexById
        End If

    End If

    If IndexById = 0 Or BuscaPorHASH = False Then 'BUSQUEDA SECUENCIAL
        cant = getCantOf(arreglo)

        For i = 1 To cant
            id = getIdOf(arreglo, i, pasig)

            If kernel.utils.idigual(id, pid) Then
                If arreglo <> dDESGLOSE Then cacheID(arreglo).add pid, i
                IndexById = i
                Exit Function
            End If

        Next

    End If

End Function

'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'Devuelve el indice de un element de un arreglo (TRecurso.Rest()) en dependencia de
'TRecurso.Res().Periodo = per
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

Public Function IndexRestZpriori(per As String, idclasif As Long) As Long
    Dim i As Long

    With clasif(idclasif)
        reparaClasifZpriori idclasif

        For i = 1 To periodos.Count

            If kernel.utils.idigual(.zpriori(i).idperiodo, per) Then
                IndexRestZpriori = i
                Exit Function
            End If

        Next

    End With

    IndexRestZpriori = 0
End Function

Public Function IndexGrupoxClasif(brg As Long, pclasif As String) As Long
    Dim j As Long, i As Long

    For j = 1 To Brigada(brg).cantGxClasif

        If kernel.utils.idigual(Brigada(brg).GrupoXClasif(j).idclasif, pclasif) Then
            IndexGrupoxClasif = j
            Exit Function
        End If

    Next

    IndexGrupoxClasif = 0
End Function

Public Function IndexProfexAct(per As Long, asg As Long, act As Long, ByRef cant As Long) As Variant

    Dim i As Long, listaids() As Long
    cant = 0

    For i = 1 To cantPxAct

        With ProfeXAct(i)

            If kernel.utils.idigual(.para.idper, periodos(per).id) And kernel.utils.idigual(.para.idasig, _
                asig(asg).comun.id) And .para.idact = act _
                Then

                cant = cant + 1
                ReDim Preserve listaids(cant)
                listaids(cant) = i
            End If

        End With

    Next

    IndexProfexAct = listaids
End Function

Public Function IndexLugxAct(per As Long, asg As Long, act As Long) As Long
    Dim i As Long

    For i = 1 To cantLxAct

        With LugXact(i)

            If kernel.utils.idigual(.para.idper, periodos(per).id) And kernel.utils.idigual(.para.idasig, _
                asig(asg).comun.id) And .para.idact = act _
                Then

                IndexLugxAct = i
                Exit Function
            End If

        End With

    Next

End Function

Public Function IndexResxAct(per As Long, asg As Long, act As Long) As Long
    Dim i As Long

    For i = 1 To recursosXact.Count

        With recursosXact(i)

            If kernel.utils.idigual(.per, periodos(per).id) And kernel.utils.idigual(.asg, asig(asg).comun.id) _
                And .act = act _
                Then

                IndexResxAct = i
                Exit Function
            End If

        End With

    Next

End Function

Public Function IndexByIdFila(id As String) As Long
    Dim i As Long

    For i = 1 To cantLug

        If kernel.utils.idigual(Distancias(i).id, id) Then
            IndexByIdFila = i
            Exit Function
        End If

    Next

End Function

Public Function IndexByIdColum(id As String, fil As Long) As Long
    Dim i As Long

    For i = 1 To cantLug

        If kernel.utils.idigual(Distancias(fil).colum(i).id, id) Then
            IndexByIdColum = i
            Exit Function
        End If

    Next

End Function

Public Sub setLugxAct_Priori(ix As Long, idlug As Long, priority As Long)

    If ix <= cantLxAct Then
        ReDim Preserve LugXact(ix).priori(LugXact(ix).cantLug)

        If idlug <= LugXact(ix).cantLug Then LugXact(ix).priori(idlug) = priority
    End If

End Sub

Public Sub insertLugXAct(ByVal idact As Long, ByVal idasig As String, ByVal idper As String)

    cantLxAct = cantLxAct + 1
    ReDim Preserve LugXact(cantLxAct)

    With LugXact(cantLxAct)
        .para.idact = idact
        .para.idasig = idasig
        .para.idper = idper
        .cantLug = 0
    End With

End Sub

Public Function getCantLxAct()
    getCantLxAct = cantLxAct
End Function

Public Function getCantPxAct()
    getCantPxAct = cantPxAct
End Function

Public Sub deleteLxAct(ix As Long)
    Dim i As Long

    For i = ix To getCantLxAct - 1
        LugXact(i) = LugXact(i + 1)
    Next

    ReDim Preserve LugXact(cantLxAct)
    cantLxAct = cantLxAct - 1
End Sub

Public Function getLxAct_MaxPriority(ByVal ix As Long, Optional ByVal asg As String, Optional ByVal per As String, Optional ByVal act As Long) As Long

    Dim max As Long, i As Long

    If ix <= 0 Then ix = getIndexOfLxAct(asg, per, act)

    If ix > 0 Then

        With LugXact(ix)

            For i = 1 To .cantLug

                If max < .priori(i) Then max = .priori(i)
            Next

        End With

    End If

    getLxAct_MaxPriority = max
End Function

Public Function getLxAct_Priority(ByVal ix As Long, ByVal idlug As Long, Optional ByVal asg As String, Optional ByVal per As String, Optional ByVal act As Long) As Long

    If ix <= 0 Then ix = getIndexOfLxAct(asg, per, act)

    If ix > 0 Then

        With LugXact(ix)
            ReDim Preserve .priori(.cantLug)

            If idlug <= .cantLug Then getLxAct_Priority = .priori(idlug)
        End With

    End If

End Function

Public Function getLxAct_Lug(ByVal ix As Long, ByVal idlug As Long, Optional ByVal asg As String, Optional ByVal per As String, Optional ByVal act As Long) As String

    If ix <= 0 Then ix = getIndexOfLxAct(asg, per, act)

    If ix > 0 Then

        With LugXact(ix)
            ReDim Preserve .idlug(.cantLug)

            If idlug <= .cantLug Then getLxAct_Lug = .idlug(idlug)
        End With

    End If

End Function

Public Sub deleteLxAct_lug(ByVal ix As Long, ByVal idlug As Long, Optional ByVal asg As String, Optional ByVal per As String, Optional ByVal act As Long)

    Dim i As Long

    If ix <= 0 Then ix = getIndexOfLxAct(asg, per, act)

    If ix > 0 Then

        With LugXact(ix)

            If idlug <= .cantLug Then

                For i = idlug To .cantLug - 1
                    .idlug(i) = .idlug(i + 1)
                    .priori(i) = .priori(i + 1)
                Next

                .cantLug = .cantLug - 1
            End If

        End With

    End If

End Sub

Public Function getCantLug() As Long
    getCantLug = cantLug
End Function

Public Function getCantAsig() As Long
    getCantAsig = cantAsig
End Function

Public Function getCantBrg() As Long
    getCantBrg = cantBrg
End Function

Public Function getCantPer() As Long
    getCantPer = periodos.Count
End Function

Public Function getArrayOfGruposXClasif(ByVal esp As String, ByVal Nivel As Long, ByVal cla As String, ByRef cantGrupos As Long) As Variant

    Dim i As Long, j As Long, k As Long
    Dim grupos() As Long
    cantGrupos = 0

    For i = 1 To cantBrg

        With Brigada(i)

            If kernel.utils.idigual(.idesp, esp) And .Nivel = Nivel Then

                For j = 1 To cantClasif

                    If kernel.utils.idigual(.GrupoXClasif(j).idclasif, cla) Then

                        For k = 1 To cantGrupos

                            If grupos(k) = .GrupoXClasif(j).grupo Then GoTo 10
                        Next

                        cantGrupos = cantGrupos + 1
                        ReDim Preserve grupos(cantGrupos)
                        grupos(cantGrupos) = .GrupoXClasif(j).grupo
10:
                    End If

                Next

            End If

        End With

    Next

    getArrayOfGruposXClasif = grupos
End Function

Public Function getArrayOfBrigadasByEspAndNivel(ByVal esp As String, ByVal Nivel As Long, ByRef cant As Long) As Variant

    Dim i As Long, brgs() As Long
    cant = 0

    For i = 1 To cantBrg

        With Brigada(i)

            If kernel.utils.idigual(.idesp, esp) And .Nivel = Nivel Then
                cant = cant + 1
                ReDim Preserve brgs(cant)
                brgs(cant) = i
            End If

        End With

    Next

    getArrayOfBrigadasByEspAndNivel = brgs
End Function

Public Function getArrayOfBrgsByEspNivelClasifGroup(ByVal esp As String, ByVal Nivel As Long, ByVal cla As String, ByVal grupo As Long, ByRef cant As Long) As Variant

    Dim i As Long, brgs() As Long, j As Long
    Dim brgss As Variant, cantt As Long
    cant = 0
    brgss = getArrayOfBrigadasByEspAndNivel(esp, Nivel, cantt)

    For i = 1 To cantt

        With Brigada(brgss(i))

            For j = 1 To cantClasif

                If kernel.utils.idigual(.GrupoXClasif(j).idclasif, cla) And grupo = _
                    .GrupoXClasif(j).grupo _
                    Then

                    cant = cant + 1
                    ReDim Preserve brgs(cant)
                    brgs(cant) = brgss(i)
                    Exit For
                End If

            Next

        End With

    Next

    getArrayOfBrgsByEspNivelClasifGroup = brgs
End Function

Public Function getLugarFijo(ByVal esp)
End Function

Public Sub insertPxAct_Grupo(ByVal ix As Long, ByVal grupo As Long, Optional idprofe As String = "", Optional ByVal asg As String, Optional ByVal per As String, Optional ByVal act As Long)

    Dim i As Long

    If ix <= 0 Then ix = getIndexOfPxAct(asg, per, act, idprofe)

    If ix > 0 Then

        With ProfeXAct(ix)
            .cantGrupos = .cantGrupos + 1
            ReDim Preserve .grupos(.cantGrupos)
            .grupos(.cantGrupos) = grupo
        End With

    End If

End Sub

Public Sub updateAsignaciones(Query As String, values As String, setcampos As String, newvalues As String)

    Dim i As Long, j As Long, k As Boolean
    Dim campo As String, xcampo As String, cantcampos As Long
    Dim act As TActAsignada, iclasif As Long, brg As TFiltro, esp As Long, id As Long
    Dim grupos As TFiltro, asg As Long, per As Long
    Dim g As Long, ini As Long, iprof1 As Long, iasig As Long
    Dim desg As Long, iclas As Long, turnos As Long, clas As String
    Dim ibrg As Long, iprof As Long, ilug As Long
    Dim ii As Long, iperxrest As Long
    Dim idx As Long
    Dim grupoasig As Long
    Dim NoCompare_getGrupoAsignacion As Boolean

    If InStr(1, Query, "idact") <> 0 And InStr(1, Query, "grupo") <> 0 And InStr(1, _
    Query, "idasig") <> 0 Then NoCompare_getGrupoAsignacion = _
    False

    updatehash
    Dim kk As Long
    cantcampos = kernel.strings.cantsubcadenas(Query, ",")

    

    For i = 1 To cantAsignaciones
        kk = i

        interface.console.Progress "Trabajando....", kernel.utils.Porciento(kk, cantAsignaciones)

        k = True

        With Asignaciones(i)
            iasig = IndexById(dASIG, .idasig, 0)

            If iasig = 0 Then GoTo 10
            desg = IndexById(dDESGLOSE, .idperiodo, iasig)

            If desg = 0 Then GoTo 10
            clas = asig(iasig).desglose(desg).act(.idact).idclasif
            iclas = IndexById(dCLASIF, clas, 0)
            turnos = clasif(iclas).ct
            ibrg = IndexById(dBRIGADA, .idbrigada, 0)
            iprof = IndexById(dPROFE, .idprofe, 0)
            ilug = IndexById(dLUGAR, .idlugar, 0)

            For j = 1 To cantcampos
                campo = kernel.utils.trunca(kernel.strings.subcadena(Query, j, ","))
                xcampo = kernel.utils.trunca(kernel.strings.subcadena(values, j, ","))

                Select Case campo

                    Case "dia"
                        k = k And .dia = Val(xcampo)

                    Case "turno"
                        k = k And .turno = Val(xcampo)

                    Case "idprofe"
                        k = k And kernel.utils.idigual(.idprofe, xcampo)

                    Case "idasig"
                        k = k And kernel.utils.idigual(.idasig, xcampo)

                    Case "idact"
                        k = k And .idact = Val(xcampo)

                    Case "idlugar"
                        k = k And kernel.utils.idigual(.idlugar, xcampo)

                    Case "idperiodo"
                        k = k And kernel.utils.idigual(.idperiodo, xcampo)

                    Case "idbrigada"
                        k = k And kernel.utils.idigual(.idbrigada, xcampo)

                    Case "fecha"
                        k = k And kernel.utils.idigual(.fecha, xcampo)

                    Case "hora"
                        k = k And kernel.utils.idigual(.hora, xcampo)

                    Case "fija"
                        k = k And .fija = Val(xcampo)

                    Case "grupo"

                        If grupoasig = 0 Then grupoasig = getGrupoAsignacion(i) = Val(xcampo)

                        If Not NoCompare_getGrupoAsignacion Then
                            k = k And getGrupoAsignacion(i) = Val(xcampo)
                        Else
                            k = k And grupoasig
                        End If

                    Case "clasif"
                        k = k And kernel.utils.idigual(getClasifOfActivity(.idasig, .idperiodo, .idact), xcampo)

                End Select

10:
            Next

            If k Then

                For j = 1 To cantcampos
                    campo = kernel.utils.trunca(kernel.strings.subcadena(setcampos, j, ","))
                    xcampo = kernel.utils.trunca(kernel.strings.subcadena(newvalues, j, ","))

                    Select Case campo

                        Case "dia"
                            'actualizo las restricciones para el mismo turno pero dia diferente
                            'profe
                            idx = IndexById(dPROFE, .idprofe, 0)

                            For ii = 1 To turnos
                                iperxrest = IndexRestRecurso(.idperiodo, profe(idx))
                                profe(idx).rest(iperxrest).rest(.dia, .turno + ii - 1) = False
                                profe(idx).rest(iperxrest).rest(Val(xcampo), .turno + ii - 1) = True
                            Next

                            'lugar
                            idx = IndexById(dLUGAR, .idlugar, 0)

                            For ii = 1 To turnos
                                iperxrest = IndexRestRecurso(.idperiodo, lugar(idx))
                                lugar(idx).rest(iperxrest).rest(.dia, .turno + ii - 1) = False
                                lugar(idx).rest(iperxrest).rest(Val(xcampo), .turno + ii - 1) = True
                            Next

                            'brigada
                            idx = IndexById(dBRIGADA, .idbrigada, 0)

                            For ii = 1 To turnos
                                iperxrest = IndexRestRecurso(.idperiodo, Brigada(idx).comun)
                                Brigada(idx).comun.rest(iperxrest).rest(.dia, .turno + ii - 1) = False
                                Brigada(idx).comun.rest(iperxrest).rest(Val(xcampo), .turno + ii - 1) = True

                            Next

                            .dia = Val(xcampo)

                        Case "turno"
                            'actualizo las restricciones para el mismo turno pero dia diferente
                            'profe
                            idx = IndexById(dPROFE, .idprofe, 0)

                            For ii = 1 To turnos
                                iperxrest = IndexRestRecurso(.idperiodo, profe(idx))
                                profe(idx).rest(iperxrest).rest(.dia, .turno + ii - 1) = False
                                profe(idx).rest(iperxrest).rest(.dia, Val(xcampo) + ii - 1) = True
                            Next

                            'lugar
                            idx = IndexById(dLUGAR, .idlugar, 0)

                            For ii = 1 To turnos
                                iperxrest = IndexRestRecurso(.idperiodo, lugar(idx))
                                lugar(idx).rest(iperxrest).rest(.dia, .turno + ii - 1) _
                                = _
                                False

                                lugar(idx).rest(iperxrest).rest(.dia, Val(xcampo) + ii _
                                - 1) = _
                                True

                            Next

                            'brigada
                            idx = IndexById(dBRIGADA, .idbrigada, 0)

                            For ii = 1 To turnos
                                iperxrest = IndexRestRecurso(.idperiodo, _
                                Brigada(idx).comun)

                                Brigada(idx).comun.rest(iperxrest).rest(.dia, .turno + _
                                ii - 1) = _
                                False

                                Brigada(idx).comun.rest(iperxrest).rest(.dia, _
                                Val(xcampo) + ii - 1) = _
                                True

                            Next

                            .turno = Val(xcampo)

                        Case "idprofe"
                            iprof1 = IndexById(dPROFE, xcampo, 0)

                            For ii = 1 To turnos
                                iperxrest = IndexRestRecurso(.idperiodo, profe(iprof))
                                profe(iprof).rest(iperxrest).rest(.dia, .turno + ii - _
                                1) = _
                                False

                                iperxrest = IndexRestRecurso(.idperiodo, profe(iprof1))
                                profe(iprof1).rest(iperxrest).rest(.dia, .turno + ii - _
                                1) = _
                                True

                            Next

                            .idprofe = xcampo

                        Case "idasig"
                            .idasig = xcampo

                        Case "idact"
                            .idact = Val(xcampo)

                        Case "idlugar"
                            iprof1 = IndexById(dLUGAR, xcampo, 0)

                            For ii = 1 To turnos
                                iperxrest = IndexRestRecurso(.idperiodo, lugar(ilug))
                                lugar(ilug).rest(iperxrest).rest(.dia, .turno + ii - 1) _
                                = _
                                False

                                iperxrest = IndexRestRecurso(.idperiodo, lugar(iprof1))
                                lugar(iprof1).rest(iperxrest).rest(.dia, .turno + ii - _
                                1) = _
                                True

                            Next

                            .idlugar = xcampo

                        Case "idperiodo"
                            .idperiodo = xcampo

                        Case "idbrigada"
                            iprof1 = IndexById(dBRIGADA, xcampo, 0)

                            For ii = 1 To turnos
                                iperxrest = IndexRestRecurso(.idperiodo, _
                                Brigada(ibrg).comun)

                                Brigada(ibrg).comun.rest(iperxrest).rest(.dia, .turno + _
                                ii - 1) = _
                                False

                                iperxrest = IndexRestRecurso(.idperiodo, _
                                Brigada(iprof1).comun)

                                Brigada(iprof1).comun.rest(iperxrest).rest(.dia, .turno _
                                + ii - 1) = _
                                True

                            Next

                            .idbrigada = xcampo

                        Case "fecha"
                            .fecha = xcampo

                        Case "hora"
                            .hora = xcampo

                        Case "fija"
                            .fija = Val(xcampo)

                    End Select

                Next

            End If

        End With

    Next

    
End Sub

Public Sub BeginIDX()
    On Error Resume Next
    Dim i As Long, j As Long

    
    'profexact

    For i = 1 To cantPxAct
        interface.console.Progress "Aumentando velocidad del generador...", kernel.utils.Porciento(kernel.utils.Porciento(i, cantPxAct) / 2, 100)
        ProfeXAct(i).idxprofe = hashPrf(ProfeXAct(i).idprofes).idx  'IndexById(dPROFE, ProfeXAct(i).idprofes, 0)
    Next

    'lugxact

    For i = 1 To cantLxAct
        interface.console.Progress "Aumentando velocidad del generador...", kernel.utils.Porciento(50 + kernel.utils.Porciento(i, cantLxAct) / 2, 100)
        With LugXact(i)
            ReDim .idxlug(.cantLug)
            For j = 1 To .cantLug
                .idxlug(j) = hashLug(.idlug(j)).idx  'IndexById(dLUGAR, .idlug(j), 0)
            Next
        End With
    Next

    
End Sub

Public Sub FiltraIDPxAct(esp As Long, Nivel As Long, per As Long)

    Dim i As Long, j As Long

    
    cantIDPxAct = 0

    For i = 1 To cantPxAct

        interface.console.Progress "Aumentando velocidad....", kernel.utils.Porciento(i, cantPxAct)

        With ProfeXAct(i)
            j = IndexById(dASIG, .para.idasig, 0)

            If kernel.utils.idigual(.para.idper, periodos(per).id) And kernel.utils.idigual(asig(j).idesp, _
                Especialidad(esp).id) And Nivel = asig(j).Nivel _
                Then

                cantIDPxAct = cantIDPxAct + 1
                ReDim Preserve ListaIDPxAct(cantIDPxAct)
                ListaIDPxAct(cantIDPxAct) = i
            End If

        End With

    Next

    
End Sub

Public Sub FiltraIDLxAct(esp As Long, Nivel As Long, per As Long)

    Dim i As Long, j As Long

    
    cantIDLxAct = 0

    For i = 1 To cantLxAct

        interface.console.Progress "Aumentando velocidad....", kernel.utils.Porciento(i, cantLxAct)

        With LugXact(i)
            j = IndexById(dASIG, .para.idasig, 0)

            If kernel.utils.idigual(.para.idper, periodos(per).id) And kernel.utils.idigual(asig(j).idesp, _
                Especialidad(esp).id) And Nivel = asig(j).Nivel _
                Then

                cantIDLxAct = cantIDLxAct + 1
                ReDim Preserve ListaIDLxAct(cantIDLxAct)
                ListaIDLxAct(cantIDLxAct) = i
            End If

        End With

    Next

    
End Sub

Public Function EstaticaConfig()
    CD = 7
    ct = 10
End Function

Public Function getCantPxActOfActivity(ByVal idasig As String, ByVal idper As String, ByVal idact As Long) As Long

    Dim i As Long, cant As Long

    For i = 1 To getCantPxAct

        With ProfeXAct(i)

            If kernel.utils.idigual(.para.idasig, idasig) And kernel.utils.idigual(.para.idper, idper) And _
            .para.idact = idact Then cant = cant + 1

        End With

    Next

    getCantPxActOfActivity = cant
End Function

Public Sub clearPxActOfPeriod(idper As String)
    Dim i As Long, listaid() As Long, cantlistaid As Long
    cantlistaid = 0
    'obtengo una lista de los que voy a borrar

    For i = 1 To cantPxAct

        With ProfeXAct(i)

            If kernel.utils.idigual(.para.idper, idper) Then
                cantlistaid = cantlistaid + 1
                ReDim Preserve listaid(cantlistaid)
                listaid(cantlistaid) = i
            End If

        End With

    Next

    'cojo los ultimos y los pongo en los de la lista id
    'si y solo si no es el ultimo uno de la lista, aunque no importa si no lo pregunto
    'jaja!
    'voy desde el ultimo hasta el primero, esto esta genial!

    For i = cantlistaid To 1 Step -1
        ProfeXAct(listaid(i)) = ProfeXAct(cantLxAct)
        cantPxAct = cantPxAct - 1
    Next

    ReDim Preserve ProfeXAct(cantPxAct)
End Sub

Public Sub clearLxActOfPeriod(idper As String) 'limpiar  los lugares por actividad de un periodo
    Dim i As Long, listaid() As Long, cantlistaid As Long
    cantlistaid = 0
    'obtengo una lista de los que voy a borrar

    For i = 1 To cantLxAct

        With LugXact(i)

            If kernel.utils.idigual(.para.idper, periodos(idper).id) Then
                cantlistaid = cantlistaid + 1
                ReDim Preserve listaid(cantlistaid)
                listaid(cantlistaid) = i
            End If

        End With

    Next

    'cojo los ultimos y los pongo en los de la lista id
    'si y solo si no es el ultimo uno de la lista, aunque no importa si no lo pregunto
    'jaja!
    'voy desde el ultimo hasta el primero, esto esta genial!

    For i = cantlistaid To 1 Step -1
        LugXact(listaid(i)) = LugXact(cantLxAct)
        cantLxAct = cantLxAct - 1
    Next

    ReDim Preserve LugXact(cantLxAct)
End Sub


Public Sub clearRxActOfPeriod(idper As String) 'limpiar los otros recursos x act de un periodo
    Dim i As Long, listaid() As Long, cantlistaid As Long
    cantlistaid = 0
    'obtengo una lista de los que voy a borrar

    For i = 1 To recursosXact.Count

        With recursosXact(i)

            If kernel.utils.idigual(.per, periodos(idper).id) Then
                cantlistaid = cantlistaid + 1
                ReDim Preserve listaid(cantlistaid)
                listaid(cantlistaid) = i
            End If

        End With

    Next

    'cojo los ultimos y los pongo en los de la lista id
    'si y solo si no es el ultimo uno de la lista, aunque no importa si no lo pregunto
    'jaja!
    'voy desde el ultimo hasta el primero, esto esta genial!

    For i = cantlistaid To 1 Step -1
        recursosXact.Remove listaid(i)
    Next

End Sub


Public Sub eliminaRestriccionesDeAsignacion(id As Long)
    Dim i As Long, iasig As Long, desg As Long, clas As String, iclas As Long
    Dim turnos As Long, ibrg As Long, iprof As Long, ilug As Long
    Dim iperxrest As Long

    With Asignaciones(id)
        iasig = IndexById(dASIG, .idasig, 0)
        desg = IndexById(dDESGLOSE, .idperiodo, iasig)
        clas = asig(iasig).desglose(desg).act(.idact).idclasif
        iclas = IndexById(dCLASIF, clas, 0)
        turnos = clasif(iclas).ct
        ibrg = IndexById(dBRIGADA, .idbrigada, 0)
        iprof = IndexById(dPROFE, .idprofe, 0)
        ilug = IndexById(dLUGAR, .idlugar, 0)

        For i = 1 To turnos
            iperxrest = IndexRestRecurso(.idperiodo, Brigada(ibrg).comun)
            Brigada(ibrg).comun.rest(iperxrest).rest(.dia, .turno + i - 1) = False
            iperxrest = IndexRestRecurso(.idperiodo, profe(iprof))
            profe(iprof).rest(iperxrest).rest(.dia, .turno + i - 1) = False
            iperxrest = IndexRestRecurso(.idperiodo, lugar(ilug))
            lugar(ilug).rest(iperxrest).rest(.dia, .turno + i - 1) = False
        Next

        'quitando restricciones a recursos
        Dim ires As Long, j As Long

        For j = 1 To .cantrecursos
            ires = IndexById(dRECURSO, .recursos(j))
            If ires > 0 Then
                For i = 1 To turnos
                    recursos(ires).setRestriccion .idperiodo, .dia, .turno + i - 1, 0
                Next
            End If
        Next

    End With

End Sub

Public Sub eliminaAsignacion(id As Long)
    clearAsignacionesOfPeriod , id
End Sub

Public Sub clearAsignacionesOfPeriod(Optional ByVal idper As String = "", Optional id As Long = 0, Optional esp As Long = 0, Optional Nivel As Long = 0, Optional ByVal per As Long = 0)

    Dim i As Long, listaid() As Long, cantlistaid As Long
    Dim k As Long

    
    cantlistaid = 0

    If idper <> "" Then
        'obtengo una lista de los que voy a borrar

        For i = 1 To cantAsignaciones
'            interface.console.Progress "Analizando asignaciones...", kernel.utils.Porciento(i, cantAsignaciones)

            With Asignaciones(i)

                If (kernel.utils.idigual(.idperiodo, idper)) Then
                    cantlistaid = cantlistaid + 1
                    ReDim Preserve listaid(cantlistaid)
                    listaid(cantlistaid) = i
                End If

            End With

        Next

    Else

        If id <> 0 Then
            cantlistaid = 1
            ReDim Preserve listaid(1)
            listaid(1) = id
        Else

            If esp <> 0 And Nivel <> 0 And per <> 0 Then
                cantlistaid = 0

                For i = 1 To cantAsignaciones
 '                   interface.console.Progress _
  '                  "Eliminando asignaciones de actividades >> Especialidad = " & interface.getRS_Especialidad(0, asig(k).idesp) & ", Nivel = " & asig(k).Nivel & ", Período = " & interface.getRS_Periodo(0, periodos(per).id), i / _
   '                 cantAsignaciones * 100

                    With Asignaciones(i)
                        k = IndexById(dASIG, .idasig, 0)

                        If kernel.utils.idigual(asig(k).idesp, Especialidad(esp).id) And _
                            asig(k).Nivel = Nivel And kernel.utils.idigual(.idperiodo, periodos(per).id) _
                            And Not .fija _
                            Then

                            cantlistaid = cantlistaid + 1
                            ReDim Preserve listaid(cantlistaid)
                            listaid(cantlistaid) = i
                        End If

                    End With

                Next

            End If

        End If

    End If

    'cojo los ultimos y los pongo en los de la lista id
    'si y solo si no es el ultimo uno de la lista, aunque no importa si no lo pregunto
    'jaja!
    'voy desde el ultimo hasta el primero, esto esta genial!

    If cantlistaid > 0 Then

        For i = cantlistaid To 1 Step -1
    '        interface.console.Progress _
     '       "Eliminando asignaciones de actividades correspondientes", i / _
      '      cantAsignaciones

            eliminaRestriccionesDeAsignacion listaid(i)
            Asignaciones(listaid(i)) = Asignaciones(cantAsignaciones)
            cantAsignaciones = cantAsignaciones - 1
        Next

        ReDim Preserve Asignaciones(cantAsignaciones)
    End If

'    interface.console.Hide
End Sub

Public Sub duplicatePxAct(ByVal ix As Long, ByVal oldper As String, ByVal idper As String)

    If kernel.utils.idigual(ProfeXAct(ix).para.idper, oldper) Then
        insertProfexAct ProfeXAct(ix).para.idasig, idper, ProfeXAct(ix).para.idact, _
        ProfeXAct(ix).idprofes

        ProfeXAct(cantPxAct) = ProfeXAct(ix)
        ProfeXAct(cantPxAct).para.idper = idper
    End If

End Sub

Public Sub duplicateLxAct(ByVal ix As Long, ByVal oldper As String, ByVal idper As String)

    If kernel.utils.idigual(LugXact(ix).para.idper, oldper) Then
        insertLugXAct LugXact(ix).para.idact, LugXact(ix).para.idasig, idper
        LugXact(cantLxAct) = LugXact(ix)
        LugXact(cantLxAct).para.idper = idper
    End If

End Sub

Public Sub duplicateRxAct(ByVal ix As Long, ByVal oldper As String, ByVal idper As String)
    If kernel.utils.idigual(Me.recursosXact(ix).per, oldper) Then recursosXact.add recursosXact(ix).act, idper, recursosXact(ix).asg, recursosXact(ix).gruposRecursos
End Sub

Public Sub duplicateAsignacionAct(ByVal ix As Long, ByVal oldper As String, ByVal idper As String)

    If kernel.utils.idigual(Asignaciones(ix).idperiodo, oldper) Then
        cantAsignaciones = cantAsignaciones + 1
        ReDim Preserve Asignaciones(cantAsignaciones)
        Asignaciones(cantAsignaciones) = Asignaciones(ix)
        Asignaciones(cantAsignaciones).idperiodo = idper
    End If

End Sub

Public Sub setRestriccionesByMatrix(ByVal modo As Long, ByVal id As Long, ByVal per As String, ByVal iper As Long, ByVal matrix As Variant)

    Dim a As String
    Dim pid As Long
    Dim ll As Long, i As Long, j As Long
    Dim t As TRecurso

    If per <> "" Then iper = IndexById(dPERIODO, per, 0)
    per = periodos(iper).id

    If iper > 0 Then

        For i = 1 To CD

            For j = 1 To ct

                Select Case modo

                    Case 1
                        periodos(iper).setTimeRequest i, j, matrix(i, j)

                    Case 2
                        pid = IndexRestRecurso(per, clasif(id).comun)
                        clasif(id).comun.rest(pid).rest(i, j) = matrix(i, j)
                        clasif(id).comun.rest(pid).idperiodo = per

                    Case 3
                        pid = IndexRestRecurso(per, Brigada(id).comun)
                        Brigada(id).comun.rest(pid).rest(i, j) = matrix(i, j)
                        Brigada(id).comun.rest(pid).idperiodo = per

                    Case 4
                        pid = IndexRestRecurso(per, profe(id))
                        profe(id).rest(pid).rest(i, j) = matrix(i, j)
                        profe(id).rest(pid).idperiodo = per

                    Case 5
                        pid = IndexRestRecurso(per, lugar(id))
                        lugar(id).rest(pid).rest(i, j) = matrix(i, j)
                        lugar(id).rest(pid).idperiodo = per

                    Case 7
                        pid = IndexRestRecurso(per, asig(id).comun)
                        asig(id).comun.rest(pid).rest(i, j) = matrix(i, j)
                        asig(id).comun.rest(pid).idperiodo = per

                    Case 8
                        pid = IndexRestRecurso(per, Especialidad(id))
                        Especialidad(id).rest(pid).rest(i, j) = matrix(i, j)
                        Especialidad(id).rest(pid).idperiodo = per

                    Case 9
                        recursos(id).setRestriccion per, i, j, IIf(matrix(i, j), 1, 0)
                End Select

            Next

        Next

    End If

End Sub

Public Function getMatrixFromRestricciones(ByVal modo As Long, ByVal id As Long, ByVal per As String, ByVal iper As Long) As Variant

    Dim pid As Long
    Dim ll As Long, i As Long, j As Long
    Dim t As TRecurso
    Dim matrix() As Boolean
    ReDim matrix(1 To CD, ct)

    If per <> "" Then iper = IndexById(dPERIODO, per, 0)
    per = periodos(iper).id

    If iper > 0 Then
        iper = IndexById(dPERIODO, per, 0)

        For i = 1 To CD

            For j = 1 To ct

                Select Case modo

                    Case 1
                        matrix(i, j) = periodos(iper).getTimeRequest(i, j)

                    Case 2
                        pid = IndexRestRecurso(per, clasif(id).comun)
                        matrix(i, j) = clasif(id).comun.rest(pid).rest(i, j)

                    Case 3
                        pid = IndexRestRecurso(per, Brigada(id).comun)
                        matrix(i, j) = Brigada(id).comun.rest(pid).rest(i, j)

                    Case 4
                        pid = IndexRestRecurso(per, profe(id))
                        matrix(i, j) = profe(id).rest(pid).rest(i, j)

                    Case 5
                        pid = IndexRestRecurso(per, lugar(id))
                        matrix(i, j) = lugar(id).rest(iper).rest(i, j)

                    Case 7
                        pid = IndexRestRecurso(per, asig(id).comun)
                        matrix(i, j) = asig(id).comun.rest(pid).rest(i, j)

                    Case 8
                        pid = IndexRestRecurso(per, Especialidad(id))
                        matrix(i, j) = Especialidad(id).rest(iper).rest(i, j)

                    Case 9
                        matrix(i, j) = recursos(id).getRestriccion(per, i, j)
                End Select

            Next

        Next

    End If

    getMatrixFromRestricciones = matrix
End Function

Public Function ExisteID(arreglo As Long, id As String, Optional asig As Long = 0, Optional exceptoint As Long = 0, Optional exceptostr As String = "") As Boolean

    Dim i As Long

    If exceptostr <> "" Then exceptoint = IndexById(arreglo, exceptostr, asig)
    i = IndexById(arreglo, id)
    ExisteID = i > 0 And exceptoint <> i
End Function

'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'Devuelve la cantidad de actividades de una asignatura
'segun su esp, Nivel, y el periodo
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

Public Function CantActGeneracion(esp As Long, Nivel As Long, per As Long) As Long
    Dim suma As Long, i As Long, p As Long
    suma = 0

    For i = 1 To cantAsig

        With asig(i)

            If kernel.utils.idigual(.idesp, Especialidad(esp).id) And .Nivel = Nivel Then
                p = IndexById(dDESGLOSE, periodos(per).id, i)
                suma = suma + .desglose(p).cantact
            End If

        End With

    Next

    CantActGeneracion = suma
End Function

'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'Analiza los criterios de optimo de una actividad
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

Public Function AnalizaOptimoAct(dia As Long, turno As Long, asg As Long, per As Long, act As Long) As TAna_OptimoAct

    Dim zona As Long
    Dim temp As TRecurso, p As Long, idclasif As Long, k As Long
    Dim ct As Long, suma As Long, i As Long, j As Long
    p = IndexById(dDESGLOSE, periodos(per).id, asg)
    idclasif = IndexById(dCLASIF, asig(asg).desglose(p).act(act).idclasif, 0)
    ct = clasif(idclasif).ct
    suma = 0

    For i = turno To turno + ct - 1
        k = IndexRestZpriori(periodos(per).id, idclasif)

        For zona = 1 To CantZpriori(idclasif, per)

            If EnZPriori(idclasif, zona, per, dia, turno) Then
                suma = suma + 1
                Exit For
            End If

        Next

    Next

    Dim result As TAna_OptimoAct
    Set result = New TAna_OptimoAct
    result.cantenzpriori = suma
    result.ct = clasif(idclasif).ct
    Set AnalizaOptimoAct = result
    Set result = Nothing
End Function

'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'Analiza un horario segun esp, Nivel, per
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

Public Function AnalizaOptimo(esp As Long, Nivel As Long, per As Long) As TAna_Optimo

    Dim result As TAna_Optimo, AA As TAna_OptimoAct
    Dim iiasig As Long, i As Long

    
    Set result = New TAna_Optimo

    For i = 1 To cantAsignaciones

        interface.console.Progress "Analizando...", kernel.utils.Porciento(i, cantAsignaciones)

        With Asignaciones(i)
            iiasig = IndexById(dASIG, .idasig, 0)

            If kernel.utils.idigual(asig(iiasig).idesp, Especialidad(esp).id) And _
                kernel.utils.idigual(.idperiodo, periodos(per).id) And Nivel = asig(iiasig).Nivel _
                Then

                result.cantasignadas = result.cantasignadas + 1

                If .fija Then
                    result.cantActFijas = result.cantActFijas + 1
                Else
                    Set AA = AnalizaOptimoAct(.dia, .turno, IndexById(dASIG, .idasig, _
                    0), per, _
                    .idact)

                    result.totalTurnos = result.totalTurnos + AA.ct
                    result.cantenzpriori = result.cantenzpriori + AA.cantenzpriori
                End If

            End If

        End With

    Next

    With result
        .totalAct = CantActGeneracion(esp, Nivel, per) * CantBrgXGeneracion(esp, Nivel)

        If .totalTurnos = 0 Then .percentZpriori = 0 Else .percentZpriori = kernel.utils.Porciento(.cantenzpriori, .totalTurnos)

        If .totalAct = 0 Then .percentActAsig = 0 Else .percentActAsig = kernel.utils.Porciento((.cantasignadas - .cantActFijas), (.totalAct - .cantActFijas))

        .Nivel = Nivel
        .idesp = Especialidad(esp).id
        .idper = periodos(per).id
    End With

    Set AnalizaOptimo = result
    Set result = Nothing

    
End Function

'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'Devuelve la cantidad de brigadas de una espec y Nivel
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

Public Function CantBrgXGeneracion(esp As Long, Nivel As Long) As Long
    Dim suma As Long, i As Long
    suma = 0

    For i = 1 To cantBrg

        With Brigada(i)

            If kernel.utils.idigual(.idesp, Especialidad(esp).id) And .Nivel = Nivel Then suma = suma + 1

        End With

    Next

    CantBrgXGeneracion = suma
End Function

'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'Analiza lxact y pxact
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

Public Function getAnalisisRecursos() As TAna_arrRecursos

    Dim result As TAna_arrRecursos
    Set result = New TAna_arrRecursos
    Dim i As Long, k As Long, j As Long, l As Long, jj As Long, kk As Long
    Dim sinLugar As Boolean, sinProfe As Boolean, gruposSinProfe As String
    Dim dale As Boolean, grupos As TFiltro, gruposya() As Boolean, encontrado As Boolean
    ReDim gruposya(cantBrg)

    Dim templxact As Variant

    updateHashPxAct
    updateHashLxAct
    
    For i = 1 To cantAsig

        interface.console.Progress "Analizando la asignatura: " + _
        kernel.utils.trunca(asig(i).comun.id) + " - " + kernel.utils.trunca(asig(i).comun.descrip), kernel.utils.Porciento(i, cantAsig)

        For j = 1 To periodos.Count
            DoEvents

            For k = 1 To asig(i).desglose(j).cantact
                DoEvents
                dale = False
                sinLugar = False
                sinProfe = False
                gruposSinProfe = ""
                'lxact
                
                If Not hashLxact(asig(i).comun.id) Is Nothing Then
                    If Not hashLxact(asig(i).comun.id).idper(asig(i).desglose(j).idperiodo) Is Nothing Then
                        If Not hashLxact(asig(i).comun.id).idper(asig(i).desglose(j).idperiodo).idact(k) Is Nothing Then
                            l = hashLxact(asig(i).comun.id).idper(asig(i).desglose(j).idperiodo).idact(k).index
                             With LugXact(l)
                                 If .cantLug = 0 Then
                                     sinLugar = True
                                     dale = True
                                 End If
                             End With
                        End If
                    End If
                End If

                'pxact
                grupos = CantGruposxClasif(IndexById(dESPECIALIDAD, asig(i).idesp, 0), asig(i).Nivel, IndexById(dCLASIF, asig(i).desglose(j).act(k).idclasif, 0))

                For l = 1 To grupos.cant
                    gruposya(l) = False
                Next

                encontrado = False
                
                Dim itm As TKernel_HashPxAct_idprofes
                If Not hashPxact(asig(i).comun.id) Is Nothing Then
                    If Not hashPxact(asig(i).comun.id).idper(asig(i).desglose(j).idperiodo) Is Nothing Then
                        If Not hashPxact(asig(i).comun.id).idper(asig(i).desglose(j).idperiodo).idact(k) Is Nothing Then
                            If Not hashPxact(asig(i).comun.id).idper(asig(i).desglose(j).idperiodo).idact(k).idprofes Is Nothing Then
                                For Each itm In hashPxact(asig(i).comun.id).idper(asig(i).desglose(j).idperiodo).idact(k).idprofes
                                    l = itm.index
                                    DoEvents
            
                                    With ProfeXAct(l)
                
                                        encontrado = True
            
                                        If kernel.utils.trunca(.idprofes) = "" Then
                                            sinProfe = True
                                            dale = True
                                        Else
                                            For jj = 1 To grupos.cant
                                                For kk = 1 To .cantGrupos
                                                    If grupos.id(jj) = .grupos(kk) Then gruposya(.grupos(kk)) = True
                                                Next
                                            Next
                                        End If
                
                                    End With
                                Next
                            End If
                        End If
                    End If
                End If
                For l = 1 To grupos.cant
                    DoEvents

                    If gruposya(l) = False Then
                        dale = True
                        gruposSinProfe = gruposSinProfe + Str(grupos.id(l)) + ", "
                    End If

                Next

                sinProfe = Not encontrado

                If dale Or Not encontrado Then result.add asig(i).comun.id, asig(i).desglose(j).idperiodo, k, asig(i).desglose(j).act(k).idclasif, sinLugar, sinProfe, gruposSinProfe
            Next
        Next
    Next

    Set getAnalisisRecursos = result
    Set result = Nothing
End Function

Public Sub QuitaHuecos(idbrg As String, per As String, sentido As Long)

    Dim temp As TMPI_Casilla, iasig As Long, iper As Long, ic As Long, k As Long, ibrg _
    As _
    Long

    Dim ini As Long, fin As Long, steps As Long
    Dim i As Long, j As Long, ip As Long
    Dim zona As Long, iii As Long, grupo As Long, cant As Long
    Dim daleLugar As Boolean, daleprofe As Boolean
    Dim strlug As String, strprofe As String, r As Variant
    Dim mayores As Boolean
    ibrg = IndexById(dBRIGADA, idbrg, 0)
    mayores = False
    r = interface.MessageDlg("Quitar huecos", "¿Desea que el sistema trate de colocar en en zonas priorizadas mayores que 1?", vbQuestion, "No", "Sí")

    If r = 2 Then mayores = True
    Dim esp As Long, ixper As Long
    esp = IndexById(dESPECIALIDAD, Brigada(ibrg).idesp, 0)
    ixper = IndexById(dPERIODO, per, 0)
    updatehash
    updateHash_objects
    BeginIDX
    FiltraIDPxAct esp, Brigada(ibrg).Nivel, ixper
    FiltraIDLxAct esp, Brigada(ibrg).Nivel, ixper

    

    For i = 1 To cantAsignaciones
        interface.console.Progress "Quitando huecos...", kernel.utils.Porciento(i, cantAsignaciones)

        With Asignaciones(i)

            If kernel.utils.idigual(.idbrigada, idbrg) And kernel.utils.idigual(.idperiodo, per) And Not .fija Then
                iasig = IndexById(dASIG, .idasig, 0)
                iper = IndexById(dDESGLOSE, per, iasig)
                ic = IndexById(dCLASIF, _
                asig(iasig).desglose(iper).act(.idact).idclasif, _
                0)

                For j = 1 To periodos.Count

                    If kernel.utils.idigual(clasif(ic).zpriori(j).idperiodo, per) Then

                        If sentido = 1 Then
                            ini = 1
                            fin = .turno - 1
                            steps = 1
                        Else
                            ini = ct
                            fin = .turno + 1
                            steps = -1
                        End If

                        cant = CantZpriori(ic, iper)

                        If Not mayores Then cant = 1

                        For zona = 1 To cant

                            For k = ini To fin Step steps
                                temp = PosibleInicio(iper, .dia, k, iasig, .idact, _
                                ibrg, _
                                zona)

                                If temp.valor Then
                                    daleLugar = False
                                    daleprofe = False

                                    For iii = 1 To temp.lug.cant

                                        If kernel.utils.idigual(.idlugar, _
                                        lugar(temp.lug.id(iii)).id) Then GoTo puede1

                                    Next

                                    r = interface.MessageDlg("Quitando huecos", "Es posible quitar un hueco para " & Chr(13) & Chr(13) & " Asignatura: (" & kernel.utils.trunca(.idasig) & ")" & kernel.utils.trunca(asig(iasig).comun.descrip) & Chr(13) & _
                                    " Actividad: #" & .idact & "(" & kernel.utils.trunca(clasif(ic).comun.id) & ") " & kernel.utils.trunca(clasif(ic).comun.descrip) & Chr(13) & _
                                    Chr(13) & " en el turno " & k & Chr(13) & " pero no para el LUGAR que tiene seleccionado" & _
                                    Chr(13) & " ¿Desea que el sistema le asigne otro lugar? " & _
                                    Chr(13) & Chr(13) & "A saber:es posible que en otro turno si se pueda con dicho LUGAR. ", _
                                    vbQuestion, "No", "Sí")

                                    If r = 2 Then
                                        daleLugar = True
                                        GoTo puede1
                                    End If

                                    GoTo proximoturno ' el lugar no puede
puede1:

                                    For iii = 1 To temp.prof.cant

                                        If kernel.utils.idigual(.idprofe, _
                                        profe(temp.prof.id(iii)).id) Then GoTo _
                                        puede2

                                    Next

                                    r = interface.MessageDlg("Quitando huecos", "Es posible quitar un hueco para " & _
                                    Chr(13) & Chr(13) & " Asignatura: (" & _
                                    kernel.utils.trunca(.idasig) & ")" & _
                                    kernel.utils.trunca(asig(iasig).comun.descrip) & Chr(13) & _
                                    " Actividad: #" & .idact & "(" & _
                                    kernel.utils.trunca(clasif(ic).comun.id) & ") " & _
                                    kernel.utils.trunca(clasif(ic).comun.descrip) & Chr(13) & _
                                    Chr(13) & " en el turno " & k & Chr(13) & _
                                    " pero no para el PROFESOR que tiene seleccionado" _
                                    & Chr(13) & _
                                    " ¿Desea que el sistema le asigne otro profesor? " _
                                    & Chr(13) & Chr(13) & _
                                    " A saber:es posible que en otro turno si se pueda con dicho PROFESOR.", _
                                     vbQuestion, _
                                    "No", "Sí")

                                    If r = 2 Then
                                        daleprofe = True
                                        GoTo puede2
                                    End If

                                    GoTo proximoturno ' el profe no puede
puede2:
                                    strlug = .idlugar
                                    strprofe = .idprofe

                                    If daleLugar Then strlug = lugar(temp.lug.id(1)).id

                                    If daleprofe Then strprofe = _
                                    profe(temp.prof.id(1)).id

                                    grupo = getGrupoAsignacion(i)
                                    Dim lista As Variant
                                    Dim cantlista As Long
                                    Dim ii As Long
                                    lista = MarcaAsignacionesIgualGrupo(i, cantlista)

                                    For ii = 1 To cantlista
                                        setAsignaciones_profe Val(lista(ii)), strprofe
                                        setAsignaciones_lugar Val(lista(ii)), strlug
                                        moveAsignacion lista(ii), .dia, k
                                    Next

                                    interface.console.Writer _
                                    "Hueco quitado al mover la actividad #" & .idact & _
                                    " de la asignatura " & _
                                    .idasig

                                    GoTo 20
                                End If

proximoturno:
                            Next

                        Next zona

20:
                    End If

                Next

            End If

        End With

    Next

    
    interface.showMsg_ProcesoTerminado
End Sub

Public Sub setAsignaciones_profe(id As Long, idprofe As String)
    Dim ix As Long, cla As Long, turnos As Long
    Dim i As Long, iper As Long

    With Asignaciones(id)
        cla = getClasifOfActivity(.idasig, .idperiodo, .idact)
        turnos = clasif(cla).ct
        'quito restricciones del profe viejo
        ix = IndexById(dPROFE, .idprofe, 0)
        iper = IndexRestRecurso(.idperiodo, profe(ix))

        For i = 1 To turnos
            profe(ix).rest(iper).rest(.dia, .turno + i - 1) = False
        Next

        'pongo restricciones al profe nuevo
        ix = IndexById(dPROFE, idprofe, 0)
        iper = IndexRestRecurso(.idperiodo, profe(ix))

        For i = 1 To turnos
            profe(ix).rest(iper).rest(.dia, .turno + i - 1) = True
        Next

        .idprofe = idprofe
    End With

End Sub

Public Sub setAsignaciones_lugar(id As Long, idlugar As String)
    Dim ix As Long, cla As Long, turnos As Long
    Dim i As Long, iper As Long

    With Asignaciones(id)
        cla = getClasifOfActivity(.idasig, .idperiodo, .idact)
        turnos = clasif(cla).ct
        'quito restricciones del lugar viejo
        ix = IndexById(dLUGAR, .idlugar, 0)
        iper = IndexRestRecurso(.idperiodo, lugar(ix))

        For i = 1 To turnos
            lugar(ix).rest(iper).rest(.dia, .turno + i - 1) = False
        Next

        'pongo restricciones al lugar nuevo
        ix = IndexById(dLUGAR, idlugar, 0)
        iper = IndexRestRecurso(.idperiodo, lugar(ix))

        For i = 1 To turnos
            lugar(ix).rest(iper).rest(.dia, .turno + i - 1) = True
        Next

        .idlugar = idlugar
    End With

End Sub


Public Sub insertBrigada(ByVal id As String, ByVal descrip As String, ByVal idesp As String, ByVal Nivel As Long, Optional ByVal Caption As String = "", Optional ByVal matricula As Long = 0)

    Dim i As Long
    cantBrg = cantBrg + 1
    ReDim Preserve Brigada(cantBrg)

    With Brigada(cantBrg)
        .comun.id = id
        .comun.descrip = descrip
        .idesp = idesp
        .Nivel = Nivel
        .comun.titulo = Caption
        ReDim Preserve .comun.rest(periodos.Count)

        For i = 1 To periodos.Count
            .comun.rest(i).idperiodo = periodos(i).id
        Next

        ReDim Preserve .GrupoXClasif(cantClasif)
        .cantGxClasif = cantClasif

        For i = 1 To cantClasif
            .GrupoXClasif(i).idclasif = clasif(i).comun.id
        Next

    End With

End Sub

Public Sub insertAsignatura(ByVal id As String, ByVal descrip As String, ByVal idesp As String, ByVal Nivel As Long, Optional ByVal Caption As String = "")

    Dim i As Long
    cantAsig = cantAsig + 1
    ReDim Preserve asig(cantAsig)

    With asig(cantAsig)
        .comun.id = id
        .comun.descrip = descrip
        .idesp = idesp
        .Nivel = Nivel
        ReDim Preserve .comun.rest(periodos.Count)
        ReDim Preserve .desglose(periodos.Count)

        For i = 1 To periodos.Count
            .comun.rest(i).idperiodo = periodos(i).id
            .desglose(i).idperiodo = periodos(i).id
            .desglose(i).RespetarOrden = True
            .desglose(i).mismodia = False
            .desglose(i).min = 1
            .desglose(i).max = 2
        Next

    End With

End Sub

Public Sub insertProfe(ByVal id As String, ByVal descrip As String, Optional ByVal Caption As String = "")

    Dim i As Long
    cantProfe = cantProfe + 1
    ReDim Preserve profe(cantProfe)

    With profe(cantProfe)
        .id = id
        .descrip = descrip
        .titulo = Caption
        ReDim Preserve .rest(periodos.Count)

        For i = 1 To periodos.Count
            .rest(i).idperiodo = periodos(i).id
        Next

    End With

End Sub

Public Sub insertLugar(ByVal id As String, ByVal descrip As String, Optional ByVal Caption As String = "", Optional ByVal capacity As Long = 0)

    Dim i As Long
    cantLug = cantLug + 1
    ReDim Preserve lugar(cantLug)

    With lugar(cantLug)
        .id = id
        .descrip = descrip
        .titulo = Caption
        ReDim Preserve .rest(periodos.Count)

        For i = 1 To periodos.Count
            .rest(i).idperiodo = periodos(i).id
        Next

        ReDim Preserve Distancias(cantLug)
        ReDim Preserve Distancias(cantLug).colum(cantLug)
    End With

End Sub

Public Sub insertEspecialidad(ByVal id As String, ByVal descrip As String, Optional ByVal Caption As String = "")

    Dim i As Long
    cantEsp = cantEsp + 1
    ReDim Preserve Especialidad(cantEsp)

    With Especialidad(cantEsp)
        .id = id
        .descrip = descrip
        .titulo = Caption
        ReDim Preserve .rest(periodos.Count)

        For i = 1 To periodos.Count
            .rest(i).idperiodo = periodos(i).id
        Next

    End With

End Sub

Public Sub insertClasifAct(ByVal id As String, ByVal descrip As String, Optional ByVal cantturnos As Long = 1, Optional ByVal continuos As Boolean = True, Optional ByVal Caption As String = "")

    Dim i As Long, j As Long, k As Long

    If cantturnos = 0 Then cantturnos = 1
    cantClasif = cantClasif + 1
    ReDim Preserve clasif(cantClasif)

    With clasif(cantClasif)
        .comun.id = id
        .comun.descrip = descrip
        .comun.titulo = Caption
        ReDim Preserve .comun.rest(periodos.Count)

        For i = 1 To periodos.Count
            .comun.rest(i).idperiodo = periodos(i).id
        Next

        ReDim Preserve .zpriori(periodos.Count)

        For i = 1 To periodos.Count
            .zpriori(i).idperiodo = periodos(i).id

            For j = 1 To CD

                For k = 1 To ct
                    .zpriori(i).rest(j, k) = 1
                Next

            Next

        Next

        .ct = cantturnos
        .continuos = continuos

        For i = 1 To getCantBrg
            Brigada(i).cantGxClasif = cantClasif
            ReDim Preserve Brigada(i).GrupoXClasif(cantClasif)
            Brigada(i).GrupoXClasif(cantClasif).idclasif = id
        Next

    End With

End Sub

Public Function MarcaAsignacionesIgualGrupo(ByVal id As Long, ByRef cant As Long) As Variant

    Dim act As TActAsignada, iclasif As Long, brg As TFiltro, esp As Long, idx As Long
    Dim grupos As TFiltro, asg As Long, per As Long, i As Long, j As Long
    Dim g As Long, ini As Long
    Dim listaids() As Long
    Dim cantlistaids As Long
    ini = 1

    If id = 0 Then Exit Function
    act = Asignaciones(id)
    asg = IndexById(dASIG, act.idasig, 0)
    per = IndexById(dDESGLOSE, act.idperiodo, asg)
    iclasif = IndexById(dCLASIF, asig(asg).desglose(per).act(act.idact).idclasif, 0)
    idx = IndexById(dBRIGADA, act.idbrigada, 0)
    esp = IndexById(dESPECIALIDAD, Brigada(idx).idesp, 0)
    grupos = CantGruposxClasif(esp, Brigada(idx).Nivel, iclasif)
    g = 0

    For i = 1 To grupos.cant
        brg = BrigadasDeGrupo(iclasif, esp, Brigada(idx).Nivel, grupos.id(i))

        For j = 1 To brg.cant

            If kernel.utils.idigual(act.idbrigada, Brigada(brg.id(j)).comun.id) Then
                g = i
                ini = 1
                GoTo 10
            End If

        Next

    Next

    Exit Function
10:
    cantlistaids = 0

    For i = ini To cantAsignaciones
        Dim idper As String, idact As Long, b As String, idasg As String

        With Asignaciones(i)
            idper = .idperiodo
            idact = .idact
            b = .idbrigada
            idasg = .idasig
        End With

        If kernel.utils.idigual(idper, act.idperiodo) Then

            If kernel.utils.idigual(idasg, act.idasig) Then

                If idact = act.idact Then

                    For j = 1 To brg.cant

                        If kernel.utils.idigual(b, Brigada(brg.id(j)).comun.id) Then
                            cantlistaids = cantlistaids + 1
                            ReDim Preserve listaids(cantlistaids)
                            listaids(cantlistaids) = i
                        End If

                    Next

                End If

            End If

        End If

    Next

    cant = cantlistaids
    MarcaAsignacionesIgualGrupo = listaids
End Function

Public Sub destruyeAsignacion(ByVal idx As Integer)
    Dim listaids As Variant
    Dim cantlistaids As Long
    Dim i As Long
    listaids = MarcaAsignacionesIgualGrupo(idx, cantlistaids)

    For i = cantlistaids To 1 Step -1
        eliminaAsignacion Val(listaids(i))
    Next

End Sub

Public Sub destruyeAsignaciones(asigs As Variant, cant As Long)
    Dim i As Long, j As Long, k As Long
    Dim listaids As Variant
    Dim cantlistaids As Long
    Dim superlista() As Long
    Dim cantsuper As Long

    For i = 1 To cant
        cantlistaids = 0
        listaids = MarcaAsignacionesIgualGrupo(asigs(i), cantlistaids)
        
        For j = 1 To cantlistaids
            For k = 1 To cantsuper
                If superlista(k) = listaids(j) Then GoTo proximo
            Next
            cantsuper = cantsuper + 1
            ReDim Preserve superlista(cantsuper)
            superlista(cantsuper) = listaids(j)
proximo:
        Next
    Next

    For i = cantsuper To 1 Step -1
        eliminaAsignacion superlista(i)
    Next

End Sub

Public Sub moveAsignacion(ByVal id As Long, ByVal dia As Long, ByVal turno As Long)
    Dim idprofe As Long, idlugar As Long, idbrg As Long
    Dim idper1 As Long, idper2 As Long, idper3 As Long
    Dim cla As Long, turnos As Long, i As Long, j As Long, ii As Long
    
    
    With Asignaciones(id)
        idprofe = IndexById(dPROFE, .idprofe, 0)
        idlugar = IndexById(dLUGAR, .idlugar, 0)
        idbrg = IndexById(dBRIGADA, .idbrigada, 0)
        idper1 = IndexRestRecurso(.idperiodo, profe(idprofe))
        idper2 = IndexRestRecurso(.idperiodo, lugar(idlugar))
        idper3 = IndexRestRecurso(.idperiodo, Brigada(idbrg).comun)
        cla = getClasifOfActivity(.idasig, .idperiodo, .idact)
        turnos = clasif(cla).ct

        For i = 1 To turnos
            profe(idprofe).rest(idper1).rest(.dia, .turno + i - 1) = False
            lugar(idlugar).rest(idper2).rest(.dia, .turno + i - 1) = False
            Brigada(idbrg).comun.rest(idper3).rest(.dia, .turno + i - 1) = False
            For j = 1 To .cantrecursos
                ii = IndexById(dRECURSO, .recursos(j))
                recursos(ii).setRestriccion .idperiodo, .dia, .turno + i - 1, 0
            Next
        Next

        .dia = dia
        .turno = turno

        For i = 1 To turnos
            profe(idprofe).rest(idper1).rest(.dia, .turno + i - 1) = True
            lugar(idlugar).rest(idper2).rest(.dia, .turno + i - 1) = True
            Brigada(idbrg).comun.rest(idper3).rest(.dia, .turno + i - 1) = True
            Brigada(idbrg).comun.rest(idper3).rest(.dia, .turno + i - 1) = True
            For j = 1 To .cantrecursos
                ii = IndexById(dRECURSO, .recursos(j))
                recursos(ii).setRestriccion .idperiodo, .dia, .turno + i - 1, 1
            Next
        Next

    End With

End Sub

Public Sub AutoRestriccDeBotonesRestriccion(arreglo As Long, listaids As Variant, cantids As Long, Optional per As String = "", Optional EliminarActuales As Boolean = False)

    Dim i As Long, j As Long, k As Long, r As Boolean, iper As Long
    Dim ini As Long, fin As Long, ixper As Long
    Dim noquitar() As Boolean

    For k = 1 To cantids
        ReDim noquitar(periodos.Count, CD, ct)

        For i = 1 To cantAsignaciones

            With Asignaciones(i)
                ixper = IndexById(dPERIODO, .idperiodo, 0)

                Select Case arreglo

                    Case dPROFE

                        If kernel.utils.idigual(.idprofe, profe(listaids(k)).id) Then _
                        noquitar(ixper, .dia, .turno) = _
                        True

                    Case dLUGAR

                        If kernel.utils.idigual(.idlugar, lugar(listaids(k)).id) Then _
                        noquitar(ixper, .dia, .turno) = _
                        True

                    Case dBRIGADA

                        If kernel.utils.idigual(.idbrigada, Brigada(listaids(k)).comun.id) Then _
                        noquitar(ixper, .dia, .turno) = _
                        True

                    Case dRECURSO

                        For j = 1 To .cantrecursos

                            If kernel.utils.idigual(.recursos(j), recursos(listaids(k)).id) Then _
                            noquitar(ixper, .dia, .turno) = _
                            True

                        Next

                End Select

            End With

        Next

        For i = 1 To CD

            For j = 1 To ct

                Select Case arreglo

                    Case dPERIODO
                        r = periodos(listaids(k)).getTimeRequest(i, j)

                        If EliminarActuales Then r = BotonesRestriccion(i, j) Else r = BotonesRestriccion(i, j) Or r

                        periodos(listaids(k)).setTimeRequest i, j, BotonesRestriccion(i, j)

                    Case dESPECIALIDAD

                        If per = "" Then
                            ini = 1
                            fin = periodos.Count
                        Else
                            ixper = IndexRestRecurso(per, Especialidad(k))
                            ini = ixper
                            fin = ixper
                        End If

                        For iper = ini To fin
                            r = Especialidad(listaids(k)).rest(iper).rest(i, j)

                            If EliminarActuales Then r = BotonesRestriccion(i, j) Else r = BotonesRestriccion(i, j) Or r
                            Especialidad(listaids(k)).rest(iper).rest(i, j) = BotonesRestriccion(i, j)

                        Next

                    Case dBRIGADA

                        If per = "" Then
                            ini = 1
                            fin = periodos.Count
                        Else
                            ixper = IndexRestRecurso(per, Brigada(listaids(k)).comun)
                            ini = ixper
                            fin = ixper
                        End If

                        For iper = ini To fin
                            ixper = IndexById(dPERIODO, _
                            Brigada(listaids(k)).comun.rest(iper).idperiodo, _
                            0)

                            r = Brigada(listaids(k)).comun.rest(iper).rest(i, j)

                            If EliminarActuales Then r = BotonesRestriccion(i, j) Else r = BotonesRestriccion(i, j) Or r

                            Brigada(listaids(k)).comun.rest(iper).rest(i, j) = BotonesRestriccion(i, j) Or noquitar(ixper, i, j)

                        Next

                    Case dASIG

                        If per = "" Then
                            ini = 1
                            fin = periodos.Count
                        Else
                            ixper = IndexRestRecurso(per, asig(listaids(k)).comun)
                            ini = ixper
                            fin = ixper
                        End If

                        For iper = ini To fin
                            r = asig(listaids(k)).comun.rest(iper).rest(i, j)

                            If EliminarActuales Then r = BotonesRestriccion(i, j) Else r = BotonesRestriccion(i, j) Or r

                            asig(listaids(k)).comun.rest(iper).rest(i, j) = _
                            BotonesRestriccion(i, _
                            j)

                        Next

                    Case dPROFE

                        If per = "" Then
                            ini = 1
                            fin = periodos.Count
                        Else
                            ixper = IndexRestRecurso(per, profe(k))
                            ini = ixper
                            fin = ixper
                        End If

                        For iper = ini To fin
                            ixper = IndexById(dPERIODO, _
                            profe(listaids(k)).rest(iper).idperiodo, _
                            0)

                            r = profe(listaids(k)).rest(iper).rest(i, j)

                            If EliminarActuales Then r = BotonesRestriccion(i, j) Else _
                            r = BotonesRestriccion(i, j) Or r

                            profe(listaids(k)).rest(iper).rest(i, j) = _
                            BotonesRestriccion(i, j) Or noquitar(ixper, i, _
                            j)

                        Next

                    Case dLUGAR

                        If per = "" Then
                            ini = 1
                            fin = periodos.Count
                        Else
                            ixper = IndexRestRecurso(per, lugar(k))
                            ini = ixper
                            fin = ixper
                        End If

                        For iper = ini To fin
                            ixper = IndexById(dPERIODO, _
                            lugar(listaids(k)).rest(iper).idperiodo, _
                            0)

                            r = lugar(listaids(k)).rest(iper).rest(i, j)

                            If EliminarActuales Then r = BotonesRestriccion(i, j) Else _
                            r = BotonesRestriccion(i, j) Or r

                            lugar(listaids(k)).rest(iper).rest(i, j) = _
                            BotonesRestriccion(i, j) Or noquitar(ixper, i, _
                            j)

                        Next

                    Case dRECURSO

                        If per = "" Then
                            ini = 1
                            fin = periodos.Count
                        Else
                            ixper = IndexById(dPERIODO, per)
                            ini = ixper
                            fin = ixper
                        End If

                        For iper = ini To fin
                            r = recursos(listaids(k)).getRestriccion(periodos(iper).id, i, j)

                            If EliminarActuales Then r = BotonesRestriccion(i, j) Else _
                            r = BotonesRestriccion(i, j) Or r

                            recursos(listaids(k)).setRestriccion periodos(iper).id, i, _
                            j, IIf(BotonesRestriccion(i, j) Or noquitar(ixper, i, j), _
                            1, _
                            0)

                        Next

                End Select

            Next

        Next

    Next

    interface.showMsg_ProcesoTerminado
End Sub

Public Sub AutoLxAct(ix As Long, Optional mismaEspecialidad As Boolean = False, Optional mismoNivel As Boolean = False, Optional mismoPeriodo As Boolean = False, Optional mismaAsignatura As Boolean = False, Optional mismoNumero As Boolean = False, Optional mismaClasif As Boolean = False, Optional tospecific As Boolean = False, Optional faltantes As Boolean = True, Optional limpiar As Boolean = False)

    Dim i As Long, j As Long, k As Long, l As Long
    Dim esp As String, asg As String, per As String, act As Long, cla As String
    Dim iesp As Long, iasg As Long, iper As Long, icla As Long
    Dim ilxact As Long, iiper As Long
    Dim temp_esp As String
    Dim temp_iesp As Long
    reparaLxAct ' si ix no es el ultimo no habra problemas

    

    If ix > 0 And ix <= cantLxAct Then

        With LugXact(ix)
            asg = .para.idasig
            iasg = IndexById(dASIG, asg)
            esp = asig(iasg).idesp
            iesp = IndexById(dESPECIALIDAD, esp)
            act = .para.idact
            per = .para.idper
            iper = IndexById(dPERIODO, .para.idper)
            cla = asig(iasg).desglose(IndexRestRecurso(per, _
            asig(iasg).comun)).act(act).idclasif

            icla = IndexById(dCLASIF, cla)
        End With

        'recorrer todas las asignaturas

        For i = 1 To cantAsig
            interface.console.Progress "Clonando lugares...", i / cantAsig
            temp_esp = asig(i).idesp
            temp_iesp = IndexById(dESPECIALIDAD, temp_esp)

            For j = 1 To periodos.Count

                For k = 1 To asig(i).desglose(j).cantact
                    iiper = IndexById(dPERIODO, asig(i).desglose(j).idperiodo)
                    ilxact = IndexLugxAct(iiper, i, k)

                    If ilxact <> ix Then

                        If Not (faltantes And ilxact > 0) Or (tospecific = False) Then
                            Dim dale As Boolean
                            dale = True
                            dale = dale And Not (mismaEspecialidad And Not _
                            kernel.utils.idigual(temp_esp, _
                            esp))

                            dale = dale And Not (mismoNivel And Not asig(i).Nivel = _
                            asig(iasg).Nivel)

                            dale = dale And Not (mismoPeriodo And Not _
                            kernel.utils.idigual(asig(i).desglose(j).idperiodo, _
                            per))

                            dale = dale And Not (mismaAsignatura And Not _
                            kernel.utils.idigual(asig(i).comun.id, _
                            asg))

                            dale = dale And Not (mismoNumero And Not k = act)
                            dale = dale And Not (mismaClasif And Not _
                            kernel.utils.idigual(asig(i).desglose(j).act(k).idclasif, _
                            cla))

                            If dale Then

                                If limpiar And ilxact > 0 Then
                                    LugXact(ilxact).cantLug = 0
                                    ReDim LugXact(ilxact).idlug(0)
                                End If

                                If ilxact = 0 Then
                                    insertLugXAct k, asig(i).comun.id, _
                                    asig(i).desglose(j).idperiodo

                                    ilxact = cantLxAct
                                End If

                                For l = 1 To LugXact(ix).cantLug
                                    insertLxAct_lug ilxact, LugXact(ix).idlug(l), _
                                    LugXact(ix).priori(l)

                                Next

                                interface.console.Writer "Clonados " & _
                                LugXact(ix).cantLug & " lugares para la actividad # " & _
                                k & " de la asignatura " & asig(i).comun.descrip & _
                                " en el período " & _
                                interface.getRS_Periodo(iiper)

                            End If

                        End If

                    End If

                Next

            Next

        Next

    End If

    interface.showMsg_ProcesoTerminado

    
End Sub

Public Sub AutoPxAct(ix As Long, Optional mismaEspecialidad As Boolean = False, Optional mismoNivel As Boolean = False, Optional mismoPeriodo As Boolean = False, Optional mismaAsignatura As Boolean = False, Optional mismoNumero As Boolean = False, Optional mismaClasif As Boolean = False, Optional tospecific As Boolean = False, Optional faltantes As Boolean = True, Optional limpiar As Boolean = False)

    Dim i As Long, j As Long, k As Long, l As Long, ll As Long
    Dim esp As String, asg As String, per As String, act As Long, cla As String
    Dim iesp As Long, iasg As Long, iper As Long, icla As Long
    Dim profesclon As Variant, cantclon As Long
    Dim dale As Boolean
    Dim ipxact As Variant, cantipxact As Long, iiper As Long
    Dim temp_esp As String
    Dim temp_iesp As Long
    Dim limpieza() As Long, cantlimpieza As Long

    

    If ix > 0 And ix <= cantPxAct Then

        With ProfeXAct(ix)
            asg = .para.idasig
            iasg = IndexById(dASIG, asg)
            esp = asig(iasg).idesp
            iesp = IndexById(dESPECIALIDAD, esp)
            act = .para.idact
            per = .para.idper
            iper = IndexById(dPERIODO, .para.idper)
            cla = asig(iasg).desglose(IndexRestRecurso(per, _
            asig(iasg).comun)).act(act).idclasif

            icla = IndexById(dCLASIF, cla)
            profesclon = IndexProfexAct(iper, iasg, act, cantclon)
        End With

        'recorrer todas las asignaturas

        For i = 1 To cantAsig
            interface.console.Progress "Clonando profesores...", i / cantAsig
            temp_esp = asig(i).idesp
            temp_iesp = IndexById(dESPECIALIDAD, temp_esp)

            For j = 1 To periodos.Count

                For k = 1 To asig(i).desglose(j).cantact
                    iiper = IndexById(dPERIODO, asig(i).desglose(j).idperiodo)
                    ipxact = IndexProfexAct(iiper, i, k, cantipxact)

                    If searchInArray(ipxact, ix, cantipxact, 1) <= 0 Then

                        If Not (faltantes And cantipxact > 0) Or (tospecific = False) _
                            Then

                            dale = True
                            dale = dale And Not (mismaEspecialidad And Not _
                            kernel.utils.idigual(temp_esp, _
                            esp))

                            dale = dale And Not (mismoNivel And Not asig(i).Nivel = _
                            asig(iasg).Nivel)

                            dale = dale And Not (mismoPeriodo And Not _
                            kernel.utils.idigual(asig(i).desglose(j).idperiodo, _
                            per))

                            dale = dale And Not (mismaAsignatura And Not _
                            kernel.utils.idigual(asig(i).comun.id, _
                            asg))

                            dale = dale And Not (mismoNumero And Not k = act)
                            dale = dale And Not (mismaClasif And Not _
                            kernel.utils.idigual(asig(i).desglose(j).act(k).idclasif, _
                            cla))

                            If dale Then
                                'clonando..

                                For l = 1 To cantclon
                                    insertProfexAct asig(i).comun.id, _
                                    asig(i).desglose(j).idperiodo, k, _
                                    ProfeXAct(profesclon(l)).idprofes

                                    For ll = 1 To ProfeXAct(profesclon(l)).cantGrupos
                                        insertPxAct_Grupo cantPxAct, _
                                        ProfeXAct(profesclon(l)).grupos(ll)

                                    Next

                                Next

                                'para limpiar luego

                                For l = 1 To cantipxact
                                    cantlimpieza = cantlimpieza + 1
                                    ReDim Preserve limpieza(cantlimpieza)
                                    limpieza(cantlimpieza) = ipxact(l)
                                Next

                            End If

                        End If

                    End If

                Next

            Next

        Next

    End If

    'limpiando anteriores

    If limpiar Then
        deleteSomes_pxact limpieza, cantlimpieza
    End If

    interface.showMsg_ProcesoTerminado

    
End Sub

Public Sub sortListaIDs(ByRef listaids As Variant, ByRef cant As Long)
    Dim i As Long, j As Long, t As Variant
    'ordeno la lista que me mandaron

    For i = 1 To cant - 1

        For j = i + 1 To cant

            If listaids(i) > listaids(j) Then
                t = listaids(i)
                listaids(i) = listaids(j)
                listaids(j) = t
            End If

        Next

    Next

End Sub

Public Sub deleteSomes_pxact(listaids As Variant, cant As Long)
    Dim i As Long
    sortListaIDs listaids, cant
    'voy eliminando desde abajo

    For i = cant To 1 Step -1
        ProfeXAct(listaids(i)) = ProfeXAct(cantPxAct)
        cantPxAct = cantPxAct - 1
    Next

    ReDim Preserve ProfeXAct(cantPxAct)
End Sub

Public Sub deleteSomes_imposibles(listaids As Variant, cant As Long)
    Dim i As Long
    sortListaIDs listaids, cant
    'voy eliminando desde abajo

    For i = cant To 1 Step -1
        Imposibles(listaids(i)) = Imposibles(cantImposibles)
        cantImposibles = cantImposibles - 1
    Next

    ReDim Preserve Imposibles(cantImposibles)
End Sub

Public Sub deleteSomes_asignaciones(listaids As Variant, cant As Long)
    Dim i As Long
    sortListaIDs listaids, cant
    'voy eliminando desde abajo

    For i = cant To 1 Step -1
        eliminaRestriccionesDeAsignacion Val(listaids(i))
        Asignaciones(listaids(i)) = Asignaciones(cantAsignaciones)
        cantAsignaciones = cantAsignaciones - 1
    Next

    ReDim Preserve Asignaciones(cantAsignaciones)
End Sub

Public Sub deleteSomes_lxact(listaids As Variant, cant As Long)
    Dim i As Long
    sortListaIDs listaids, cant
    'voy eliminando desde abajo

    For i = cant To 1 Step -1
        LugXact(listaids(i)) = LugXact(cantLxAct)
        cantLxAct = cantLxAct - 1
    Next

    ReDim Preserve LugXact(cantLxAct)
End Sub




Public Sub DebugPrintMatrix(matrix As Variant, countrows As Long, countcols As Long)
    Dim i As Long, j As Long

    For i = 0 To countrows

        For j = 0 To countcols
            Debug.Print matrix(i, j),
        Next

        Debug.Print
    Next

End Sub





Public Sub deleteActivityFromDesglose(iasg As Long, idesglose As Long, idact As Long)
    Dim i As Long, listaids() As Long, cantlistaids As Long
    'afectaciones
    'lugaresxact
    'restar el numero de actividad a todos los de la misma asg,per
    'voy guardando los recursos asignados a esta actividad
    cantlistaids = 0

    For i = 1 To cantLxAct

        With LugXact(i)

            If kernel.utils.idigual(.para.idasig, asig(iasg).comun.id) And kernel.utils.idigual(.para.idper, _
                asig(iasg).desglose(idesglose).idperiodo) _
                Then

                If .para.idact = idact Then
                    cantlistaids = cantlistaids + 1
                    ReDim Preserve listaids(cantlistaids)
                    listaids(cantlistaids) = i
                End If

                If .para.idact > idact Then .para.idact = .para.idact - 1
            End If

        End With

    Next

    'eliminar los recursos asignados a esta actividad
    deleteSomes_lxact listaids, cantlistaids
    'profesxact
    'restar el numero de actividad a todos los de la misma asg,per
    'voy guardando los recursos asignados a esta actividad
    cantlistaids = 0

    For i = 1 To cantPxAct

        With ProfeXAct(i)

            If kernel.utils.idigual(.para.idasig, asig(iasg).comun.id) And kernel.utils.idigual(.para.idper, _
                asig(iasg).desglose(idesglose).idperiodo) _
                Then

                If .para.idact = idact Then
                    cantlistaids = cantlistaids + 1
                    ReDim Preserve listaids(cantlistaids)
                    listaids(cantlistaids) = i
                End If

                If .para.idact > idact Then .para.idact = .para.idact - 1
            End If

        End With

    Next

    'eliminar los recursos asignados a esta actividad
    deleteSomes_pxact listaids, cantlistaids
    'asignaciones de actividades
    'restar el numero de actividad a todos los de la misma asg,per
    'voy guardando las actividades asignadas
    cantlistaids = 0

    For i = 1 To cantAsignaciones

        With Asignaciones(i)

            If kernel.utils.idigual(.idasig, asig(iasg).comun.id) And kernel.utils.idigual(.idperiodo, _
                asig(iasg).desglose(idesglose).idperiodo) _
                Then

                If .idact = idact Then
                    cantlistaids = cantlistaids + 1
                    ReDim Preserve listaids(cantlistaids)
                    listaids(cantlistaids) = i
                End If

                If .idact > idact Then .idact = .idact - 1
            End If

        End With

    Next

    'elimino las asignaciones
    deleteSomes_asignaciones listaids, cantlistaids
    'imposibles
    cantlistaids = 0

    For i = 1 To cantImposibles

        With Imposibles(i)

            If kernel.utils.idigual(.idasig, asig(iasg).comun.id) And kernel.utils.idigual(.idperiodo, _
                asig(iasg).desglose(idesglose).idperiodo) _
                Then

                If .idact = idact Then
                    cantlistaids = cantlistaids + 1
                    ReDim Preserve listaids(cantlistaids)
                    listaids(cantlistaids) = i
                End If

                If .idact > idact Then .idact = .idact - 1
            End If

        End With

    Next

    'elimino las imposibles
    deleteSomes_imposibles listaids, cantlistaids
    'desgloses

    With asig(iasg).desglose(idesglose)

        For i = idact To .cantact - 1
            .act(i) = .act(i + 1)
        Next

        .cantact = .cantact - 1
    End With

End Sub

Public Sub swapActivityFromDesglose(iasg As Long, idesglose As Long, idact1 As Long, idact2 As Long)

    Dim i As Long
    'afectaciones
    'lugaresxact
    'restar el numero de actividad a todos los de la misma asg,per
    'voy guardando los recursos asignados a esta actividad

    For i = 1 To cantLxAct

        With LugXact(i)

            If kernel.utils.idigual(.para.idasig, asig(iasg).comun.id) And kernel.utils.idigual(.para.idper, _
                asig(iasg).desglose(idesglose).idperiodo) _
                Then

                If .para.idact = idact1 Then
                    .para.idact = idact2
                Else

                    If .para.idact = idact2 Then .para.idact = idact1
                End If

            End If

        End With

    Next

    'profesxact
    'restar el numero de actividad a todos los de la misma asg,per
    'voy guardando los recursos asignados a esta actividad

    For i = 1 To cantPxAct

        With ProfeXAct(i)

            If kernel.utils.idigual(.para.idasig, asig(iasg).comun.id) And kernel.utils.idigual(.para.idper, _
                asig(iasg).desglose(idesglose).idperiodo) _
                Then

                If .para.idact = idact1 Then
                    .para.idact = idact2
                Else

                    If .para.idact = idact2 Then .para.idact = idact1
                End If

            End If

        End With

    Next

    'asignaciones de actividades
    'restar el numero de actividad a todos los de la misma asg,per
    'voy guardando las actividades asignadas

    For i = 1 To cantAsignaciones

        With Asignaciones(i)

            If kernel.utils.idigual(.idasig, asig(iasg).comun.id) And kernel.utils.idigual(.idperiodo, _
                asig(iasg).desglose(idesglose).idperiodo) _
                Then

                If .idact = idact1 Then
                    .idact = idact2
                Else

                    If .idact = idact2 Then .idact = idact1
                End If

            End If

        End With

    Next

    'imposibles

    For i = 1 To cantImposibles

        With Imposibles(i)

            If kernel.utils.idigual(.idasig, asig(iasg).comun.id) And kernel.utils.idigual(.idperiodo, _
                asig(iasg).desglose(idesglose).idperiodo) _
                Then

                If .idact = idact1 Then
                    .idact = idact2
                Else

                    If .idact = idact2 Then .idact = idact1
                End If

            End If

        End With

    Next

    'desgloses
    Dim temp As TActividad

    With asig(iasg).desglose(idesglose)
        temp = .act(idact1)
        .act(idact1) = .act(idact2)
        .act(idact2) = temp
    End With

End Sub

Public Sub updatehash()
    On Error GoTo errdep
    Set mvarHash = Nothing
    Set mvarHash = New TKernel_HashCollection
    Dim i As Long, j As Byte, cant As Long, k As Long, id As String

    

    interface.console.Progress "Acelerando el motor de búsqueda", 0

    For i = 1 To 9

        If i <> dDESGLOSE Then
            mvarHash.add i, New TKernel_Hash_arrBegin
            cant = getCantOf(i)

            For j = 1 To 254
                mvarHash("" & i).arreglo = i
                mvarHash("" & i).BeginWith.add j, New TKernel_Hash_arrIndexOf
            Next

            For k = 1 To cant
                id = getIdOf(i, k)
                j = Asc(Mid(id, 1, 1))
                mvarHash("" & i).BeginWith("" & j).IndexOf.add id, k
            Next

        End If

    Next

    
    BuscaPorHASH = True
    Exit Sub
errdep:
    Debug.Print Err.Number, Erl, Err.Description

    
    Resume Next
End Sub

'mismo funcionamiento que RecursoPermanece

Public Function isFreeResourceInInterval(Optional id As String = "", Optional idx As Long = 0, Optional per As String = "", Optional iper As Long = 0, Optional dia As Long = 1, Optional turno As Long = 1, Optional turnos As Long = 1) As Boolean

    Dim i As Long

    If id = "" And idx = 0 Then
        isFreeResourceInInterval = False
        Exit Function
    End If

    If idx = 0 Then idx = IndexById(dRECURSO, id)

    If iper = 0 Then iper = IndexById(dPERIODO, per)
    Dim puede As Boolean
    puede = True

    For i = 1 To turnos
        'si almenos en un turno no se puede, me voy con falso
        If Not recursos(idx) Is Nothing Then
            If Not recursos(idx).virtual Then
                If recursos(idx).getRestriccion(per, dia, turno + i - 1) = 1 _
                   Or estaRestringidoPorHerencia(per, dia, turno + i - 1, dRECURSO, id) _
                   Or estaRestringidoPorHerencia(per, dia, turno + i - 1, dRECURSO, id, , , False) _
                Then
                    puede = False
                    Exit For
                End If
            End If
        End If
    Next

    isFreeResourceInInterval = puede
End Function

Public Function getFreeRecursos(asg As String, per As String, act As Long, dia As Long, turno As Long, turnos As Long, ByRef puede As Boolean) As TGOH_arrGroupRest

    Dim result As TGOH_arrGroupRest, j As Long, k As Long
    Dim cant As Long
    Set result = New TGOH_arrGroupRest
    puede = True
    Dim i As Long
    'recorro las asignaciones de recursos a actividades

    For i = 1 To recursosXact.Count

        With recursosXact(i)

            If kernel.utils.idigual(.per, per) And kernel.utils.idigual(.asg, asg) And .act = act Then
                'recorro los grupos de recursos buscando que recursos pueden

                For j = 1 To .gruposRecursos.Count
                    result.add New TAtom_arrVariant, New TAtom_arrVariant, _
                    .gruposRecursos(j).cantNecesarios, _
                    .gruposRecursos(j).imprescindibles, _
                    .gruposRecursos(j).prioridad

                    For k = 1 To .gruposRecursos(j).recursos.Count

                        If isFreeResourceInInterval("" & _
                            .gruposRecursos(j).recursos(k).value, , per, , dia, turno, _
                            turnos) _
                            Then

                            result(j).recursos.add .gruposRecursos(j).recursos(k).value
                            result(j).prioridades.add .gruposRecursos(j).prioridades(k).value

                        End If

                    Next

                Next

                'ya aqui debo tener en result, los grupos de recursos con los recursos disponibles
                'verifico ahora que tengan los necesarios para poder realizar la actividad

                For j = 1 To result.Count
                    'si la cantidad de recursos disponibles es menor que los necesarios
                    'y los necesarios son imprescindibles entonces no se puede

                    If result(j).recursos.Count < result(j).cantNecesarios And _
                        result(j).imprescindibles _
                        Then

                        puede = False
                        Exit For
                    End If

                Next

                Exit For
            End If

        End With

    Next

    Set getFreeRecursos = result
    Set result = Nothing
End Function

'Obtener todas las asignaciones de actividades segun los filtro

Function getIDAsignacionesByFilter(Optional asg As String = "*", Optional per As String = "*", Optional act As Long = -1, Optional dia As Long = -1, Optional turno As Long = -1, Optional brg As String = "*", Optional fija As Integer = -1, Optional res As String = "*", Optional prf As String = "*", Optional lug As String = "*") As TAtom_arrVariant

    Dim result As TAtom_arrVariant, i  As Long, j As Long
    Set result = New TAtom_arrVariant

    For i = 1 To cantAsignaciones

        With Asignaciones(i)
            Dim dale As Boolean
            dale = True
            'Debug.Assert .idperiodo <> "si"
            dale = dale And ((asg <> "*" And kernel.utils.idigual(.idasig, asg)) Or asg = "*")
            dale = dale And ((per <> "*" And kernel.utils.idigual(.idperiodo, per)) Or per = "*")
            dale = dale And ((act <> -1 And .idact = act) Or act = -1)
            dale = dale And ((dia <> -1 And .dia = dia) Or dia = -1)
            dale = dale And ((turno <> -1 And .turno = turno) Or turno = -1)
            dale = dale And ((brg <> "*" And kernel.utils.idigual(.idbrigada, brg)) Or brg = "*")
            dale = dale And ((fija <> -1 And .fija = (fija = 1)) Or fija = -1)
            dale = dale And ((res <> "*" And kernel.utils.getIdxFromArrayByValue(.recursos, res, .cantrecursos) > 0) Or res = "*")
            dale = dale And ((prf <> "*" And kernel.utils.idigual(.idprofe, prf)) Or prf = "*")
            dale = dale And ((lug <> "*" And kernel.utils.idigual(.idlugar, lug)) Or lug = "*")

            If dale Then
                result.add i
            End If

        End With

    Next

    Set getIDAsignacionesByFilter = result
    Set result = Nothing
End Function

'retorna una collection de string "idrecurso,idlugar" de aquellos recursos que
'participan en un per,dia,turno dados

Public Function getResourcesOnActivity(per As String, dia As Long, turnos As Long) As TAtom_arrVariant

    Dim result As TAtom_arrVariant, i As Long, j As Long
    Set result = New TAtom_arrVariant
    Dim tmp As TAtom_arrVariant
    Set tmp = getIDAsignacionesByFilter(, per, , dia, turnos)

    For i = 1 To tmp.Count

        With Asignaciones(Val(tmp(i).value))

            For j = 1 To .cantrecursos
                result.add .recursos(j) & "," & .idlugar
            Next

        End With

    Next

    Set getResourcesOnActivity = result
    Set result = Nothing
    Set tmp = Nothing
End Function

Public Function getUseOfResources(per As String, dia As Long, turno As Long) As TAtom_arrVariant

    Dim result As TAtom_arrVariant, i As Long, j As Long
    Set result = New TAtom_arrVariant
    Dim tmp As TAtom_arrVariant
    Set tmp = getIDAsignacionesByFilter(, per, , dia, turno)

    For i = 1 To tmp.Count

        With Asignaciones(Val(tmp(i).value))

            For j = 1 To .cantrecursos

                If result(.recursos(j)) Is Nothing Then result.add 0, .recursos(j)
                result(.recursos(j)).value = result(.recursos(j)).value + 1
            Next

        End With

    Next

    Set getUseOfResources = result
    Set result = Nothing
    Set tmp = Nothing
End Function

Public Function getDistanciaResource(res As String, lug As String, per As String, dia As Long, turno As Long) As Long

    Dim i As Long, j As Long
    Dim tmp As TAtom_arrVariant
    Set tmp = getIDAsignacionesByFilter(, per, , dia, , , , , res)
    Dim dis1 As Long, dis2 As Long
    'busco hacia el inicio del dia
    dis1 = 0

    For j = turno - 1 To 1 Step -1

        For i = 1 To tmp.Count

            With Asignaciones(Val(tmp(i).value))

                If j = .turno Then
                    dis1 = DistanciaEntre(lug, .idlugar)
                    GoTo 10
                End If

            End With

        Next

    Next
10:

    'busco hacia el final del dia
    dis2 = 0

    For j = turno + 1 To CD

        For i = 1 To tmp.Count

            With Asignaciones(Val(tmp(i).value))

                If j = .turno Then
                    dis2 = DistanciaEntre(lug, .idlugar)
                    GoTo 20
                End If

            End With

        Next

    Next
20:

    getDistanciaResource = dis1 + dis2
    Set tmp = Nothing
End Function

'Realiza un AND con todas las restricciones de los objetos pasados
'los arreglos booleanos tienen marcados aquellos objetos que se desean analizar
'por ejemplo especs(1)=true significa que la especialidad(1) se tiene en cuenta
'en el AND. Esta función es utulizada para conocer Huecos Comunes

Public Function getANDRestrictions(per As Long, especs() As Boolean, brgs() As Boolean, asg() As Boolean, cla() As Boolean, prof() As Boolean, lugs() As Boolean, res() As Boolean) As TGOH_arrRestriccion

    Dim r As New TGOH_arrRestriccion
    Dim i As Long, j As Long, k As Long, ix As Long
    r.add periodos(per).id

    For i = 1 To CD
        For j = 1 To ct
            r(1).setRest i, j, 0
        Next
    Next

    'analizando especialidades

    For i = 1 To getCantEspecialidades
        If especs(i) Then
             For j = 1 To CD
                For k = 1 To ct
                    If getRestriccion(dESPECIALIDAD, Especialidad(i).id, periodos(per).id, j, k) Then r(1).setRest j, k, 1
                Next
            Next
        End If
    Next

    'analizando brigadas

    For i = 1 To getCantBrg
        If brgs(i) Then
            For j = 1 To CD
                For k = 1 To ct
                    If getRestriccion(dBRIGADA, Brigada(i).comun.id, periodos(per).id, j, k) Then r(1).setRest j, k, 1
                Next
            Next
        End If
    Next

    'analizando asignaturas

    For i = 1 To getCantAsig
        If asg(i) Then
            For j = 1 To CD
                For k = 1 To ct
                    If getRestriccion(dASIG, asig(i).comun.id, periodos(per).id, j, k) Then r(1).setRest j, k, 1
                Next
            Next
        End If
    Next

    'analizando clasificaciones

    For i = 1 To cantClasif
        If cla(i) Then
            For j = 1 To CD
                For k = 1 To ct
                    If getRestriccion(dCLASIF, clasif(i).comun.id, periodos(per).id, j, k) Then r(1).setRest j, k, 1
                Next
            Next
        End If
    Next

    'analizando profesores

    For i = 1 To cantProfe
        If prof(i) Then
            For j = 1 To CD
                For k = 1 To ct
                    If getRestriccion(dPROFE, profe(i).id, periodos(per).id, j, k) Then r(1).setRest j, k, 1
                Next
            Next
        End If
    Next

    'analizando lugares

    For i = 1 To cantLug
        If lugs(i) Then
            For j = 1 To CD
                For k = 1 To ct
                    If getRestriccion(dLUGAR, lugar(i).id, periodos(per).id, j, k) Then r(1).setRest j, k, 1
                Next
            Next
        End If
    Next

    'analizando otros recursos

    For i = 1 To recursos.Count
        If res(i) Then
            For j = 1 To CD
                For k = 1 To ct
                    If getRestriccion(dRECURSO, recursos(i).id, periodos(per).id, j, k) Then r(1).setRest j, k, 1
                Next
            Next
        End If
    Next

    Set getANDRestrictions = r
End Function

Public Sub BuscaSinGenerar()
    Dim asg As Long, i As Long, j As Long, l As Long, k As Long, per As Long
    Dim brg As Long, p As Long, a As String
    updatehash

    
    ReDim SinGenerar(cantAsig, 20)

    For i = 1 To cantAsignaciones

        With Asignaciones(i)
            asg = IndexById(dASIG, .idasig, 0)
            per = IndexById(dPERIODO, .idperiodo, 0)
            brg = IndexById(dBRIGADA, .idbrigada, 0)
            ReDim Preserve SinGenerar(asg, (per - 1) * 5 + .idact).id(getCantBrg)
            SinGenerar(asg, (per - 1) * 5 + .idact).id(brg) = True
        End With

    Next

    cantSgenerar = 0

    For i = 1 To cantAsig
        interface.console.Progress "Trabajando...", kernel.utils.Porciento(i, cantAsig)

        For j = 1 To periodos.Count
            p = IndexById(dDESGLOSE, periodos(j).id, i)

            For k = 1 To asig(i).desglose(p).cantact
                a = ""
                ReDim Preserve SinGenerar(i, (j - 1) * MAX_ACT + k).id(getCantBrg)

                For l = 1 To cantBrg
                    If kernel.utils.idigual(Brigada(l).idesp, asig(i).idesp) And Brigada(l).Nivel = asig(i).Nivel And Not SinGenerar(i, (j - 1) * MAX_ACT + k).id(l) Then a = a + kernel.utils.trunca(Brigada(l).comun.id) + ","
                Next

                If a <> "" Then
                    cantSgenerar = cantSgenerar + 1
                    ReDim Preserve Sgenerar(cantSgenerar)

                    With Sgenerar(cantSgenerar)
                        .idasig = asig(i).comun.id
                        .idesp = asig(i).idesp
                        .Nivel = asig(i).Nivel
                        .idper = periodos(j).id
                        .idact = k
                        .idclasif = asig(i).desglose(p).act(k).idclasif
                        .brgs = a
                    End With

                End If

            Next

        Next

    Next

    
End Sub

'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
''''  R E S T A U R A C I O N
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'Funcion para restaurar los grupos por clasif en las brigadas

Public Sub reparaGxClasifBrigada()
    Dim i As Long, j As Long, k As Long, p As Long

    For i = 1 To cantClasif

        For j = 1 To cantBrg
            p = IndexGrupoxClasif(j, clasif(i).comun.id)

            If p = 0 Then
                'agrego las que existen en CLasif
                Brigada(j).cantGxClasif = Brigada(j).cantGxClasif + 1
                ReDim Preserve Brigada(j).GrupoXClasif(Brigada(j).cantGxClasif)
                Brigada(j).GrupoXClasif(Brigada(j).cantGxClasif).idclasif = _
                clasif(i).comun.id

            End If

        Next

    Next

    For i = 1 To cantBrg

        For j = 1 To Brigada(i).cantGxClasif
            p = IndexById(dCLASIF, Brigada(i).GrupoXClasif(j).idclasif, 0)

            If p = 0 Then
                'elimino las que no existen en Clasif

                If j < Brigada(i).cantGxClasif Then

                    For k = j To Brigada(i).cantGxClasif
                        Brigada(i).GrupoXClasif(k) = Brigada(i).GrupoXClasif(k + 1)
                    Next

                End If

                Brigada(i).cantGxClasif = Brigada(i).cantGxClasif - 1
                ReDim Preserve Brigada(j).GrupoXClasif(Brigada(j).cantGxClasif)
            End If

        Next

    Next

End Sub

Public Sub reparaZpriori()
    Dim i As Long, j As Long, k As Long, l As Long

    

    For i = 1 To cantClasif
        interface.console.Progress "reparando datos: zonas de prioridad", kernel.utils.Porciento(i, cantClasif)

        With clasif(i)

            For j = 1 To periodos.Count

                For k = 1 To CD

                    For l = 1 To ct

                        If .zpriori(j).rest(k, l) = 0 Then .zpriori(j).rest(k, l) = 1
                    Next

                Next

            Next

        End With

    Next

    
End Sub

Public Sub reparaOrdenPerZpriori(idclasif As Long)
    Dim temp As TZPriori, i As Long, j As Long

    With clasif(idclasif)

        For i = 1 To periodos.Count - 1

            If Not kernel.utils.idigual(.zpriori(i).idperiodo, periodos(i).id) Then

                For j = i + 1 To periodos.Count

                    If kernel.utils.idigual(.zpriori(j).idperiodo, periodos(i).id) Then
                        temp = .zpriori(i)
                        .zpriori(i) = .zpriori(j)
                        .zpriori(j) = temp
                        Exit For
                    End If

                Next

            End If

        Next

    End With

End Sub



Public Sub SuperDatarepara()
    On Error Resume Next
    Dim i As Long, d As Long, t As Long
    
    interface.console.Progress "Analizando inconsistencias en los datos...Espere", 0
    RESTORE_LCaseID_All

    For i = 1 To cantClasif
        reparaClasifZpriori i
    Next

    For i = 1 To cantAsig
        reparaDesglose asig(i)
    Next

    reparatodosRest
    reparaDistancias
    reparaPrioriLxAct
    d = CD
    t = ct
    EstaticaConfig
    CD = d
    ct = t
    repara_Desgloses_Clasif
    reparaZpriori
    reparaArrays
    reparaLxAct
    AnalizandoDatos
End Sub

Public Sub reparaArrays()
    Dim i As Long
    ReDim Preserve lugar(cantLug)

    For i = 1 To cantLug
        ReDim Preserve lugar(i).rest(periodos.Count)
    Next

    ReDim Preserve profe(cantProfe)

    For i = 1 To cantProfe
        ReDim Preserve profe(i).rest(periodos.Count)
    Next

    ReDim Preserve LugXact(cantLxAct)

    For i = 1 To cantLxAct
        ReDim Preserve LugXact(i).idlug(LugXact(i).cantLug)
        ReDim Preserve LugXact(i).idxlug(LugXact(i).cantLug)
    Next

    ReDim Preserve ProfeXAct(cantPxAct)

    For i = 1 To cantPxAct
        ReDim Preserve ProfeXAct(i).grupos(ProfeXAct(i).cantGrupos)
    Next

    ReDim Preserve Especialidad(cantEsp)
    ReDim Preserve Brigada(cantBrg)

    For i = 1 To cantBrg
        ReDim Preserve Brigada(i).comun.rest(periodos.Count)
        ReDim Preserve Brigada(i).GrupoXClasif(Brigada(i).cantGxClasif)
    Next

    ReDim Preserve asig(cantAsig)

    For i = 1 To cantAsig
        ReDim Preserve asig(i).comun.rest(periodos.Count)
        ReDim Preserve asig(i).desglose(periodos.Count)
    Next

    ReDim Preserve Asignaciones(cantAsignaciones)
    ReDim Preserve Imposibles(cantImposibles)
    ReDim Preserve AulasFijas(cantfijas)
    ReDim Preserve AccesosProhibidos(cantAccesos)

    For i = 1 To cantAccesos
        ReDim Preserve AccesosProhibidos(i).idlugs(AccesosProhibidos(i).cantLugs)
    Next

    For i = 1 To cantClasif
        ReDim Preserve clasif(i).zpriori(periodos.Count)
    Next

End Sub

Public Sub reparaLxAct()
    Dim i As Long
    Dim ini As Long
    ini = 1
10:

    For i = ini To cantLxAct

        If LugXact(i).cantLug = 0 Then
            ini = i
            LugXact(i) = LugXact(cantLxAct)
            cantLxAct = cantLxAct - 1
            GoTo 10
        End If

    Next

End Sub

Public Sub reparaClasifZpriori(iclasif As Long) 'analoga a reparaRest
    Dim i As Long, j As Long, k As Long

    Dim c As TClasif
    c = clasif(iclasif)
    ReDim c.zpriori(periodos.Count)
    
    For j = 1 To periodos.Count
        k = IndexById(dPERIODO, clasif(iclasif).zpriori(j).idperiodo)
        If k > 0 Then c.zpriori(j) = clasif(iclasif).zpriori(k)
        c.zpriori(j).idperiodo = periodos(j).id
    Next
    With c
        For i = 1 To periodos.Count
            For j = 1 To CD
                For k = 1 To ct
                    If .zpriori(i).rest(j, k) = 0 Then .zpriori(i).rest(j, k) = 1
                Next
            Next
        Next
    End With

    clasif(iclasif) = c
End Sub

Public Sub reparaClasifCT()
    Dim i As Long, ll As Long, t As TRecurso

    For i = 1 To cantClasif
        If clasif(i).ct = 0 Then clasif(i).ct = 1
    Next

End Sub

Public Sub reparatodosRest()
    Dim i As Long

    For i = 1 To cantEsp
        reparaRest Especialidad(i)
    Next

    For i = 1 To cantClasif
        reparaRest clasif(i).comun
    Next

    For i = 1 To cantClasif
        reparaClasifZpriori i
    Next

    For i = 1 To cantBrg
        reparaRest Brigada(i).comun
    Next

    For i = 1 To cantAsig
        reparaRest asig(i).comun
    Next

    For i = 1 To cantProfe
        reparaRest profe(i)
    Next

    For i = 1 To cantLug
        reparaRest lugar(i)
    Next

    reparaClasifCT
End Sub

Public Sub repara_Desgloses_Clasif()

    Dim i As Long, j As Long, k As Long, ll As Long

    

    For i = 1 To cantAsig
        interface.console.Progress "Trabajando...", kernel.utils.Porciento(i, cantAsig)

        For j = 1 To periodos.Count

            With asig(i).desglose(j)

                For ll = 1 To .cantact

                    For k = 1 To cantClasif

                        If kernel.utils.idigual(.act(ll).idclasif, clasif(k).comun.id) Then
                            .act(ll).idclasif = clasif(k).comun.id
                            Exit For
                        End If

                    Next

                Next

            End With

        Next

    Next

    
End Sub

Public Sub setId(ByVal arreglo As Long, ByVal id As String, ByVal idnew As String)
    Dim i As Long, j As Long
    Dim ix As Long
    
    ix = IndexById(arreglo, id)
    If ix = 0 Then Exit Sub
    
    'arreglo
    'Periodo      LugxAct, ProfeXact, Asignaciones, Imposibles, Clasif.Restric,,hrt
    '             Clasif.ZPriori, Brigada.Restric, Lug.Restric, Profe.Restricc,hrt
    'Especialodad Brigadas, Asig,hrt
    'ClasifAct    Asig.Desgloses, Brigada.GrupoXClasif,hrt
    'Profe        ProfeXAct, Asignaciones,hrt
    'Lugar        LugXAct, Asignaciones,hrt
    'Asig         LugXAct,ProfeXAct,Asignaciones,Imposibles,hrt
    'Brigada      Asignaciones, Imposibles, hrt
    'Recurso      Asignaciones, RxAct, hrt

    hrt.replaceId arreglo, id, idnew
        
    Select Case arreglo

        Case dPERIODO

            For i = 1 To cantLxAct
                If kernel.utils.idigual(LugXact(i).para.idper, id) Then LugXact(i).para.idper = idnew
            Next

            For i = 1 To cantPxAct
                If kernel.utils.idigual(ProfeXAct(i).para.idper, id) Then ProfeXAct(i).para.idper = idnew
            Next

            For i = 1 To cantAsignaciones
                If kernel.utils.idigual(Asignaciones(i).idperiodo, id) Then Asignaciones(i).idperiodo = idnew
            Next

            For i = 1 To cantImposibles
                If kernel.utils.idigual(Imposibles(i).idperiodo, id) Then Imposibles(i).idperiodo = idnew
            Next

            For i = 1 To cantClasif
                For j = 1 To periodos.Count
                    If kernel.utils.idigual(clasif(i).comun.rest(j).idperiodo, id) Then clasif(i).comun.rest(j).idperiodo = idnew
                    If kernel.utils.idigual(clasif(i).zpriori(j).idperiodo, id) Then clasif(i).zpriori(j).idperiodo = idnew
                Next
            Next

            For i = 1 To cantBrg
                For j = 1 To periodos.Count
                    If kernel.utils.idigual(Brigada(i).comun.rest(j).idperiodo, id) Then Brigada(i).comun.rest(j).idperiodo = idnew
                Next
            Next

            For i = 1 To cantLug
                For j = 1 To periodos.Count
                    If kernel.utils.idigual(lugar(i).rest(j).idperiodo, id) Then lugar(i).rest(j).idperiodo = idnew
                Next
            Next

            For i = 1 To cantProfe
                For j = 1 To periodos.Count
                    If kernel.utils.idigual(profe(i).rest(j).idperiodo, id) Then profe(i).rest(j).idperiodo = idnew
                Next
            Next

            For i = 1 To cantAsig
                With asig(i)
                    For j = 1 To periodos.Count
                        If kernel.utils.idigual(.desglose(j).idperiodo, id) Then .desglose(j).idperiodo = idnew
                    Next
                End With
            Next

            hashPer.Remove id
            hashPer.add idnew, ix
            periodos(ix).id = idnew
        
        Case dESPECIALIDAD

            For i = 1 To cantBrg
                If kernel.utils.idigual(Brigada(i).idesp, id) Then Brigada(i).idesp = idnew
            Next

            For i = 1 To cantAsig
                If kernel.utils.idigual(asig(i).idesp, id) Then asig(i).idesp = idnew
            Next

            
            hashEsp.Remove id
            hashEsp.add idnew, ix
            
            Especialidad(ix).id = idnew
            
        Case dCLASIF

            For i = 1 To cantAsig
                For j = 1 To periodos.Count
                    If kernel.utils.idigual(asig(i).desglose(j).idperiodo, id) Then asig(i).desglose(j).idperiodo = idnew
                Next
            Next

            For i = 1 To cantBrg
                For j = 1 To Brigada(i).cantGxClasif
                    If kernel.utils.idigual(Brigada(i).GrupoXClasif(j).idclasif, id) Then Brigada(i).GrupoXClasif(j).idclasif = idnew
                Next
            Next

            For i = 1 To cantfijas
                With AulasFijas(i)
                    If kernel.utils.idigual(.idclasif, id) Then .idclasif = idnew
                End With
            Next

            For i = 1 To cantAccesos
                With AccesosProhibidos(i)
                    If kernel.utils.idigual(.idclasif, id) Then .idclasif = idnew
                End With
            Next

            hashCls.Remove id
            hashCls.add idnew, ix
            
            clasif(ix).comun.id = idnew
            
        Case dPROFE
            For i = 1 To cantPxAct
                If kernel.utils.idigual(ProfeXAct(i).idprofes, id) Then ProfeXAct(i).idprofes = idnew
            Next

            For i = 1 To cantAsignaciones
                If kernel.utils.idigual(Asignaciones(i).idprofe, id) Then Asignaciones(i).idprofe = idnew
            Next

            hashPrf.Remove id
            hashPrf.add idnew, ix
            
            profe(ix).id = idnew
        Case dLUGAR

            For i = 1 To cantLxAct
                For j = 1 To LugXact(i).cantLug
                    If kernel.utils.idigual(LugXact(i).idlug(j), id) Then LugXact(i).idlug(j) = idnew
                Next
            Next

            For i = 1 To cantAsignaciones
                If kernel.utils.idigual(Asignaciones(i).idlugar, id) Then Asignaciones(i).idlugar = idnew
            Next

            For i = 1 To cantAccesos
                With AccesosProhibidos(i)
                    For j = 1 To .cantLugs
                        If kernel.utils.idigual(.idlugs(j), id) Then .idlugs(j) = idnew
                    Next
                End With
            Next

            For i = 1 To cantLug
                With Distancias(i)
                    If kernel.utils.idigual(.id, id) Then .id = idnew
                    For j = 1 To cantLug
                        If kernel.utils.idigual(.colum(j).id, id) Then .colum(j).id = idnew
                    Next
                End With
            Next

            For i = 1 To cantfijas
                With AulasFijas(i)
                    If kernel.utils.idigual(.idlug, id) Then .idlug = idnew
                End With
            Next

            hashLug.Remove id
            hashLug.add idnew, ix
            
            lugar(ix).id = idnew
            
        Case dASIG
            For i = 1 To cantLxAct
                If kernel.utils.idigual(LugXact(i).para.idasig, id) Then LugXact(i).para.idasig = idnew
            Next

            For i = 1 To cantPxAct
                If kernel.utils.idigual(ProfeXAct(i).para.idasig, id) Then ProfeXAct(i).para.idasig = idnew
            Next

            For i = 1 To cantAsignaciones
                If kernel.utils.idigual(Asignaciones(i).idasig, id) Then Asignaciones(i).idasig = idnew
            Next

            For i = 1 To cantImposibles
                If kernel.utils.idigual(Imposibles(i).idasig, id) Then Imposibles(i).idasig = idnew
            Next

            hashAsg.Remove id
            hashAsg.add idnew, ix

            asig(ix).comun.id = idnew
        Case dBRIGADA
            For i = 1 To cantAsignaciones
                If kernel.utils.idigual(Asignaciones(i).idbrigada, id) Then Asignaciones(i).idbrigada = idnew
            Next

            For i = 1 To cantImposibles
                If kernel.utils.idigual(Imposibles(i).idbrigada, id) Then Imposibles(i).idbrigada = idnew
            Next
            
            hashBrg.Remove id
            hashBrg.add idnew, ix
            
            Brigada(ix).comun.id = idnew
        
        Case dRECURSO
            For i = 1 To cantAsignaciones
                For j = 1 To Asignaciones(i).cantrecursos
                    If kernel.utils.idigual(Asignaciones(i).recursos(j), id) Then Asignaciones(i).recursos(j) = idnew
                Next
            Next
            
            Dim r As TGOH_RecursoXAct, gr As TGOH_GroupRest
            
            For Each r In recursosXact
                For Each gr In r.gruposRecursos
                    For i = 1 To gr.recursos.Count
                        If kernel.utils.idigual("" & gr.recursos(i).value, id) Then gr.recursos(i).value = "" & idnew
                    Next
                Next
            Next
            
            hashRes.Remove id
            hashRes.add idnew, ix
            
            ancora.recursos(ix).id = idnew

    End Select

End Sub

Public Sub reparaDistancias()

    
    Dim pos As Long, i As Long, j As Long, k As Long
    interface.console.Progress "Analizando distancia entre lugares...", 0
    ReDim Preserve Distancias(cantLug)

    For j = 1 To cantLug
        ReDim Preserve Distancias(j).colum(cantLug)
    Next

    For i = 1 To cantLug
        interface.console.Progress "Analizando distancia entre lugares", kernel.utils.Porciento(i, cantLug)

        For j = 1 To cantLug

            If kernel.utils.trunca(Distancias(j).id) = kernel.utils.trunca(lugar(i).id) Then
                pos = j
                GoTo 10
            End If

        Next

        For j = 1 To cantLug

            If kernel.utils.trunca(Distancias(j).id) = "" Then
                Distancias(j).id = lugar(i).id
                pos = j
                Exit For
            End If

        Next

10:
        'busco por columna

        For k = 1 To cantLug
            DoEvents

            For j = 1 To cantLug

                If kernel.utils.trunca(Distancias(pos).colum(j).id) = kernel.utils.trunca(lugar(k).id) Then GoTo 20
            Next

            For j = 1 To cantLug
                DoEvents

                If kernel.utils.trunca(Distancias(pos).colum(j).id) = "" Then
                    Distancias(pos).colum(j).id = lugar(k).id
                    Exit For
                End If

            Next
20:

        Next

    Next

    
End Sub

Public Function reparaProfeXact()
    On Error GoTo errdep
    Dim j1 As Long, j2 As Long, j3 As Long, j4 As Long, i As Long, j As Long
    'limpiar

    
10:

    For i = 1 To cantPxAct
        interface.console.Progress "Analizando recursos...", kernel.utils.Porciento(i, cantLug)
        j1 = IndexById(dASIG, ProfeXAct(i).para.idasig, 0)
        j2 = IndexById(dPERIODO, ProfeXAct(i).para.idper, 0)

        If j1 <> 0 And j2 <> 0 Then

            If asig(j1).desglose(IndexById(dDESGLOSE, ProfeXAct(i).para.idper, _
            j1)).cantact >= ProfeXAct(i).para.idact Then j3 = 1 Else j3 = 0

        End If

        j4 = IndexById(dPROFE, ProfeXAct(i).idprofes, 0)

        If j1 + j2 + j3 + j4 <> 4 Then

            If i < cantPxAct Then

                For j = i To cantPxAct - 1
                    ProfeXAct(j) = ProfeXAct(j + 1)
                Next

            End If

            cantPxAct = cantPxAct - 1
            GoTo 10
        End If

    Next

    'agregar los que falten
errdep:

    
End Function

Public Sub reparaPrioriLxAct()
    Dim i As Long, k As Long

    For i = 1 To cantLxAct

        With LugXact(i)

            For k = 1 To .cantLug

                If .priori(k) = 0 Then .priori(k) = 1
            Next

        End With

    Next

End Sub

Public Sub reparaRestricciones()
    Dim id As Long, asg As Long, per As Long, i As Long

    For i = 1 To cantAsignaciones

        With Asignaciones(i)
            id = IndexById(dBRIGADA, .idbrigada, 0)
            per = IndexRestRecurso(.idperiodo, Brigada(id).comun)
            Brigada(id).comun.rest(per).rest(.dia, .turno) = True
            id = IndexById(dPROFE, .idprofe, 0)
            per = IndexRestRecurso(.idperiodo, profe(id))
            profe(id).rest(per).rest(.dia, .turno) = True
            id = IndexById(dLUGAR, .idlugar, 0)
            per = IndexRestRecurso(.idperiodo, lugar(id))
            lugar(id).rest(per).rest(.dia, .turno) = True
        End With

    Next

End Sub

Public Sub AnalizandoDatos()
    'On Error GoTo 10
    Dim i As Long, a As String, j As Long
    
    interface.console.Progress "Analizando datos...", 1
    'asig.rest

    For i = 1 To cantAsig
        With asig(i)
            If IndexById(dESPECIALIDAD, .idesp, 0) = 0 Then insertEspecialidad .idesp, .idesp, .idesp
        End With
    Next

    'brigadas.rest

    For i = 1 To cantBrg
        With Brigada(i)
            If IndexById(dESPECIALIDAD, .idesp, 0) = 0 Then insertEspecialidad .idesp, .idesp, .idesp
        End With
    Next

    'profexact.idasig
    'profexact.idper
    'profexact.idprofe
    
    Dim eliminalo As Boolean
    
    For i = 1 To cantPxAct
        eliminalo = False
        With ProfeXAct(i)

            If IndexById(dASIG, .para.idasig, 0) = 0 Then
                eliminalo = True
                Else
                If IndexById(dPERIODO, .para.idper, 0) = 0 Then
                    eliminalo = True
                Else
                    If IndexById(dPROFE, .idprofes, 0) = 0 Then
                        eliminalo = True
                    End If
                End If
            End If
        End With
        
        If eliminalo Then
                deleteProfexAct i
                i = i - 1
        End If
    Next

    'lugxact.idasig
    'lugxact.idper
    'lugxact.idlugs

    For i = 1 To cantLxAct
        With LugXact(i)
            eliminalo = False
            If IndexById(dASIG, .para.idasig, 0) = 0 Then
                eliminalo = True
            Else
                If IndexById(dPERIODO, .para.idper, 0) = 0 Then
                    eliminalo = True
                Else
                    For j = 1 To .cantLug
                        If IndexById(dLUGAR, .idlug(j), 0) = 0 Then
                            deleteLxAct_lug i, j
                            j = j - 1
                        End If
                    Next
                End If
            End If
            If .cantLug = 0 Then eliminalo = True
        End With
        
        If eliminalo Then
            deleteLxAct i
            i = i - 1
        End If
    Next

    'asignaciones.
    'idasig
    'idper
    'idbrg
    
    Dim max As Long, kk As Long, qq As Long
    max = cantAsignaciones
    kk = 0
    qq = 0

    For i = 1 To cantAsignaciones
        kk = kk + 1
        interface.console.Progress "Reparando asignaciones de actividades: " & qq & " asignaciones eliminadas", kernel.utils.Porciento(kk, max)
        eliminalo = False
        With Asignaciones(i)
            If IndexById(dASIG, .idasig, 0) = 0 Then
                eliminalo = True
            Else
                If IndexById(dPERIODO, .idperiodo, 0) = 0 Then
                    eliminalo = True
                Else
                    If IndexById(dBRIGADA, .idbrigada, 0) = 0 Then
                        eliminalo = True
                    Else
                        If IndexById(dLUGAR, .idlugar, 0) = 0 Then
                            eliminalo = True
                        Else
                            If IndexById(dPROFE, .idprofe, 0) = 0 Then
                                eliminalo = True
                            Else
                                For j = 1 To .cantrecursos
                                    If IndexById(dRECURSO, .recursos(j)) = 0 Then
                                        eliminalo = True
                                        Exit For
                                    End If
                                Next
                            End If
                        End If
                    End If
                End If
            End If
        End With
        If eliminalo Then
            destruyeAsignacion i
            qq = qq + 1
            i = i - 1
        End If
    Next
    interface.console.Progress "Analizando datos...", 100
    Exit Sub
10:
    Debug.Print Err.Number, Erl, Err.Description
    Resume Next
End Sub

Public Sub RESTORE_LCaseID_Zpriori(iclasif As Long)
    Dim i As Long

    For i = 1 To cantClasif
        With clasif(iclasif).zpriori(i)
            .idperiodo = LCase(.idperiodo)
        End With
    Next

End Sub

Public Sub RESTORE_LCaseID_Desglose(iasig As Long)
    Dim i As Long, j As Long

    For i = 1 To periodos.Count

        With asig(iasig).desglose(i)
            .idperiodo = LCase(.idperiodo)

            For j = 1 To .cantact
                .act(j).idclasif = LCase(.act(j).idclasif)
            Next

        End With

    Next

End Sub

Public Sub RESTORE_LCaseID_GxClasif(ibrg As Long)
    On Error Resume Next
    Dim i As Long

    For i = 1 To cantClasif
        With Brigada(ibrg).GrupoXClasif(i)
            .idclasif = LCase(.idclasif)
        End With
    Next

End Sub

Public Sub RESTORE_LCaseID_All()
    Dim i As Long, j As Long

    
    'periodos

    For i = 1 To periodos.Count
        interface.console.Progress "reparando identificadores...Períodos", kernel.utils.Porciento(i, periodos.Count)
        periodos(i).id = LCase(periodos(i).id)
    Next

    'especialidad

    For i = 1 To cantEsp
        interface.console.Progress "reparando identificadores...Especialidades", kernel.utils.Porciento(i, cantEsp)
        Especialidad(i).id = LCase(Especialidad(i).id)
        RESTORE_LCaseID_Rest Especialidad(i)
    Next

    'asig

    For i = 1 To cantAsig
        interface.console.Progress "reparando identificadores...Asignaturas", kernel.utils.Porciento(i, cantAsig)
        asig(i).comun.id = LCase(asig(i).comun.id)
        RESTORE_LCaseID_Desglose i
    Next

    'brg

    For i = 1 To cantBrg
        interface.console.Progress "reparando identificadores...Brigadas", kernel.utils.Porciento(i, cantBrg)

        Brigada(i).comun.id = LCase(Brigada(i).comun.id)
        RESTORE_LCaseID_GxClasif i
        RESTORE_LCaseID_Rest Brigada(i).comun
        Brigada(i).idesp = LCase(Brigada(i).idesp)
    Next

    'clasif

    For i = 1 To cantClasif
        interface.console.Progress "reparando identificadores...Clasificaciones de actividades", kernel.utils.Porciento(i, cantClasif)
        clasif(i).comun.id = LCase(clasif(i).comun.id)
        RESTORE_LCaseID_Rest clasif(i).comun
        RESTORE_LCaseID_Zpriori i
    Next

    'lugares

    For i = 1 To cantLug
        interface.console.Progress "reparando identificadores...Lugares", kernel.utils.Porciento(i, cantLug)
        lugar(i).id = LCase(lugar(i).id)
        RESTORE_LCaseID_Rest lugar(i)
    Next

    'profes

    For i = 1 To cantProfe
        interface.console.Progress "reparando identificadores...Profesores", kernel.utils.Porciento(i, cantProfe)
        profe(i).id = LCase(profe(i).id)
        RESTORE_LCaseID_Rest profe(i)
    Next

    'distancias

    For i = 1 To cantLug
        interface.console.Progress "reparando identificadores...Distancia entre lugares", kernel.utils.Porciento(i, cantLug)

        Distancias(i).id = LCase(Distancias(i).id)

        For j = 1 To cantLug
            Distancias(i).colum(j).id = LCase(Distancias(i).colum(j).id)
        Next

    Next

    'lxact

    For i = 1 To cantLxAct
        interface.console.Progress "reparando identificadores...Lugares por actividad", kernel.utils.Porciento(i, cantLxAct)

        With LugXact(i)
            .para.idasig = LCase(.para.idasig)
            .para.idper = LCase(.para.idper)

            For j = 1 To .cantLug
                .idlug(j) = LCase(.idlug(j))
            Next

        End With

    Next

    'pxact

    For i = 1 To cantPxAct
        interface.console.Progress "reparando identificadores...Profesores por actividad", kernel.utils.Porciento(i, cantPxAct)

        With ProfeXAct(i)
            .para.idasig = LCase(.para.idasig)
            .para.idper = LCase(.para.idper)
            .idprofes = LCase(.idprofes)
        End With

    Next

    'asignaciones

    For i = 1 To cantAsignaciones
        interface.console.Progress "reparando identificadores...Asignacioens de actividades", kernel.utils.Porciento(i, cantAsignaciones)

        With Asignaciones(i)
            .idasig = LCase(.idasig)
            .idbrigada = LCase(.idbrigada)
            .idlugar = LCase(.idlugar)
            .idperiodo = LCase(.idperiodo)
            .idprofe = LCase(.idprofe)
        End With

    Next

    'imposibles

    For i = 1 To cantImposibles
        interface.console.Progress "reparando identificadores...Actividade sin asignar", kernel.utils.Porciento(i, _
        cantImposibles)

        With Imposibles(i)
            .idasig = LCase(.idasig)
            .idbrigada = LCase(.idbrigada)
            .idperiodo = LCase(.idperiodo)
        End With

    Next

    'aulas fijas

    For i = 1 To cantfijas
        interface.console.Progress "reparando identificadores...Lugares fijos", kernel.utils.Porciento(i, cantfijas)

        With AulasFijas(i)
            .idclasif = LCase(.idclasif)
            .idlug = LCase(.idlug)
        End With

    Next

    'accesos prohibidos

    For i = 1 To cantAccesos
        interface.console.Progress "reparando identificadores...Accesos prohibidos", kernel.utils.Porciento(i, cantAccesos)

        With AccesosProhibidos(i)
            .idclasif = LCase(.idclasif)

            For j = 1 To .cantLugs
                .idlugs(j) = LCase(.idlugs(j))
            Next

        End With

    Next

    
End Sub

'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'' HERRAMIENTAS
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

Public Sub ConvierteTGrafo()
    Dim i As Long, j As Long, k As Long
    grafo.cantNodos = cantLug
    ReDim Preserve grafo.matrix(cantLug, cantLug)

    For i = 1 To cantLug

        For j = 1 To cantLug

            If kernel.utils.idigual(Distancias(j).id, lugar(i).id) Then

                For k = 1 To cantLug
                    grafo.matrix(i, IndexById(dLUGAR, Distancias(j).colum(k).id, 0)) = _
                    Distancias(j).colum(k).dist

                Next

            End If

        Next

    Next

End Sub

Public Function LugarAnteriorSgte(dia As Long, brg As Long, per As Long, turno As Long, sentido As Long) As Long

    Dim i As Long, j As Long, finsentido As Long, stepsentido As Long, inisentido As Long

    If sentido = 1 Then
        inisentido = turno + 1
        finsentido = ct
        stepsentido = 1
    Else
        inisentido = turno - 1
        finsentido = 1
        stepsentido = -1
    End If

    For i = inisentido To finsentido Step stepsentido

        For j = 1 To cantFiltroAsignaciones

            With Asignaciones(FiltroAsignaciones(j))

                If kernel.utils.idigual(Brigada(brg).comun.id, .idbrigada) And kernel.utils.idigual(.idperiodo, _
                    periodos(per).id) And .dia = dia And .turno = i _
                    Then

                    LugarAnteriorSgte = IndexById(dLUGAR, .idlugar, 0)
                    Exit Function
                End If

            End With

        Next

    Next

    LugarAnteriorSgte = 0
End Function

Public Function DistanciaEntre(id1 As String, id2 As String) As Long
    Dim i As Long, j As Long

    For i = 1 To cantLug

        If kernel.utils.trunca(Distancias(i).id) = kernel.utils.trunca(id1) Then

            For j = 1 To cantLug

                If kernel.utils.trunca(Distancias(i).colum(j).id) = kernel.utils.trunca(id2) Then
                    DistanciaEntre = Distancias(i).colum(j).dist
                    Exit Function
                End If

            Next

        End If

    Next

    DistanciaEntre = 0
End Function

Public Sub setDistancia(id1 As String, id2 As String, d As Long)
    Dim i As Long, j As Long

    For i = 1 To cantLug

        If kernel.utils.idigual(id1, Distancias(i).id) Then

            For j = 1 To cantLug

                If kernel.utils.idigual(id2, Distancias(i).colum(j).id) Then
                    Distancias(i).colum(j).dist = d
                    GoTo 10
                End If

            Next

        End If

    Next

10:

    For i = 1 To cantLug

        If kernel.utils.idigual(id2, Distancias(i).id) Then

            For j = 1 To cantLug

                If kernel.utils.idigual(id1, Distancias(i).colum(j).id) Then
                    Distancias(i).colum(j).dist = d
                    Exit Sub
                End If

            Next

        End If

    Next

End Sub

Public Sub LimpiaImposibles(esp As String, Nivel As Long, per As String)

    Dim i As Long, j As Long, asg As Long, ini As Long
    updatehash

    

restart_for:
    For i = ini To cantImposibles

        interface.console.Progress "Limpiando el listado de actividades sin asignar...", kernel.utils.Porciento(i, cantImposibles)

        With Imposibles(i)
            asg = IndexById(dASIG, .idasig, 0)

            If kernel.utils.idigual(esp, asig(asg).idesp) And kernel.utils.idigual(per, .idperiodo) And Nivel = _
                asig(asg).Nivel _
                Then

                For j = i To cantImposibles - 1
                    Imposibles(j) = Imposibles(j + 1)
                Next

                ini = i
                cantImposibles = cantImposibles - 1
                GoTo restart_for
            End If

        End With

    Next

    
End Sub


Public Sub Fijar(idx As Long)
    Dim act As TActAsignada, iclasif As Long, brg As TFiltro, esp As Long, id As Long
    Dim grupos As TFiltro, asg As Long, per As Long, i As Long, j As Long
    Dim g As Long, ini As Long
    act = Asignaciones(idx)
    asg = IndexById(dASIG, act.idasig, 0)
    per = IndexById(dDESGLOSE, act.idperiodo, asg)
    iclasif = IndexById(dCLASIF, asig(asg).desglose(per).act(act.idact).idclasif, 0)
    id = IndexById(dBRIGADA, act.idbrigada, 0)
    esp = IndexById(dESPECIALIDAD, Brigada(id).idesp, 0)
    grupos = CantGruposxClasif(esp, Brigada(id).Nivel, iclasif)
    g = 0

    For i = 1 To grupos.cant
        brg = BrigadasDeGrupo(iclasif, esp, Brigada(id).Nivel, grupos.id(i))

        For j = 1 To brg.cant

            If kernel.utils.idigual(act.idbrigada, Brigada(brg.id(j)).comun.id) Then
                g = i
                ini = 1
                GoTo 10
            End If

        Next

    Next

    ini = 1
10:

    For i = ini To cantAsignaciones

        With Asignaciones(i)

            If kernel.utils.idigual(.idperiodo, act.idperiodo) Then

                If kernel.utils.idigual(.idasig, act.idasig) Then

                    If .idact = act.idact Then

                        For j = 1 To brg.cant

                            If kernel.utils.idigual(.idbrigada, Brigada(brg.id(j)).comun.id) Then
                                Asignaciones(i).fija = Not Asignaciones(i).fija
                                ini = i + 1
                                GoTo 10
                            End If

                        Next

                    End If

                End If

            End If

        End With

    Next

End Sub

Public Function sePuedeEliminar(arreglo As Long, id As Long) As String
    Dim a As String, i As Long, j As Long, k As Long
    a = ""

    Select Case arreglo

        Case dPERIODO

            For i = 1 To cantAsignaciones

                If kernel.utils.idigual(Asignaciones(i).idperiodo, periodos(id).id) Then
                    a = "- Existen actividades asignadas para este período" + Chr(13)
                    Exit For
                End If

            Next

        Case dESPECIALIDAD

            For i = 1 To cantBrg

                If kernel.utils.idigual(Especialidad(id).id, Brigada(i).idesp) Then
                    a = "- Existen brigadas con esta especialidad" + Chr(13)
                    Exit For
                End If

            Next

            For i = 1 To cantAsig

                If kernel.utils.idigual(Especialidad(id).id, asig(i).idesp) Then
                    a = a + "- Existen asignaturas con esta especialidad" + Chr(13)
                    Exit For
                End If

            Next

        Case dBRIGADA

            For i = 1 To cantAsignaciones

                If kernel.utils.idigual(Asignaciones(i).idbrigada, Brigada(id).comun.id) Then
                    a = "- La brigada posee actividades asignadas" + Chr(13)
                    Exit For
                End If

            Next

        Case dASIG

            For i = 1 To cantPxAct

                If kernel.utils.idigual(ProfeXAct(i).para.idasig, asig(id).comun.id) Then
                    a = "- La asignatura posee 'profesores por actividad'" + Chr(13)
                    Exit For
                End If

            Next

            For i = 1 To cantLxAct

                If kernel.utils.idigual(LugXact(i).para.idasig, asig(id).comun.id) Then
                    a = a + "- La asignatura posee 'lugares por actividad'" + Chr(13)
                    Exit For
                End If

            Next

            For i = 1 To cantAsignaciones

                If kernel.utils.idigual(Asignaciones(i).idasig, asig(id).comun.id) Then
                    a = a + "- La asignatura posee actividades asignadas" + Chr(13)
                    Exit For
                End If

            Next

        Case dCLASIF

            For i = 1 To cantAsig

                For j = 1 To periodos.Count

                    For k = 1 To asig(i).desglose(j).cantact

                        If kernel.utils.idigual(asig(i).desglose(j).act(k).idclasif, _
                            clasif(id).comun.id) _
                            Then

                            a = _
                            "- La clasificación está utilizada en 'desgloses de actividades' (" _
                            + kernel.utils.trunca(asig(i).comun.id) + ", " + _
                            kernel.utils.trunca(asig(i).desglose(j).idperiodo) + ")" + _
                            Chr(13)

                            Exit For
                        End If

                    Next

                Next

            Next

            For i = 1 To cantBrg

                For j = 1 To cantClasif

                    If kernel.utils.idigual(Brigada(i).GrupoXClasif(j).idclasif, _
                        clasif(id).comun.id) And Brigada(i).GrupoXClasif(j).grupo <> 0 _
                        Then

                        a = a + "- Existen grupos de esta clasificación" + Chr(13)
                        GoTo 10
                    End If

                Next

            Next
10:

        Case dPROFE

            For i = 1 To cantPxAct

                If kernel.utils.idigual(ProfeXAct(i).idprofes, profe(id).id) Then
                    a = "- Este profesor está asignado a una actividad (" & _
                    kernel.utils.trunca(ProfeXAct(i).para.idasig) + ", " & _
                    kernel.utils.trunca(ProfeXAct(i).para.idper) + ", act #" & _
                    ProfeXAct(i).para.idact & _
                    vbLf

                    Exit For
                End If

            Next

        Case dLUGAR

            For i = 1 To cantLxAct

                For j = 1 To LugXact(i).cantLug

                    If kernel.utils.idigual(LugXact(i).idlug(j), lugar(id).id) Then
                        a = "- Este lugar está asignado a una actividad (" & _
                        LugXact(i).para.idasig + ", " & LugXact(i).para.idper & _
                        ", act #" & LugXact(i).para.idact & ")" & _
                        vbLf

                        Exit For
                    End If

                Next

            Next

        Case dRECURSO

            For i = 1 To recursosXact.Count

                For j = 1 To recursosXact(i).gruposRecursos.Count

                    For k = 1 To recursosXact(i).gruposRecursos(j).recursos.Count

                        If kernel.utils.idigual(recursosXact(i).gruposRecursos(j).recursos(k).value _
                            & "", recursos(id).id) _
                            Then

                            a = "- Este recurso está asignado a una actividad (" + _
                            recursosXact(i).asg + ", " + recursosXact(i).per + _
                            ", act #" + recursosXact(i).act + ")" + _
                            Chr(13)

                            Exit For
                        End If

                    Next

                Next

            Next

    End Select

    sePuedeEliminar = a
End Function

Public Function getCantAsignacionesFijas() As Long
    Dim i As Long, cantfijas As Long

    For i = 1 To cantAsignaciones

        If Asignaciones(i).fija Then cantfijas = cantfijas + 1
    Next

    getCantAsignacionesFijas = cantfijas
End Function

Public Function getCantGruposAsignacion(idx As Long) As Long
    Dim act As TActAsignada, iclasif As Long, brg As TFiltro, esp As Long
    Dim grupos As TFiltro, asg As Long, per As Long, i As Long, j As Long
    Dim g As Long, ini As Long, id As Long

    If idx = 0 Then Exit Function
    act = Asignaciones(id)
    asg = IndexById(dASIG, act.idasig, 0)
    per = IndexById(dDESGLOSE, act.idperiodo, asg)
    iclasif = IndexById(dCLASIF, asig(asg).desglose(per).act(act.idact).idclasif, 0)
    id = IndexById(dBRIGADA, act.idbrigada, 0)
    esp = IndexById(dESPECIALIDAD, Brigada(id).idesp, 0)
    grupos = CantGruposxClasif(esp, Brigada(id).Nivel, iclasif)
    getCantGruposAsignacion = grupos.cant
End Function

Public Function getGrupoAsignacion(idx As Long) As Long
    Dim act As TActAsignada, iclasif As Long, brg As TFiltro, esp As Long, id As Long
    Dim grupos As TFiltro, asg As Long, per As Long, i As Long, j As Long
    Dim g As Long, ini As Long
    Dim ii As Long

    If idx = 0 Then Exit Function
    act = Asignaciones(idx)
    asg = IndexById(dASIG, act.idasig, 0)
    per = IndexById(dDESGLOSE, act.idperiodo, asg)
    iclasif = IndexById(dCLASIF, asig(asg).desglose(per).act(act.idact).idclasif, 0)
    id = IndexById(dBRIGADA, act.idbrigada, 0)
    esp = IndexById(dESPECIALIDAD, Brigada(id).idesp, 0)
    grupos = CantGruposxClasif(esp, Brigada(id).Nivel, iclasif)
    ii = IndexGrupoxClasif(id, asig(asg).desglose(per).act(act.idact).idclasif)
    getGrupoAsignacion = Brigada(id).GrupoXClasif(ii).grupo
End Function

Public Function getClasifOfActivity(idasig As String, idper As String, idact As Long) As Long
    Dim asg As Long, per As Long, act As Long
    asg = IndexById(dASIG, idasig)
    per = IndexById(dDESGLOSE, idper, asg)
    act = idact
    getClasifOfActivity = IndexById(dCLASIF, asig(asg).desglose(per).act(idact).idclasif, 0)
End Function

Public Sub QuitaSpanishAsig()
    Dim i As Long

    For i = 1 To cantAsig
        asig(i).comun.descrip = kernel.strings.QuitaSpanish(asig(i).comun.descrip)
    Next

End Sub

Public Function getIdPerHerencia(idper As String, idperi As Long, ByRef tiene As Boolean) As Long

    Dim a As String, p As Long
    p = idperi

    If p = 0 Then p = IndexById(dPERIODO, idper, 0)
    a = periodos(p).template

    If a <> "" Then
        p = IndexById(dPERIODO, a, 0)
        tiene = True
    End If

    getIdPerHerencia = p
End Function

Public Function getEstadoZPriori(iclasif As Long, dia As Long, turno As Long, per As Long) As Long

    Dim i As Long

    With clasif(iclasif)

        For i = 1 To periodos.Count

            If kernel.utils.idigual(.zpriori(i).idperiodo, periodos(per).id) Then
                getEstadoZPriori = .zpriori(i).rest(dia, turno)
                Exit Function
            End If

        Next

    End With

    getEstadoZPriori = 0
End Function


Public Function getTotalDeActividades() As Long

    On Error Resume Next
    Dim i As Long, j As Long, total As Long
    total = 0

    

    For i = 1 To cantAsig

        interface.console.Progress "Calculando...", kernel.utils.Porciento(i, cantAsig)

        For j = 1 To periodos.Count
            total = total + asig(i).desglose(j).cantact
        Next

    Next

    
    getTotalDeActividades = total
End Function

'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'''''' GENERADOR
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

Public Function getMaxPrioriLxAct_byPI(cant As Long) As Long
    Dim max As Long, i As Long

    For i = 1 To cant
        If PRIORI_LXACT_segunPI(i) > max Or i = 1 Then max = PRIORI_LXACT_segunPI(i)
    Next

    getMaxPrioriLxAct_byPI = max
End Function

'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'GENERADOR
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'1- Por clasif:  Priorizar el orden de las clasificaciones
'2- Por niveles: Priorizando la cantidad de actividad de las asignaturas
'3- parche: Maximizar la agrupacion de las actividades según su clasificacion

Public Sub Generar(esp As Long, Nivel As Long, per As Long, forma As Long, PARCHE As Long, compactar As Long, parche1 As Boolean, buscalugar As Boolean)

    Dim oo As Long, kk As Long, i As Long, p As Long, j As Long, level As Long
    Dim clasificacion As Long, fila As Long, MatrixAct() As TFilaMatrixAct
    ReDim MatrixAct(getCantAsig)
    Dim tempMACT As TFilaMatrixAct, cantAsigEnCurso As Long, Indice() As Long
    ReDim Indice(getCantAsig)
    Dim TablaPrioriza() As Double, cantPriorizando  As Long
    ReDim TablaPrioriza(getCantAsig, 10)
    Dim Priorizame As TFiltro, cantAsigPrioriza As Long, idclasifSgte As Long
    Dim cniveles As Long, k As Long, ll As Long, op As Long
    Dim varCiclo1 As Long, varCiclo2 As Long, cantCiclo1 As Long, cantCiclo2 As Long
    Dim cantactencurso As Long, voyact As Long
    Dim jj As Long, rr As Long
    Dim brgs As TFiltro, grupos As TFiltro, g As Long
    Dim Rgrupos As TFiltro, gg As Double, ii As Long
    Dim cantCriterios As Long
    
    
    cantCriterios = 9
    BeginIDX
    ESPEC_GENERANDO = esp
    IMPOSIBLES_NOW = 0
    Detener = False
    HoraInicialGeneracion = "" & Time
    cantAsigEnCurso = 0
    cniveles = cantLevel(esp, Nivel, per)
    Dim tempuses As TAtom_arrVariant
    Set tempuses = getUseOfResources("", 0, 0)
    Set UsesOfResources = Nothing
    Set UsesOfResources = New TAtom_arrVariant

    For i = 1 To recursos.Count
        UsesOfResources.add 0, recursos(i).id

        If Not tempuses(recursos(i).id) Is Nothing Then _
        UsesOfResources(recursos(i).id).value = _
        tempuses(recursos(i).id).value

    Next

    '--------------- preparando matrix de actividades con Corrimiento ---------------------
    FiltraIDPxAct esp, Nivel, per
    FiltraIDLxAct esp, Nivel, per
    FiltraAsignaciones Especialidad(esp).id, Nivel, periodos(per).id
    INI_OPTIMIZAR_PROFE
    goProfesoresEnCurso esp, Nivel, per

    

    For i = 1 To cantAsig

        If kernel.utils.idigual(asig(i).idesp, Especialidad(esp).id) And asig(i).Nivel = Nivel Then
            cantAsigEnCurso = cantAsigEnCurso + 1
            p = IndexById(dDESGLOSE, periodos(per).id, i)

            If p <> 0 Then
                MatrixAct(cantAsigEnCurso).cantact = asig(i).desglose(p).cantact
                MatrixAct(cantAsigEnCurso).idasig = i

                For j = 1 To asig(i).desglose(p).cantact
                    MatrixAct(cantAsigEnCurso).act(cniveles - asig(i).desglose(p).cantact + j) = IndexById(dCLASIF, asig(i).desglose(p).act(j).idclasif)
                    MatrixAct(cantAsigEnCurso).numero(cniveles - asig(i).desglose(p).cantact + j) = j
                    If Detener = True Then If interface.Question_InterrumpirProceso Then Exit Sub
                Next

            End If

        End If

    Next

    'ordenar por cantact la matrix

    For i = 1 To cantAsigEnCurso - 1

        For j = i + 1 To cantAsigEnCurso

            If MatrixAct(i).cantact < MatrixAct(j).cantact Then
                tempMACT = MatrixAct(i)
                MatrixAct(i) = MatrixAct(j)
                MatrixAct(j) = tempMACT

                If Detener = True Then If interface.Question_InterrumpirProceso Then Exit Sub
            End If

        Next

    Next

    'cantidad de actividades que se van a colocar
    cantactencurso = 0

    For i = 1 To cantAsigEnCurso
        cantactencurso = cantactencurso + MatrixAct(i).cantact
    Next

    voyact = 0
    'algoritmo polimorfico

    If forma = 1 Then
        cantCiclo2 = cniveles
        cantCiclo1 = cantClasif
    Else
        cantCiclo1 = cniveles
        cantCiclo2 = cantClasif
    End If

    'GENERANDO
1000:

    For varCiclo1 = 1 To cantCiclo1

        For varCiclo2 = 1 To cantCiclo2

            If forma = 1 Then
                clasificacion = varCiclo1
                level = varCiclo2
            Else
                clasificacion = varCiclo2
                level = varCiclo1
            End If

            'priorizando actividades segun recurso que disponen
            cantPriorizando = 0

            For fila = 1 To cantAsigEnCurso

                If MatrixAct(fila).act(level) = clasificacion Then
                    cantPriorizando = cantPriorizando + 1
                    Indice(cantPriorizando) = fila

                    If Detener = True Then If interface.Question_InterrumpirProceso Then Exit Sub
                End If

            Next

            For fila = 1 To cantPriorizando

                If MatrixAct(Indice(fila)).act(level) = clasificacion Then
                    i = fila
                    'calculando cant PROFES asignados
                    kk = 0
                    rr = 0

                    For jj = 1 To cantIDPxAct
                        j = ListaIDPxAct(jj)

                        If kernel.utils.idigual(ProfeXAct(j).para.idasig, _
                            asig(MatrixAct(Indice(fila)).idasig).comun.id) And _
                            kernel.utils.idigual(ProfeXAct(j).para.idper, periodos(per).id) And _
                            ProfeXAct(j).para.idact = MatrixAct(Indice(fila)).numero(level) _
                            Then

                            kk = kk + 1
                            ii = IndexById(dPROFE, ProfeXAct(j).idprofes)
                            If ii > 0 Then rr = rr + CantRestRecurso(profe(ii), per)
                        End If

                        If Detener = True Then If interface.Question_InterrumpirProceso Then Exit _
                        Sub

                    Next

                    TablaPrioriza(fila, 1) = kk
                    TablaPrioriza(fila, 4) = kernel.utils.Porciento(rr, kk * CD * ct)

                    Rgrupos = RestriccByGrupo(per, MatrixAct(Indice(fila)).act(level), esp, Nivel)

                    grupos = CantGruposxClasif(esp, Nivel, MatrixAct(Indice(fila)).act(level))

                    'calculando cant LUGARES asignados
                    kk = 0
                    rr = 0
                    gg = 0

                    For jj = 1 To cantIDLxAct
                        j = ListaIDLxAct(jj)

                        If kernel.utils.idigual(LugXact(j).para.idasig, _
                            asig(MatrixAct(Indice(fila)).idasig).comun.id) And _
                            kernel.utils.idigual(LugXact(j).para.idper, periodos(per).id) And _
                            LugXact(j).para.idact = MatrixAct(Indice(fila)).numero(level) _
                            Then

                            kk = kk + LugXact(j).cantLug

                            For k = 1 To LugXact(j).cantLug
                                ii = IndexById(dLUGAR, LugXact(j).idlug(k))

                                If ii <> 0 Then rr = rr + CantRestRecurso(lugar(ii), per)

                                For g = 1 To grupos.cant
                                    brgs = BrigadasDeGrupo(MatrixAct(Indice(fila)).act(level), esp, Nivel, grupos.id(g))
                                    If cabe(brgs, ii) And Not EstaProhibido(MatrixAct(Indice(fila)).act(level), g, ii) Then gg = gg + Rgrupos.id(g)
                                Next
                            Next
                        End If

                        If Detener = True Then If interface.Question_InterrumpirProceso Then Exit Sub

                    Next

                    TablaPrioriza(fila, 2) = kk

                        TablaPrioriza(fila, 5) = kernel.utils.Porciento(rr, kk * CD * ct)
                        TablaPrioriza(fila, 6) = kernel.utils.Porciento(gg, grupos.cant * kk)
                        TablaPrioriza(fila, 7) = CantRestRecurso(asig(MatrixAct(Indice(fila)).idasig).comun, per)

                    'necesidad y posibilidad de recursos
                    Dim ix As Long, posibilidad As Long, necesidad As Long
                    ix = IndexResxAct(per, MatrixAct(Indice(fila)).idasig, MatrixAct(Indice(fila)).act(level))

                    posibilidad = 0
                    necesidad = 0

                    If ix > 0 Then

                        With recursosXact(ix)

                            For i = 1 To .gruposRecursos.Count
                                posibilidad = posibilidad + IIf(.gruposRecursos(i).imprescindibles, .gruposRecursos(i).recursos.Count, 0)
                            Next

                            For i = 1 To .gruposRecursos.Count
                                necesidad = necesidad + IIf(.gruposRecursos(i).imprescindibles, .gruposRecursos(i).cantNecesarios, 0)
                            Next

                        End With

                    End If

                    TablaPrioriza(fila, 8) = posibilidad
                    TablaPrioriza(fila, 9) = necesidad
                End If

            Next fila

            'estableciendo id de prioris para PROFES Y LUGARES
            ReDim Preserve Priorizame.id(cantCriterios)

            For j = 1 To cantCriterios 'profes to lugares

                For i = 1 To cantPriorizando
                    Priorizame.id(i) = TablaPrioriza(i, j)
                    DoEvents

                    If Detener = True Then If interface.Question_InterrumpirProceso Then Exit Sub
                Next i

                Priorizame.cant = cantPriorizando
                Priorizame = prioris(Priorizame)

                If j = 9 Then Priorizame = inviertePrioris(Priorizame) 'necesidad de recursos

                For i = 1 To cantPriorizando

                    If j = 1 Or j = 2 Then k = 2 Else k = 1
                    TablaPrioriza(i, j) = Priorizame.id(i) * k

                    If Detener = True Then If interface.Question_InterrumpirProceso Then Exit Sub
                Next i

            Next j

            For i = 1 To cantPriorizando
                TablaPrioriza(i, 3) = cniveles - (MatrixAct(Indice(i)).cantact - 1)

                If Detener = True Then If interface.Question_InterrumpirProceso Then Exit Sub
            Next

            'CALCULANDO TOTALES HORIZONTALES

            For i = 1 To cantPriorizando
                TablaPrioriza(i, cantCriterios + 1) = 0

                For jj = 1 To cantCriterios
                    TablaPrioriza(i, cantCriterios + 1) = TablaPrioriza(i, cantCriterios + 1) + TablaPrioriza(i, jj)

                Next

                If Detener = True Then If interface.Question_InterrumpirProceso Then Exit Sub
            Next i

            For i = 1 To cantPriorizando - 1

                For j = i + 1 To cantPriorizando

                    If TablaPrioriza(i, cantCriterios + 1) > TablaPrioriza(j, cantCriterios + 1) Then

                        kk = TablaPrioriza(i, cantCriterios + 1)
                        TablaPrioriza(i, cantCriterios + 1) = TablaPrioriza(j, cantCriterios + 1)

                        TablaPrioriza(j, cantCriterios + 1) = kk
                        kk = Indice(i)
                        Indice(i) = Indice(j)
                        Indice(j) = kk
                    End If

                    If Detener = True Then If interface.Question_InterrumpirProceso Then Exit Sub
                Next j

            Next i

            idclasifSgte = 0
            'calculo clasificacion siguiente

            For i = clasificacion + 1 To cantClasif

                For j = 1 To cantAsigEnCurso
                    DoEvents

                    If MatrixAct(j).act(level) = i Then
                        idclasifSgte = i
                        GoTo 20
                    End If

                    If Detener = True Then If interface.Question_InterrumpirProceso Then Exit Sub
                Next j

            Next i

20:

            For fila = 1 To cantPriorizando
                DoEvents

                If Indice(fila) <> 0 Then

                    If level > 1 Then
                        If MatrixAct(Indice(fila)).numero(level - 1) <> 0 Then GoTo 2000
                    End If

                    If MatrixAct(Indice(fila)).numero(level) <> 0 Then
                        If level = cniveles Then op = 0 Else op = compactar 'parche
                        Dim respeta As Boolean
                        respeta = asig(MatrixAct(Indice(fila)).idasig).desglose(IndexById(dDESGLOSE, periodos(per).id, MatrixAct(Indice(fila)).idasig)).RespetarOrden
                        ColocaAct per, MatrixAct(Indice(fila)).idasig, MatrixAct(Indice(fila)).numero(level), idclasifSgte, CD - ((MatrixAct(Indice(fila)).cantact - MatrixAct(Indice(fila)).numero(level)) - op) * IIf(respeta, 1, 0), PARCHE, parche1, buscalugar
                        voyact = voyact + 1
                        ProgresoDelGenerador = kernel.utils.Porciento(voyact, cantactencurso)
                        MatrixAct(Indice(fila)).numero(level) = 0
                        MatrixAct(Indice(fila)).act(level) = 0
                    End If

                End If

2000:

                If Detener = True Then If interface.Question_InterrumpirProceso Then Exit Sub
            Next

        Next

    Next

    If voyact < cantactencurso Then GoTo 1000
    Close
End Sub

'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'Funcion que coloca una actividad determinada para los grupos que le corresponde
'en un periodo determinado
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

Public Sub ColocaAct(per As Long, asg As Long, act As Long, idclasifSgte As Long, maxDia As Long, PARCHE As Long, parche1 As Boolean, buscalugar As Boolean)

    Dim grupo_anterior As Long
    Dim cniveles As Long, posibXDias() As Long
    
    Dim grupos As TFiltro, listaidbrg As TFiltro
    Dim rangobusqueda As TRango, actasignadas As TArrInt
    Dim GrupoMPI As TMPI1, GruposMPI As TMPI1, PI As TMPI_Casilla
    Dim k As Long, i As Long, j As Long
    Dim sentido As Long, ini_sentido As Long, fin_sentido As Long
    Dim step_sentido As Long, ini As Long, dia_anterior As Long
    Dim dia_coloca As Long, t As TRecurso, ll As Long
    Dim CicloIni As Long, CicloFin As Long, CicloStep As Long
    Dim tt As String, dd As String, l As Long
    Dim xasig() As Boolean
    Dim brgAnteriores As TFiltro, puedo As Boolean
    Dim lg As String, lgi As Long, iiper As Long
    Dim rechazosProf As Long, rechazosLug As Long, rechazosRest As Long
    Dim MAXPI As Long, etapa As Long
    Dim idMaxPIGrupo() As Long
    Dim idMaxPIGrupoDia() As Long
    Dim poderDia(1 To MAX_TURNOS) As Boolean
    Dim c As Long, ii As Long, iii As Long
    Dim ztodo As Long
    Dim ilg As Long
    Dim minEdias As Long, maxEdias As Long
    Dim mismodia As Boolean, min As Long, gmin As Long, varint
    Dim idesp As Long
    
    Static iasg As Long, iclasif As Long, iper As Long, cturnos As Long
    Static respeta As Boolean, p As Long, igc As Long, g As Long, zona As Long
    Static faltan As Long
    
    ReDim posibXDias(CD)
    ReDim xasig(ct)
    ReDim idMaxPIGrupo(getCantBrg, CD)
    ReDim idMaxPIGrupoDia(getCantBrg)
    
    
    iper = per
    iasg = asg
    p = IndexById(dDESGLOSE, periodos(per).id, iasg)
    idesp = hashEsp(asig(asg).idesp).idx
    iclasif = hashCls(asig(iasg).desglose(p).act(act).idclasif).idx 'IndexById(dCLASIF, asig(iasg).desglose(p).act(act).idclasif, 0)
    cturnos = clasif(iclasif).ct
    respeta = asig(iasg).desglose(p).RespetarOrden
    minEdias = asig(iasg).desglose(p).min
    maxEdias = asig(iasg).desglose(p).max
    mismodia = asig(iasg).desglose(p).mismodia
    
    If Detener = True Then If interface.Question_InterrumpirProceso Then Exit Sub
    
    'Dim ztodo As Long
    ztodo = CantZpriori(iclasif, iper)
    'BUSCAR LA CANTIDAD DE GRUPOS RESPECTO A LA CLASIFICACION DE ACTIVIDADES
    
    grupos = CantGruposxClasif(idesp, asig(iasg).Nivel, iclasif)
    'grupos = CantGruposxClasif(IndexById(dESPECIALIDAD, asig(iasg).idesp, 0), asig(iasg).Nivel, iclasif)

    faltan = grupos.cant
    sentido = 2
    dia_anterior = 0
    'CALCULO LAS POSIBILIDADES PARA TODOS LOS GRUPOS
    '1. obtengo las brigadas que pertenecen a este grupo, especialidad, Nivel
    '2. calculo los posibles inicios para este grupo (AND)
    '3. actualizo las posibilidades de todos los grupos en conjunto (OR)
    ReDim GruposEnCurso(grupos.cant)

    For j = 1 To grupos.cant
        listaidbrg = BrigadasDeGrupo(iclasif, idesp, asig(iasg).Nivel, Val(grupos.id(j)))

        GrupoMPI = AND_MPI(listaidbrg, per, asg, act, 0)
        GrupoMPI.ct = cturnos
        parche_AND_MPI_EXCEPTO = True
        GruposEnCurso(j) = AND_MPI(listaidbrg, per, asg, act, zona)
        parche_AND_MPI_EXCEPTO = False
        Rem GruposMPI = OR_MPI(GrupoMPI, GruposMPI)

        For i = 1 To CD
            c = MaxColocaciones(GrupoMPI, i)
            idMaxPIGrupo(j, i) = c

            If posibXDias(i) > c Or j = 1 Then posibXDias(i) = c
        Next

        If Detener = True Then If interface.Question_InterrumpirProceso Then Exit Sub
    Next

    'calculo de los posibles turnos optimos en zonapriori

    If parche1 Then
        'busco los turnos optimos de los grupos por dias

        For i = 1 To CD
            'calculo las posibilidades para todos los grupos
            zona = 1
            'busco min posible
            Dim ya() As Boolean
            ReDim ya(1 To grupos.cant)

            For j = 1 To grupos.cant
                ya(j) = False
            Next

            For varint = 1 To grupos.cant
                min = ct + 1
                gmin = 0
                'busco el minimo

                For g = 1 To grupos.cant
                    c = 0

                    If Not ya(g) Then

                        For k = 1 To ct
                            'If GruposEnCurso(g).MPI(I, k).valor Then c = c + 1

                            If GruposEnCurso(g).MPI(i, k).valor And getEstadoZPriori(iclasif, i, k, iper) = zona Then c = c + 1

                        Next

                        If min > c Then
                            min = c
                            gmin = g
                        End If

                    End If

                Next

                'busco la primera posibilidad

                For k = 1 To ct

                    If GruposEnCurso(gmin).MPI(i, k).valor And _
                        getEstadoZPriori(iclasif, i, k, iper) = zona _
                        Then

                        idMaxPIGrupo(gmin, i) = k
                        ya(gmin) = True

                        For g = 1 To grupos.cant

                            For l = 1 To cturnos
                                GruposEnCurso(g).MPI(i, k + l - 1).valor = False
                            Next

                        Next

                        Exit For
                    End If

                Next

            Next

        Next

        For j = 1 To CD
            posibXDias(j) = 0

            For i = 1 To grupos.cant

                If idMaxPIGrupo(i, j) <> 0 Then posibXDias(j) = posibXDias(j) + 1
            Next

        Next

    End If

    'If parche1 Then
    'For j = 1 To CD
    'For I = 1 To grupos.cant
    'idMaxPIGrupoDia(I) = I
    'Next
    'For I = 1 To grupos.cant - 1
    'For k = I + 1 To grupos.cant
    'If idMaxPIGrupo(I, j) > idMaxPIGrupo(k, j) Then
    'l = idMaxPIGrupo(I, j)
    'idMaxPIGrupo(I, j) = idMaxPIGrupo(k, j)
    'idMaxPIGrupo(k, j) = l
    'l = idMaxPIGrupoDia(I)
    'idMaxPIGrupoDia(I) = idMaxPIGrupoDia(k)
    'idMaxPIGrupoDia(k) = l
    'End If
    'Next
    'Next
    'For l = 1 To CT: poderDia(l) = True: Next
    'sentido = 2
    'For I = 1 To grupos.cant
    'If sentido = 1 Then sentido = 2 Else sentido = 1
    'If sentido = 1 Then
    'CicloIni = 1: CicloFin = CT: step_sentido = 1
    'Else
    'CicloFin = 1: CicloIni = CT: step_sentido = -1
    'End If
    'listaidbrg = BrigadasDeGrupo(iclasif,  IndexById(dESPECIALIDAD, asig(iasg).idesp, 0), asig(iasg).Nivel, Val(grupos.id(idMaxPIGrupoDia(I))))
    'GrupoMPI = AND_MPI(listaidbrg, per, asg, act, 1)
    'idMaxPIGrupo(idMaxPIGrupoDia(I), j) = 0
    'For l = CicloIni To CicloFin Step step_sentido
    'If GrupoMPI.MPI(j, l).valor And poderDia(l) Then
    'idMaxPIGrupo(idMaxPIGrupoDia(I), j) = l
    'poderDia(l) = False
    'Exit For
    'End If
    'Next
    'Next
    'Next
    'For j = 1 To CD
    'posibXDias(j) = 0
    'For I = 1 To grupos.cant
    'If idMaxPIGrupo(I, j) <> 0 Then posibXDias(j) = posibXDias(j) + 1
    'Next
    'Next
    'End If
    'CALCULO DE LAS POSIBILIDADES POR DIA para todos los grupos
    'GruposMPI.CT = cturnos
    'For j = 1 To CD
    'posibXDias(j) = MaxColocaciones(GruposMPI, j)
    'Next
    
    'Comprobar que exite rango

    If rangobusqueda.fin - rangobusqueda.ini >= 0 Then
        'For ll = 1 To cantPer: t.rest(ll) = clasif(iclasif).zpriori(ll): Next
        't es un recurso y contiene la informacion de la zona priorizada por periodo

        For j = 1 To ct
            xasig(j) = False
        Next

        'RECORRIDO POR GRUPOS
        '************************
        'OPTIMIZACION PROFE
        setZPrioriEnCurso iclasif, per
        goGruposProfesEnCurso iasg, per, act
        setPrioriDiasProfesEnCurso
        Rem calculo el rango segun todos los grupos

        For i = 1 To grupos.cant

            If respeta Then
                listaidbrg = BrigadasDeGrupo(iclasif, idesp, asig(iasg).Nivel, Val(grupos.id(i)))

                actasignadas.cant = CD

                For j = 1 To CD
                    actasignadas.arr(j) = 0
                Next

                For j = 1 To cantFiltroAsignaciones

                    With Asignaciones(FiltroAsignaciones(j))

                        If kernel.utils.idigual(.idasig, asig(asg).comun.id) Then

                            If kernel.utils.idigual(.idperiodo, periodos(per).id) Then

                                If kernel.utils.idigual(.idbrigada, Brigada(listaidbrg.id(1)).comun.id) Then actasignadas.arr(.dia) = .idact

                            End If

                        End If

                    End With

                Next

                If Detener = True Then If interface.Question_InterrumpirProceso Then Exit Sub
                'calcular
                rangobusqueda = RangoV2(act, actasignadas, minEdias, maxEdias) ' rango(act, actasignadas)
                'Public Function RangoV2( n As Long, arr As TArrInt, min As Long, max As Long) As TRango
                DoEvents
            Else
                rangobusqueda.ini = 1
                rangobusqueda.fin = CD
            End If

            setRangosProfesEnCurso iasg, per, act, grupos.id(i), rangobusqueda
        Next

        setMiDiaSegunProfe grupos, iasg, act, per, rangobusqueda
        Rem ************************

        For i = 1 To grupos.cant
            'buscar brigadas de este grupo
            listaidbrg = BrigadasDeGrupo(iclasif, idesp, asig(iasg).Nivel, Val(grupos.id(i)))

            Generando.cantBrg = listaidbrg.cant
            ReDim Generando.id(Generando.cantBrg)

            For j = 1 To listaidbrg.cant
                Generando.id(j) = listaidbrg.id(j)
            Next

            'CALCULAR RANGO
            'calcular para la asignatura las actividades que ya han sido asignadas

            If respeta = False Then
                rangobusqueda.ini = 1
                rangobusqueda.fin = CD
            Else
                actasignadas.cant = CD

                For j = 1 To CD
                    actasignadas.arr(j) = 0
                Next

                For j = 1 To cantFiltroAsignaciones

                    With Asignaciones(FiltroAsignaciones(j))

                        If kernel.utils.idigual(.idasig, asig(asg).comun.id) And kernel.utils.idigual(.idperiodo, periodos(per).id) And kernel.utils.idigual(.idbrigada, Brigada(listaidbrg.id(1)).comun.id) Then actasignadas.arr(.dia) = .idact

                    End With

                Next

                If Detener = True Then If interface.Question_InterrumpirProceso Then Exit Sub
                'calcular
                rangobusqueda = RangoV2(act, actasignadas, minEdias, maxEdias) 'rango(act, actasignadas)
                DoEvents
            End If

            DoEvents

            If i = 1 And idclasifSgte <> 0 And idclasifSgte <> iclasif Then

                If PARCHE = 1 And Not (dia_anterior > CD / 2 - 1) Then GoTo 1000
                dia_anterior = DiaMinImpacto(iclasif, idclasifSgte, idesp, asig(asg).Nivel, per, rangobusqueda.ini, rangobusqueda.fin)

            End If

1000:
            'Verificar que no este asignada la actividad
            ini = BuscaDiaAsignacion(Brigada(listaidbrg.id(1)).comun.id, periodos(per).id, asig(asg).comun.id, act)

            If ini <> 0 Then GoTo SePudoColocar
            'actualiza sentido para mayor combinacion

            If sentido = 2 Then
                sentido = 1
                ini_sentido = 1
                fin_sentido = ct
                step_sentido = 1
            Else
                sentido = 2
                ini_sentido = ct
                fin_sentido = 1
                step_sentido = -1
            End If

            'BUSQUEDA POR ZONAS
            'Polietapas
            'zona:
            '1-Zona priori
            '2-Zona todo
            'ciclo por cada etapa
            '1- Mismo Dia
            '2- Posib>=faltan
            '3- Cualquier dia

            For zona = 1 To ztodo
                'buscar posibilidades para este grupo
                GrupoMPI = AND_MPI(listaidbrg, per, asg, act, zona)
                'calculo de rechazos

                If zona = ztodo Then
                    rechazosProf = 0
                    rechazosRest = 0
                    rechazosLug = 0
                    MAXPI = 0

                    For k = 1 To CD

                        For j = 1 To ct
                            iiper = IndexRestRecurso(periodos(iper).id, clasif(iclasif).comun)

                            If clasif(iclasif).comun.rest(iper).rest(k, j) = False And periodos(iper).getTimeRequest(k, j) = False Then MAXPI = MAXPI + 1

                            PI = PosibleInicio(per, k, j, asg, act, listaidbrg.id(1), zona)

                            If PI.motivo = 1 Then rechazosRest = rechazosRest + 1

                            If PI.motivo = 2 Then rechazosProf = rechazosProf + 1

                            If PI.motivo = 3 Then rechazosLug = rechazosLug + 1

                            If PI.motivo = 4 Then
                                rechazosProf = rechazosProf + 1
                                rechazosLug = rechazosLug + 1
                            End If

                        Next

                    Next

                End If

                For etapa = 1 To 3
                    'preparo el rango de busqueda por dia

                    If etapa = 1 And dia_anterior > rangobusqueda.ini Then
                        CicloIni = dia_anterior
                        CicloFin = dia_anterior
                    Else
                        CicloIni = rangobusqueda.ini
                        CicloFin = rangobusqueda.fin

                        If CicloFin > maxDia Then CicloFin = maxDia
                    End If

                    For k = CicloIni To CicloFin
                        puedo = True

                        If Not respeta And Not mismodia Then puedo = Not BuscaActDia(asig(asg).comun.id, Brigada(listaidbrg.id(1)).comun.id, periodos(per).id, k)

                        If k <> 0 And puedo Then

                            If posibXDias(k) < faltan And etapa <> 3 Then GoTo 200

                            For j = ini_sentido To fin_sentido Step step_sentido

                                If Detener = True Then If interface.Question_InterrumpirProceso Then Exit Sub

                                If parche1 Then

                                    If etapa = 1 And idMaxPIGrupo(i, k) <> 0 Then

                                        If GrupoMPI.MPI(k, idMaxPIGrupo(i, k)).valor = True Then j = idMaxPIGrupo(i, k)

                                    End If

                                End If

                                If MiDiaSegunProfe(i) <> 0 Then
                                    k = MiDiaSegunProfe(i)
                                    MiDiaSegunProfe(i) = 0
                                End If

                                If GrupoMPI.MPI(k, j).valor Then

                                    If etapa = 1 And xasig(j) = True Then GoTo 30

                                    If etapa = 2 And dia_anterior = 0 Then xasig(j) = True

                                    'If zona = 1 And EstadoRestriccion(t, k, j, per) = False Then goTo 100
                                    'If zona <> getEstadoZPriori(iclasif, k, j, per) Then goTo 100
                                    Dim freerecursos As TGOH_arrGroupRest
                                    PI = PosibleInicio(per, k, j, asg, act, listaidbrg.id(1), zona, freerecursos)

                                    'Arreglar
                                    'ciclo por lugar.priori()
                                    '1 filtralug
                                    'quitar segun accesos prohibidos
                                    '2 tratar de colocar en aulas fijas
                                    '3 lugar mas cerca
                                    'hacer  Public Function MaxPrioriLug

                                        Rem SELECCIONANDO LUGAR
                                        Rem PI.lug = QuitaSegunProhibidos(PI.lug,clasif(iclasif).comun.id,i)

                                        PI.lug = QuitaSegunCapacidad(listaidbrg, PI.lug)
                                        'tratar de colocar en aula fija

                                        For ii = 1 To cantfijas

                                            With AulasFijas(ii)

                                                If .idgrupo = i And kernel.utils.idigual(.idclasif, clasif(iclasif).comun.id) Then

                                                    For iii = 1 To PI.lug.cant

                                                        If kernel.utils.idigual(lugar(PI.lug.id(iii)).id, .idlug) Then
                                                            lg = .idlug
                                                            ilg = iii
                                                            GoTo 2000
                                                        End If

                                                    Next

                                                End If

                                            End With

                                        Next

                                        Dim lugg As TFiltro
                                        Dim myLugHear As Long

                                        For ii = 1 To getMaxPrioriLxAct_byPI(PI.lug.cant)
                                            lugg.cant = 0

                                            For iii = 1 To PI.lug.cant

                                                If PRIORI_LXACT_segunPI(iii) = ii Then
                                                    lugg.cant = lugg.cant + 1
                                                    ReDim Preserve lugg.id(lugg.cant)
                                                    lugg.id(lugg.cant) = PI.lug.id(iii)
                                                End If

                                            Next

                                            If Not buscalugar Then
999:
                                                lgi = BuscaLugarProximoIgual(per, k, listaidbrg.id(1), lugg)

                                                If lgi = 0 And i <> grupo_anterior Then
                                                    myLugHear = BuscaLugarMenosUtilizado(lugg, per, k)

                                                    If myLugHear <> 0 Then
                                                        lgi = lugg.id(myLugHear)
                                                    Else
                                                        lgi = _
                                                        BuscaLugarProximoIgual(per, k, listaidbrg.id(1), lugg)

                                                        If lgi = 0 And _
                                                        brgAnteriores.cant <> 0 Then lgi = BuscaLugarProximoDif(per, k, brgAnteriores.id(1), lugg)

                                                    End If

                                                End If

                                                If lgi = 0 And lugg.cant <> 0 Then
                                                    lg = lugar(lugg.id(1)).id

                                                    If i > 1 And brgAnteriores.cant <> 0 Then lg = lugar(BuscaLugarProximoDif(per, k, brgAnteriores.id(1), lugg)).id

                                                    ilg = hashLug(lg) 'IndexById(dLUGAR, lg, 0)
                                                End If

                                                If lgi <> 0 And lugg.cant <> 0 Then
                                                    lg = lugar(lgi).id
                                                    ilg = lgi
                                                End If

                                            Else
                                                Dim kkk As Long
                                                kkk = SelectLugarOptimo(listaidbrg, lugg, k, per, j, sentido)

                                                If kkk = 0 Then GoTo 999 Else lg = lugar(kkk).id

                                            End If

                                        Next

2000:

                                        AsignaActividad per, listaidbrg, asig(asg).comun.id, act, k, j, profe(PI.prof.id(1)).id, lg, cturnos, freerecursos

                                        'PI.lug = EliminaDeFiltro(PI.lug, ilg) 'parece que esto era de cuando habia semigrupo

                                    Rem **************** OPTIMIZACION PROFE
                                    addProfeEnCurso PI.prof.id(1), k, j
                                    Rem ****************************
                                    brgAnteriores = listaidbrg

                                    If dia_anterior <> 0 Then

                                        For l = 1 To ct
                                            xasig(l) = False
                                        Next

                                    End If

                                    dia_anterior = k
                                    GoTo SePudoColocar
                                End If
30:

100:
                            Next j

200:
                        End If

                    Next k

                Next etapa

            Next zona

imposible:
            'NO SE PUDO COLOCAR
            'Paso a imposibles
            tt = Time
            dd = Date

            For k = 1 To listaidbrg.cant
                cantImposibles = cantImposibles + 1
                ReDim Preserve Imposibles(cantImposibles)

                With Imposibles(cantImposibles)
                    .fecha = dd
                    .hora = tt
                    .MAXPI = MAXPI
                    .RechazosXLug = rechazosLug
                    .RechazosXProf = rechazosProf
                    .RechazosXRest = rechazosRest
                    .idact = act
                    .idperiodo = periodos(per).id
                    .idasig = asig(asg).comun.id
                    .idbrigada = Brigada(listaidbrg.id(k)).comun.id
                    IMPOSIBLES_NOW = IMPOSIBLES_NOW + 1
                End With

            Next k

            Beep
SePudoColocar:
            faltan = faltan - 1
            grupo_anterior = i
        Next i

    End If

End Sub

'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'Devuelve la cantidad de niveles que determinan un conjunto de asignaturas en un período
'y pertenecientes a una misma especialidad y Nivel
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

Public Function cantLevel(esp As Long, Nivel As Long, per As Long) As Long
    Dim max As Long, pos As Long, m As Long, p As Long
    Dim i As Long
    max = 0

    For i = 1 To cantAsig
        p = IndexById(dDESGLOSE, periodos(per).id, i)

        If p <> 0 Then

            If kernel.utils.idigual(asig(i).idesp, Especialidad(esp).id) And asig(i).Nivel = Nivel Then
                m = asig(i).desglose(p).cantact

                If max < m Then max = m
            End If

        End If

    Next

    cantLevel = max
End Function

Public Function DiaMinImpacto(idclasif1 As Long, idclasif2 As Long, esp As Long, Nivel As Long, per As Long, diaini As Long, diafin As Long)

    Dim GruposMPI As TMPI1
    Dim brgMPI() As Boolean
    Dim brgMPI1() As Boolean
    ReDim brgMPI(getCantBrg, CD, ct)
    ReDim brgMPI1(getCantBrg, CD, ct)
    Dim grupo1 As TFiltro
    Dim grupo2 As TFiltro
    Dim listabrg As TFiltro
    Dim idper As Long
    Dim brgGrupo As TFiltro, k As Long
    Dim MPIbrg(1 To MAX_DIAS, 1 To MAX_TURNOS) As Boolean
    Dim kk As Long, l As Long, ll As Long, dia As Long, i As Long, j As Long
    Dim max As Long, cant As Long
    grupo1 = CantGruposxClasif(esp, Nivel, idclasif1)
    grupo2 = CantGruposxClasif(esp, Nivel, idclasif2)
    listabrg.cant = 0

    For i = 1 To cantBrg

        If Brigada(i).Nivel = Nivel And kernel.utils.idigual(Brigada(i).idesp, Especialidad(esp).id) _
            Then

            listabrg.cant = listabrg.cant + 1
            ReDim Preserve listabrg.id(listabrg.cant)
            listabrg.id(listabrg.cant) = i

            For j = diaini To diafin

                For k = 1 To ct
                    idper = IndexRestRecurso(periodos(per).id, Brigada(i).comun)
                    brgMPI(i, j, k) = Brigada(i).comun.rest(idper).rest(j, k)
                    idper = IndexRestZpriori(periodos(per).id, idclasif2)

                    If Not clasif(idclasif2).zpriori(idper).rest(j, k) = _
                    CantZpriori(idclasif2, per) Then brgMPI(i, j, k) = _
                    True

                    If periodos(per).getTimeRequest(j, k) Then brgMPI(i, j, k) = True
                Next

            Next

        End If

    Next

    max = 0
    dia = 0

    For i = 1 To CD

        For j = 1 To ct
            idper = IndexRestZpriori(periodos(per).id, idclasif1)

            If Not clasif(idclasif2).zpriori(idper).rest(i, j) = CantZpriori(idclasif2, _
                per) _
                Then

                'marco todas las brigdas del primer grupo
                brgGrupo = BrigadasDeGrupo(idclasif1, esp, Nivel, grupo1.id(1))

                For kk = 1 To listabrg.cant

                    For l = 1 To CD

                        For ll = 1 To ct
                            brgMPI1(kk, l, ll) = brgMPI(kk, l, ll)
                        Next

                    Next

                Next

                For k = 1 To brgGrupo.cant
                    brgMPI1(brgGrupo.id(k), i, j) = True
                Next

                'busco cant por suamtoria logica
                cant = 0

                For l = 1 To CD

                    For ll = 1 To ct
                        MPIbrg(l, ll) = True
                    Next

                Next

                For kk = 1 To listabrg.cant

                    For l = 1 To CD

                        For ll = 1 To ct

                            If brgMPI1(kk, l, ll) = True Then MPIbrg(l, ll) = False 'SUMATORIA LOGICA
                        Next

                    Next

                Next

                For l = 1 To CD

                    For ll = 1 To ct

                        If MPIbrg(l, ll) = False Then cant = cant + 1
                    Next

                Next

                'actualizo max

                If max < cant Then
                    max = cant
                    dia = i
                End If

            End If

        Next

    Next

    DiaMinImpacto = dia
End Function

Public Function MaxPrioriLugar(per As Long, asg As Long, act As Long) As Long
    Dim max As Long, p As Long, i As Long, k As Long
    max = 0
    p = IndexById(dDESGLOSE, periodos(per).id, asg)
    i = IndexLugxAct(per, asg, act)

    For k = 1 To LugXact(i).cantLug

        If max < LugXact(i).priori(i) Then max = LugXact(i).priori(i)
    Next

    MaxPrioriLugar = max
End Function

Public Function BuscaActDia(asg As String, brg As String, per As String, dia As Long) As Boolean

    Dim i As Long

    For i = 1 To cantFiltroAsignaciones

        With Asignaciones(FiltroAsignaciones(i))

            If kernel.utils.idigual(.idasig, asg) And kernel.utils.idigual(.idbrigada, brg) And _
                kernel.utils.idigual(.idperiodo, per) And .dia = dia _
                Then

                BuscaActDia = True
                Exit Function
            End If

        End With

    Next

    BuscaActDia = False
End Function

Public Sub FiltraAsignaciones(esp As String, Nivel As Long, per As String)
    Dim i As Long, ii As Long
    cantFiltroAsignaciones = 0

    For i = 1 To cantAsignaciones

        With Asignaciones(i)

            If kernel.utils.idigual(.idperiodo, per) Then
                ii = IndexById(dASIG, .idasig, 0)

                If kernel.utils.idigual(asig(ii).idesp, esp) And asig(ii).Nivel = Nivel Then
                    cantFiltroAsignaciones = cantFiltroAsignaciones + 1
                    ReDim Preserve FiltroAsignaciones(cantFiltroAsignaciones)
                    FiltroAsignaciones(cantFiltroAsignaciones) = i
                End If

            End If

        End With

    Next

End Sub

Public Function AsigAsignada(id As Long, per As Long) As Boolean
    Dim i As Long

    For i = 1 To cantAsignaciones

        If kernel.utils.idigual(Asignaciones(i).idasig, asig(id).comun.id) And _
            kernel.utils.idigual(Asignaciones(i).idperiodo, periodos(per).id) _
            Then

            AsigAsignada = True
            Exit Function
        End If

    Next

    AsigAsignada = False
End Function

Public Function EstaProhibido(idclasif As Long, grupo As Long, lug As Long) As Boolean
    Dim i As Long, j As Long

    For i = 1 To cantAccesos

        With AccesosProhibidos(i)

            If kernel.utils.idigual(.idclasif, clasif(idclasif).comun.id) And .idgrupo = grupo Then

                For j = 1 To .cantLugs

                    If kernel.utils.idigual(.idlugs(j), lugar(lug).id) Then
                        EstaProhibido = True
                        Exit Function
                    End If

                Next

            End If

        End With

    Next

    EstaProhibido = False
End Function

Public Function BrgClasifAsignada(brg As Long, cla As Long) As Boolean
    Dim a As Long, i As Long

    For i = 1 To cantAsignaciones

        With Asignaciones(i)

            If kernel.utils.idigual(.idbrigada, Brigada(brg).comun.id) Then
                a = getClasifOfActivity(.idasig, .idperiodo, .idact)

                If clasif(a).comun.id = clasif(cla).comun.id Then
                    BrgClasifAsignada = True
                    Exit Function
                End If

            End If

        End With

    Next

End Function

Public Function EnZPriori(iclasif As Long, zona As Long, per As Long, dia As Long, turno As Long) As Boolean

    Dim i As Long

    If zona = CantZpriori(iclasif, per) Then
        EnZPriori = False
        Exit Function
    End If

    For i = 1 To periodos.Count

        If kernel.utils.idigual(clasif(iclasif).zpriori(i).idperiodo, periodos(per).id) Then

            If clasif(iclasif).zpriori(i).rest(dia, turno) = zona Then
                EnZPriori = True
                Exit Function
            End If

        End If

    Next

    EnZPriori = False
End Function

Public Sub CalcGeneraciones()
    Dim i As Long, j As Long, k As Long
    cantGeneraciones = 0

    For i = 1 To cantAsignaciones

        With Asignaciones(i)

            interface.console.Progress "Trabajando...", kernel.utils.Porciento(i, cantAsignaciones)

            k = IndexById(dASIG, .idasig, 0)

            If k <> 0 Then

                For j = 1 To cantGeneraciones

                    If kernel.utils.idigual(asig(k).idesp, Generaciones(j).idesp) And asig(k).Nivel = _
                    Generaciones(j).Nivel And kernel.utils.idigual(.idperiodo, Generaciones(j).idper) _
                    Then GoTo jumper

                Next

                cantGeneraciones = cantGeneraciones + 1
                ReDim Preserve Generaciones(cantGeneraciones)
                Generaciones(cantGeneraciones).Nivel = asig(k).Nivel
                Generaciones(cantGeneraciones).idesp = asig(k).idesp
                Generaciones(cantGeneraciones).idper = .idperiodo
                Generaciones(cantGeneraciones).fecha = .fecha

jumper:
            End If

        End With

    Next

    
End Sub

Public Sub degenerar(esp As Long, Nivel As Long, per As Long)

    clearAsignacionesOfPeriod , , esp, Nivel, per
End Sub

Public Function CantZpriori(idclasif As Long, idper As Long) As Long
    Dim c As Long, i As Long, j As Long, id2 As Long
    c = 0

    With clasif(idclasif)
        id2 = IndexRestZpriori(periodos(idper).id, idclasif)

        For i = 1 To CD

            For j = 1 To ct

                If .zpriori(id2).rest(i, j) > c Then c = .zpriori(id2).rest(i, j)
            Next

        Next

    End With

    CantZpriori = c
End Function

'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'Devuelve TRUE si una actividad ya ha sido asignada
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

Public Function EstaAsignada(brg As String, per As String, asg As String, act As Long) As Boolean

    Dim i As Long

    For i = 1 To cantAsignaciones

        With Asignaciones(i)

            If .idact = act And .idasig = asg And .idbrigada = brg And .idperiodo = per _
                Then

                EstaAsignada = True
                Exit Function
            End If

        End With

    Next

    EstaAsignada = False
End Function

'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'Devuelve el día de una asignacion
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

Public Function BuscaDiaAsignacion(brg As String, per As String, asg As String, act As Long) As Long

    Dim i As Long

    For i = 1 To cantFiltroAsignaciones

        With Asignaciones(FiltroAsignaciones(i))

            If .idact = act And .idasig = asg And .idbrigada = brg And .idperiodo = per _
                Then

                BuscaDiaAsignacion = .dia
                Exit Function
            End If

        End With

    Next

    BuscaDiaAsignacion = 0
End Function

'Permuta dos actividades si es posible
Public Function permuta(ByVal id1 As Long, ByVal id2 As Long) As Boolean
    Dim act1() As TActAsignada
    Dim act2() As TActAsignada
    
    ReDim act1(getCantBrg)
    ReDim act2(getCantBrg)
    
    Dim GrupoMPI As TMPI1, iasig As Long
    Dim cant1 As Long, cant2 As Long, per As Long, iper As Long
    Dim i As Long, grupo As Long, iclasif As Long
    Dim clasifa As String, grupo1 As Long, grupo2 As Long, idbrg As Long
    Dim brg1 As TFiltro, brg2 As TFiltro
    Dim esp As Long, Nivel As Long, iclasif1 As Long, iclasif2 As Long
    Dim listaidbrg As TFiltro, listaidbrg1 As TFiltro, listaidbrg2 As TFiltro
    
    Dim actasignadas As TArrInt
    Dim rangobusqueda As TRango
    
    If Asignaciones(id1).fija Or Asignaciones(id2).fija Then
        permuta = False
        Exit Function
    End If

    With Asignaciones(id1)
        iclasif1 = getClasifOfActivity(.idasig, .idperiodo, .idact)
        idbrg = IndexById(dBRIGADA, .idbrigada, 0)
        grupo1 = Brigada(idbrg).GrupoXClasif(IndexGrupoxClasif(idbrg, clasif(iclasif1).comun.id)).grupo
    End With

    With Asignaciones(id2)
        iclasif2 = getClasifOfActivity(.idasig, .idperiodo, .idact)
        idbrg = IndexById(dBRIGADA, .idbrigada, 0)
        grupo2 = Brigada(idbrg).GrupoXClasif(IndexGrupoxClasif(idbrg, clasif(iclasif2).comun.id)).grupo
    End With

    cant1 = 1
    cant2 = 1
    act1(1) = Asignaciones(id1)
    act2(1) = Asignaciones(id2)
    per = IndexById(dPERIODO, act1(1).idperiodo, 0)
    
    'comprobar que la actividad1 estará en rango
    
    iasig = IndexById(dASIG, act1(1).idasig, 0)
    listaidbrg1 = BrigadasDeGrupo(iclasif1, IndexById(dESPECIALIDAD, asig(iasig).idesp, 0), asig(iasig).Nivel, grupo1)

    iper = IndexById(dDESGLOSE, periodos(per).id, iasig)
    Dim j As Long

    If asig(iasig).desglose(iper).RespetarOrden Then
        actasignadas.cant = CD

        For j = 1 To CD
            actasignadas.arr(j) = 0
        Next

        For j = 1 To cantAsignaciones

            With Asignaciones(j)

                If kernel.utils.idigual(.idasig, asig(iasig).comun.id) And kernel.utils.idigual(.idperiodo, _
                    periodos(per).id) And kernel.utils.idigual(.idbrigada, _
                    Brigada(listaidbrg1.id(1)).comun.id) And .idact <> act1(1).idact _
                    Then

                    actasignadas.arr(.dia) = .idact
                End If

            End With

        Next

        'calcular
        rangobusqueda = rango(act1(1).idact, actasignadas)

        If act2(1).dia < rangobusqueda.ini Or act2(1).dia > rangobusqueda.fin Then
            permuta = False
            Exit Function
        End If

    End If

    'comprobar que la actividad2 estará en rango
    
    iasig = IndexById(dASIG, act2(1).idasig, 0)
    listaidbrg2 = BrigadasDeGrupo(iclasif2, IndexById(dESPECIALIDAD, asig(iasig).idesp, 0), asig(iasig).Nivel, grupo2)

    iper = IndexById(dDESGLOSE, periodos(per).id, iasig)

    If asig(iasig).desglose(iper).RespetarOrden Then
        actasignadas.cant = CD

        For j = 1 To CD
            actasignadas.arr(j) = 0
        Next

        For j = 1 To cantAsignaciones

            With Asignaciones(j)

                If kernel.utils.idigual(.idasig, asig(iasig).comun.id) _
                   And kernel.utils.idigual(.idperiodo, periodos(per).id) _
                   And kernel.utils.idigual(.idbrigada, Brigada(listaidbrg2.id(1)).comun.id) _
                   And .idact <> act2(1).idact _
                Then actasignadas.arr(.dia) = .idact

            End With

        Next

        'calcular
        rangobusqueda = rango(act2(1).idact, actasignadas)

        If act1(1).dia < rangobusqueda.ini Or act1(1).dia > rangobusqueda.fin Then
            permuta = False
            Exit Function
        End If

    End If

    For i = 1 To cantAsignaciones

        With Asignaciones(i)

            If i <> id1 Then

                If .idact = Asignaciones(id1).idact _
                    And kernel.utils.idigual(.idperiodo, Asignaciones(id1).idperiodo) _
                    And kernel.utils.idigual(.idasig, Asignaciones(id1).idasig) _
                Then

                    clasifa = clasif(getClasifOfActivity(.idasig, .idperiodo, .idact)).comun.id
                    idbrg = IndexById(dBRIGADA, .idbrigada, 0)
                    grupo = IndexGrupoxClasif(idbrg, clasifa)

                    If grupo = grupo1 Then '
                        cant1 = cant1 + 1
                        act1(cant1) = Asignaciones(i)
                    End If
                End If
            End If

            If i <> id2 Then

                If .idact = Asignaciones(id2).idact _
                    And kernel.utils.idigual(.idperiodo, Asignaciones(id2).idperiodo) _
                    And kernel.utils.idigual(.idasig, Asignaciones(id2).idasig) _
                Then

                    clasifa = clasif(getClasifOfActivity(.idasig, .idperiodo, .idact)).comun.id
                    idbrg = IndexById(dBRIGADA, .idbrigada, 0)
                    grupo = IndexGrupoxClasif(idbrg, clasifa)

                    If grupo = grupo2 Then
                        cant2 = cant2 + 1
                        act2(cant2) = Asignaciones(i)
                    End If

                End If

            End If

        End With

    Next

    Dim lista1 As Variant
    Dim lista2 As Variant
    Dim dia1 As Long, dia2 As Long
    Dim turno1 As Long, turno2 As Long
    
    lista1 = MarcaAsignacionesIgualGrupo(id1, cant1)
    lista2 = MarcaAsignacionesIgualGrupo(id2, cant2)
    
    dia1 = Asignaciones(id1).dia
    dia2 = Asignaciones(id2).dia
    
    turno1 = Asignaciones(id1).turno
    turno2 = Asignaciones(id2).turno
    
    iasig = IndexById(dASIG, act1(1).idasig, 0)
    GrupoMPI = AND_MPI(listaidbrg, per, iasig, act1(1).idact, 2)

    If GrupoMPI.MPI(act2(1).dia, act2(1).turno).valor Then
        
        iasig = IndexById(dASIG, act2(1).idasig, 0)
        GrupoMPI = AND_MPI(listaidbrg, per, iasig, act2(1).idact, 2)
        
        Dim turno As Long, dia As Long, iprofe As Long

        If GrupoMPI.MPI(act1(1).dia, act1(1).turno).valor Then
            turno = act1(1).turno
            dia = act1(1).dia
            iprofe = IndexById(dPROFE, act2(1).idprofe, 0)

            If Not profe(iprofe).rest(IndexRestRecurso(periodos(per).id, profe(iprofe))).rest(dia, turno) _
                   And Not estaRestringidoPorHerencia(periodos(per).id, dia, turno, dPROFE, profe(iprofe).id) _
                   And Not estaRestringidoPorHerencia(periodos(per).id, dia, turno, dPROFE, profe(iprofe).id, , , False) Then

                iprofe = IndexById(dPROFE, act1(1).idprofe, 0)

                If Not profe(iprofe).rest(IndexRestRecurso(periodos(per).id, profe(iprofe))).rest(act2(1).dia, act2(1).turno) _
                   And Not estaRestringidoPorHerencia(periodos(per).id, act2(1).dia, act2(1).turno, dPROFE, profe(iprofe).id) _
                   And Not estaRestringidoPorHerencia(periodos(per).id, act2(1).dia, act2(1).turno, dPROFE, profe(iprofe).id, , , False) Then

                    For i = 1 To cant1
                        moveAsignacion lista1(i), dia2, turno2
                    Next

                    For i = 1 To cant2
                        moveAsignacion lista2(i), dia1, turno1
                    Next

                    permuta = True
                    Exit Function
                End If

            End If

        End If

    End If

    permuta = False
End Function

Public Sub addProfeEnCurso(id As Long, dia As Long, turno As Long)
    Dim i As Long
10:

    For i = 1 To cantProfesEnCurso

        With ProfesoresEnCurso(i)

            If .idprofe = id Then

                If dia <> 0 And turno <> 0 Then

                    If Not .misAct(dia, turno) Then
                        .cant(dia) = .cant(dia) + 1
                        .misAct(dia, turno) = True
                    End If

                End If

                Exit Sub
            End If

        End With

    Next

    cantProfesEnCurso = cantProfesEnCurso + 1
    ReDim Preserve ProfesoresEnCurso(cantProfesEnCurso)
    ProfesoresEnCurso(cantProfesEnCurso).idprofe = id
    GoTo 10
End Sub

Public Sub clearProfesEnCurso()
    Dim i As Long, j As Long
    Dim temp As TActxProfexDia

    For i = 1 To cantProfesEnCurso
        ProfesoresEnCurso(i) = temp
    Next

    cantProfesEnCurso = 0
End Sub

Sub goProfesoresEnCurso(esp As Long, Nivel As Long, per As Long)
    Dim i As Long, iasig As Long, iprofe As Long
    clearProfesEnCurso
    Dim tiene As Boolean

    For i = 1 To cantIDPxAct

        With ProfeXAct(ListaIDPxAct(i))
            iasig = IndexById(dASIG, .para.idasig, 0)

            If (kernel.utils.idigual(.para.idper, periodos(per).id) Or kernel.utils.idigual(getIdPerHerencia("", _
                per, tiene), .para.idper)) And kernel.utils.idigual(asig(iasig).idesp, _
                Especialidad(esp).id) And asig(iasig).Nivel = Nivel _
                Then

                iprofe = IndexById(dPROFE, .idprofes, 0)
                addProfeEnCurso iprofe, 0, 0
            End If

        End With

    Next

    For i = 1 To cantFiltroAsignaciones

        With Asignaciones(FiltroAsignaciones(i))
            iasig = IndexById(dASIG, .idasig, 0)
            Rem If kernel.utils.idigual(.idperiodo,  periodos(per).id) And _
            kernel.utils.idigual(asig(iasig).idesp, _
            Especialidad(esp).id) And _
            asig(iasig).Nivel = Nivel _
            Then

            iprofe = IndexById(dPROFE, .idprofe, 0)
            addProfeEnCurso iprofe, .dia, .turno
            Rem End If
        End With

    Next

End Sub

Sub goIdDiasActxProfexDia(i As Long)
    Dim pcant(MAX_DIAS) As Long, j As Long, k As Long, l As Long

    With ProfesoresEnCurso(i)

        For j = 1 To CD
            .priori(j) = j
            pcant(j) = .cant(j)

            If .cant(j) = 0 Then .priori(j) = 0
        Next

        For j = 1 To CD - 1

            For k = j + 1 To CD

                If pcant(j) < pcant(k) Then
                    l = pcant(j)
                    pcant(j) = pcant(k)
                    pcant(k) = l
                    l = .priori(j)
                    .priori(j) = .priori(k)
                    .priori(k) = l
                End If

            Next

        Next

    End With

End Sub

Public Sub setPrioriDiasProfesEnCurso()
    Dim i As Long

    For i = 1 To cantProfesEnCurso
        goIdDiasActxProfexDia i
    Next

End Sub

Public Sub setPrioriDiasProfe(id As Long)
    Dim i As Long

    For i = 1 To cantProfesEnCurso

        If ProfesoresEnCurso(i).idprofe = id Then
            goIdDiasActxProfexDia (i)
            Exit Sub
        End If

    Next

End Sub

Public Sub setGruposProfesEnCurso(i As Long, iasig As Long, per As Long, act As Long)
    Dim j As Long, k As Long
    Dim tiene As Boolean

    For j = 1 To cantIDPxAct

        With ProfeXAct(ListaIDPxAct(j))

            If kernel.utils.idigual(.idprofes, profe(ProfesoresEnCurso(i).idprofe).id) Then

                If kernel.utils.idigual(asig(iasig).comun.id, .para.idasig) Then

                    If .para.idact = act Then

                        If (kernel.utils.idigual(periodos(per).id, .para.idper) Or _
                            kernel.utils.idigual(getIdPerHerencia("", per, tiene), .para.idper)) _
                            Then

                            ProfesoresEnCurso(i).cantGrupos = .cantGrupos
                            ReDim ProfesoresEnCurso(i).gruposQueAtiende(.cantGrupos)

                            For k = 1 To .cantGrupos
                                ProfesoresEnCurso(i).gruposQueAtiende(k) = .grupos(k)
                            Next

                            ProfesoresEnCurso(i).iasig = iasig
                            ProfesoresEnCurso(i).per = per
                            ProfesoresEnCurso(i).act = act
                            Exit Sub
                        End If

                    End If

                End If

            End If

        End With

    Next

End Sub

Public Sub goGruposProfesEnCurso(iasig As Long, per As Long, act As Long)
    Dim i As Long

    For i = 1 To cantProfesEnCurso
        setGruposProfesEnCurso i, iasig, per, act
    Next

End Sub

Public Function PuedenGrupos(dia As Long) As Boolean
    Rem Dim priori() As Long
    Rem redim priori(getcantbrg)
    Dim cant() As Long
    ReDim cant(cantMisGruposEnCurso)
    Dim gruposya() As Boolean
    ReDim gruposya(getCantBrg)
    Dim i As Long, j As Long
    Dim min As Long, p As Long
    Dim turnosya()   As Boolean
    ReDim turnosya(ct)
    Dim faltan As Long
    faltan = cantMisGruposEnCurso

    ReDim Preserve gruposya(cantMisGruposEnCurso)
10
    For j = 1 To cantMisGruposEnCurso

        If Not gruposya(j) Then
            Rem priori(j) = j

            For i = 1 To ct

                If ZprioriEnCurso(dia, i) = 1 And MisGruposEnCurso(j).MPI(dia, i).valor _
                    And Not turnosya(i) _
                    Then

                    cant(j) = cant(j) + 1
                End If

            Next

        End If

    Next

    min = ct + 1

    For i = 1 To cantMisGruposEnCurso

        If min > cant(i) Or i = 1 And Not gruposya(i) Then
            min = cant(i)
            p = i
        End If

    Next

    For i = 1 To ct

        If ZprioriEnCurso(dia, i) = 1 And Not turnosya(i) And _
            MisGruposEnCurso(p).MPI(dia, i).valor _
            Then

            turnosya(i) = True
            gruposya(p) = True
            faltan = faltan - 1

            If faltan > 0 Then GoTo 10
            PuedenGrupos = True
            Exit Function
        End If

    Next

    PuedenGrupos = False
End Function

Public Sub setZPrioriEnCurso(iclasif As Long, per As Long)
    Dim k As Long, i As Long, j As Long

    For k = 1 To periodos.Count

        If kernel.utils.idigual(clasif(iclasif).zpriori(k).idperiodo, periodos(per).id) Then

            For i = 1 To CD

                For j = 1 To ct
                    ZprioriEnCurso(i, j) = clasif(iclasif).zpriori(k).rest(i, j)
                Next

            Next

            Exit Sub
        End If

    Next

End Sub

Public Sub INI_OPTIMIZAR_PROFE()
    Dim a As TMPI1, i As Long
    clearProfesEnCurso
    ReDim MiDiaSegunProfe(cantBrg)
    ReDim GruposEnCurso(cantBrg)
    ReDim MisGruposEnCurso(cantBrg)

    For i = 1 To cantBrg
        MiDiaSegunProfe(i) = 0
        GruposEnCurso(i) = a
        MisGruposEnCurso(i) = a
    Next

End Sub

'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'''''''''ANALISIS
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'Analiza el orden de prioridad de las clasificaciones
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

Public Function PriorizaClasif(per As Long) As String
    Dim prioriClasif() As Long
    ReDim prioriClasif(cantClasif, 5)
    Dim temp As TFiltro, r As Long, z As Long
    Dim dia As Long, turno As Long
    Dim i As Long, j As Long
    Dim t As Long, a As String
    Dim id() As Long
    ReDim id(cantClasif)

    For i = 1 To cantClasif

        For j = 1 To periodos.Count

            If kernel.utils.idigual(clasif(i).comun.rest(j).idperiodo, periodos(per).id) Then
                r = 0

                For dia = 1 To CD

                    For turno = 1 To ct

                        If clasif(i).comun.rest(j).rest(dia, turno) Then r = r + 1
                    Next

                Next

                prioriClasif(i, 1) = r
            End If

            If kernel.utils.idigual(clasif(i).zpriori(j).idperiodo, periodos(per).id) Then
                z = 0

                For dia = 1 To CD

                    For turno = 1 To ct

                        If EnZPriori(i, 1, j, dia, turno) Then z = z + 1
                    Next

                Next

                prioriClasif(i, 2) = z
            End If

        Next

        prioriClasif(i, 3) = clasif(i).ct
    Next

    temp.cant = cantClasif
    ReDim temp.id(temp.cant)

    For i = 1 To cantClasif
        temp.id(i) = kernel.utils.trunca(Str(prioriClasif(i, 1)))
    Next

    temp = prioris(temp)
    temp = inviertePrioris(temp)

    For i = 1 To cantClasif
        prioriClasif(i, 1) = Val(temp.id(i))
    Next

    For i = 1 To cantClasif
        temp.id(i) = kernel.utils.trunca(Str(prioriClasif(i, 2)))
    Next

    temp = prioris(temp)

    For i = 1 To cantClasif
        prioriClasif(i, 2) = Val(temp.id(i))
    Next

    For i = 1 To cantClasif
        temp.id(i) = kernel.utils.trunca(Str(prioriClasif(i, 3)))
    Next

    temp = prioris(temp)
    temp = inviertePrioris(temp)

    For i = 1 To cantClasif
        prioriClasif(i, 3) = Val(temp.id(i))
        prioriClasif(i, 4) = prioriClasif(i, 1) + prioriClasif(i, 2) + prioriClasif(i, 3)
    Next

    For i = 1 To cantClasif
        id(i) = i
    Next

    For i = 1 To cantClasif - 1

        For j = i + 1 To cantClasif

            If prioriClasif(i, 4) > prioriClasif(j, 4) Then
                t = prioriClasif(i, 4)
                prioriClasif(i, 4) = prioriClasif(j, 4)
                prioriClasif(j, 4) = t
                t = id(i)
                id(i) = id(j)
                id(j) = t
            End If

        Next

    Next

    a$ = ""

    For i = 1 To cantClasif
        a$ = a$ + kernel.utils.trunca(clasif(id(i)).comun.id) + ", "
    Next

    PriorizaClasif = a$
End Function

'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'Analiza el kernel.utils.Porciento de restricciones de la informacion
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

Public Sub AnalisisPrecentRestricc()
    Dim i As Long, j As Long
    Dim temp As TRecurso, temp1 As TPercentRestricc
    cantPercentRestricc = 0
    temp = DameComoRecurso(dPERIODO, 0)

    For i = 1 To periodos.Count
        temp1 = PercentRestriccion(temp, i)
        addPercentrestricc dPERIODO, i, 0, temp1.parte
    Next

    For i = 1 To cantEsp

        For j = 1 To periodos.Count
            temp1 = PercentRestriccion(Especialidad(i), j)
            addPercentrestricc dESPECIALIDAD, i, temp1.idper, temp1.parte
        Next

    Next

    For i = 1 To cantClasif

        For j = 1 To periodos.Count
            temp1 = PercentRestriccion(clasif(i).comun, j)
            addPercentrestricc dCLASIF, i, temp1.idper, temp1.parte
        Next

    Next

    For i = 1 To cantBrg

        For j = 1 To periodos.Count
            temp1 = PercentRestriccion(Brigada(i).comun, j)
            addPercentrestricc dBRIGADA, i, temp1.idper, temp1.parte
        Next

    Next

    For i = 1 To cantAsig

        For j = 1 To periodos.Count
            temp1 = PercentRestriccion(asig(i).comun, j)
            addPercentrestricc dASIG, i, temp1.idper, temp1.parte
        Next

    Next

    For i = 1 To cantProfe

        For j = 1 To periodos.Count
            temp1 = PercentRestriccion(profe(i), j)
            addPercentrestricc dPROFE, i, temp1.idper, temp1.parte
        Next

    Next

    For i = 1 To cantLug

        For j = 1 To periodos.Count
            temp1 = PercentRestriccion(lugar(i), j)
            addPercentrestricc dLUGAR, i, temp1.idper, temp1.parte
        Next

    Next

End Sub

'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'Agrega un registro al arreglo PercentRestricc
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

Public Sub addPercentrestricc(dato As Long, id As Long, idper As Long, parte As Long)
    cantPercentRestricc = cantPercentRestricc + 1
    ReDim Preserve idPercentRestricc(cantPercentRestricc)
    ReDim Preserve PercentRestricc(cantPercentRestricc)
    idPercentRestricc(cantPercentRestricc) = cantPercentRestricc

    With PercentRestricc(cantPercentRestricc)
        .dato = dato
        .id = id
        .idper = idper
        .parte = parte
    End With

End Sub

Public Sub updateHashPxAct()
    Dim i As Long
    Set hashPxact = Nothing
    Set hashPxact = New TKernel_HashPxAct

    For i = 1 To cantPxAct

        With ProfeXAct(i)
            DoEvents
            hashPxact.add .para.idasig
            hashPxact(.para.idasig).idper.add .para.idper
            hashPxact(.para.idasig).idper(.para.idper).idact.add .para.idact
            hashPxact(.para.idasig).idper(.para.idper).idact("" & .para.idact).idprofes.add .idprofes, i
        End With

    Next

End Sub
Public Sub updateHashLxAct()
    Dim i As Long
    Set hashLxact = Nothing
    Set hashLxact = New TKernel_HashPxAct

    For i = 1 To cantLxAct
        With LugXact(i)
            DoEvents
            hashLxact.add .para.idasig
            hashLxact(.para.idasig).idper.add .para.idper
            hashLxact(.para.idasig).idper(.para.idper).idact.add .para.idact
            hashLxact(.para.idasig).idper(.para.idper).idact("" & .para.idact).index = i
        End With
    Next

End Sub
Public Function reparaGrupoxClasif()

    Dim i As Long

    For i = 1 To cantBrg
        Brigada(i).cantGxClasif = cantClasif
    Next

    GuardarTodo
End Function
Public Function CantBrgSegunEspNivel(esp As String, Nivel As Long) As Long
    Dim c As Long, i As Long

    For i = 1 To cantBrg

        With Brigada(i)
            If kernel.utils.idigual(.idesp, esp) And Nivel = .Nivel Then c = c + 1
        End With

    Next

    CantBrgSegunEspNivel = c
End Function
Public Sub ProfesoresDuplicados()
    Dim i As Long, j As Long

    Open App.path + "\AncoraInforme_ProfesDuplicados.txt " For Output As #1
    Print #1, "-------------------------------------------------------"
    Print #1, "REPORTE DE Áncora ------------- Profesores duplicados: "
    Print #1, "-------------------------------------------------------"

    For i = 1 To cantProfe

        For j = i + 1 To cantProfe
            If kernel.utils.idigual(profe(i).id, profe(j).id) And i <> j Then Print #1, j, profe(j).id, profe(j).descrip
        Next

    Next

    Close
End Sub

Public Sub deletePeriodo(ByVal id As String)
    Dim i As Long, j As Long, k As Long, ix As Long
    
        ix = IndexById(dPERIODO, id)
        If ix = 0 Then Exit Sub
    
        'rest de especialidad
        For i = 1 To getCantEspecialidades
            deleteRestriccionRecurso Especialidad(i), id
        Next

        'rest de brigada
        For i = 1 To getCantBrg
            deleteRestriccionRecurso Brigada(i).comun, id
        Next

        'rest de asig y desgloses
        For i = 1 To getCantAsig
            deleteRestriccionRecurso asig(i).comun, id
            With asig(i)
                For j = 1 To periodos.Count
                    If kernel.utils.idigual(periodos(j).id, .desglose(j).idperiodo) Then
                        For k = j To periodos.Count - 1
                            .desglose(k) = .desglose(k + 1)
                        Next
                        ReDim Preserve .desglose(periodos.Count - 1)
                        Exit For
                    End If
                Next
            End With
        Next

        'rest de lugar
        For i = 1 To getCantLug
            deleteRestriccionRecurso lugar(i), id
        Next

        'rest de profesor
        For i = 1 To cantProfe
            deleteRestriccionRecurso profe(i), id
        Next

        'rest de recurso
        For i = 1 To recursos.Count
             recursos(i).rest.Remove id
        Next

        'rest de y zpriori de clasif
        For i = 1 To cantClasif
            deleteRestriccionRecurso clasif(i).comun, id
            With clasif(i)
                For j = 1 To periodos.Count
                    If kernel.utils.idigual(periodos(j).id, .zpriori(j).idperiodo) Then
                        For k = j To periodos.Count - 1
                            .zpriori(k) = .zpriori(k + 1)
                        Next
                        ReDim Preserve .zpriori(periodos.Count - 1)
                        Exit For
                    End If
                Next
            End With
        Next

        Dim temp() As Long, cant As Long

        'lxact
        cant = 0
        For i = 1 To cantLxAct
            With LugXact(i)
                If kernel.utils.idigual(id, .para.idper) Then
                    cant = cant + 1
                    ReDim Preserve temp(cant)
                    temp(cant) = i
                End If
            End With
        Next

        For i = cant To 1 Step -1
            deleteLxAct temp(i)
        Next

        'pxact
        cant = 0
        For i = 1 To cantPxAct
            With ProfeXAct(i)
                If kernel.utils.idigual(id, .para.idper) Then
                    cant = cant + 1
                    ReDim Preserve temp(cant)
                    temp(cant) = i
                End If
            End With
        Next

        For i = cant To 1 Step -1
            deleteProfexAct temp(i)
        Next

        'rxact
        cant = 0
        For i = 1 To recursosXact.Count
            With recursosXact(i)
                If kernel.utils.idigual(id, .per) Then
                    cant = cant + 1
                    ReDim Preserve temp(cant)
                    temp(cant) = i
                End If
            End With
        Next

        For i = cant To 1 Step -1
            recursosXact.Remove temp(i)
        Next

        'asignaciones
        cant = 0
        For i = 1 To cantAsignaciones
            With Asignaciones(i)
                If kernel.utils.idigual(id, .idperiodo) Then
                    cant = cant + 1
                    ReDim Preserve temp(cant)
                    temp(cant - 1) = i
                End If
            End With
        Next

        destruyeAsignaciones temp, cant

        'imposibles
        cant = 0
        For i = 1 To cantImposibles
            With Imposibles(i)
                If kernel.utils.idigual(id, .idperiodo) Then
                    cant = cant + 1
                    ReDim Preserve temp(cant)
                    temp(cant) = i
                End If
            End With
        Next

        For i = cant To 1 Step -1
            deleteImposible temp(i)
        Next

        'plantillas de periodos

        For i = 1 To periodos.Count
            If kernel.utils.idigual(periodos(i).template, id) Then periodos(i).template = ""
        Next
        
        'herencia de restricciones
        
        Dim h As TGOH_HRT
        
        For Each h In hrt
            h.exceptoEnTiempo.Remove (id)
        Next
        
        cacheID(dPERIODO).Remove id
        
        periodos.Remove ix
        
        updateHash_objects
End Sub
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
Public Sub GuardarTodo()

    Dim fname As String, ftemp As String, fbak As String
    fname = Directorio & "\" & NameFile
    ftemp = Directorio & "\" & NameFile & ".tmp"
    fbak = Directorio & "\" & NameFile & ".bak"

    
    SuperDatarepara

    GuardaTXT ftemp           'guardo en un temporal
    If kernel.files.ExisteFichero(fbak) Then Kill fbak                 'elimino la salva anterior
    If kernel.files.ExisteFichero(fname) Then FileCopy fname, fbak      'hago una salva del actual
    If kernel.files.ExisteFichero(fname) Then Kill fname                'elimino el actual
    If kernel.files.ExisteFichero(ftemp) Then FileCopy ftemp, fname     'guardo el actual como el temporal
    If kernel.files.ExisteFichero(ftemp) Then Kill ftemp                 'elimino el temporal
    
    updatehash
End Sub
Public Sub AbrirTodo()
    LeeTXT Directorio + "\" + NameFile
    SuperDatarepara
    updatehash
    updateHashLxAct
    updateHashPxAct
    updateHash_objects
End Sub
Public Function DirectorioActual()
    Dim Directorio As String
    ChDir App.path
    ChDrive App.path
    Directorio = App.path
    If Len(Directorio) > 3 Then Directorio = Directorio & "\"
    DirectorioActual = Directorio
End Function

Public Function LeeLinea() As String
    Dim l As String
    Dim a As String
    l = ";"
    a = Mid$(l, 1, 1)
    While a = ";" Or kernel.utils.trunca(l) = ""
        If Not EOF(1) Then
            Line Input #1, l
            l = kernel.utils.trunca(l)
            a = Mid$(l, 1, 1)
        Else
            LeeLinea = ""
            Exit Function
        End If

    Wend
    LeeLinea = l
    DoEvents
End Function

Sub GuardaTXT(path As String)
    On Error GoTo errdep

    Dim i As Long, j As Long, k As Long, l As Long, a As String

    Dim d As Long, t As Long

    Close
    Open path For Output As #1
    Print #1, "; ------------------------------------------------------------------------------------------"
    Print #1, ";            Áncora, generación y organización de horarios Ver 1.2.0"
    Print #1, ";                          Archivo de horarios"
    Print #1, ";"
    Print #1, ";                    ¿Cuándo se guardó este archivo?"
    Print #1, ";                           Fecha: " & Date
    Print #1, ";                           Hora: " & Time
    Print #1, "; ------------------------------------------------------------------------------------------"
    reparatodosRest
    

    d = CD
    t = ct
    EstaticaConfig
    CD = d
    ct = t
    'generales
    Print #1, ";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;"
    Print #1, ";;              DATOS GENERLES"
    Print #1, ";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;"
    Print #1, kernel.utils.trunca(Str(CD))
    Print #1, kernel.utils.trunca(Str(ct))

    'periodos
    Print #1, ";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;"
    Print #1, ";;              PERIODOS"
    Print #1, ";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;"
    Print #1, kernel.utils.trunca(Str(periodos.Count))

    For i = 1 To periodos.Count
        interface.console.Progress "Guardando...", kernel.utils.Porciento(kernel.utils.Porciento(i, periodos.Count) / 20, 100)
        Print #1, kernel.utils.trunca(periodos(i).id) + "," + kernel.utils.trunca(periodos(i).descrip) + "," + periodos(i).template + "," + periodos(i).Caption + ","

        For j = 1 To ct

            For k = 1 To CD
                If periodos(i).getTimeRequest(k, j) Then Print #1, "1,"; Else Print #1, "0,";
            Next

            Print #1, " "
        Next

    Next

    'Niveles
    
    Print #1, ";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;"
    Print #1, ";;            CANTIDAD DE Niveles"
    Print #1, ";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;"
    Print #1, "" & cantNiveles
    
    'especialidades
    
    Print #1, ";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;"
    Print #1, ";;              ESPECIALIDADES"
    Print #1, ";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;"
    Print #1, kernel.utils.trunca(Str(cantEsp))

    For i = 1 To cantEsp
        interface.console.Progress "Guardando...", kernel.utils.Porciento(5 + kernel.utils.Porciento(i, cantEsp) / 20, 100)
        Print #1, kernel.utils.trunca(Especialidad(i).id) + "," + kernel.utils.trunca(Especialidad(i).descrip) + "," + Especialidad(i).titulo + ","

        For j = 1 To periodos.Count
            Print #1, Especialidad(i).rest(j).idperiodo

            For k = 1 To ct

                For l = 1 To CD
                    If Especialidad(i).rest(j).rest(l, k) Then Print #1, "1,"; Else Print #1, "0,";
                Next

                Print #1, " "
            Next

        Next

    Next

    'clasif act
    Print #1, ";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;"
    Print #1, ";;              CLASIFICACION DE ACTIVIDADES"
    Print #1, ";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;"
    Print #1, kernel.utils.trunca(Str(cantClasif))

    For i = 1 To cantClasif
        interface.console.Progress "Guardando...", kernel.utils.Porciento(10 + kernel.utils.Porciento(i, cantClasif) / 20, 100)
        Print #1, kernel.utils.trunca(clasif(i).comun.id) + "," + kernel.utils.trunca(clasif(i).comun.descrip) + ","; clasif(i).ct; ","; clasif(i).comun.titulo; ","

        For j = 1 To periodos.Count
            Print #1, clasif(i).comun.rest(j).idperiodo

            For k = 1 To ct

                For l = 1 To CD
                    If clasif(i).comun.rest(j).rest(l, k) Then Print #1, "1,"; Else Print #1, "0,";
                Next

                Print #1, " "
            Next

        Next

        For j = 1 To periodos.Count
            Print #1, clasif(i).zpriori(j).idperiodo

            For k = 1 To ct

                For l = 1 To CD
                    Print #1, kernel.utils.trunca(Str(clasif(i).zpriori(j).rest(l, k))); ",";
                Next

                Print #1, " "
            Next

        Next

    Next

    'brigadas
    Print #1, ";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;"
    Print #1, ";;              BRIGADAS"
    Print #1, ";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;"
    Print #1, kernel.utils.trunca(Str(cantBrg))

    For i = 1 To cantBrg
        interface.console.Progress "Guardando...Brigadas", kernel.utils.Porciento(15 + kernel.utils.Porciento(i, cantBrg) / 20, 100)
        Print #1, kernel.utils.trunca(Brigada(i).comun.id) + "," + kernel.utils.trunca(Brigada(i).comun.descrip) + "," + kernel.utils.trunca(Brigada(i).idesp); ","; Brigada(i).Nivel; ","; IIf(Brigada(i).comun.virtual, 1, 0); ","; Brigada(i).matricula; ","; Brigada(i).comun.titulo; ","

        For j = 1 To periodos.Count
            Print #1, Brigada(i).comun.rest(j).idperiodo

            For k = 1 To ct

                For l = 1 To CD
                    If Brigada(i).comun.rest(j).rest(l, k) Then Print #1, "1,"; Else Print #1, "0,";
                Next

                Print #1, " "
            Next

        Next

    Next

    'gruposXClasif
    Print #1, ";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;"
    Print #1, ";;   GRUPOS POR CLASIFICACION DE ACTIVIDADES"
    Print #1, ";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;"

    For i = 1 To cantBrg
        interface.console.Progress "Guardando...", kernel.utils.Porciento(20 + kernel.utils.Porciento(i, cantBrg) / 20, 100)
        With Brigada(i)
            Print #1, kernel.utils.trunca(.comun.id); ",";

            For j = 1 To cantClasif

                For k = 1 To cantClasif
                    If kernel.utils.idigual(.GrupoXClasif(k).idclasif, clasif(j).comun.id) Then
                        Print #1, kernel.utils.trunca(Str(.GrupoXClasif(k).grupo)); ",";
                        Exit For
                    End If

                Next

            Next

        End With

        Print #1, " "
    Next

    'asig
    Print #1, ";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;"
    Print #1, ";;              ASIGNATURAS"
    Print #1, ";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;"
    Print #1, kernel.utils.trunca(Str(cantAsig))

    For i = 1 To cantAsig
        interface.console.Progress "Guardando...", kernel.utils.Porciento(25 + kernel.utils.Porciento(i, cantAsig) / 20, 100)
        Print #1, asig(i).comun.id & "," & asig(i).comun.descrip & "," & asig(i).idesp & "," & asig(i).Nivel & "," & asig(i).comun.titulo & ","

        For j = 1 To periodos.Count
            Print #1, asig(i).comun.rest(j).idperiodo

            For k = 1 To ct

                For l = 1 To CD
                    If asig(i).comun.rest(j).rest(l, k) Then Print #1, "1,"; Else Print #1, "0,";
                Next

                Print #1, " "
            Next

        Next

        For j = 1 To periodos.Count
            Print #1, kernel.utils.trunca(asig(i).desglose(j).idperiodo) + ",";
            If asig(i).desglose(j).RespetarOrden Then Print #1, "1,"; Else Print #1, "0,";
            If asig(i).desglose(j).mismodia Then Print #1, "1,"; Else Print #1, "0,";
            Print #1, kernel.utils.trunca(Str(asig(i).desglose(j).min)); ",";
            Print #1, kernel.utils.trunca(Str(asig(i).desglose(j).max)); ",";
            Print #1, kernel.utils.trunca(Str(asig(i).desglose(j).cantact)); ",";

            For k = 1 To asig(i).desglose(j).cantact
                Print #1, kernel.utils.trunca(asig(i).desglose(j).act(k).idclasif); ",";
            Next

            Print #1, " "
        Next

    Next

    'profes
    Print #1, ";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;"
    Print #1, ";;              PROFESORES"
    Print #1, ";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;"
    Print #1, kernel.utils.trunca(Str(cantProfe))

    For i = 1 To cantProfe
        interface.console.Progress "Guardando...", kernel.utils.Porciento(30 + kernel.utils.Porciento(i, cantProfe) / 20, 100)
        Print #1, profe(i).id & "," & profe(i).descrip & "," & IIf(profe(i).virtual, 1, 0) & "," & profe(i).titulo & ","

        For j = 1 To periodos.Count
            Print #1, profe(i).rest(j).idperiodo

            For k = 1 To ct

                For l = 1 To CD
                    If profe(i).rest(j).rest(l, k) Then Print #1, "1,"; Else Print #1, "0,";
                Next

                Print #1, " "
            Next

        Next

    Next

    Rem LUGARES
    Print #1, ";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;"
    Print #1, ";;              LUGARES"
    Print #1, ";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;"
    Print #1, kernel.utils.trunca(Str(cantLug))

    For i = 1 To cantLug
        interface.console.Progress "Guardando...Lugares", kernel.utils.Porciento(35 + kernel.utils.Porciento(i, cantLug) / 20, 100)
        Print #1, lugar(i).id & "," & lugar(i).descrip & "," & IIf(lugar(i).virtual, 1, 0) & "," & lugar(i).capacidad & ",";

        'coordenadas
        If Not getLugaresCoordenadas(lugar(i).id) Is Nothing Then
            With getLugaresCoordenadas(lugar(i).id)
                Print #1, .x & "," & .y & "," & .esteriotipo & "," & .color & "," & .fondo
            End With
        End If

        
        For j = 1 To periodos.Count
            Print #1, lugar(i).rest(j).idperiodo

            For k = 1 To ct

                For l = 1 To CD
                    If lugar(i).rest(j).rest(l, k) Then Print #1, "1,"; Else Print #1, "0,";
                Next

                Print #1, " "
            Next

        Next

    Next

    Print #1, ";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;"
    Print #1, ";;              ACCESOS PROHIBIDOS"
    Print #1, ";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;"
    'accesos prohibidos
    Print #1, kernel.utils.trunca(Str(cantAccesos))

    For i = 1 To cantAccesos
        interface.console.Progress "Guardando...", kernel.utils.Porciento(40 + kernel.utils.Porciento(i, cantAccesos) / 20, 100)
        Print #1, kernel.utils.trunca(AccesosProhibidos(i).idclasif) + ","; kernel.utils.trunca(Str(AccesosProhibidos(i).idgrupo)); ","; kernel.utils.trunca(Str(AccesosProhibidos(i).cantLugs)); ",";

        For j = 1 To AccesosProhibidos(i).cantLugs
            Print #1, kernel.utils.trunca(AccesosProhibidos(i).idlugs(j)); ",";
        Next

        Print #1, " "
    Next

    Print #1, ";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;"
    Print #1, ";;              AULAS FIJAS"
    Print #1, ";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;"
    'aulas fijas
    Print #1, kernel.utils.trunca(Str(cantfijas))

    For i = 1 To cantfijas
        interface.console.Progress "Guardando...", kernel.utils.Porciento(45 + kernel.utils.Porciento(i, cantfijas) / 20, 100)
        Print #1, kernel.utils.trunca(AulasFijas(i).idclasif); ","; kernel.utils.trunca(Str(AulasFijas(i).idgrupo)); ","; kernel.utils.trunca(AulasFijas(i).idlug)
    Next

    Print #1, ";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;"
    Print #1, ";;              LUGARES POR ACTIVIDAD"
    Print #1, ";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;"
    'lugxact
    Print #1, kernel.utils.trunca(Str(cantLxAct))

    For i = 1 To cantLxAct
        interface.console.Progress "Guardando...", kernel.utils.Porciento(50 + kernel.utils.Porciento(i, cantLxAct) / 20, 100)
        With LugXact(i)
            Print #1, kernel.utils.trunca(.para.idasig) + "," + kernel.utils.trunca(.para.idper); ","; kernel.utils.trunca(Str(.para.idact)); ","; kernel.utils.trunca(Str(.cantLug)); ",";

            For j = 1 To .cantLug
                Print #1, kernel.utils.trunca(.idlug(j)); ","; kernel.utils.trunca(Str(.priori(j))); ",";
            Next

            Print #1, " "
        End With

    Next

    Print #1, ";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;"
    Print #1, ";;              PROFESORES POR ACTIVIDAD"
    Print #1, ";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;"
    'profexact
    Print #1, kernel.utils.trunca(Str(cantPxAct))

    For i = 1 To cantPxAct
        interface.console.Progress "Guardando...", kernel.utils.Porciento(55 + kernel.utils.Porciento(i, cantPxAct) / 20, 100)
        With ProfeXAct(i)
            Print #1, kernel.utils.trunca(.para.idasig) + "," + kernel.utils.trunca(.para.idper); ","; kernel.utils.trunca(Str(.para.idact)); ","; kernel.utils.trunca(.idprofes); ","; kernel.utils.trunca(Str(.cantGrupos)); ",";

            For j = 1 To .cantGrupos
                Print #1, kernel.utils.trunca(.grupos(j)); ",";
            Next

            Print #1, " "
        End With

    Next

    Print #1, ";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;"
    Print #1, ";;              TABLA DE DISTANCIAS"
    Print #1, ";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;"
    'distancias

    For i = 1 To cantLug
        interface.console.Progress "Guardando...", kernel.utils.Porciento(60 + kernel.utils.Porciento(i, cantLug) / 20, 100)
        
        For j = 1 To cantLug
            DoEvents
            Print #1, kernel.utils.trunca(DistanciaEntre(lugar(i).id, lugar(j).id)); ",";
        Next

        Print #1, " "
    Next

    Print #1, ";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;"
    Print #1, ";;          ASIGNACIONES DE ACTIVIDADES"
    Print #1, ";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;"
    'asignaciones
    Print #1, kernel.utils.trunca(Str(cantAsignaciones))

    For i = 1 To cantAsignaciones
        interface.console.Progress "Guardando...", kernel.utils.Porciento(65 + kernel.utils.Porciento(i, cantAsignaciones) / 6.6, 100)

        With Asignaciones(i)
            Print #1, kernel.utils.trunca(.fecha) & "," & kernel.utils.trunca(.hora) & "," & kernel.utils.trunca(.idasig) & "," & kernel.utils.trunca(.idperiodo) & "," & .idact & "," & kernel.utils.trunca(.idprofe) & "," & kernel.utils.trunca(.idlugar) & "," & kernel.utils.trunca(.idbrigada) & "," & .dia & "," & .turno & "," & IIf(.fija, "1", "0") & "," & .cantrecursos & ",";
            For j = 1 To .cantrecursos
                Print #1, .recursos(j) & ",";
            Next
            Print #1, " "
        End With

    Next

    Print #1, ";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;"
    Print #1, ";;              ACTIVIDADES RECHAZADAS"
    Print #1, ";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;"
    'imposibles
    Print #1, kernel.utils.trunca(Str(cantImposibles))

    For i = 1 To cantImposibles
        interface.console.Progress "Guardando...", kernel.utils.Porciento(80 + kernel.utils.Porciento(i, cantImposibles) / 20, 100)

        With Imposibles(i)
            Print #1, kernel.utils.trunca(.fecha); ","; kernel.utils.trunca(.hora); ","; kernel.utils.trunca(.idasig); ","; kernel.utils.trunca(.idperiodo); ","; .idact; ","; ","; kernel.utils.trunca(.idbrigada); ","; .MAXPI; ","; .RechazosXRest; ","; .RechazosXProf; ","; .RechazosXLug
        End With

    Next

    'recursos
    Print #1, ";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;"
    Print #1, ";;              RECURSOS"
    Print #1, ";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;"
    Print #1, kernel.utils.trunca(Str(recursos.Count))

    For i = 1 To recursos.Count
        interface.console.Progress "Guardando...", kernel.utils.Porciento(85 + kernel.utils.Porciento(i, recursos.Count) / 20, 100)
        Print #1, kernel.utils.trunca(recursos(i).id) + "," + kernel.utils.trunca(recursos(i).descrip) & "," & IIf(recursos(i).virtual, 1, 0) & "," & recursos(i).Caption & ","
        For l = 1 To periodos.Count
            Print #1, periodos.Item(l).id
            For j = 1 To ct
                For k = 1 To CD
                    Print #1, recursos(i).getRestriccion(periodos(l).id, k, j) & ",";
                Next
                Print #1, " "
            Next
        Next
    Next

    'recursos por actividad

    Print #1, ";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;"
    Print #1, ";;              RECURSOS POR ACTIVIDAD"
    Print #1, ";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;"
    Print #1, kernel.utils.trunca(Str(recursosXact.Count))

    For i = 1 To recursosXact.Count
        interface.console.Progress "Guardando...", kernel.utils.Porciento(90 + kernel.utils.Porciento(i, recursosXact.Count) / 20, 100)
        With recursosXact(i)
            Print #1, .asg & "," & .per & "," & .act & "," & .gruposRecursos.Count & ",";
            For j = 1 To .gruposRecursos.Count
                Print #1, .gruposRecursos(j).prioridad & "," & IIf(.gruposRecursos(j).imprescindibles, "1", "0") & "," & .gruposRecursos(j).cantNecesarios & "," & .gruposRecursos(j).recursos.Count & ",";
                For k = 1 To .gruposRecursos(j).recursos.Count
                    Print #1, .gruposRecursos(j).recursos(k).value & "," & .gruposRecursos(j).prioridades(k).value & ",";
                Next
            Next
        End With
        Print #1, " "
    Next
   
    Print #1, ";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;"
    Print #1, ";; HERENCIA DE RESTRICCIONES "
    Print #1, ";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;"

    Print #1, "" & hrt.Count
    
    Dim h As TGOH_HRT
    
    For Each h In hrt
        With h
            Print #1, .tipoObjetoA & "," & .idObjetoA & "," & .tipoObjetoB & "," & .idObjetoB
            Print #1, "" & .exceptoEnTiempo.Count
            
            Dim rest As TGOH_Restriccion
            
            For Each rest In .exceptoEnTiempo
                Print #1, rest.idperiodo
                For j = 1 To ct
                    For i = 1 To CD
                        Print #1, "" & rest.rest(i, j) & ",";
                    Next
                    Print #1, ""
                Next
            Next
        End With
    Next

finish:
    Close
    interface.console.Progress "Guardando...", 100
    
    Exit Sub
errdep:
    Debug.Print Err.Description
    Resume Next
End Sub



Public Sub LeeTXT(path As String)

    'On Error goTo errdep

    Dim i As Long, j As Long, k As Long, l As Long, a As String
    Dim cant As Long, cant1 As Long


    Debug.Print Time

    Close
100
    Open path For Input As #1
    
    interface.console.Progress "Cargando...", 0
    'generales
    
    CD = Val(LeeLinea)
    ct = Val(LeeLinea)

    Dim tr As TarrRowRest
    Dim id As String, descrip As String
    Dim trow As TarrCellRest
    Dim matrix() As Long
    ReDim matrix(CD, ct)

    'periodos
    cant = Val(LeeLinea)
    
    For i = 1 To cant
        interface.console.Progress "Cargando...", kernel.utils.Porciento(kernel.utils.Porciento(i, cant) / 20, 100)
        a = LeeLinea
        id = kernel.strings.picaPrimerasubcadena(a)
        descrip = kernel.strings.picaPrimerasubcadena(a)
        Dim plantilla As String
        plantilla = kernel.strings.picaPrimerasubcadena(a)
        
        Dim titulo As String
        
        titulo = kernel.strings.picaPrimerasubcadena(a)
        For j = 1 To ct
            a = LeeLinea

            For k = 1 To CD
                matrix(k, j) = Val(kernel.strings.picaPrimerasubcadena(a))
            Next

        Next

        Set tr = New TarrRowRest

        For j = 1 To CD
            Set trow = New TarrCellRest

            For k = 1 To ct
                trow.add matrix(j, k), "" & k
            Next

            tr.add trow, "" & j
        Next

        periodos.add id, descrip, tr, titulo, plantilla
    Next

    'Niveles
    
    cantNiveles = LeeLinea
    
    'especialidades
    
    cantEsp = Val(LeeLinea)
    ReDim Especialidad(cantEsp)

    For i = 1 To cantEsp
        interface.console.Progress "Cargando...", kernel.utils.Porciento(5 + kernel.utils.Porciento(i, cantEsp) / 20, 100)
        a = LeeLinea

        With Especialidad(i)
            .id = kernel.strings.picaPrimerasubcadena(a)
            .descrip = kernel.strings.picaPrimerasubcadena(a)
            .titulo = kernel.strings.picaPrimerasubcadena(a)
            
            ReDim Preserve .rest(periodos.Count)
            For j = 1 To periodos.Count
                .rest(j).idperiodo = LeeLinea

                For k = 1 To ct
                    a = LeeLinea

                    For l = 1 To CD
                        .rest(j).rest(l, k) = Val(kernel.strings.picaPrimerasubcadena(a))
                    Next

                Next

            Next

        End With

    Next

    'clasif act
    cantClasif = Val(LeeLinea)
    ReDim clasif(cantClasif)

    For i = 1 To cantClasif
        interface.console.Progress "Cargando...", kernel.utils.Porciento(10 + kernel.utils.Porciento(i, cantClasif) / 20, 100)
        a = LeeLinea

        With clasif(i)
            .comun.id = kernel.strings.picaPrimerasubcadena(a)
            .comun.descrip = kernel.strings.picaPrimerasubcadena(a)
            .ct = Val(kernel.strings.picaPrimerasubcadena(a))
            .comun.titulo = kernel.strings.picaPrimerasubcadena(a)
            
            ReDim Preserve .comun.rest(periodos.Count)
            For j = 1 To periodos.Count
                .comun.rest(j).idperiodo = LeeLinea

                For k = 1 To ct
                    a = LeeLinea

                    For l = 1 To CD
                        .comun.rest(j).rest(l, k) = Val(kernel.strings.picaPrimerasubcadena(a))
                    Next

                Next

            Next

            ReDim .zpriori(periodos.Count)
            For j = 1 To periodos.Count
                .zpriori(j).idperiodo = LeeLinea

                For k = 1 To ct
                    a = LeeLinea

                    For l = 1 To CD
                        .zpriori(j).rest(l, k) = Val(kernel.strings.picaPrimerasubcadena(a))
                    Next

                Next

            Next

        End With

    Next

    'brigadas
    cantBrg = Val(LeeLinea)
    ReDim Brigada(cantBrg)

    For i = 1 To cantBrg
        interface.console.Progress "Cargando...", kernel.utils.Porciento(15 + kernel.utils.Porciento(i, cantBrg) / 20, 100)
        a = LeeLinea

        With Brigada(i)
            .comun.id = kernel.strings.picaPrimerasubcadena(a)
            .comun.descrip = kernel.strings.picaPrimerasubcadena(a)
            .idesp = kernel.strings.picaPrimerasubcadena(a)
            .Nivel = Val(kernel.strings.picaPrimerasubcadena(a))
            
            
            Dim tmp As Long
            tmp = Val(kernel.strings.picaPrimerasubcadena(a))
            .comun.virtual = IIf(tmp = 1, True, False)

            .matricula = Val(kernel.strings.picaPrimerasubcadena(a))
            .comun.titulo = kernel.strings.picaPrimerasubcadena(a)
            
            ReDim Preserve .comun.rest(periodos.Count)
            For j = 1 To periodos.Count
                .comun.rest(j).idperiodo = LeeLinea

                For k = 1 To ct
                    a = LeeLinea

                    For l = 1 To CD
                        .comun.rest(j).rest(l, k) = Val(kernel.strings.picaPrimerasubcadena(a))
                    Next

                Next

            Next

        End With

    Next

    Dim idbrg As String
    For i = 1 To cantBrg
        interface.console.Progress "Cargando...", kernel.utils.Porciento(20 + kernel.utils.Porciento(i, cantBrg) / 20, 100)

        With Brigada(i)
            a = LeeLinea
            idbrg = kernel.strings.picaPrimerasubcadena(a)
            'aqui se supone que las brigadas estan en orden
            'pero puede ser alterado!!!!
            ReDim .GrupoXClasif(cantClasif)
            For j = 1 To cantClasif

                .GrupoXClasif(j).grupo = Val(kernel.strings.picaPrimerasubcadena(a))
                .GrupoXClasif(j).idclasif = clasif(j).comun.id
            Next

            .cantGxClasif = cantClasif
        End With

    Next

    'asigs
    cantAsig = Val(LeeLinea)
    ReDim asig(cantAsig)

    For i = 1 To cantAsig
        interface.console.Progress "Cargando...", kernel.utils.Porciento(25 + kernel.utils.Porciento(i, cantAsig) / 20, 100)
        a = LeeLinea

        With asig(i)
            .comun.id = kernel.strings.picaPrimerasubcadena(a)
            .comun.descrip = kernel.strings.picaPrimerasubcadena(a)
            .idesp = kernel.strings.picaPrimerasubcadena(a)
            .Nivel = Val(kernel.strings.picaPrimerasubcadena(a))
            .comun.titulo = kernel.strings.picaPrimerasubcadena(a)
            ReDim Preserve .comun.rest(periodos.Count)
            For j = 1 To periodos.Count
                .comun.rest(j).idperiodo = LeeLinea

                For k = 1 To ct
                    a = LeeLinea

                    For l = 1 To CD
                        .comun.rest(j).rest(l, k) = Val(kernel.strings.picaPrimerasubcadena(a))
                    Next

                Next

            Next

            ReDim Preserve .desglose(periodos.Count)
            For j = 1 To periodos.Count
                a = LeeLinea
                .desglose(j).idperiodo = kernel.strings.picaPrimerasubcadena(a)
                .desglose(j).RespetarOrden = Val(kernel.strings.picaPrimerasubcadena(a))
                .desglose(j).mismodia = Val(kernel.strings.picaPrimerasubcadena(a))
                .desglose(j).min = Val(kernel.strings.picaPrimerasubcadena(a))
                .desglose(j).max = Val(kernel.strings.picaPrimerasubcadena(a))
                .desglose(j).cantact = Val(kernel.strings.picaPrimerasubcadena(a))
                If .desglose(j).min = 0 Then .desglose(j).min = 1
                If .desglose(j).max = 0 Then .desglose(j).max = 1

                For k = 1 To .desglose(j).cantact
                    .desglose(j).act(k).idclasif = kernel.strings.picaPrimerasubcadena(a)
                Next

            Next

        End With

    Next

    'profes
    cantProfe = Val(LeeLinea)
    ReDim profe(cantProfe)

    For i = 1 To cantProfe
        interface.console.Progress "Cargando...", kernel.utils.Porciento(30 + kernel.utils.Porciento(i, cantProfe) / 20, 100)
        a = LeeLinea

        With profe(i)
            .id = kernel.strings.picaPrimerasubcadena(a)
            .descrip = kernel.strings.picaPrimerasubcadena(a)
             
             tmp = Val(kernel.strings.picaPrimerasubcadena(a))
            .virtual = IIf(tmp = 1, True, False)
           
            .titulo = kernel.strings.picaPrimerasubcadena(a)
            
            ReDim Preserve .rest(periodos.Count)
            For j = 1 To periodos.Count
                .rest(j).idperiodo = LeeLinea

                For k = 1 To ct
                    a = LeeLinea

                    For l = 1 To CD
                        .rest(j).rest(l, k) = Val(kernel.strings.picaPrimerasubcadena(a))
                    Next

                Next

            Next

        End With

    Next

    'lugs
    cantLug = Val(LeeLinea)
    ReDim lugar(cantLug)

    For i = 1 To cantLug
        interface.console.Progress "Cargando...", kernel.utils.Porciento(35 + kernel.utils.Porciento(i, cantLug) / 20, 100)
        a = LeeLinea

        With lugar(i)
            .id = kernel.strings.picaPrimerasubcadena(a)
            .descrip = kernel.strings.picaPrimerasubcadena(a)

             tmp = Val(kernel.strings.picaPrimerasubcadena(a))
            .virtual = IIf(tmp = 1, True, False)

            .capacidad = Val(kernel.strings.picaPrimerasubcadena(a))
            
            
            'coordenadas de los lugares

            If (getLugaresCoordenadas(.id) Is Nothing) Then getLugaresCoordenadas.add .id, -1, -1, -1, -1, -1

            getLugaresCoordenadas(.id).x = Val(kernel.strings.picaPrimerasubcadena(a))
            getLugaresCoordenadas(.id).y = Val(kernel.strings.picaPrimerasubcadena(a))
            getLugaresCoordenadas(.id).esteriotipo = Val(kernel.strings.picaPrimerasubcadena(a))
            getLugaresCoordenadas(.id).color = Val(kernel.strings.picaPrimerasubcadena(a))
            getLugaresCoordenadas(.id).fondo = Val(kernel.strings.picaPrimerasubcadena(a))

            .titulo = kernel.strings.picaPrimerasubcadena(a)
            
            ReDim Preserve .rest(periodos.Count)
            For j = 1 To periodos.Count
                .rest(j).idperiodo = LeeLinea

                For k = 1 To ct
                    a = LeeLinea

                    For l = 1 To CD
                        .rest(j).rest(l, k) = Val(kernel.strings.picaPrimerasubcadena(a))
                    Next

                Next

            Next

        End With

    Next

    'accesos
    cantAccesos = Val(LeeLinea)
    ReDim Preserve AccesosProhibidos(cantAccesos)
    For i = 1 To cantAccesos
        interface.console.Progress "Cargando...", kernel.utils.Porciento(40 + kernel.utils.Porciento(i, cantAccesos) / 20, 100)
        a = LeeLinea

        With AccesosProhibidos(i)
            .idclasif = kernel.strings.picaPrimerasubcadena(a)
            .idgrupo = Val(kernel.strings.picaPrimerasubcadena(a))
            .cantLugs = Val(kernel.strings.picaPrimerasubcadena(a))

            ReDim .idlugs(.cantLugs)
            For j = 1 To .cantLugs
                .idlugs(j) = kernel.strings.picaPrimerasubcadena(a)
            Next

        End With

    Next

    'aulasfijas
    cantfijas = Val(LeeLinea)
    ReDim AulasFijas(cantfijas)
    For i = 1 To cantfijas
        interface.console.Progress "Cargando...", kernel.utils.Porciento(45 + kernel.utils.Porciento(i, cantfijas) / 20, 100)
        a = LeeLinea

        With AulasFijas(i)
            .idclasif = kernel.strings.picaPrimerasubcadena(a)
            .idgrupo = Val(kernel.strings.picaPrimerasubcadena(a))
            .idlug = Val(kernel.strings.picaPrimerasubcadena(a))
        End With

    Next

    'lugxact
    cantLxAct = Val(LeeLinea)
    ReDim Preserve LugXact(cantLxAct)

    For i = 1 To cantLxAct
        interface.console.Progress "Cargando...", kernel.utils.Porciento(50 + kernel.utils.Porciento(i, cantLxAct) / 20, 100)
        a = LeeLinea
        Dim b As String
        b = a
        With LugXact(i)

            .para.idasig = kernel.strings.picaPrimerasubcadena(a)
            .para.idper = kernel.strings.picaPrimerasubcadena(a)
            .para.idact = Val(kernel.strings.picaPrimerasubcadena(a))
            .cantLug = Val(kernel.strings.picaPrimerasubcadena(a))
            If (.cantLug) * 2 + 4 > kernel.strings.cantsubcadenas(b, ",") Then .cantLug = (kernel.strings.cantsubcadenas(b, ",") - 4) / 2
            k = 0

            ReDim Preserve .idlug(.cantLug)
            ReDim Preserve .priori(.cantLug)

            For j = 1 To .cantLug
                k = k + 1
                .idlug(j) = kernel.strings.picaPrimerasubcadena(a)
                .priori(j) = kernel.strings.picaPrimerasubcadena(a)
            Next
        End With
    Next

    'profexact
    cant = Val(LeeLinea)
    For i = 1 To cant
        interface.console.Progress "Cargando...", kernel.utils.Porciento(55 + kernel.utils.Porciento(i, cant) / 20, 100)
        a = LeeLinea
        Dim b1 As String, b2 As String, b3 As String, b4 As String
        b1 = kernel.strings.picaPrimerasubcadena(a)
        b2 = kernel.strings.picaPrimerasubcadena(a)
        b3 = kernel.strings.picaPrimerasubcadena(a)
        b4 = kernel.strings.picaPrimerasubcadena(a)

        insertProfexAct b1, b2, Val(b3), b4
        cant1 = Val(kernel.strings.picaPrimerasubcadena(a))
        For j = 1 To cant1
            insertPxAct_Grupo getCantPxAct, Val(kernel.strings.picaPrimerasubcadena(a))
        Next
    Next

    'distancias
    ReDim Preserve Distancias(cantLug)
    For i = 1 To cantLug
        ReDim Preserve Distancias(i).colum(cantLug)
    Next
    For i = 1 To cantLug
        interface.console.Progress "Cargando...", kernel.utils.Porciento(60 + kernel.utils.Porciento(i, cantLug) / 20, 100)
        a = LeeLinea
        Distancias(i).id = lugar(i).id
        ReDim Preserve Distancias(i).colum(cantLug)
        For j = 1 To cantLug
            Distancias(i).colum(j).id = lugar(j).id
            Distancias(i).colum(j).dist = Val(kernel.strings.picaPrimerasubcadena(a))
        Next

    Next

    'asignaciones
    cantAsignaciones = Val(LeeLinea)
    ReDim Asignaciones(cantAsignaciones)

    For i = 1 To cantAsignaciones
        interface.console.Progress "Cargando...", kernel.utils.Porciento(65 + kernel.utils.Porciento(i, cantAsignaciones) / 6.6, 100)

        With Asignaciones(i)
            a = LeeLinea
            .fecha = kernel.strings.picaPrimerasubcadena(a)
            .hora = kernel.strings.picaPrimerasubcadena(a)
            .idasig = kernel.strings.picaPrimerasubcadena(a)
            .idperiodo = kernel.strings.picaPrimerasubcadena(a)
            .idact = Val(kernel.strings.picaPrimerasubcadena(a))
            .idprofe = kernel.strings.picaPrimerasubcadena(a)
            .idlugar = kernel.strings.picaPrimerasubcadena(a)
            .idbrigada = kernel.strings.picaPrimerasubcadena(a)
            .dia = Val(kernel.strings.picaPrimerasubcadena(a))
            .turno = Val(kernel.strings.picaPrimerasubcadena(a))
            .fija = Val(kernel.strings.picaPrimerasubcadena(a))
            .cantrecursos = Val(kernel.strings.picaPrimerasubcadena(a))
            ReDim Preserve .recursos(.cantrecursos)
            For j = 1 To .cantrecursos
                .recursos(j) = kernel.strings.picaPrimerasubcadena(a)
            Next
        End With

    Next

    'imposibles
    cantImposibles = Val(LeeLinea)
    ReDim Imposibles(cantImposibles)

    For i = 1 To cantImposibles
        interface.console.Progress "Cargando...", kernel.utils.Porciento(80 + kernel.utils.Porciento(i, cantImposibles) / 20, 100)

        With Imposibles(i)
            a = LeeLinea
            .fecha = kernel.strings.picaPrimerasubcadena(a)
            .hora = kernel.strings.picaPrimerasubcadena(a)
            .idasig = kernel.strings.picaPrimerasubcadena(a)
            .idperiodo = kernel.strings.picaPrimerasubcadena(a)
            .idact = Val(kernel.strings.picaPrimerasubcadena(a))
            .idbrigada = kernel.strings.picaPrimerasubcadena(a)
            .MAXPI = Val(kernel.strings.picaPrimerasubcadena(a))
            .RechazosXRest = Val(kernel.strings.picaPrimerasubcadena(a))
            .RechazosXProf = Val(kernel.strings.picaPrimerasubcadena(a))
            .RechazosXLug = Val(kernel.strings.picaPrimerasubcadena(a))
        End With
    Next

    'recusos
    Dim restt As TGOH_arrRestriccion
    cant = Val(LeeLinea)
    For i = 1 To cant
        interface.console.Progress "Cargando...", kernel.utils.Porciento(85 + kernel.utils.Porciento(i, cant) / 20, 100)

        Set restt = New TGOH_arrRestriccion

        a = LeeLinea

        id = kernel.strings.picaPrimerasubcadena(a)
        descrip = kernel.strings.picaPrimerasubcadena(a)
        tmp = kernel.strings.picaPrimerasubcadena(a)
        titulo = kernel.strings.picaPrimerasubcadena(a)
        
        For l = 1 To periodos.Count
            Dim p As String
            p = LeeLinea
            restt.add p
            restt(p).idperiodo = p

            For j = 1 To ct
                a = LeeLinea
                For k = 1 To CD
                    restt(p).setRest k, j, kernel.strings.picaPrimerasubcadena(a)
                Next
            Next
        Next
        recursos.add restt, id, titulo, descrip, 0, "", IIf(tmp = 1, True, False)
    Next

    'recursos por actividad
    Dim scant As Long
    scant = Val(LeeLinea)
    For i = 1 To scant
        interface.console.Progress "Cargando...", kernel.utils.Porciento(90 + kernel.utils.Porciento(i, scant) / 20, 100)
        a = LeeLinea
        Debug.Print a
        Dim asg As String, per As String, act As Long
        asg = kernel.strings.picaPrimerasubcadena(a)
        per = kernel.strings.picaPrimerasubcadena(a)
        act = Val(kernel.strings.picaPrimerasubcadena(a))
        recursosXact.add act, per, asg, New TGOH_arrGroupRest
        cant = kernel.strings.picaPrimerasubcadena(a)
        For j = 1 To cant
            Dim prioridad As Long, impresc As Boolean, necesarios As Long
            prioridad = Val(kernel.strings.picaPrimerasubcadena(a))
            impresc = IIf(Val(kernel.strings.picaPrimerasubcadena(a)) = 1, True, False)
            necesarios = Val(kernel.strings.picaPrimerasubcadena(a))
            recursosXact(recursosXact.Count).gruposRecursos.add New TAtom_arrVariant, New TAtom_arrVariant, necesarios, impresc, prioridad
            Dim canti As Long
            canti = Val(kernel.strings.picaPrimerasubcadena(a))
            For k = 1 To canti
                recursosXact(recursosXact.Count).gruposRecursos(j).recursos.add kernel.strings.picaPrimerasubcadena(a)
                recursosXact(recursosXact.Count).gruposRecursos(j).prioridades.add Val(kernel.strings.picaPrimerasubcadena(a))
            Next
        Next
    Next

    'herencia de restricciones
    
    Dim tipoA As String, tipoB As String, obja As String, objb As String
    Dim cc As Long, pp As String
    Dim h As TGOH_HRT
    
    cant = Val(LeeLinea)
    For i = 1 To cant
        interface.console.Progress "Cargando...", kernel.utils.Porciento(95 + kernel.utils.Porciento(i, cant) / 20, 100)
        a = LeeLinea
        
        tipoA = kernel.strings.picaPrimerasubcadena(a)
        obja = kernel.strings.picaPrimerasubcadena(a)
        tipoB = kernel.strings.picaPrimerasubcadena(a)
        objb = kernel.strings.picaPrimerasubcadena(a)
        
        cc = Val(LeeLinea)
        
        Set h = hrt.add(Val(tipoA), obja, Val(tipoB), objb, New TGOH_arrRestriccion)
         
        For j = 1 To cc
            pp = LeeLinea
             h.exceptoEnTiempo.add pp
            For k = 1 To ct
                a = LeeLinea
                For l = 1 To CD
                    h.exceptoEnTiempo.setRest pp, l, k, Val(kernel.strings.picaPrimerasubcadena(a))
                Next
            Next
        Next
    
    Next
    interface.console.Progress "Cargando...", 100
    Close
    
    Debug.Print Time
    Exit Sub

errdep:
    Debug.Print Err.Description
    Resume Next
End Sub


Public Function getIdGenerico(ByVal arreglo As Long, ByVal idx As Long) As String
    Dim id As String
    Select Case arreglo
        Case dPERIODO
            id = periodos(idx).id
        Case dESPECIALIDAD
            id = Especialidad(idx).id
        Case dBRIGADA
            id = Brigada(idx).comun.id
        Case dPROFE
            id = profe(idx).id
        Case dLUGAR
            id = lugar(idx).id
        Case dRECURSO
            id = recursos(idx).id
        Case dASIG
            id = asig(idx).comun.id
        Case dCLASIF
            id = clasif(idx).comun.id
    End Select
    getIdGenerico = id
End Function

'Analiza las herencias de restricciones de un objeto o las específicas heredadas de otro,
'y devuelve true si esta restringido en un periodo, dia, turno
'No se analiza la herencia transitiva. Si supone que se simule con la multiherencia no transitiva
Public Function estaRestringidoPorHerencia(idperiodo As String, dia As Long, turno As Long, tipoA As Long, idA As String, Optional tipoB As Long = 0, Optional idB As String = "", Optional quienHereda As Boolean = True) As Boolean
    Dim r As Boolean
    r = False
    
    Dim h As TGOH_HRT
    
    For Each h In hrt
        With h
          If quienHereda Then
            If .tipoObjetoA = tipoA And kernel.utils.idigual(.idObjetoA, idA) _
              And ( _
                     (.tipoObjetoB = tipoB And kernel.utils.idigual(.idObjetoB, idB)) _
                     Or tipoB = 0 Or idB = "" _
                  ) _
                  Then
                r = ((.exceptoEnTiempo.getRest(idperiodo, dia, turno) = 0) _
                    And getNativeRestriccion(.tipoObjetoB, .idObjetoB, idperiodo, dia, turno))
                If r = True Then Exit For
            End If
          Else
            If .tipoObjetoB = tipoA And kernel.utils.idigual(.idObjetoB, idA) _
              And ( _
                     (.tipoObjetoA = tipoB And kernel.utils.idigual(.idObjetoA, idB)) _
                     Or tipoB = 0 Or idB = "" _
                  ) _
                  Then
                r = (.exceptoEnTiempo.getRest(idperiodo, dia, turno) = 0) _
                    And tieneActividad(.tipoObjetoA, .idObjetoA, idperiodo, dia, turno)
                If r = True Then Exit For
            End If
          End If
        End With
    Next
    
    estaRestringidoPorHerencia = r
End Function

'verifica si un objeto tiene actividad en un per,dia,turno
Public Function tieneActividad(tipo As Long, id As String, per As String, dia As Long, turno As Long) As Boolean
    Dim i As Long, k As Long
    
    For i = 1 To cantAsignaciones
        With Asignaciones(i)
            If .dia = dia And turno = .turno And kernel.utils.idigual(per, .idperiodo) Then
                Select Case tipo
                    Case dPROFE
                        If kernel.utils.idigual(.idprofe, id) Then
                            tieneActividad = True
                            Exit Function
                        End If
                    Case dBRIGADA
                        If kernel.utils.idigual(.idbrigada, id) Then
                            tieneActividad = True
                            Exit Function
                        End If
                    Case dLUGAR
                        If kernel.utils.idigual(.idlugar, id) Then
                            tieneActividad = True
                            Exit Function
                        End If
                    Case dRECURSO
                        For k = 1 To .cantrecursos
                            If kernel.utils.idigual(.recursos(k), id) Then
                                tieneActividad = True
                                Exit Function
                            End If
                        Next
                End Select
            End If
        End With
    Next
    tieneActividad = False
End Function

'Es tan poca la probabilidad de que al aumentar la cantidad de turnos de una clasificacion
'no colapse con las restricciones existentes o sobrepase a CT que no vale la pena realizar un analisis exaustivo
'y luego actualizar las restricciones. La politica a seguir es: si existe una actividad asignada
'de esa clasif no se puede cambiar la cantidad de turnos

Public Function PosibleAumentarTurnosClasif(idclasif As String, turnos As Long) As Boolean
    Dim i As Long, icla As Long, ix As Long, iper As Long
    Dim ii As Long, v As Boolean
    
    ix = IndexById(dCLASIF, idclasif)
    
    For i = 1 To cantAsignaciones
        With Asignaciones(i)
            icla = getClasifOfActivity(.idasig, .idperiodo, .idact)
            If icla = ix Then
                PosibleAumentarTurnosClasif = False
                Exit Function
            End If
        End With
    Next
    PosibleAumentarTurnosClasif = True
End Function

Public Sub NivelarDistancias(Optional Porciento As Boolean = False)
    Dim min As Integer
    Dim ya() As Boolean
    Dim d As Integer
    Dim i As Long, j As Long
    
    Dim distans() As Long
    ReDim distans(cantLug, cantLug)
    
    For i = 1 To cantLug
        interface.console.Progress "Preparando la nivelación", i / cantLug * 100
        For j = 1 To cantLug
            If i <> j Then distans(i, j) = DistanciaEntre(lugar(i).id, lugar(j).id)
        Next
    Next
    
    ReDim ya(cantLug, cantLug)
    Dim p As Integer
    
    Dim total As Integer
    Dim parte As Integer
    total = (cantLug * cantLug - cantLug) / 2
    parte = 0
    
    Dim longitudes() As Long
    Dim mx As Long
    
    For i = 1 To cantLug
        interface.console.Progress "Nivelando...", i / cantLug * 100
        For j = i + 1 To cantLug
            Dim dd As Long
            dd = distans(i, j)
            If mx < dd Then 'mx empieza con cero, se ignoran las distancias 0
                mx = dd
                ReDim Preserve longitudes(mx)
            End If
            longitudes(dd) = 1
        Next
    Next
    
    p = 0
    Dim ultimo As Long
    For i = 1 To mx
        If longitudes(i) = 1 Then
            p = p + 1
            longitudes(i) = p
        End If
    Next

    For i = 1 To cantLug
        interface.console.Progress "Finalizando la nivelación", i / cantLug * 100
        For j = 1 To cantLug
            If i <> j Then
                If Porciento Then
                    setDistancia lugar(i).id, lugar(j).id, longitudes(distans(i, j)) / p * 100
                    setDistancia lugar(j).id, lugar(i).id, longitudes(distans(i, j)) / p * 100
                Else
                    setDistancia lugar(i).id, lugar(j).id, longitudes(distans(i, j))
                    setDistancia lugar(j).id, lugar(i).id, longitudes(distans(i, j))
                End If
            End If
        Next
    Next

End Sub

Public Function getLongArray_BrgOfGrupo(ByVal cla As String, grupo As Long, ByRef cant As Long) As Variant
    Dim ids() As Long, i As Long, j As Long
    cant = 0
    For i = 1 To cantBrg
        With Brigada(i)
            For j = 1 To .cantGxClasif
                If kernel.utils.idigual(.GrupoXClasif(j).idclasif, cla) And grupo = .GrupoXClasif(j).grupo Then
                    cant = cant + 1
                    ReDim Preserve ids(cant)
                    ids(cant) = i
                    Exit For
                End If
            Next
        End With
    Next
    getLongArray_BrgOfGrupo = ids
End Function

' Dada la matriz de costos, los nodos desde donde se parten, los nodos intermedios y los nodos hasta donde se llegan,
' se busca el nodo de los nodos intermedios que hace el camino mínimo entre los nodos desde donde se parten hasta
' donde se llegan pasando por por el.
Public Function getLugarOptimo(matrix As Variant, cant As Long, antes As Variant, cantAntes As Long, despues As Variant, cantDespues, ahora As Variant, cantAhora As Long) As Long
    Dim sumaAntes As Long, sumaDespues As Long, suma As Long
    Dim min As Long
    
    Dim primero As Boolean, mejor As Long
    
    Dim i As Long, j As Long, k As Long
    
    primero = True
    For i = 1 To cantAhora
    
        sumaAntes = 0
        For j = 1 To cantAntes
            sumaAntes = sumaAntes + matrix(antes(j), ahora(i))
        Next
    
        sumaDespues = 0
        For j = 1 To cantDespues
            sumaDespues = sumaDespues + matrix(ahora(i), despues(i))
        Next
    
        suma = sumaAntes + sumaDespues
        
        If primero Or min > suma Then
            min = suma
            mejor = i
        End If
        primero = False
    Next
    
    getLugarOptimo = mejor
    
End Function

Public Function firstWithRestTemplate(per As String, dia As Long, turno As Long) As Long
    Dim i As Long
    For i = 1 To periodos.Count
        If kernel.utils.idigual(periodos(i).template, per) Then
            If periodos(i).getTimeRequest(dia, turno) Then
                firstWithRestTemplate = IndexById(dPERIODO, periodos(i).id)
                Exit Function
            End If
        End If
    Next
    firstWithRestTemplate = 0
End Function
Public Sub switchNativeRestriccion(ByVal arreglo As Long, ByVal id As String, ByVal per As String, ByVal dia As Long, ByVal turno As Long)
    setNativeRestriccion arreglo, id, per, dia, turno, Not getNativeRestriccion(arreglo, id, per, dia, turno)
End Sub
Public Sub setNativeRestriccion(ByVal arreglo As Long, ByVal id As String, ByVal per As String, ByVal dia As Long, ByVal turno As Long, ByVal valor As Boolean, Optional ByVal cturnos As Long = 1)
    Dim idx As Long, ixp As Long, idp As Long, i As Long
    idx = IndexById(arreglo, id)
    idp = IndexById(dPERIODO, per)
   
    Select Case arreglo
        Case dPERIODO
            For i = 1 To cturnos
                periodos(idx).setTimeRequest dia, turno + i - 1, valor
            Next
        Case dESPECIALIDAD
            For i = 1 To cturnos
                ixp = IndexRestRecurso(periodos(idp).id, Especialidad(idx))
                Especialidad(idx).rest(ixp).rest(dia, turno + i - 1) = valor
            Next
        Case dCLASIF
            For i = 1 To cturnos
                ixp = IndexRestRecurso(periodos(idp).id, clasif(idx).comun)
                clasif(idx).comun.rest(ixp).rest(dia, turno + i - 1) = valor
            Next
        Case dASIG
            For i = 1 To cturnos
                ixp = IndexRestRecurso(periodos(idp).id, asig(idx).comun)
                asig(idx).comun.rest(ixp).rest(dia, turno + i - 1) = valor
            Next
        Case dBRIGADA
            For i = 1 To cturnos
                ixp = IndexRestRecurso(periodos(idp).id, Brigada(idx).comun)
                If Not Brigada(idx).comun.virtual Then Brigada(idx).comun.rest(ixp).rest(dia, turno + i - 1) = valor
            Next
        Case dPROFE
            For i = 1 To cturnos
                ixp = IndexRestRecurso(periodos(idp).id, profe(idx))
                If Not profe(idx).virtual Then profe(idx).rest(ixp).rest(dia, turno + i - 1) = valor
            Next
        Case dLUGAR
            For i = 1 To cturnos
                ixp = IndexRestRecurso(periodos(idp).id, lugar(idx))
                If Not lugar(idx).virtual Then lugar(idx).rest(ixp).rest(dia, turno + i - 1) = valor
            Next
        Case dRECURSO
            For i = 1 To cturnos
                If Not recursos(idx).virtual Then recursos(idx).setRestriccion periodos(idp).id, dia, turno + i - 1, IIf(valor, 1, 0)
            Next
    End Select
End Sub

Public Function getNativeRestriccion(ByVal arreglo As Long, ByVal id As String, ByVal per As String, ByVal dia As Long, ByVal turno As Long) As Boolean
    Dim idx As Long, ixp As Long, idp As Long
    idx = IndexById(arreglo, id)
    idp = IndexById(dPERIODO, per)
    Select Case arreglo
        Case dPERIODO
            getNativeRestriccion = periodos(idx).getTimeRequest(dia, turno)
        Case dESPECIALIDAD
            ixp = IndexRestRecurso(periodos(idp).id, Especialidad(idx))
            getNativeRestriccion = Especialidad(idx).rest(ixp).rest(dia, turno)
        Case dCLASIF:
            ixp = IndexRestRecurso(periodos(idp).id, clasif(idx).comun)
            getNativeRestriccion = clasif(idx).comun.rest(ixp).rest(dia, turno)
        Case dASIG
            ixp = IndexRestRecurso(periodos(idp).id, asig(idx).comun)
            getNativeRestriccion = asig(idx).comun.rest(ixp).rest(dia, turno)
        Case dBRIGADA
            ixp = IndexRestRecurso(periodos(idp).id, Brigada(idx).comun)
            If Brigada(idx).comun.virtual Then getNativeRestriccion = False Else getNativeRestriccion = Brigada(idx).comun.rest(ixp).rest(dia, turno)
        Case dPROFE
            ixp = IndexRestRecurso(periodos(idp).id, profe(idx))
            If profe(idx).virtual Then getNativeRestriccion = False Else getNativeRestriccion = profe(idx).rest(ixp).rest(dia, turno)
        Case dLUGAR
            ixp = IndexRestRecurso(periodos(idp).id, lugar(idx))
            If lugar(idx).virtual Then getNativeRestriccion = False Else getNativeRestriccion = lugar(idx).rest(ixp).rest(dia, turno)
        Case dRECURSO
            If recursos(idx).virtual Then getNativeRestriccion = False Else getNativeRestriccion = recursos(idx).getRestriccion(periodos(idp).id, dia, turno) > 0
    End Select
End Function
Public Function getRestriccion(ByVal arreglo As Long, ByVal id As String, ByVal per As String, ByVal dia As Long, ByVal turno As Long, Optional ByRef patronrest As String) As Boolean
    Dim normal As Boolean, herencia As Boolean, plantilla As Boolean
    Dim sobre As Boolean, espec As Boolean, dper As Boolean
    Dim idx As Long, idp As Long, ixp As Long
    Dim i As Long
    
    idx = IndexById(arreglo, id)
    idp = IndexById(dPERIODO, per)
    
    'normal
        normal = getNativeRestriccion(arreglo, id, per, dia, turno)
        
    'herencia

        herencia = estaRestringidoPorHerencia(per, dia, turno, arreglo, id)
        If Not herencia Then
            If arreglo <> dPERIODO Then
                If periodos(idp).template <> "" Then
                    herencia = estaRestringidoPorHerencia(periodos(idp).template, dia, turno, arreglo, id)
                    If herencia Then plantilla = True
                End If
            End If
        End If
    
    'plantilla
    
        If Not plantilla And idp > 0 And arreglo <> dPERIODO Then If periodos(idp).template <> "" Then plantilla = getNativeRestriccion(arreglo, id, periodos(idp).template, dia, turno)
    
    'especialidad
        'llamada recursiva sin posibilidad de bucle infinito
        'notese que se llama con arreglo=dESPECIALIDAD
        Dim pat As String
        If arreglo = dBRIGADA Then
            espec = getRestriccion(dESPECIALIDAD, Brigada(idx).idesp, per, dia, turno, pat)
            If pat = "-----P" Then espec = False
        End If
        
    'dper
        
        If arreglo <> dPERIODO Then dper = periodos(idp).getTimeRequest(dia, turno)
    
    'sobre
    
        'con respecto a las restricciones del objeto
            
            If arreglo <> dPERIODO Then
                For i = 1 To periodos.Count
                    If periodos(i).id <> per Then
                        If kernel.utils.idigual(periodos(i).template, per) Then
                            sobre = getNativeRestriccion(arreglo, id, periodos(i).id, dia, turno)
                            If sobre Then Exit For
                        End If
                    End If
                Next
            End If
        
        'con respecto a las restricciones de los periodos
            
            If Not sobre Then
                For i = 1 To periodos.Count
                    If periodos(i).id <> per Then
                        If kernel.utils.idigual(periodos(i).template, per) Then
                            sobre = getNativeRestriccion(dPERIODO, periodos(i).id, "", dia, turno)
                            If sobre Then
                                dper = True
                                Exit For
                            End If
                        End If
                    End If
                Next
            End If
        
        'con respecto a la HRT
        If arreglo = dBRIGADA Or arreglo = dESPECIALIDAD Or arreglo = dPROFE Or arreglo = dLUGAR Or arreglo = dRECURSO Then
            If Not sobre Then
                For i = 1 To periodos.Count
                    If periodos(i).id <> per Then
                        If kernel.utils.idigual(periodos(i).template, per) Then
                            sobre = estaRestringidoPorHerencia(periodos(i).id, dia, turno, arreglo, id)
                            If sobre Then
                                herencia = True
                                Exit For
                            End If
                        End If
                    End If
                Next
            End If
        End If
        
        Dim patron As String
        'patron = "NHTSEP"
        
        patron = "------"
        
        If normal Then Mid(patron, 1, 1) = "N"
        If herencia Then Mid(patron, 2, 1) = "H"
        If plantilla Then Mid(patron, 3, 1) = "T"
        If sobre Then Mid(patron, 4, 1) = "S"
        If espec Then Mid(patron, 5, 1) = "E"
        If dper Then Mid(patron, 6, 1) = "P"
                        
        patronrest = patron
        
        getRestriccion = False
        If patron <> "------" Then getRestriccion = True
        
End Function
Public Function TurnoExtremo(ByVal arreglo As Long, ByVal id As String, extremo As Long, per As Long, dia As Long) As Long

    Dim i As Long, j As Long, ini As Long, fin As Long, stp As Long
    TurnoExtremo = 0
    If extremo = 1 Then
        ini = 1
        fin = ancora.ct
        stp = 1
    Else
        fin = 1
        ini = ancora.ct
        stp = -1
    End If

    For i = ini To fin Step stp
        If getRestriccion(arreglo, id, periodos(per).id, dia, i) Then
            TurnoExtremo = i
            Exit Function
        End If

    Next
End Function

Public Function getGrupoXClasifOf(idbrg As String, cla As String) As Long
    Dim ix As Long, i As Long
    ix = IndexById(dBRIGADA, idbrg)
    For i = 1 To Brigada(ix).cantGxClasif
        If kernel.utils.idigual(Brigada(ix).GrupoXClasif(i).idclasif, cla) Then
            getGrupoXClasifOf = Brigada(ix).GrupoXClasif(i).grupo
            Exit Function
        End If
    Next
    getGrupoXClasifOf = 0
End Function
Public Function getBrigadasDeGrupo(clasifa As Long, esp As String, Nivel As Long, grupo As Long, ByRef cant As Long) As Variant

    Dim j As Long, igc As Long, g As Long, lista() As Long
    
    cant = 0
    
    For j = 1 To ancora.cantBrg
        igc = IndexGrupoxClasif(j, clasif(clasifa).comun.id)
        If igc <> 0 Then g = Brigada(j).GrupoXClasif(igc).grupo
        If kernel.utils.idigual(Brigada(j).idesp, esp) And Brigada(j).Nivel = Nivel And grupo = g Then
            cant = cant + 1
            ReDim Preserve lista(cant)
            lista(cant) = j
        End If
    Next

    getBrigadasDeGrupo = lista
End Function
Public Function getProfesParaActividad(ByVal asg As String, ByVal per As String, ByVal act As Long, ByVal grupo As Long, ByRef cant As Long, Optional update_hash As Boolean = False) As Variant
    Dim lista() As Long, i As Long
    cant = 0
    
    If update_hash Then updateHashPxAct
    
    If Not hashPxact Is Nothing Then
        If Not hashPxact(asg) Is Nothing Then
            If Not hashPxact(asg).idper(per) Is Nothing Then
                If Not hashPxact(asg).idper(per).idact("" & act) Is Nothing Then
                    
                    Dim it As TKernel_HashPxAct_idprofes
                    
                    For Each it In hashPxact(asg).idper(per).idact("" & act).idprofes
                        For i = 1 To ProfeXAct(it.index).cantGrupos
                            If ProfeXAct(it.index).grupos(i) = grupo Then
                                cant = cant + 1
                                ReDim Preserve lista(cant)
                                lista(cant) = IndexById(dPROFE, ProfeXAct(it.index).idprofes)
                            End If
                        Next
                    Next
                    
                End If
            End If
        End If
    End If
    getProfesParaActividad = lista
End Function
Public Function getLugaresParaActividad(ByVal asg As String, ByVal per As String, ByVal act As Long, ByRef cant As Long, Optional update_hash As Boolean = False) As Variant
    Dim lista() As Long, i As Long
    cant = 0
    
    If update_hash Then updateHashLxAct
    
    If Not hashLxact Is Nothing Then
        If Not hashLxact(asg) Is Nothing Then
            If Not hashLxact(asg).idper(per) Is Nothing Then
                If Not hashLxact(asg).idper(per).idact(act) Is Nothing Then
                    Dim ix As Long
                    ix = hashLxact(asg).idper(per).idact("" & act).index
                    cant = LugXact(ix).cantLug
                    ReDim lista(cant)
                    For i = 1 To cant
                        lista(i) = IndexById(dLUGAR, LugXact(ix).idlug(i))
                    Next
                End If
            End If
        End If
    End If
    getLugaresParaActividad = lista
End Function
Public Function getIndexesRecursosParaActividad(ByVal asg As String, ByVal per As String, ByVal act As Long, ByRef cant As Long) As Variant
    Dim lista() As Long, i As Long
    Dim it As TGOH_RecursoXAct
    cant = 0
    i = 0
    For Each it In recursosXact
       i = i + 1
        If it.act = act And kernel.utils.idigual(it.asg, asg) And kernel.utils.idigual(it.per, per) Then
            cant = cant + 1
            ReDim lista(cant)
            lista(cant) = i
        End If
    Next
    getIndexesRecursosParaActividad = lista
End Function

Public Function getPosiblesInicios(ByVal asg As String, ByVal per As String, ByVal act As Long, ByVal brg As String, Optional zpriori As Long = 0, Optional update_hash_asignaciones As Boolean = False, Optional update_hash_pxact As Boolean = False, Optional update_hash_lxact As Boolean = False) As Variant
    
    Dim matrix() As Boolean
    Dim cla As Long, ibrg As Long, g As Long
    Dim brgs() As Long, cbrgs As Long
    Dim prfs() As Long, cprfs As Long
    Dim lugs() As Long, clugs As Long
    Dim recs() As Long, crecs As Long
    Dim iasg As Long
    Dim cc As Long, i As Long, j As Long, k As Long
    Dim respeta As Boolean, mismodia As Boolean
    Dim cantact As Long
    Dim min As Long
    Dim max As Long
    Dim bebe As String, pd As Long
    
    iasg = IndexById(dASIG, asg)
    pd = IndexById(dDESGLOSE, per, iasg)
    
    With asig(iasg).desglose(pd)
        respeta = .RespetarOrden
        mismodia = .mismodia
        cantact = .cantact
        min = .min
        max = .max
    End With
    
    ibrg = IndexById(dBRIGADA, brg)
    cla = getClasifOfActivity(asg, per, act)
    g = getGrupoXClasifOf(brg, clasif(cla).comun.id)
    brgs = getBrigadasDeGrupo(cla, Brigada(ibrg).idesp, Brigada(ibrg).Nivel, g, cbrgs)
    prfs = getProfesParaActividad(asg, per, act, g, cprfs, update_hash_pxact)
    lugs = getLugaresParaActividad(asg, per, act, clugs, update_hash_lxact)
    recs = getIndexesRecursosParaActividad(asg, per, act, crecs)
    
    ReDim matrix(ancora.CD, ancora.ct)
    
    If update_hash_asignaciones Then updatehash_asignaciones_asig
        
    Dim pdias() As Boolean
    ReDim pdias(CD)
    For i = 1 To CD
        pdias(i) = True
    Next
    
    'RANGO DE DIAS
    
    'para todas las brigadas implicadas
    For k = 1 To cbrgs
        
        bebe = brgs(k)
        
        'si se respeta el orden
            
        If respeta Then
            'deshabilito  los días desde el día 1 al día de
            'la actividad anterior más próxima colocada
            Dim key As String
            For i = act - 1 To 1 Step -1
                key = asg & "_" & per & "_" & i & "_" & bebe
                If Not hashAsignaciones_asig(key) Is Nothing Then
                    For j = Asignaciones(hashAsignaciones_asig(key).value).dia + min * (act - i) To 1 Step -1
                        pdias(j) = False
                    Next
                    For j = Asignaciones(hashAsignaciones_asig(key).value).dia + max * (act - i) To CD
                        pdias(j) = False
                    Next
                    Exit For
                End If
            Next
            'deshabilito los días desde el día de la actividad siguiente
            'más próxima colocada hasta CD
            For i = act + 1 To cantact
                key = asg & "_" & per & "_" & i & "_" & bebe
                If Not hashAsignaciones_asig(key) Is Nothing Then
                    For j = Asignaciones(hashAsignaciones_asig(key).value).dia - min * (i - act) To CD
                        pdias(j) = False
                    Next
                    For j = Asignaciones(hashAsignaciones_asig(key).value).dia - max * (i - act) To 1 Step -1
                        pdias(j) = False
                    Next
                    Exit For
                End If
            Next
        Else
           ' si no se respeta el orden solo es importante analizar cuando no
           ' se permiten actividades un mismo día y se deshabilitan los días
           ' que ya tiene actividad
           If Not mismodia Then
                For i = 1 To cantact
                    key = asg & "_" & per & "_" & i & "_" & bebe
                    If Not hashAsignaciones_asig(key) Is Nothing Then
                        pdias(Asignaciones(hashAsignaciones_asig(key).value).dia) = False
                    End If
                Next
           End If
        End If
    Next
    
    Dim d As Long, t As Long
    
    For d = 1 To CD
        If pdias(d) Then
            For t = 1 To ct
                For i = 1 To clasif(cla).ct
                    Dim v As Boolean
                    
                    v = True
                    
                    'todas las brigadas deben estar habilitadas
                    
                    For j = 1 To cbrgs
                        v = v And Not getRestriccion(dBRIGADA, Brigada(brgs(j)).comun.id, per, d, t + i - 1)
                        If v = False Then GoTo salta
                    Next
                    
                    'al menos un profe
                    
                    
                    cc = cprfs
                    For j = 1 To cprfs
                        If getRestriccion(dPROFE, profe(prfs(j)).id, per, d, t + i - 1) Then cc = cc - 1
                        If cc = 0 Then
                            v = False
                            GoTo salta
                        End If
                    Next
                    
                    
                    'al menos un lugar
                    
                    cc = clugs
                    For j = 1 To clugs
                        If getRestriccion(dLUGAR, lugar(lugs(j)).id, per, d, t + i - 1) Then cc = cc - 1
                        If cc = 0 Then
                            v = False
                            GoTo salta
                        End If
                    Next
                                                    
                    'todos los recursos imprescindibles deben estar habilitados
                    
                    Dim gr As TGOH_GroupRest, rc As TAtom_Variant
                    
                    For j = 1 To crecs
                        For Each gr In recursosXact(i).gruposRecursos
                            If gr.imprescindibles Then
                                cc = gr.cantNecesarios
                                For Each rc In gr.recursos
                                    If getRestriccion(dRECURSO, "" & rc.value, per, d, t + i - 1) Then cc = cc - 1
                                        If cc = 0 Then
                                            v = False
                                            GoTo salta
                                        End If
                                Next
                            End If
                        Next
                    Next
                    
                    
                Next
salta:
                matrix(d, t) = v
            Next
        End If
    Next
    
    getPosiblesInicios = matrix
End Function
Public Sub updatehash_asignaciones_asig()
    Dim i As Long
    
    Set hashAsignaciones_asig = Nothing
    Set hashAsignaciones_asig = New TAtom_arrVariant
    
    For i = 1 To cantAsignaciones
        With Asignaciones(i)
            hashAsignaciones_asig.add i, .idasig & "_" & .idperiodo & "_" & .idact & "_" & .idbrigada
        End With
    Next
End Sub

Public Sub addNivel()
    If cantNiveles > 99 Then
        interface.MessageDlg "Agregando nivel...", "No se pueden agregar más de 100 niveles", vbInformation, "Aceptar"
        Exit Sub
    End If
    cantNiveles = cantNiveles + 1
End Sub

Public Sub deleteNivel(ByVal Nivel As Long)
    Dim i As Long, id As String, a As Long, ini As Long
    If cantNiveles = 0 Then Exit Sub
    ini = 1
restart:
    For i = ini To cantBrg
        a = Brigada(i).Nivel
        If a = Nivel Then
            id = Brigada(i).comun.id
            deleteBrigada id
            ini = i
            GoTo restart
        End If
    Next
    ini = 1
restar:
    For i = ini To cantAsig
        a = asig(i).Nivel
        If a = Nivel Then
            id = asig(i).comun.id
            deleteAsignatura id
            ini = i
            GoTo restar
        End If
    Next
    For i = 1 To cantBrg
        If Brigada(i).Nivel > Nivel Then Brigada(i).Nivel = Brigada(i).Nivel - 1
    Next
    For i = 1 To cantAsig
        If asig(i).Nivel > Nivel Then asig(i).Nivel = asig(i).Nivel - 1
    Next
    cantNiveles = cantNiveles - 1
End Sub
