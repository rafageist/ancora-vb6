VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "TLugar_Cordenadas"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
Attribute VB_Ext_KEY = "Member0" ,"TarrLugar_Coordenadas"
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"489BC2EB00F9"
Option Explicit
Private mvaridlugar As String
Private mvarx As Long
Private mvary As Long
Private mvaresteriotipo As Long
Private mvarcolor As Long
Private mvarfondo As Long
Public Property Let fondo(ByVal vData As Long)
    mvarfondo = vData
End Property
Public Property Get fondo() As Long
    fondo = mvarfondo
End Property
Public Property Let color(ByVal vData As Long)
    mvarcolor = vData
End Property
Public Property Get color() As Long
    color = mvarcolor
End Property
Public Property Let esteriotipo(ByVal vData As Long)
    mvaresteriotipo = vData
End Property
Public Property Get esteriotipo() As Long
    esteriotipo = mvaresteriotipo
End Property
Public Property Let y(ByVal vData As Long)
    mvary = vData
End Property
Public Property Get y() As Long
    y = mvary
End Property
Public Property Let x(ByVal vData As Long)
    mvarx = vData
End Property
Public Property Get x() As Long
    x = mvarx
End Property
Public Property Let idlugar(ByVal vData As String)
    mvaridlugar = vData
End Property
Public Property Get idlugar() As String
    idlugar = mvaridlugar
End Property

