VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "TGOH_GroupRest"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"489BC2DA028F"
Option Explicit
Private mvarrecursos As TAtom_arrVariant
Private mvarprioridades As TAtom_arrVariant
Private mvarcantNecesarios As Long
Private mvarimprescindibles As Boolean
Private mvarprioridad As Long
Public Property Let prioridad(ByVal vData As Long)
    mvarprioridad = vData
End Property
Public Property Get prioridad() As Long
    prioridad = mvarprioridad
End Property
Public Property Let imprescindibles(ByVal vData As Boolean)
    mvarimprescindibles = vData
End Property
Public Property Get imprescindibles() As Boolean
    imprescindibles = mvarimprescindibles
End Property
Public Property Let cantNecesarios(ByVal vData As Long)
    mvarcantNecesarios = vData
End Property
Public Property Get cantNecesarios() As Long
    cantNecesarios = mvarcantNecesarios
End Property
Public Property Set prioridades(ByVal vData As TAtom_arrVariant)
    Set mvarprioridades = vData
End Property
Public Property Get prioridades() As TAtom_arrVariant
    Set prioridades = mvarprioridades
End Property
Public Property Set recursos(ByVal vData As TAtom_arrVariant)
    Set mvarrecursos = vData
End Property
Public Property Get recursos() As TAtom_arrVariant
    Set recursos = mvarrecursos
End Property
Public Function MinPrioridad(Optional excepto As Variant = Null) As Long
    Dim min As Long, i As Long
    min = MaxPrioridad
    For i = 1 To prioridades.Count
        Dim exp As Boolean
        exp = False
        If IsArray(excepto) Then exp = excepto(i)
        If Val(prioridades(i)) < min And Not exp Then min = Val(prioridades(i))
    Next
    MinPrioridad = min
End Function

'devuelve la maxima prioridad segun todos los grupos de recursos
Public Function MaxPrioridad() As Long
    Dim max As Long, i As Long
    max = 0
    For i = 1 To prioridades.Count
        If Val(prioridades(i).value) > max Then max = Val(prioridades(i).value)
    Next
    MaxPrioridad = max
End Function
'devuelve la cantidad de grupos de recursos con la priroridad tal...
Public Function getCantWithPriori(priori As Long) As Long
    Dim i As Long
    getCantWithPriori = 0
    For i = 1 To prioridades.Count
        If Val(prioridades(i).value) = priori Then getCantWithPriori = getCantWithPriori + 1
    Next
End Function
Public Sub alinearPrioridades()
    Dim marcas() As Boolean, i As Long
    ReDim marcas(prioridades.Count)

    'pongo los minimos a x
    Dim min As Integer, X As Long
    X = 0
verifica:
    For i = 1 To prioridades.Count
        If Not marcas(i) Then GoTo bajalos
    Next
    GoTo salir
bajalos:
    X = X + 1
    min = MinPrioridad(marcas)
    For i = 1 To prioridades.Count
        If Val(prioridades(i).value) = min Then
            prioridades(i).value = X
            marcas(i) = True
        End If
    Next
    GoTo verifica
salir:
End Sub

