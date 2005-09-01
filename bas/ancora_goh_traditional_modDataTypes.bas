Attribute VB_Name = "modDataTypes"
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"489BC237024E"
Option Explicit

'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'                              Mis tipos de datos                             '
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

Type TRestriccion
    rest(1 To MAX_DIAS, 1 To MAX_TURNOS) As Boolean
    idperiodo As String
End Type

Type TRecurso
    id As String
    descrip As String
    rest() As TRestriccion
    virtual As Boolean
    titulo As String
    capacidad As Long
End Type

Type TZPriori
    idperiodo As String
    rest(1 To MAX_DIAS, 1 To MAX_TURNOS) As Byte
End Type

Type TClasif
    comun As TRecurso
    ct As Long
    continuos As Boolean
    zpriori() As TZPriori
End Type

Type TActividad
    idclasif As String
    cantProfesNecesarios As Long
    cantLugaresNecesarios As Long
End Type

Type TDesglose
    act(1 To MAX_ACT) As TActividad
    idperiodo As String
    cantact As Long
    RespetarOrden As Boolean
    min As Byte
    max As Byte
    mismodia As Boolean
End Type

Type TAsig
    comun As TRecurso
    idesp As String
    Nivel As Long
    desglose() As TDesglose
    examenes As String
End Type

Type TAsignaRecurso
    idasig As String
    idact As Long
    idper As String
End Type

Type TGxClasif
    idclasif As String
    grupo As Long
End Type

Type TBrigada
    comun As TRecurso
    idesp As String
    Nivel As Long
    cantGxClasif As Long
    GrupoXClasif() As TGxClasif
    matricula As Long
End Type
Type TLugarXAct
    para As TAsignaRecurso
    cantLug As Long
    idlug() As String
    idxlug() As Long
    priori() As Long
End Type
Type TProfeXAct
    para As TAsignaRecurso
    idprofes As String
    idxprofe As Long
    cantGrupos As Long
    grupos() As Long
End Type

Type TActAsignada
    dia As Long
    turno As Long
    idprofe As String
    idasig As String
    idact As Long
    idlugar As String
    idperiodo As String
    idbrigada As String
    lugs() As String
    profes() As String
    cantProfes As Long
    cantLugs() As Long
    fecha As String
    hora As String * 8
    fija As Boolean
    recursos() As String
    cantrecursos As Long
End Type
Type TImposible
    idasig As String
    idact As Long
    idbrigada As String
    idperiodo As String
    fecha As String
    hora As String * 8
    MAXPI As Long
    RechazosXRest As Long
    RechazosXProf As Long
    RechazosXLug As Long
End Type
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
Type TImprimir
    esp As Long
    Nivel As Long
    per As Long
    tipo As Long
    id As Long
End Type

Type TGenerando
    cantBrg As Long
    id() As Long
    brgs As TFiltro
End Type

'Devuelve el indice en el arreglo de restricciones por periodo segun el idperiodo
Public Function IndexRestRecurso(per As String, ByRef rest As TRecurso) As Long
    Dim i As Long
    'reparaRest rest
    ReDim Preserve rest.rest(ancora.periodos.Count)
    For i = 1 To ancora.periodos.Count
        If kernel.utils.idigual(rest.rest(i).idperiodo, per) Then
            IndexRestRecurso = i
            Exit Function
        End If

    Next

    IndexRestRecurso = 0
End Function

