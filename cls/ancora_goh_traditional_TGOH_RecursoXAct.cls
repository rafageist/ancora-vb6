VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "TGOH_RecursoXAct"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"489BC2DE0136"
Option Explicit

Private mvaract As Long
Private mvarper As String
Private mvarasg As String
Private mvargruposRecursos As TGOH_arrGroupRest
Public Property Set gruposRecursos(ByVal vData As TGOH_arrGroupRest)
'se usa al asignar un objeto a la propiedad, en la parte izquierda de una instrucción set.
'Syntax: set x.gruposRecursos = Form1
    Set mvargruposRecursos = vData
End Property

Public Property Get gruposRecursos() As TGOH_arrGroupRest
'se usa al recuperar un valor de una propiedad, en la parte derecha de una asignación.
'Syntax: Debug.Print X.gruposRecursos
    Set gruposRecursos = mvargruposRecursos
End Property

Public Property Let asg(ByVal vData As String)
'se usa al asignar un valor a la propiedad, en la parte izquierda de una asignación.
'Syntax: X.asg = 5
    mvarasg = vData
End Property

Public Property Get asg() As String
'se usa al recuperar un valor de una propiedad, en la parte derecha de una asignación.
'Syntax: Debug.Print X.asg
    asg = mvarasg
End Property

Public Property Let per(ByVal vData As String)
'se usa al asignar un valor a la propiedad, en la parte izquierda de una asignación.
'Syntax: X.per = 5
    mvarper = vData
End Property

Public Property Get per() As String
'se usa al recuperar un valor de una propiedad, en la parte derecha de una asignación.
'Syntax: Debug.Print X.per
    per = mvarper
End Property

Public Property Let act(ByVal vData As Long)
'se usa al asignar un valor a la propiedad, en la parte izquierda de una asignación.
'Syntax: X.act = 5
    mvaract = vData
End Property

Public Property Get act() As Long
'se usa al recuperar un valor de una propiedad, en la parte derecha de una asignación.
'Syntax: Debug.Print X.act
    act = mvaract
End Property

