VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "TGOH_arrRecursoXAct"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Collection" ,"TGOH_RecursoXAct"
Attribute VB_Ext_KEY = "Member0" ,"TGOH_RecursoXAct"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"489BC2DF00FB"
Option Explicit

Private mCol As Collection

Public Function add(act As Long, per As String, asg As String, gruposRecursos As TGOH_arrGroupRest, Optional sKey As String) As TGOH_RecursoXAct

    Dim objNewMember As TGOH_RecursoXAct
    Set objNewMember = New TGOH_RecursoXAct

    objNewMember.act = act
    objNewMember.per = per
    objNewMember.asg = asg
    If IsObject(gruposRecursos) Then Set objNewMember.gruposRecursos = gruposRecursos

    If Len(sKey) = 0 Then
        mCol.add objNewMember
    Else
        mCol.add objNewMember, sKey
    End If

    Set add = objNewMember
    Set objNewMember = Nothing

End Function

Public Property Get Item(vntIndexKey As Variant) As TGOH_RecursoXAct
Attribute Item.VB_UserMemId = 0
   On Error Resume Next
    'se usa al hacer referencia a un elemento de la colección
    'vntIndexKey contiene el índice o la clave de la colección,
    'por lo que se declara como un Variant
    'Syntax: set foo = x.Item(xyz) or set foo = x.Item(5)
  Set Item = mCol(vntIndexKey)
End Property

Public Property Get Count() As Long
    'se usa al obtener el número de elementos de la
    'colección. Sintaxis: Debug.Print x.Count
    Count = mCol.Count
End Property

Public Sub Remove(vntIndexKey As Variant)
    'se usa al quitar un elemento de la colección
    'vntIndexKey contiene el índice o la clave, por lo que se
    'declara como un Variant
    'Sintaxis: x.Remove(xyz)

    mCol.Remove vntIndexKey
End Sub

Public Property Get NewEnum() As IUnknown
Attribute NewEnum.VB_UserMemId = -4
    'esta propiedad permite enumerar
    'esta colección con la sintaxis For...Each
    Set NewEnum = mCol.[_NewEnum]
End Property

Private Sub Class_Initialize()
    'crea la colección cuando se crea la clase
    Set mCol = New Collection
End Sub

Private Sub Class_Terminate()
    'destruye la colección cuando se termina la clase
    Set mCol = Nothing
End Sub

