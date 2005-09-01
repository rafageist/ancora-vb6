VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "TPriorizaV2"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit
Private parametros() As String
Private elementos() As String
Private valores() As Double
Private niveles() As Long
Private criterios() As Boolean
Private pesos() As Long
Public nombre As String
Public cantParametros As Long
Public cantElementos As Long

Public Sub agregarElemento(nombre As String)
    cantElementos = cantElementos + 1
    Redimensiona
    ponElemento cantElementos, nombre
End Sub

Public Sub agregarParametro(nombre As String, peso As Long, criterio As Boolean)
    cantParametros = cantParametros + 1
    Redimensiona
    ponParametro cantParametros, nombre
    ponPeso cantParametros, peso
    ponCriterio cantParametros, criterio
End Sub

Public Sub ponPeso(index As Long, peso As Long)
    pesos(index) = peso
End Sub
Public Sub ponParametro(index As Long, nombre As String)
    parametros(index) = nombre
End Sub
Public Sub ponCriterio(index As Long, criterio As Boolean)
    criterios(index) = criterio
End Sub
Public Sub ponValor(elemento As Long, parametro As Long, valor As Double)
    valores(elemento, parametro) = valor
End Sub
Public Sub ponElemento(index As Long, nombre As String)
    elementos(index) = nombre
End Sub

Public Function dameValor(elemento As Long, parametro As Long) As Double
    dameValor = valores(elemento, parametro)
End Function
Public Function dameNivel(elemento As Long, parametro As Long) As Long
    dameNivel = niveles(elemento, parametro)
End Function
Public Function damePeso(parametro As Long) As Long
    damePeso = pesos(parametro)
End Function
Public Function dameCriterio(parametro As Long) As Double
    dameCriterio = criterios(parametro)
End Function
Public Function dameParametro(parametro As Long) As String
    dameParametro = parametros(parametro)
End Function
Public Function dameElemento(elemento As Long) As String
    dameElemento = elementos(elemento)
End Function

Private Sub Redimensiona()
    If cantElementos > 0 And cantParametros > 0 Then ReDim Preserve niveles(cantElementos, cantParametros)
    If cantElementos > 0 And cantParametros > 0 Then ReDim Preserve valores(cantElementos, cantParametros)
    If cantParametros > 0 Then ReDim Preserve parametros(cantParametros)
    If cantElementos > 0 Then ReDim Preserve elementos(cantElementos)
    If cantParametros > 0 Then ReDim Preserve criterios(cantParametros)
    If cantParametros > 0 Then ReDim Preserve pesos(cantParametros)
End Sub

Private Function arregloHomogeneo(arr As Variant, valor As Variant, cant As Long) As Boolean
    Dim i As Long
    For i = 1 To cant
        If arr(i) <> valor Then
            arregloHomogeneo = False
            Exit Function
        End If
    Next
    arregloHomogeneo = True
End Function

Private Sub NivelarColumna(columna As Long)
    Dim i As Long, ya() As Boolean, min As Long, p As Long
    Dim primero As Boolean
    ReDim ya(cantElementos)
    p = 1
    Do
        min = 0
        primero = True
        For i = 1 To cantElementos
            If (primero Or (min > valores(i, columna)) = criterios(columna)) And Not ya(i) Then
                min = valores(i, columna)
                primero = False
            End If
        Next
        
        For i = 1 To cantElementos
            If valores(i, columna) = min And Not ya(i) Then
                niveles(i, columna) = p
                ya(i) = True
            End If
        Next
        p = p + 1
    Loop While Not arregloHomogeneo(ya, True, cantElementos)
End Sub
Public Sub Nivelar()
    Dim i As Long
    For i = 1 To cantParametros
        NivelarColumna i
    Next
End Sub
Public Function SumaNiveles(elemento As Long) As Long
    Dim i As Long, s As Long
    s = 0
    For i = 1 To cantParametros
        s = s + niveles(elemento, i) * pesos(i)
    Next
    SumaNiveles = s
End Function
Public Function Priorizado() As Long
    Dim min As Long, i As Long, p As Long, s As Long
    
    Nivelar
    
    min = 0
    For i = 1 To cantElementos
        s = SumaNiveles(i)
        If i = 1 Or min > s Then
            min = s
            p = i
        End If
    Next
    Priorizado = p
End Function

