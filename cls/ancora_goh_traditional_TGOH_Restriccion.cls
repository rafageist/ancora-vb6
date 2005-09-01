VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "TGOH_Restriccion"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"489BC2C60114"
Option Explicit

Private mvaridperiodo As String
Private mvarrestricciones() As Long
Public mdias As Long
Public mturnos As Long
Public Property Let idperiodo(ByVal vData As String)
    mvaridperiodo = vData
End Property
Public Property Get idperiodo() As String
    idperiodo = mvaridperiodo
End Property

Public Sub Redimension(ByVal Dias As Long, turnos As Long)
    mdias = Dias
    mturnos = turnos
    ReDim Preserve mvarrestricciones(Dias, turnos)
End Sub
Private Sub Class_Initialize()
    Redimension MAX_DIAS, MAX_TURNOS
End Sub

Public Function rest(ByVal dia As Long, ByVal turno As Long) As Long
    If dia >= 1 And dia <= mdias Then
        If turno >= 1 And turno <= mturnos Then
            rest = mvarrestricciones(dia, turno)
        End If
    End If
End Function

Public Sub setRest(ByVal dia As Long, ByVal turno As Long, ByVal value As Long)
    If dia >= 1 And dia <= mdias Then
        If turno >= 1 And turno <= mturnos Then
           mvarrestricciones(dia, turno) = value
        End If
    End If
End Sub
