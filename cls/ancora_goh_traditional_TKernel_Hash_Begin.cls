VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "TKernel_Hash_Begin"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"489BC2E1023F"
Option Explicit
Private mvarBeginWith As Byte
Private mvarIndexOf As TKernel_Hash_arrIndexOf
Public Property Set IndexOf(ByVal vData As TKernel_Hash_arrIndexOf)
    Set mvarIndexOf = vData
End Property
Public Property Get IndexOf() As TKernel_Hash_arrIndexOf
    Set IndexOf = mvarIndexOf
End Property
Public Property Let BeginWith(ByVal vData As Byte)
    mvarBeginWith = vData
End Property
Public Property Get BeginWith() As Byte
    BeginWith = mvarBeginWith
End Property

