Attribute VB_Name = "modDataRepair"
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"489BC24F02D5"
Option Explicit

Public Sub reparaRest(ByRef rest As TRecurso)

    Dim i As Long, j As Long, ix As Long

    Dim newrest As TRecurso
    
    newrest = rest
    ReDim newrest.rest(ancora.periodos.Count)
    
    For i = 1 To ancora.periodos.Count
        ix = ancora.IndexById(dPERIODO, rest.rest(i).idperiodo)
        If ix <> 0 Then newrest.rest(ix) = rest.rest(i)
        newrest.rest(i).idperiodo = ancora.periodos(i).id
    Next

    rest = newrest
End Sub

Public Sub reparaDesglose(ByRef des As TAsig)

    Dim i As Long, j As Long

    For i = 1 To ancora.periodos.Count

        For j = 1 To ancora.periodos.Count
            If kernel.utils.idigual(des.desglose(j).idperiodo, ancora.periodos(i).id) Then GoTo 10
        Next

        For j = 1 To ancora.periodos.Count
            If kernel.utils.trunca(des.desglose(j).idperiodo) = "" Then
                des.desglose(j).idperiodo = ancora.periodos(i).id
                GoTo 10
            End If

        Next

10:
        If des.desglose(i).max = 0 Then des.desglose(i).max = 1
        If des.desglose(i).min = 0 Then des.desglose(i).min = 1
    Next

End Sub

'reparadores de id a minusculas
Public Sub RESTORE_LCaseID_Rest(ByRef r As TRecurso)
    Dim i As Long

    For i = 1 To ancora.periodos.Count
         r.rest(i).idperiodo = LCase(r.rest(i).idperiodo)
    Next

End Sub

