VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "TarrCellRest"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Collection" ,"TCellRest"
Attribute VB_Ext_KEY = "Member0" ,"TCellRest"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"489BC25F004D"

     Private mCol As Collection
     Public Function add(value As Long, Optional sKey As String) As TCellRest
          On Error Resume Next
          Dim objNewMember As TCellRest
          Set objNewMember = New TCellRest
          objNewMember.value = value
          If Len(sKey) = 0 Then
               mCol.add objNewMember
          Else
               mCol.add objNewMember, sKey
          End If

          Set add = objNewMember
          Set objNewMember = Nothing
     End Function

     Public Property Get Item(vntIndexKey As Variant) As TCellRest
Attribute Item.VB_UserMemId = 0

          On Error GoTo errdep

10
          Set Item = mCol(vntIndexKey)
          Exit Property
errdep:

          add 0, "" & vntIndexKey
          Resume 10

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

