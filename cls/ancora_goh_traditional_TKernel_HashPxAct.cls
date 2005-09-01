VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "TKernel_HashPxAct"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Collection" ,"TKernel_HashPxAct_idact"
Attribute VB_Ext_KEY = "Member0" ,"TKernel_HashPxAct_idact"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"489BC2F503C4"
Option Explicit
Private mCol As Collection
Public Function add(idasig As String) As TKernel_HashPxAct_idasig
    On Error GoTo errdep
    Dim objNewMember As TKernel_HashPxAct_idasig
    Set objNewMember = New TKernel_HashPxAct_idasig
10     mCol.add objNewMember, idasig
    Set add = objNewMember
    Set objNewMember = Nothing
finish:
    Exit Function
errdep:
    If Erl = 10 Then Resume finish
    Resume Next
End Function
Public Property Get Item(vntIndexKey As Variant) As TKernel_HashPxAct_idasig
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

Public Function Existe(idasg As String, idper As String, idact As Long, Optional idprofes As String = "") As Long
    Dim r As Long
    r = 0
    If Not Item(idasg) Is Nothing Then
        If Not Item(idasg).idper(idper) Is Nothing Then
            If Not Item(idasg).idper(idper).idact("" & idact) Is Nothing Then
                If idprofes <> "" Then
                    If Not Item(idasg).idper(idper).idact("" & idact).idprofes(idprofes) Is Nothing Then
                        r = Item(idasg).idper(idper).idact("" & idact).idprofes(idprofes).Index
                    End If
                Else
                    r = -1
                End If
            End If
        End If
    End If
    Existe = r
End Function
