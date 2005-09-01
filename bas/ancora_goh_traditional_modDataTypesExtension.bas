Attribute VB_Name = "modDataTypesExtension"
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"489BC24302F6"
Option Explicit
Type TGrafo
    cantNodos As Long
    matrix() As Long
End Type
Type TCasDistancia
    id As String
    dist As Long
End Type
Type TFilaDistancia
    colum() As TCasDistancia
    id As String
End Type
Type TAccesoProhibido
    idclasif As String
    idgrupo As Long
    idlugs() As String
    cantLugs As Long
End Type
Type TAulaFija
    idclasif As String
    idgrupo As Long
    idlug As String
End Type
Type Tgeneraciones
    idesp As String
    idper As String
    Nivel As Long
    fecha As String
End Type
Type TMuestraSubBrigadas
    num As Long
    prof As String
    lug As String
End Type
Type TAsignaLugar
    idlugar As String
    priori As Long
End Type
Type TAsignaProfes
    idprofe As String
    priori As Long
    grupos() As Long
    cantGrupos As Long
End Type
Type TActiv
    idclasif As String
    idlugares() As TAsignaLugar
    cantLug As Long
    idprofes() As TAsignaProfes
End Type
Type TDesgloseAct
    act() As TActiv
    idperiodo As String
    cantact As Long
    RespetarOrden As Boolean
    min As Byte
    max As Byte
    mismodia As Boolean
End Type
Type TAsignatura
    comun As TRecurso
    idesp As String
    Nivel As Long
    desglose() As TDesgloseAct
    examenes As String
End Type
Type TWorkRecursos
    idasig As Long
    idper As Long
    idact As Long
    idclasif As Long
    idlugares() As TAsignaLugar
    cantLug As Long
    idprofes() As TAsignaProfes
End Type
Type TResumenHueco
    idlug() As Long
    idbrg() As Long
    idprof() As Long
    idres() As Long
    cantLug As Long
    cantBrg As Long
    cantprof As Long
    cantres As Long
End Type
Type TResumenRestricc
    dato As Long
    parte As Long
    cantidad As Long
End Type

