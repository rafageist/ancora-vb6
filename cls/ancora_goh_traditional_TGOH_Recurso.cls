VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "TGOH_Recurso"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"489BC2C80080"
Option Explicit
Private mvarid As String
Private mvarcaption As String
Private mvardescrip As String
Private mvarlextra As Long
Private mvarsextra As String
Private mvarrest As TGOH_arrRestriccion
Private mvarvirtual As Boolean
Public Property Let sextra(ByVal vData As String)
    mvarsextra = vData
End Property
Public Property Get sextra() As String
    sextra = mvarsextra
End Property
Public Property Let lextra(ByVal vData As Long)
    mvarlextra = vData
End Property
Public Property Get lextra() As Long
    lextra = mvarlextra
End Property
Public Property Let descrip(ByVal vData As String)
    mvardescrip = vData
End Property
Public Property Get descrip() As String
    descrip = mvardescrip
End Property
Public Property Let Caption(ByVal vData As String)
    mvarcaption = vData
End Property
Public Property Get Caption() As String
    Caption = mvarcaption
End Property
Public Property Let id(ByVal vData As String)
    mvarid = vData
End Property
Public Property Get id() As String
    id = mvarid
End Property
Public Property Get rest() As TGOH_arrRestriccion
    Set rest = mvarrest
End Property
Public Property Set rest(value As TGOH_arrRestriccion)
    Set mvarrest = value
End Property

Public Function getRestriccion(idper As String, dia As Long, turno As Long) As Long
    getRestriccion = 0
    If Not rest(idper) Is Nothing Then getRestriccion = rest(idper).rest(dia, turno)
End Function
Public Sub setRestriccion(idper As String, dia As Long, turno As Long, value As Long)
    If rest(idper) Is Nothing Then rest.add idper
    rest(idper).setRest dia, turno, value
End Sub

Private Sub Class_Initialize()
    Set mvarrest = New TGOH_arrRestriccion
End Sub

Private Sub Class_Terminate()
    Set mvarrest = Nothing
End Sub

Public Property Get virtual() As Boolean
    If mvarvirtual Then
        If Mid(mvarid, 1, 1) <> "_" Then mvarid = "_" + mvarid
    Else
        If Mid(mvarid, 1, 1) = "_" Then id = Mid(mvarid, 2)
    End If
    virtual = mvarvirtual
End Property
Public Property Let virtual(ByVal value As Boolean)
    If value Then
        If Mid(mvarid, 1, 1) <> "_" Then mvarid = "_" + mvarid
    Else
        If Mid(mvarid, 1, 1) = "_" Then id = Mid(mvarid, 2)
    End If
    mvarvirtual = value
End Property
Public Function PercentRestricc(idper As String) As Long
    Dim i As Long, j As Long, p As Long, t As Long
    t = ancora.CD * ancora.ct
    For i = 1 To ancora.CD
        For j = 1 To ancora.ct
            If getRestriccion(idper, i, j) = 1 Then p = p + 1
        Next
    Next
    PercentRestricc = kernel.utils.Porciento(p, t)
End Function
