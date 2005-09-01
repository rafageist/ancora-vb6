VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "TKernel_arrProcesoEnCola"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Collection" ,"TKernel_ProcesoEnCola"
Attribute VB_Ext_KEY = "Member0" ,"TKernel_ProcesoEnCola"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"489BC2D00046"
Option Explicit

Private mCol As Collection

Public Function add(esp As String, Nivel As Long, per As String, ixesp As Long, ixper As Long, Optional sKey As String) As TKernel_ProcesoEnCola
    Dim objNewMember As TKernel_ProcesoEnCola

    If search(esp, Nivel, per) = 0 Then
            Set objNewMember = New TKernel_ProcesoEnCola

            objNewMember.esp = esp
            objNewMember.Nivel = Nivel
            objNewMember.per = per
            objNewMember.ixesp = ixesp
            objNewMember.ixper = ixper
            If Len(sKey) = 0 Then
                mCol.add objNewMember
            Else
                mCol.add objNewMember, sKey
            End If

            Set add = objNewMember
            Set objNewMember = Nothing
    End If
End Function
Public Property Get Item(vntIndexKey As Variant) As TKernel_ProcesoEnCola
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

Public Sub swap(ByVal ix1 As Variant, ByVal ix2 As Variant)
    Dim esp As String, per As String, Nivel As Long, ixesp As Long, ixper As Long
    With Item(ix1)
        esp = .esp
        per = .per
        Nivel = .Nivel
        ixper = .ixper
        ixesp = .ixesp

        .ixesp = Item(ix2).ixesp
        .ixper = Item(ix2).ixper
        .per = Item(ix2).per
        .esp = Item(ix2).esp
        .Nivel = Item(ix2).Nivel
    End With

    With Item(ix2)
        .esp = esp
        .per = per
        .Nivel = Nivel
        .ixper = ixper
        .ixesp = ixesp
    End With

End Sub
Public Function search(ByVal esp As String, ByVal Nivel As Long, ByVal per As String) As Long
    Dim i As Long
    For i = 1 To Count
        With Item(i)
            If kernel.utils.idigual(esp, .esp) And kernel.utils.idigual(per, .per) And .Nivel = Nivel Then
                search = i
                Exit Function
            End If
        End With
    Next
    search = 0
End Function
