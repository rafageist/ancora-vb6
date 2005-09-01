VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "TAna_arrRecursos"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
Attribute VB_Ext_KEY = "Collection" ,"TAna_Recursos"
Attribute VB_Ext_KEY = "Member0" ,"TAna_Recursos"
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"489BC2C201AE"
Option Explicit

Private mCol As Collection

Public Function add(idasig As String, idper As String, idact As Long, idclasif As String, sinLugar As Boolean, sinProfe As Boolean, gruposSinProfe As String, Optional sKey As String) As TAna_Recursos
    Dim objNewMember As TAna_Recursos
    Set objNewMember = New TAna_Recursos

    objNewMember.idasig = idasig
    objNewMember.idper = idper
    objNewMember.idact = idact
    objNewMember.idclasif = idclasif
    objNewMember.sinLugar = sinLugar
    objNewMember.sinProfe = sinProfe
    objNewMember.gruposSinProfe = gruposSinProfe

    If Len(sKey) = 0 Then
        mCol.add objNewMember
    Else
        mCol.add objNewMember, sKey
    End If

    Set add = objNewMember
    Set objNewMember = Nothing

End Function
Public Property Get Item(vntIndexKey As Variant) As TAna_Recursos
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

