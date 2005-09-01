VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "TConsole"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"489BC2E70392"
Public Sub Writer(s As String)
 Debug.Print s
End Sub
Public Sub Progress(pro As String, percent As Integer)
       On Error Resume Next
       frmKernelMain.PosicionaProgress
       If frmKernelMain.labProgress.Caption <> pro Then frmKernelMain.labProgress.Caption = pro
       frmKernelMain.Progress.value = percent
       frmKernelMain.labProgress.Visible = percent > 0 And percent < 100
       frmKernelMain.Progress.Visible = percent > 0 And percent < 100
       If percent >= 100 Then Hide
       DoEvents
       
End Sub

Public Sub Hide()
    frmKernelMain.labProgress.Visible = True
    frmKernelMain.labProgress.Caption = "Listo: " & Directorio & "\" & NameFile
    frmKernelMain.Progress.Visible = False
End Sub

