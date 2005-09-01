VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "TGOH_arrGroupRest"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Collection" ,"TGOH_GroupRest"
Attribute VB_Ext_KEY = "Member0" ,"TGOH_GroupRest"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"489BC2DC016F"
Option Explicit
Private mCol As Collection
Public Function add(recursos As TAtom_arrVariant, prioridades As TAtom_arrVariant, cantNecesarios As Long, imprescindibles As Boolean, prioridad As Long, Optional sKey As String) As TGOH_GroupRest
    Dim objNewMember As TGOH_GroupRest
    Set objNewMember = New TGOH_GroupRest

    Set objNewMember.recursos = recursos
    Set objNewMember.prioridades = prioridades
    objNewMember.cantNecesarios = cantNecesarios
    objNewMember.imprescindibles = imprescindibles
    objNewMember.prioridad = prioridad

    If Len(sKey) = 0 Then
        mCol.add objNewMember
    Else
        mCol.add objNewMember, sKey
    End If
    Set add = objNewMember
    Set objNewMember = Nothing
End Function
Public Property Get Item(vntIndexKey As Variant) As TGOH_GroupRest
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
Public Function MinPrioridad(Optional excepto As Variant) As Long
    Dim min As Long, i As Long
    min = MaxPrioridad
    For i = 1 To Count
        Dim exp As Boolean
        exp = False
        If IsArray(excepto) Then exp = excepto(i)
        If Item(i).prioridad < min And Not exp Then min = Item(i).prioridad
    Next
    MinPrioridad = min
End Function

'devuelve la maxima prioridad segun todos los grupos de recursos
Public Function MaxPrioridad() As Long
    Dim max As Long, i As Long
    max = 0
    For i = 1 To Count
        If Item(i).prioridad > max Then max = Item(i).prioridad
    Next
    MaxPrioridad = max
End Function
'devuelve la cantidad de grupos de recursos con la priroridad tal...
Public Function getCantWithPriori(priori As Long) As Long
    Dim i As Long
    getCantWithPriori = 0
    For i = 1 To Count
        If Item(i).prioridad = priori Then getCantWithPriori = getCantWithPriori + 1
    Next
End Function
Public Sub alinearPrioridades()
    Dim marcas() As Boolean, i As Long
    ReDim marcas(Count)

    'pongo los minimos a x
    Dim min As Integer, X As Long
    X = 0
verifica:
    For i = 1 To Count
        If Not marcas(i) Then GoTo bajalos
    Next
    GoTo salir
bajalos:
    X = X + 1
    min = MinPrioridad(marcas)
    For i = 1 To Count
        If Item(i).prioridad = min Then
            Item(i).prioridad = X
            marcas(i) = True
        End If
    Next
    GoTo verifica
salir:
End Sub
Public Function estaRecurso(ByVal id As String) As Boolean
    Dim i As Long, j As Long
    For i = 1 To Count
        For j = 1 To Item(i).recursos.Count
            If kernel.utils.idigual("" & Item(i).recursos(j).value, id) Then
                estaRecurso = True
                Exit Function
            End If
        Next
    Next
End Function

