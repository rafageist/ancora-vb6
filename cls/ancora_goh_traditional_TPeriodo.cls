VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "TPeriodo"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"489BC25D01B3"
     Private mvarid As String
     Private mvardescrip As String
     Private mvartimerequest As TarrRowRest
     Private mvarcaption As String
     Private mvartemplate As String
                    Public Property Let template(ByVal vData As String)
          mvartemplate = vData
     End Property

     Public Property Get template() As String
          template = mvartemplate
     End Property

                    Public Property Let Caption(ByVal vData As String)
          mvarcaption = vData
     End Property

     Public Property Get Caption() As String
          Caption = mvarcaption
     End Property

                    Public Property Set timerequest(ByVal vData As TarrRowRest)
          Set mvartimerequest = vData
     End Property

     Public Property Get timerequest() As TarrRowRest
          Set timerequest = mvartimerequest
     End Property

                    Public Property Let descrip(ByVal vData As String)
          mvardescrip = vData
     End Property

     Public Property Get descrip() As String
          descrip = mvardescrip
     End Property

                    Public Property Let id(ByVal vData As String)
          mvarid = vData
     End Property

     Public Property Get id() As String
          id = mvarid
     End Property

     Public Function getTimeRequest(ByVal dia As Long, ByVal turno As Long) As Boolean

          On Error GoTo errdep

          If timerequest("" & dia).values("" & turno).value > 0 Then
               getTimeRequest = True
               Exit Function
          End If

10                         getTimeRequest = False
          Exit Function
errdep:
          Resume 10
     End Function

     Public Function setTimeRequest(ByVal dia As Long, ByVal turno As Long, ByVal value As Boolean)

          If timerequest("" & dia) Is Nothing Then timerequest.add New TarrCellRest, "" & dia

          If value Then
               timerequest("" & dia).values("" & turno).value = 1
          Else
               timerequest("" & dia).values("" & turno).value = 0
          End If

     End Function

