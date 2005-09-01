VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "TarrRowRest"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Member0" ,"TRowRest"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"489BC25F03B4"

     Private mCol As Collection
     Public Function add(values As TarrCellRest, Optional sKey As String) As TRowRest
          Dim objNewMember As TRowRest
          Set objNewMember = New TRowRest
          If values Is Nothing Then Set values = New TarrCellRest
          Set objNewMember.values = values
          If Len(sKey) = 0 Then
               mCol.add objNewMember
          Else
               mCol.add objNewMember, sKey
          End If

          Set add = objNewMember
          Set objNewMember = Nothing
     End Function

     Public Property Get Item(vntIndexKey As Variant) As TRowRest
Attribute Item.VB_UserMemId = 0

          On Error GoTo errdep

10
          Set Item = mCol(vntIndexKey)
          Exit Property
errdep:
          If Erl = 10 Then
               add Nothing, "" & vntIndexKey
               Resume 10
          End If

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

