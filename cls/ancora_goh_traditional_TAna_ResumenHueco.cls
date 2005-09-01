VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "TAna_ResumenHueco"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"489BC2ED01A6"
Option Explicit
Private mvarprofes As TAtom_arrVariant
Private mvarlugares As TAtom_arrVariant
Private mvarbrigadas As TAtom_arrVariant
Private mvarrecursos As TAtom_arrVariant
Private mvardia As Long
Private mvarturno As Long
Private mvarperiodo As String

Public Property Let periodo(ByVal vData As String)
    mvarperiodo = vData
End Property
Public Property Get periodo() As String
    periodo = mvarperiodo
End Property
Public Property Let turno(ByVal vData As Long)
    mvarturno = vData
End Property
Public Property Get turno() As Long
    turno = mvarturno
End Property
Public Property Let dia(ByVal vData As Long)
    mvardia = vData
End Property
Public Property Get dia() As Long
    dia = mvardia
End Property
Public Property Set recursos(ByVal vData As TAtom_arrVariant)
    Set mvarrecursos = vData
End Property
Public Property Get recursos() As TAtom_arrVariant
    Set recursos = mvarrecursos
End Property
Public Property Set brigadas(ByVal vData As TAtom_arrVariant)
    Set mvarbrigadas = vData
End Property
Public Property Get brigadas() As TAtom_arrVariant
    Set brigadas = mvarbrigadas
End Property
Public Property Set lugares(ByVal vData As TAtom_arrVariant)
    Set mvarlugares = vData
End Property
Public Property Get lugares() As TAtom_arrVariant
    Set lugares = mvarlugares
End Property
Public Property Set profes(ByVal vData As TAtom_arrVariant)
    Set mvarprofes = vData
End Property
Public Property Get profes() As TAtom_arrVariant
    Set profes = mvarprofes
End Property
Private Sub Class_Initialize()
    Set mvarprofes = New TAtom_arrVariant
    Set mvarlugares = New TAtom_arrVariant
    Set mvarbrigadas = New TAtom_arrVariant
    Set mvarrecursos = New TAtom_arrVariant
End Sub
Private Sub Class_Terminate()
    Set mvarprofes = Nothing
    Set mvarlugares = Nothing
    Set mvarbrigadas = Nothing
    Set mvarrecursos = Nothing
End Sub
