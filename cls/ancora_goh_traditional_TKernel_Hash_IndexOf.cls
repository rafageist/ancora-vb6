VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "TKernel_Hash_IndexOf"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"489BC2E0008F"
Option Explicit
Private mvarid As String
Private mvaridx As Long
Public Property Let idx(ByVal vData As Long)
    mvaridx = vData
End Property
Public Property Get idx() As Long
    idx = mvaridx
End Property
Public Property Let id(ByVal vData As String)
    mvarid = vData
End Property
Public Property Get id() As String
    id = mvarid
End Property

