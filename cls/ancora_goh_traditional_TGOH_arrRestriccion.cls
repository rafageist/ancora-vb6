VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "TGOH_arrRestriccion"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Collection" ,"TGOH_Restriccion"
Attribute VB_Ext_KEY = "Member0" ,"TGOH_Restriccion"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"489BC2C70007"
Option Explicit
Private mCol As Collection

Public Function add(idperiodo As String) As TGOH_Restriccion
    Dim objNewMember As TGOH_Restriccion
    Set objNewMember = New TGOH_Restriccion

    objNewMember.idperiodo = idperiodo
    mCol.add objNewMember, idperiodo

    Set add = objNewMember
    Set objNewMember = Nothing

End Function
Public Property Get Item(vntIndexKey As Variant) As TGOH_Restriccion
Attribute Item.VB_UserMemId = 0
  On Error Resume Next
  Set Item = mCol(vntIndexKey)
End Property
Public Property Get Count() As Long
    Count = mCol.Count
End Property
Public Sub Remove(vntIndexKey As Variant)
    On Error Resume Next
    mCol.Remove vntIndexKey
End Sub
Public Property Get NewEnum() As IUnknown
Attribute NewEnum.VB_UserMemId = -4
    Set NewEnum = mCol.[_NewEnum]
End Property
Private Sub Class_Initialize()
    Set mCol = New Collection
End Sub
Private Sub Class_Terminate()
    Set mCol = Nothing
End Sub
Public Function getRest(ByVal idperiod As String, ByVal dia As Long, ByVal turno As Long) As Long
    If Item(idperiod) Is Nothing Then
        getRest = 0
        Exit Function
    End If
    getRest = Item(idperiod).rest(dia, turno)
End Function
Public Function setRest(ByVal idperiod As String, ByVal dia As Long, ByVal turno As Long, ByVal value As Long)
    Item(idperiod).setRest dia, turno, value
End Function

Public Sub setPeriod(ByVal idperiod As String, ByVal newperiod As String, Optional ByVal countdays As Long = MAX_DIAS, Optional ByVal countturns As Long = MAX_TURNOS)
    If idperiod <> newperiod Then
            add newperiod
            Dim i As Long, j As Long
            For i = 1 To countdays
                For j = 1 To countturns
                    Item(newperiod).setRest i, j, Item(idperiod).rest(i, j)
                Next
            Next
            Remove idperiod
    End If
End Sub
