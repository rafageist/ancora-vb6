VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "clsKernel"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
Option Explicit

Public options As TKernel_arrOpcion
Public utils As libUtils
Public strings As libStrings
Public files As libFiles

Private Sub Class_Initialize()
    
    Set options = New TKernel_arrOpcion
    Set utils = New libUtils
    Set strings = New libStrings
    Set files = New libFiles
    
    Set ancora = New clsAncora
    Set interface = New clsInterface
    Set reports = New clsReport

End Sub

Private Sub Class_Terminate()
 
    Set options = Nothing
    Set utils = Nothing
    Set strings = Nothing
    Set files = Nothing
    
    Set ancora = Nothing
    Set interface = Nothing
    Set reports = Nothing

End Sub

Public Sub Ancora_Inicia()
    Dim i As Long
    Set ancora = Nothing
    Set ancora = New clsAncora
    
    For i = 1 To dCantArreglos
        Set cacheID(i) = New TCacheID
    Next
    ancora.reparaArrays
End Sub

Public Sub Ancora_Finaliza()
    Dim i As Long

    Set ancora = Nothing

    For i = 1 To dCantArreglos
        Set cacheID(i) = Nothing
    Next

End Sub

Public Sub Ancora_Reinicia()
    Ancora_Finaliza
    Ancora_Inicia
End Sub

Public Sub setDireccionFichero(f As String) 'Obetener la direccion del fichero abierto
    Directorio = files.getDirectorioFromPath(f)
    NameFile = files.getFileFromPath(f)
End Sub
