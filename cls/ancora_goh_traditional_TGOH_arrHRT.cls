VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "TGOH_arrHRT"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Collection" ,"TGOH_HRT"
Attribute VB_Ext_KEY = "Member0" ,"TGOH_HRT"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
Option Explicit

Private mCol As Collection

Public Function add(tipoObjetoA As Long, idObjetoA As String, tipoObjetoB As Long, idObjetoB As String, exceptoEnTiempo As TGOH_arrRestriccion, Optional sKey As String) As TGOH_HRT
    Dim objNewMember As TGOH_HRT
    Set objNewMember = New TGOH_HRT

    Set objNewMember.exceptoEnTiempo = exceptoEnTiempo
    objNewMember.idObjetoB = idObjetoB
    objNewMember.idObjetoA = idObjetoA
    objNewMember.tipoObjetoB = tipoObjetoB
    objNewMember.tipoObjetoA = tipoObjetoA
    
    
    If Len(sKey) = 0 Then
        mCol.add objNewMember
    Else
        mCol.add objNewMember, sKey
    End If
    
    Set add = objNewMember
    Set objNewMember = Nothing
    
End Function

Public Property Get Item(vntIndexKey As Variant) As TGOH_HRT
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
Attribute NewEnum.VB_MemberFlags = "40"
    Set NewEnum = mCol.[_NewEnum]
End Property
Private Sub Class_Initialize()
    Set mCol = New Collection
End Sub
Private Sub Class_Terminate()
    Set mCol = Nothing
End Sub

Public Sub deleteRelativoA(tipo As Long, id As String)
        Dim h As TGOH_HRT, i As Long
restart:
        i = 0
        For Each h In Me
            i = i + 1
            If (h.tipoObjetoA = tipo And kernel.utils.idigual(h.idObjetoA, id)) _
            Or (h.tipoObjetoB = tipo And kernel.utils.idigual(h.idObjetoB, id)) _
            Then
                Remove i
                GoTo restart
            End If
        Next
End Sub
Public Sub replaceId(ByVal tipo As Long, ByVal id As String, ByVal idnew As String)
        Dim h As TGOH_HRT
restart:
        For Each h In Me
            If (h.tipoObjetoA = tipo And kernel.utils.idigual(h.idObjetoA, id)) Then h.idObjetoA = idnew
            If (h.tipoObjetoB = tipo And kernel.utils.idigual(h.idObjetoB, id)) Then h.idObjetoB = idnew
        Next
End Sub

