Attribute VB_Name = "modDataGlobalsExtension"
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"489BC24400B2"
Option Explicit
Public MuestraSubBrigadas As TMuestraSubBrigadas
Public UltimoNumSubG As Long
Public HuecosComunes_Clasif() As Boolean
Public HuecosComunes_Brg() As Boolean
Public HuecosComunes_Asig() As Boolean
Public HuecosComunes_Lug() As Boolean
Public HuecosComunes_Profes() As Boolean
Public HuecosComunes_Esp() As Boolean
Public AceptaPropiedadesDesglose As Boolean
Public RECURSO_idasig As Long
Public RECURSO_idper As Long
Public RECURSO_idact As Long
Public RECURSO_idclasif As Long
Public ResumenHueco() As TResumenHueco
Public ResumenRestricc() As TResumenRestricc
Public cantResumenRestricc As Long
Public BotonesZPriori(1 To MAX_DIAS, 1 To MAX_TURNOS) As Long
Public Trabajando_IdZpriori As Long
Public Trabajando_PerZpriori As Long
