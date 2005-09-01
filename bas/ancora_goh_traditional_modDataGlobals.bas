Attribute VB_Name = "modDataGlobals"
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"489BC23B011E"
Option Explicit

'VARIABLES GLOBALES

Public DIA_CAMBIO As Long
Public TURNO_CAMBIO As Long
Public Detener As Boolean
Public PRIORI_LXACT_segunPI() As Long
Public cantPRIORI_LXACT_segunPI As Long
Public AppDemo As Boolean
Public SEMI_GRUPO As Long
Public IDASIGNA_CAMBIANDO As Long

Public AccesosProhibidos() As TAccesoProhibido
Public AulasFijas() As TAulaFija
Public Imposibles() As TImposible
Public Especialidad() As TRecurso
Public clasif() As TClasif
Public profe() As TRecurso
Public lugar() As TRecurso
Public Brigada() As TBrigada
Public LugXact() As TLugarXAct
Public ProfeXAct() As TProfeXAct
Public asig() As TAsig
Public Distancias() As TFilaDistancia

Public grafo As TGrafo

Public SeleccionInfo As TSeleccionInfo
Public ListaIDPxAct() As Long
Public ListaIDLxAct() As Long
Public cantIDPxAct As Long
Public cantIDLxAct As Long
Public ESTRATEGIA As Long
Public PARCHE As Boolean
Public BuscaPorHASH As Boolean
Public DatosImprimir As TImprimir
Public HorarioImprimir(1 To MAX_DIAS, 1 To MAX_TURNOS) As String
Public ESPEC_GENERANDO As Long
Public KEYPRESS_PROGRESS As Boolean
Public cantFiltroAsignaciones As Long
Public FiltroAsignaciones() As Long
Public MUESTRA_EN_HORARIO(1 To 3) As TMuestraEnHorario
Public SinGenerar() As TSinGenerar
Public Sgenerar() As TSgenerar
Public cantSgenerar As Long
Public DUPLICAR_PER1 As Long
Public DUPLICAR_PER2 As Long
Public REDISTRIBUIR_ESP As Long
Public REDISTRIBUIR_Nivel As Long
Public REDISTRIBUIR_per As Long
Public REDISTRIBUIR_dia1 As Long
Public REDISTRIBUIR_dia2 As Long
Public REDISTRIBUIR_chk1 As Long
Public REDISTRIBUIR_chk2 As Long
Public TextfrmExplorerSchedule(MAX_DIAS * MAX_TURNOS) As String
Public MatrixAsignaciones_frmExplorerSchedule(MAX_DIAS, MAX_TURNOS) As Long
Public ColoresAct(MAX_DIAS * MAX_TURNOS) As Long
Public CantTurnosAct(MAX_TURNOS * MAX_DIAS) As Long
Public keyfrmExplorerSchedule As String
Public Posi_profe As TFiltro
Public Posi_lug As TFiltro
Public DIA_SEL As Long
Public TURNO_SEL As Long
Public IDEnterData2 As Long
Public ModoData As Long
Public InfoData As String
Public Generaciones() As Tgeneraciones
Public cantGeneraciones As Long
Public IndexTrabajando As Long
Public IDEnterData As Long

Public MPI_frm As TMPI_frm
Public MPI_seleccion() As Boolean
Public ModofrmDatosRestriccion As Long
Public Trabajando_IdRestriccion As Long
Public TrabajandoTitulo_frmDatosRestricc As String
Public Trabajando_PerRestriccion As String
Public ColorfrmDatosRestricc As Long
Public BotonesRestriccion(1 To MAX_DIAS, 1 To MAX_TURNOS) As Boolean
Public Inhabil(1 To MAX_DIAS, 1 To MAX_TURNOS) As Boolean
Public Generando As TGenerando
Public parche_AND_MPI_EXCEPTO As Boolean
Public ShowedMsg_frmDatosgoMPI_HideCboProfe_Y_Lug As Boolean
Public RecursoPorSubGrupo() As TRecursoPorSubGrupo

Public OK_RecursoPorSubGrupo As Boolean
Public AncoraDataResource_cantProvincias As Long
Public AncoraDataResource_Provincias() As String
Public Asignaciones() As TActAsignada
Public EstadoApp As Boolean
Public ColaDeGeneracion As TKernel_arrProcesoEnCola

Public Directorio As String
Public NameFile As String

