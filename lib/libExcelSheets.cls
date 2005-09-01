VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "libExcelSheets"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
'Herramientas para el trabajo con hojas de calculo de OfficeWeb Components
Option Explicit
'Devuelve el numero de la columna segun la letra
Public Function NumberOfColumn(cc As String) As Long
    Dim i As Long, c As String
    c = "A"
    i = 1
    While c <> cc
        i = i + 1
        c = NextColumn(c)
    Wend
    NumberOfColumn = i
End Function

'Devuelve la letra de la columna siguiente segun una actual
Public Function NextColumn(Celda As String) As String

    If Len(Celda) = 1 And Celda < "Z" Then
        NextColumn = Chr(Asc(Celda) + 1)
        Exit Function
    End If

    If Celda = "Z" Then
        NextColumn = "AA"
        Exit Function
    End If

    If Len(Celda) = 2 Then
        If Mid(Celda, 2, 1) < "Z" Then
            NextColumn = Mid(Celda, 1, 1) + Chr(Asc(Mid(Celda, 2, 1)) + 1)
            Exit Function
        Else
            NextColumn = Chr(Asc(Mid(Celda, 1, 1)) + 1) + "A"
        End If

    End If

End Function

'Verifica que una fecha sea correcta
Public Function CheckDate(fecha As String) As Boolean
    Dim tmp As String

    On Error GoTo errdep

    tmp = Date$
10: Date$ = fecha
    Date$ = tmp
    CheckDate = True
    Exit Function
errdep:
If Erl = 10 Then CheckDate = False
    Resume Next
End Function

'Devuelve la letra de una columna segun el numero
Public Function CharacterOfColumn(n As Long) As String

    Dim i As Long, cc As String
    cc = "A"

    For i = 2 To n
        cc = NextColumn(cc)
    Next

    CharacterOfColumn = cc
End Function


