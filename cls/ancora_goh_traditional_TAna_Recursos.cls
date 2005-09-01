VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "TAna_Recursos"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Member0" ,"TAna_arrRecursos"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"489BC2C10134"
Option Explicit
Private mvaridasig As String
Private mvaridper As String
Private mvaridact As Long
Private mvaridclasif As String
Private mvarsinLugar As Boolean
Private mvarsinProfe As Boolean
Private mvargruposSinProfe As String
Public Property Let gruposSinProfe(ByVal vData As String)
    mvargruposSinProfe = vData
End Property
Public Property Get gruposSinProfe() As String
    gruposSinProfe = mvargruposSinProfe
End Property
Public Property Let sinProfe(ByVal vData As Boolean)
    mvarsinProfe = vData
End Property
Public Property Get sinProfe() As Boolean
    sinProfe = mvarsinProfe
End Property
Public Property Let sinLugar(ByVal vData As Boolean)
    mvarsinLugar = vData
End Property
Public Property Get sinLugar() As Boolean
    sinLugar = mvarsinLugar
End Property
Public Property Let idclasif(ByVal vData As String)
    mvaridclasif = vData
End Property
Public Property Get idclasif() As String
    idclasif = mvaridclasif
End Property
Public Property Let idact(ByVal vData As Long)
    mvaridact = vData
End Property
Public Property Get idact() As Long
    idact = mvaridact
End Property
Public Property Let idper(ByVal vData As String)
    mvaridper = vData
End Property
Public Property Get idper() As String
    idper = mvaridper
End Property
Public Property Let idasig(ByVal vData As String)
    mvaridasig = vData
End Property
Public Property Get idasig() As String
    idasig = mvaridasig
End Property

