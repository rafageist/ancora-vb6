VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "TKernel_HashPxAct_idact"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"489BC2F20211"
Option Explicit

Public idprofes As TKernel_HashPxAct_arr_idprofes
Public Index
Private Sub Class_Initialize()
Set idprofes = New TKernel_HashPxAct_arr_idprofes
End Sub

Private Sub Class_Terminate()
Set idprofes = Nothing
End Sub
