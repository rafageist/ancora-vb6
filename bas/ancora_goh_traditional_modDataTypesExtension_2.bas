Attribute VB_Name = "modDataTypesExtension_2"
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"489BC2430151"
Option Explicit
Rem Durante el proceso de generacion
Public Type TFiltro
cant As Long
id() As Long
End Type
Type TFilaMatrixAct
    act(1 To MAX_ACT) As Long
    idasig As Long
    cantact As Long
    numero(1 To MAX_ACT) As Long
End Type
Type TMPI_Casilla
    valor As Boolean
    prof As TFiltro
    lug As TFiltro
    motivo As Long
End Type
Type TMPI_Casilla1
    valor As Boolean
End Type
Type TMPI
    ct As Byte
    MPI(1 To MAX_DIAS, 1 To MAX_TURNOS) As TMPI_Casilla
End Type
Type TMPI1
    ct As Byte
    MPI(1 To MAX_DIAS, 1 To MAX_TURNOS) As TMPI_Casilla1
End Type
Type TRango
    ini As Long
    fin As Long
End Type
Type TSinGenerar
    id() As Boolean
End Type
Type TSgenerar
    idasig As String
    idesp As String
    Nivel As Long
    idper As String
    idact As Long
    idclasif  As String
    brgs As String
End Type
Type TMuestraEnHorario
    asig As Boolean
    clasif As Boolean
    profe As Boolean
    lugar As Boolean
    brg As Boolean
End Type

Type TMPI_frm
    asg As Long
    per As Long
    iddesglose As Long
    listabrg As TFiltro
    clas As Long
    act As Long
    gxc As Long
    GrupoMPI As TMPI1
    fija As Boolean
End Type

