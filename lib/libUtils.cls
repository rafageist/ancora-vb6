VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "libUtils"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
Option Explicit
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'' libreria de utilidades
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'genera una secuencia aleatoria de n caracteres
Public Function GenerateIDString(n As Long, Optional validchars As String = "1234567890abcdefghijklmnopqrstuvwxyz") As String
    Dim id As String, i As Long
    id = ""

    For i = 1 To n
        Randomize Timer
        id = id + Mid(validchars, 1 + Int(Rnd * Len(validchars)), 1)
    Next

    GenerateIDString = id
End Function

'remplaza los caracteres 0 por espacios y trunca
Public Function trunca(s As Variant) As String
    Dim p As String * 1, i As Long
    s = Replace(s, p, " ")
    trunca = Trim(s)
End Function

'compara dos strings truncando los espacios y llevandolos a minuscula
Public Function idigual(str1 As String, str2 As String) As Boolean
    idigual = (trunca(LCase(str1)) = trunca(LCase(str2)))
End Function

'devuelve la posicion de un elemento en un arreglo
Public Function getIdxFromArrayByValue(arr As Variant, value As Variant, cant As Long) As Long
    Dim i As Long
    For i = 1 To cant
        If "" & arr(i) = "" & value Then
            getIdxFromArrayByValue = i
            Exit Function
        End If
    Next
End Function

Public Function Porciento(ByVal parte As Long, ByVal todo As Long) As Long
    If todo = 0 Then
        Porciento = 0
        Exit Function
    End If
    Porciento = parte / todo * 100
End Function

Public Function max(x As Long, y As Long) As Long
    If x > y Then
        max = x
        Exit Function
    End If

    max = y
End Function
Public Function min(x As Long, y As Long) As Long
    If x < y Then
        min = x
        Exit Function
    End If

    min = y
End Function
