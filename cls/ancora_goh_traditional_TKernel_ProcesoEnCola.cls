VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "TKernel_ProcesoEnCola"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"489BC2CF00F8"
Option Explicit
Private mvaresp As String
Private mvarNivel As Long
Private mvarper As String
Private mvarixesp As Long
Private mvarixper As Long
Public Property Let ixper(ByVal vData As Long)
    mvarixper = vData
End Property
Public Property Get ixper() As Long
    ixper = mvarixper
End Property
Public Property Let ixesp(ByVal vData As Long)
    mvarixesp = vData
End Property
Public Property Get ixesp() As Long
    ixesp = mvarixesp
End Property
Public Property Let per(ByVal vData As String)
    mvarper = vData
End Property
Public Property Get per() As String
    per = mvarper
End Property
Public Property Let Nivel(ByVal vData As Long)
    mvarNivel = vData
End Property
Public Property Get Nivel() As Long
    Nivel = mvarNivel
End Property
Public Property Let esp(ByVal vData As String)
    mvaresp = vData
End Property
Public Property Get esp() As String
    esp = mvaresp
End Property

