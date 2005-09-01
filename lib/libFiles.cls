VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "libFiles"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
Option Explicit

Public Function ExisteFichero(path As String) As Boolean

    On Error GoTo errdep
10:         Open path For Input As #9
    ExisteFichero = True
    Close 9
finish:
    Exit Function

errdep:
    Resume finish
End Function

Public Function getDirectorioFromPath(ByVal path As String) As String
    Dim i As Long
    For i = Len(path) To 1 Step -1
        If Mid(path, i, 1) = "\" Then
            getDirectorioFromPath = Mid(path, 1, i - 1)
            Exit For
        End If

    Next
End Function

Public Function getFileFromPath(ByVal path As String) As String
    Dim i As Long
    For i = Len(path) To 1 Step -1
        If Mid(path, i, 1) = "\" Then
            getFileFromPath = Mid(path, i + 1)
            Exit For
        End If

    Next
End Function
