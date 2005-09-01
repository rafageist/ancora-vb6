VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "TKernel_Hash"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"489BC2E3015B"
Option Explicit
Private mvararreglo As Long
Private mvarBeginWith As TKernel_Hash_arrBegin
Public Property Set BeginWith(ByVal vData As TKernel_Hash_arrBegin)
    Set mvarBeginWith = vData
End Property
Public Property Get BeginWith() As TKernel_Hash_arrBegin
    Set BeginWith = mvarBeginWith
End Property
Public Property Let arreglo(ByVal vData As Long)
    mvararreglo = vData
End Property
Public Property Get arreglo() As Long
    arreglo = mvararreglo
End Property

