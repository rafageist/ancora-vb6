VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "TKernel_Hash_arrIndexOf"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Collection" ,"TKernel_Hash_IndexOf"
Attribute VB_Ext_KEY = "Member0" ,"TKernel_Hash_IndexOf"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"489BC2E002F2"
Option Explicit
Private mCol As Collection
Public Function add(id As String, idx As Long) As TKernel_Hash_IndexOf
    Dim objNewMember As TKernel_Hash_IndexOf
    Set objNewMember = New TKernel_Hash_IndexOf
    objNewMember.id = id
    objNewMember.idx = idx
    mCol.add objNewMember, id
    Set add = objNewMember
    Set objNewMember = Nothing
End Function
Public Property Get Item(vntIndexKey As Variant) As TKernel_Hash_IndexOf
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
Public Function existe(id As String) As Boolean
    On Error GoTo errdep
    Dim it As TKernel_Hash_IndexOf
    Set it = mCol(id)
    existe = True
finish:
    Exit Function
errdep:
    existe = False
    Resume finish
End Function
