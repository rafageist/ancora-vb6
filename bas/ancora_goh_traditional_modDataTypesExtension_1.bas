Attribute VB_Name = "modDataTypesExtension_1"
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"489BC2390251"
Option Explicit
Public Const MAX_SELECCION = 50
Type TSeleccionInfo
    modo As Long
    cant As Long
    id() As String
    descrip() As String
End Type
Type TArrInt
    cant As Long
    arr(1 To MAX_DIAS) As Long
End Type
'Para el resultado del proceso
Type TCasilla
    idprofe As String
    idasig As String
    idact As Long
    idlugar As String
End Type
Type TRecursoPorSubGrupo
    idprofe As Long
    idlugar As Long
End Type
