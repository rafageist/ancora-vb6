VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "TKernel_HashCollection"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Collection" ,"TKernel_Hash"
Attribute VB_Ext_KEY = "Member0" ,"TKernel_Hash"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"489BC2E303DC"
Option Explicit
Private mCol As Collection
Public Function add(arreglo As Long, BeginWith As TKernel_Hash_arrBegin) As TKernel_Hash
    Dim objNewMember As TKernel_Hash
    Set objNewMember = New TKernel_Hash
    objNewMember.arreglo = arreglo
    Set objNewMember.BeginWith = BeginWith
    mCol.add objNewMember, "" & arreglo
    Set add = objNewMember
    Set objNewMember = Nothing
End Function
Public Property Get Item(vntIndexKey As Variant) As TKernel_Hash
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

