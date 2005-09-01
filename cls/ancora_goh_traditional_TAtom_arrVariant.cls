VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "TAtom_arrVariant"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Collection" ,"TAtom_Variant"
Attribute VB_Ext_KEY = "Member0" ,"TAtom_Variant"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"489BC2C501B2"
Option Explicit
Private mCol As Collection

Public Function add(value As Variant, Optional sKey As String) As TAtom_Variant

    Dim objNewMember As TAtom_Variant

    Set objNewMember = New TAtom_Variant

    If IsObject(value) Then
        Set objNewMember.value = value
    Else
        objNewMember.value = value
    End If
    If Len(sKey) = 0 Then
        mCol.add objNewMember
    Else
        mCol.add objNewMember, sKey
    End If

    Set add = objNewMember

End Function
Public Property Get Item(vntIndexKey As Variant) As TAtom_Variant
Attribute Item.VB_UserMemId = 0
On Error Resume Next
  Set Item = mCol(vntIndexKey)
End Property
Public Property Get Count() As Long
    Count = mCol.Count
End Property
Public Sub Remove(vntIndexKey As Variant)
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

Function getidxByValue(value As Variant) As Long
    Dim i As Long
    For i = 1 To Count
        If kernel.utils.idigual("" & value, "" & Item(i).value) Then
            getidxByValue = i
            Exit Function
        End If
    Next
End Function
