Attribute VB_Name = "modDataAnalizer"
Attribute VB_Description = "Este modulo contiene funciones de analisis sobre los datos"
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"489BC24F00C2"
Option Explicit
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'MODULO DE ANALISIS
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'analisis

Type TPercentRestricc
    dato As Long
    id As Long
    idper As Long
    parte As Long
End Type
'analisis
Public PercentRestricc() As TPercentRestricc
Public idPercentRestricc() As Long
Public cantPercentRestricc As Long
Public AnalisisOptimo As TAna_Optimo

'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'Devuelve TPercentRestric segun restricciones
'para un TRecurso en un per
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
Public Function PercentRestriccion(rest As TRecurso, per As Long) As TPercentRestricc
    Dim temp As TPercentRestricc, i As Long, j As Long
    temp.parte = CantRestRecurso(rest, per)
    temp.idper = ancora.IndexById(dPERIODO, rest.rest(per).idperiodo, 0)
    PercentRestriccion = temp
End Function

Public Function BrgGenerando(esp As Long, Nivel As Long) As TFiltro

    Dim suma As Long, i As Long
    suma = 0
    BrgGenerando.cant = 0

    For i = 1 To ancora.cantBrg
        With Brigada(i)
            If kernel.utils.idigual(Brigada(i).idesp, Especialidad(esp).id) And Brigada(i).Nivel = Nivel Then
                BrgGenerando.cant = BrgGenerando.cant + 1
                ReDim Preserve BrgGenerando.id(BrgGenerando.cant)
                BrgGenerando.id(BrgGenerando.cant) = i
            End If
        End With

    Next

End Function


Public Function DameHuecosComunes(per As Long) As TRestriccion

    Dim d As Long, t As Long, temp As TRecurso
    Dim i As Long, j As Long, k As Long
    
    temp.rest(1).idperiodo = ancora.periodos(per).id
    
    'esp

    For i = 1 To ancora.cantEsp
        If HuecosComunes_Esp(i) Then
            For d = 1 To ancora.CD
                For t = 1 To ancora.ct
                    temp.rest(1).rest(d, t) = temp.rest(1).rest(d, t) Or ancora.getRestriccion(dESPECIALIDAD, Especialidad(i).id, ancora.periodos(per).id, d, t)
                Next
            Next
        End If
    Next

    'clasif

    For i = 1 To ancora.cantClasif
        If HuecosComunes_Clasif(i) Then
            For d = 1 To ancora.CD
                For t = 1 To ancora.ct
                    temp.rest(1).rest(d, t) = temp.rest(1).rest(d, t) Or ancora.getRestriccion(dCLASIF, clasif(i).comun.id, ancora.periodos(per).id, d, t)
                Next
            Next
        End If
    Next

    'brigadas

    For i = 1 To ancora.cantBrg
        If HuecosComunes_Brg(i) Then
            For d = 1 To ancora.CD
                For t = 1 To ancora.ct
                    temp.rest(1).rest(d, t) = temp.rest(1).rest(d, t) Or ancora.getRestriccion(dBRIGADA, Brigada(i).comun.id, ancora.periodos(per).id, d, t)
                Next
            Next
        End If
    Next

    'profes

    For i = 1 To ancora.cantProfe
        If HuecosComunes_Profes(i) Then
            For d = 1 To ancora.CD
                For t = 1 To ancora.ct
                    temp.rest(1).rest(d, t) = temp.rest(1).rest(d, t) Or ancora.getRestriccion(dPROFE, profe(i).id, ancora.periodos(per).id, d, t)
                Next
            Next
        End If
    Next

    'lugares

    For i = 1 To ancora.cantLug
        If HuecosComunes_Lug(i) Then
            For d = 1 To ancora.CD
                For t = 1 To ancora.ct
                    temp.rest(1).rest(d, t) = temp.rest(1).rest(d, t) Or ancora.getRestriccion(dLUGAR, lugar(i).id, ancora.periodos(per).id, d, t)
                Next
            Next
        End If
    Next

    For d = 1 To ancora.CD
        For t = 1 To ancora.ct
            temp.rest(1).rest(d, t) = Not temp.rest(1).rest(d, t)
        Next
    Next

    DameHuecosComunes = temp.rest(1)
End Function
Public Sub IniResumenHueco()

    Dim i As Long, j As Long
    Dim t As TResumenHueco

    ReDim t.idbrg(ancora.getCantBrg)
    ReDim t.idlug(ancora.getCantLug)
    ReDim t.idprof(ancora.cantProfe)
    ReDim t.idres(ancora.recursos.Count)

    ReDim Preserve ResumenHueco(ancora.CD, ancora.ct)
    For i = 1 To ancora.CD

        For j = 1 To ancora.ct

            ResumenHueco(i, j) = t
        Next

    Next

End Sub



