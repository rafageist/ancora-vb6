VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "TAna_OptimoAct"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"489BC2BF00A5"
Option Explicit
Private mvarcantenzpriori As Long
Private mvarct As Long
Public Property Let ct(ByVal vData As Long)
    mvarct = vData
End Property

Public Property Get ct() As Long
    ct = mvarct
End Property

Public Property Let cantenzpriori(ByVal vData As Long)
    mvarcantenzpriori = vData
End Property

Public Property Get cantenzpriori() As Long
    cantenzpriori = mvarcantenzpriori
End Property

