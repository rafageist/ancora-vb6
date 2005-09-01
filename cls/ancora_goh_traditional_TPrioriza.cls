VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "TPrioriza"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"489BC2E600E7"
Option Explicit

    Private mvarfilas As TAtom_arrMatrixVariant
    Private mvartipocolumna As TAtom_arrVariant
    Public suma As TAtom_arrVariant

                Public Property Set tipocolumna(ByVal vData As TAtom_arrVariant)
        Set mvartipocolumna = vData
    End Property
    Public Property Get tipocolumna() As TAtom_arrVariant
        Set tipocolumna = mvartipocolumna
    End Property
                Public Property Set filas(ByVal vData As TAtom_arrMatrixVariant)
        Set mvarfilas = vData
    End Property
    Public Property Get filas() As TAtom_arrMatrixVariant
        Set filas = mvarfilas
    End Property

    'nivelar valores
    Public Sub Nivela(ByRef arr As TAtom_arrVariant, Optional pormin As Boolean = True)
          Dim primero As Boolean
          Dim i As Long, priori As Long, ini As Long, min As Long, cant As Long
          Dim marcado() As Boolean, prioris() As Variant, valores() As Variant

          cant = arr.Count

          ReDim marcado(cant)
          ReDim prioris(cant)
          ReDim valores(cant)

          For i = 1 To cant
               marcado(i) = False
               prioris(i) = arr.Count + 1
               valores(i) = arr(i).value
          Next

          priori = 1
10
          'busco el minimo/maximo valor no marcado
          primero = True
          For i = 1 To cant
               If (primero Or (min > prioris(i) = pormin)) And Not marcado(i) Then
                    min = valores(i)
                    primero = False
               End If
          Next

          'marco a todos los minimos/maximos y les pongo el nivel de prioridad
          For i = 1 To cant
               If valores(i) = min Then
                    prioris(i) = priori 'pongo nivel de prioridad
                    marcado(i) = True
               End If
          Next

          'busco si existe alguno no marcado y si es necesario doy otra ronda
          For i = 1 To cant
               If Not marcado(i) Then
                    priori = priori + 1
                    GoTo 10
               End If
          Next

          'actualizo arr
          Dim ii As TAtom_Variant
          i = 0

          For Each ii In arr
            i = i + 1
                ii.value = prioris(i)
          Next
     End Sub

     'invertir niveles de prioridad
     Public Sub inviertePrioris(ByRef arr As Variant, cant As Long)
          Dim i As Long, max As Long

          For i = 1 To cant
               If i = 1 Or arr(i) > max Then max = arr(i)
          Next

          For i = 1 To cant
               arr(i) = max - (arr(i) - 1)
          Next
    End Sub

    Public Sub goPrioriza(Optional masnecesitado As Boolean = True)
        Set suma = Nothing
        Set suma = New TAtom_arrVariant
        Dim i As Long, j As Long
        Dim col As TAtom_arrVariant

        'recorro todas las columnas de la tabla
        For i = 1 To filas(1).column.Count
            'obtengo los valores de la columna
            Set col = New TAtom_arrVariant
            For j = 1 To filas.Count
                col.add filas(j).column(i).value
                suma.add 0
            Next

            'nivelar columna
            Nivela col, tipocolumna(i).value = masnecesitado

            For j = 1 To filas.Count
                suma(j).value = suma(j).value + col(j)
            Next
        Next
    End Sub

    Public Function getIndexOf_minima_suma() As Long
        Dim min As Variant, primero As Boolean, i As Long
        primero = True
        For i = 1 To filas.Count
            If primero Or min > suma(i).value Then
                min = suma(i).value
                getIndexOf_minima_suma = i
            End If
            primero = False
        Next
    End Function

Private Sub Class_Initialize()
    Set mvarfilas = New TAtom_arrMatrixVariant
    Set mvartipocolumna = New TAtom_arrVariant
End Sub

Private Sub Class_Terminate()
    Set mvarfilas = Nothing
    Set mvartipocolumna = Nothing
End Sub
