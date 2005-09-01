VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "TarrLugar_Coordenadas"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Top_Level" ,"No"
Attribute VB_Ext_KEY = "Collection" ,"TLugar_Cordenadas"
Attribute VB_Ext_KEY = "Member0" ,"TLugar_Cordenadas"
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"489BC2EC01C2"
Option Explicit
Private mCol As Collection
Public Function add(idlugar As String, X As Long, Y As Long, esteriotipo As Long, color As Long, fondo As Long) As TLugar_Cordenadas
    Dim objNewMember As TLugar_Cordenadas
    Set objNewMember = New TLugar_Cordenadas
    objNewMember.idlugar = idlugar
    objNewMember.X = X
    objNewMember.Y = Y
    objNewMember.esteriotipo = esteriotipo
    objNewMember.color = color
    objNewMember.fondo = fondo
    mCol.add objNewMember, idlugar
    Set add = objNewMember
    Set objNewMember = Nothing
End Function
Public Property Get Item(vntIndexKey As Variant) As TLugar_Cordenadas
Attribute Item.VB_UserMemId = 0
  On Error GoTo errdep
10:  Set Item = mCol(vntIndexKey)

finish:
    Exit Property
errdep:
  If Erl = 10 Then
    add "" & vntIndexKey, 0, 0, 0, 0, 0
    Resume 10
  End If
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
