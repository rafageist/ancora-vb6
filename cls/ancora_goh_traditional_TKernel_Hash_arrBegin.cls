VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "TKernel_Hash_arrBegin"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Collection" ,"TKernel_Hash_Begin"
Attribute VB_Ext_KEY = "Member0" ,"TKernel_Hash_Begin"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"489BC2E20182"
Option Explicit
Private mCol As Collection
Public Function add(BeginWith As Byte, IndexOf As TKernel_Hash_arrIndexOf) As TKernel_Hash_Begin
    Dim objNewMember As TKernel_Hash_Begin
    Set objNewMember = New TKernel_Hash_Begin
    objNewMember.BeginWith = BeginWith
    Set objNewMember.IndexOf = IndexOf
    mCol.add objNewMember, "" & BeginWith
    Set add = objNewMember
    Set objNewMember = Nothing
End Function
Public Property Get Item(vntIndexKey As Variant) As TKernel_Hash_Begin
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

