VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "TAtom_arrMatrixVariant"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Collection" ,"TAtom_matrixVariant"
Attribute VB_Ext_KEY = "Member0" ,"TAtom_matrixVariant"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"489BC2E5017C"
Option Explicit
Private mCol As Collection
Public Function add(column As TAtom_arrVariant, Optional sKey As String) As TAtom_matrixVariant
    Dim objNewMember As TAtom_matrixVariant
    Set objNewMember = New TAtom_matrixVariant

    Set objNewMember.column = column

    If Len(sKey) = 0 Then
        mCol.add objNewMember
    Else
        mCol.add objNewMember, sKey
    End If
    Set add = objNewMember
    Set objNewMember = Nothing
End Function
Public Property Get Item(vntIndexKey As Variant) As TAtom_matrixVariant
Attribute Item.VB_UserMemId = 0
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
