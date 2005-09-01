VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "TCacheID"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Collection" ,"TIdent"
Attribute VB_Ext_KEY = "Member0" ,"TIdent"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"489BC2AD0077"

     Private mCol As Collection
     Public Function add(id As String, idx As Long, Optional sKey As String) As TIdent

          If Item(id).idx = -1 Then
               Dim objNewMember As TIdent
               Set objNewMember = New TIdent
               objNewMember.idx = idx
               objNewMember.id = id
               mCol.add objNewMember, id
               Set add = objNewMember
               Set objNewMember = Nothing
          End If

     End Function

     Public Property Get Item(vntIndexKey As Variant) As TIdent
Attribute Item.VB_UserMemId = 0

          On Error GoTo errdep

10:
          Set Item = mCol(vntIndexKey)
20
          Exit Property
errdep:
          If Erl = 10 Then
               Set Item = New TIdent
               Item.idx = -1
               Resume 20
          End If

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

