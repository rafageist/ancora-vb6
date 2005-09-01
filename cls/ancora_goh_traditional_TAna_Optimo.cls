VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "TAna_Optimo"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"489BC2BF0272"
Option Explicit

Private mvaridesp As String
Private mvarNivel As Long
Private mvaridper As String
Private mvartotalAct As Long
Private mvarcantasignadas As Long
Private mvartotalTurnos As Long
Private mvarcantActFijas As Long
Private mvarcantenzpriori As Long
Private mvarpercentZpriori As Long
Private mvarpercentActAsig As Long
Public Property Let percentActAsig(ByVal vData As Long)
    mvarpercentActAsig = vData
End Property

Public Property Get percentActAsig() As Long
    percentActAsig = mvarpercentActAsig
End Property

Public Property Let percentZpriori(ByVal vData As Long)
    mvarpercentZpriori = vData
End Property

Public Property Get percentZpriori() As Long
    percentZpriori = mvarpercentZpriori
End Property

Public Property Let cantenzpriori(ByVal vData As Long)
    mvarcantenzpriori = vData
End Property

Public Property Get cantenzpriori() As Long
    cantenzpriori = mvarcantenzpriori
End Property

Public Property Let cantActFijas(ByVal vData As Long)
    mvarcantActFijas = vData
End Property

Public Property Get cantActFijas() As Long
    cantActFijas = mvarcantActFijas
End Property

Public Property Let totalTurnos(ByVal vData As Long)
    mvartotalTurnos = vData
End Property

Public Property Get totalTurnos() As Long
    totalTurnos = mvartotalTurnos
End Property

Public Property Let cantasignadas(ByVal vData As Long)
    mvarcantasignadas = vData
End Property

Public Property Get cantasignadas() As Long
    cantasignadas = mvarcantasignadas
End Property

Public Property Let totalAct(ByVal vData As Long)
    mvartotalAct = vData
End Property

Public Property Get totalAct() As Long
    totalAct = mvartotalAct
End Property

Public Property Let idper(ByVal vData As String)
    mvaridper = vData
End Property

Public Property Get idper() As String
    idper = mvaridper
End Property

Public Property Let Nivel(ByVal vData As Long)
    mvarNivel = vData
End Property

Public Property Get Nivel() As Long
    Nivel = mvarNivel
End Property

Public Property Let idesp(ByVal vData As String)
    mvaridesp = vData
End Property

Public Property Get idesp() As String
    idesp = mvaridesp
End Property
