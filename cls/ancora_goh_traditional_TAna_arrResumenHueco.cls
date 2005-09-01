VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "TAna_arrResumenHueco"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Collection" ,"TAna_ResumenHueco"
Attribute VB_Ext_KEY = "Member0" ,"TAna_ResumenHueco"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"489BC2EF0040"
Option Explicit
Private mCol As Collection

Public Function add(profes As TAtom_arrVariant, lugares As TAtom_arrVariant, brigadas As TAtom_arrVariant, recursos As TAtom_arrVariant, dia As Long, turno As Long, periodo As String, Optional sKey As String) As TAna_ResumenHueco
    Dim objNewMember As TAna_ResumenHueco
    Set objNewMember = New TAna_ResumenHueco

    Set objNewMember.profes = profes
    Set objNewMember.lugares = lugares
    Set objNewMember.brigadas = brigadas
    Set objNewMember.recursos = recursos
    objNewMember.dia = dia
    objNewMember.turno = turno
    objNewMember.periodo = periodo
    If Len(sKey) = 0 Then
        mCol.add objNewMember
    Else
        mCol.add objNewMember, sKey
    End If
    Set add = objNewMember
    Set objNewMember = Nothing
End Function

Public Property Get Item(vntIndexKey As Variant) As TAna_ResumenHueco
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

