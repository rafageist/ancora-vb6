VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "TarrPeriodo"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Collection" ,"TPeriodo"
Attribute VB_Ext_KEY = "Member0" ,"TPeriodo"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"489BC2600239"

     Private mCol As Collection
     Public Function add(id As String, descrip As String, timerequest As TarrRowRest, Caption As String, template As String, Optional sKey As String) As TPeriodo
          Dim objNewMember As TPeriodo
          Set objNewMember = New TPeriodo
          objNewMember.id = id
          objNewMember.descrip = descrip
          Set objNewMember.timerequest = timerequest
          objNewMember.Caption = Caption
          objNewMember.template = template
          If Len(sKey) = 0 Then
               mCol.add objNewMember, id
          Else
               mCol.add objNewMember, sKey
          End If

          Set add = objNewMember
          Set objNewMember = Nothing
     End Function

     Public Property Get Item(vntIndexKey As Variant) As TPeriodo
Attribute Item.VB_UserMemId = 0
          On Error GoTo errdep
          Set Item = mCol(vntIndexKey)

finish:
Exit Property
errdep:
          Debug.Print "error: TarrPeriod.Item(index) - No existe periodo"
          Resume finish
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

