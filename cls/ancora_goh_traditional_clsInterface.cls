VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "clsInterface"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"489BC2B00248"
'Clase controladora de interfaz de Áncora

Public explorerTotalActividades As Long

Dim mvarcomponents As frm_Components
Dim mvarConsole As TConsole
Public estado As Integer
Public Sub fillCboArregloObjetos(ByRef cbo As ComboBox, Optional ByVal pExtraBegin As String = "")
    With cbo
        .clear
        If pExtraBegin <> "" Then .AddItem pExtraBegin
        
        .AddItem "Especialidad"
        .AddItem "Profesor"
        .AddItem "Lugar"
        .AddItem "Brigada"
        .AddItem "Recurso"
        
    End With
    
End Sub

Public Function getTextOfAsignacion(ix As Long, Optional inline As Boolean = True) As String
    
    Dim ent As String
    
    ent = IIf(inline, "", Chr(13) & Chr(10))
    
    Dim idxclasif As Long, idclasif As String
    Dim idxasig As Long, idxbrigada As Long
    Dim idxprofe As Long, idxlugar As Long
    Dim idxdesgl As Long
    
    With Asignaciones(ix)
        idxasig = ancora.IndexById(dASIG, .idasig)
        idxbrigada = ancora.IndexById(dBRIGADA, .idbrigada)
        idxprofe = ancora.IndexById(dPROFE, .idprofe)
        idxlugar = ancora.IndexById(dLUGAR, .idlugar)
        idxdesgl = ancora.IndexById(dDESGLOSE, .idperiodo, idxasig)
        idclasif = asig(idxasig).desglose(idxdesgl).act(.idact).idclasif
        idxclasif = ancora.IndexById(dCLASIF, idclasif)
    
    
        getTextOfAsignacion = getRS_Clasificacion(idxclasif) & ent & _
                          " de " & getRS_Asignatura(idxasig) & ent & _
                          ", con " & getRS_Profe(idxprofe) & ent & _
                          " y " & getRS_Brigada(idxbrigada) & ent & _
                          " en " & getRS_Lugar(idxlugar) & ent & _
                          ""
    End With
    
End Function

Public Sub goDatosHRT()
    Dim frm As New frmDatosHRT
    frm.go
    Set frm = Nothing
End Sub
Public Function goDatosHRT_detalles(ByVal data As TGOH_HRT) As TGOH_HRT
    Dim frm As New frmDatosHRT_detalles
    
    If data Is Nothing Then Set data = New TGOH_HRT
    
    With frm
        fillCboArregloObjetos .cboTipoA
        fillCboArregloObjetos .cboTipoB
        
        .tipos = Array(0, dESPECIALIDAD, dPROFE, dLUGAR, dBRIGADA, dRECURSO)
        .canttipos = 5
               
        Set .data = data
        
        fillCboPer .cboPeriodo
        .go
        
        If .resultbutton = 1 Then
            .data.idObjetoA = ancora.getIdGenerico(.data.tipoObjetoA, .data.idxobjetoA)
            .data.idObjetoB = ancora.getIdGenerico(.data.tipoObjetoB, .data.idxobjetoB)
            Set goDatosHRT_detalles = .data
        Else
            Set goDatosHRT_detalles = Nothing
        End If
    End With
    
    Set frm = Nothing
End Function

Private Sub Class_Initialize() 'Constructor
    Set mvarcomponents = New frm_Components
    Set mvarConsole = New TConsole
    Me.estado = ARCHIVO_CERRADO
End Sub

Private Sub Class_Terminate() 'Destructor
    Set mvarcomponents = Nothing
    Set mvarConsole = Nothing
End Sub

Public Property Get console() As TConsole 'Consola de procesos
    If mvarConsole Is Nothing Then Set mvarConsole = New TConsole
    Set console = mvarConsole
End Property
Public Function goKernelArchivoAbrir() As Boolean 'Lanzadores desde el menú
    On Error GoTo err_dep

    Dim OK As Boolean
    Dim sFile As String, i As Long

10

    With commondlg
        .DialogTitle = "Abrir"
        .CancelError = True
        .FileName = ""
        .Filter = "Archivos de horarios (*.anc)|*.anc"
20                          .ShowOpen
        If Len(.FileName) = 0 Then
            goKernelArchivoAbrir = False
            Exit Function
        End If

        goKernelArchivoAbrir = abrir(.FileName)
    End With
    estado = ARCHIVO_ABIERTO
finish:
    Exit Function

err_dep:
    If commondlg.CancelError Then Resume finish

End Function

Public Sub goKernelAnalisisRestricciones() 'Lanzar Analisis de restricciones
    frmReportesAnalizaRestricciones.Show
End Sub

Public Sub goExploradorActividades() 'Lanzar Explorador de actividades
    goExplorerAct
End Sub

Public Function goKernelArchivoNuevo() As Boolean 'Lanzar nuevo archivo
    On Error GoTo errdep

    Dim sFile As String, r As Variant, i As Long

10

    With commondlg
        .DialogTitle = "Nuevo archivo de horarios"
        .CancelError = True
        .FileName = ""
        .Filter = "Archivos de horarios (*.anc)|*.anc"
20                                               .ShowSave
        If Len(.FileName) = 0 Then Exit Function

        sFile = .FileName
    End With

    If sFile = "" Then
        goKernelArchivoNuevo = False
        Exit Function
    End If

    If kernel.files.ExisteFichero(sFile) Then
        r = MessageDlg("Creando archivo", "El archivo que intenta crear ya existe. ¿Desea reemplazarlo?", vbQuestion, "No", "Sí")
        If r = 1 Then GoTo 10
    End If

    kernel.setDireccionFichero sFile
    kernel.Ancora_Reinicia
    
    Close
    Open Directorio + "\" + NameFile For Output As #1
    Close

    ancora.EstaticaConfig
    ancora.GuardarTodo
    goKernelArchivoNuevo = True
    Me.estado = ARCHIVO_ABIERTO
finish:
    Exit Function
errdep:
    If commondlg.CancelError Then Exit Function
End Function

Public Function goKernelArchivoGuardarComo() As Boolean  'Lanzar guardar como
    On Error GoTo errdep
    Dim sFile As String
10
    With commondlg
        .DialogTitle = "Guardar como"
        .CancelError = False
        .FileName = ""
        .Filter = "Archivos de horarios (*.anc)|*.anc"
        .ShowSave
        If Len(.FileName) = 0 Then Exit Function

        sFile = .FileName

    If kernel.files.ExisteFichero(sFile) Then
        r = MessageDlg("El archivo que intenta guardar ya existe. ¿Desea reemplazarlo?", vbQuestion, "No", "Sí")
        If r = 1 Then GoTo 10
    End If

        kernel.setDireccionFichero sFile
        ancora.GuardarTodo
    End With
    goKernelArchivoGuardarComo = True
finish:
    Exit Function
errdep:
    If commondlg.CancelError Then Resume finish
    Resume Next
End Function


Public Sub goKernelDatosGenerales() 'Lanzar editor de datos generales
    Dim frm As frmDatosGenerales
    Set frm = New frmDatosGenerales
    frm.refre
    frm.Show vbModal
    If frm.resultbutton = 1 Then
        ancora.CD = frm.CD
        ancora.ct = frm.ct
        ancora.GuardarTodo
    End If
    Set frm = Nothing
End Sub

Public Sub goKernelDatosPeriodos() 'Lanzar editor de periodos
    goKernelDatosObjects dPERIODO
End Sub
Public Sub goKernelDatosEspecialidades() 'Lanzar editor de especialidades
    goKernelDatosObjects dESPECIALIDAD
End Sub
Public Sub goKernelDatosClasificaciones() 'Lanzar editor de clasificaciones de actvidades
    goKernelDatosObjects dCLASIF
End Sub
Public Sub goKernelDatosProfesores() 'Lanzar editor de profesores
    goKernelDatosObjects dPROFE
End Sub
Public Sub goKernelDatosLugares() 'Lanzar editor de lugares
    goKernelDatosObjects dLUGAR
End Sub
Public Sub goKernelOtrosRecursos() 'Lanzar editor de otros recursos
    goKernelDatosObjects dRECURSO
End Sub
Public Sub goKernelDatosObjects(mode As Long) 'Lanzar editor de objetos principales segun modo
    Dim frm As frmDatosObjects
    Set frm = New frmDatosObjects
    frm.go mode
    If frm.resultbutton = 1 Then ancora.GuardarTodo
    Set frm = Nothing
End Sub
Public Sub goKernelDatosZpriori(ByVal idclasif As String, Optional ByVal idx As Long = -1) 'Lanzar editor de zonas de prioridad
    Dim frm As frmDatosZpriori
    Dim idper As Long

    If idx = -1 Then idx = ancora.IndexById(dCLASIF, idclasif, 0)
    idper = 1

    Set frm = New frmDatosZpriori

    frm.resultbutton = 0

    While frm.resultbutton = 0
        frm.resultbutton = 2
        Trabajando_IdZpriori = idx
        Trabajando_PerZpriori = idper
        IniBotonesZpriori
        frm.go
        If frm.resultbutton = 3 Then
            idper = frm.cboPer.ListIndex + 1
            frm.resultbutton = 0
        End If
    Wend

    Set frm = Nothing
End Sub
Public Sub goKernelDatosLinkedObjects(mode As Long)  'Lanzar editor de Objetos enlazados segun modo

    Dim frm As frmDatosLinkedObjects
    Set frm = New frmDatosLinkedObjects
    frm.go mode
    If frm.resultbutton = 1 Then ancora.GuardarTodo
    Set frm = Nothing

End Sub
Public Sub goKernelDatosAsignaturas() ' Lanzar editor de Asignaturas
    goKernelDatosLinkedObjects dASIG
End Sub
Public Sub goKernelDatosBrigadas() 'Lanzar editor de brigadas
    goKernelDatosLinkedObjects dBRIGADA
End Sub
Public Sub goKernelDatosGrupoXClasif() 'Lanzar editor de grupos por clasificación

    Dim frm As frmDatosGrupos
    Dim i As Long, j As Long, id As Long
    If ancora.cantBrg = 0 Then
        MessageDlg "Imposible continuar", "No se ha introducido brigadas", vbExclamation, "Aceptar"
        Exit Sub
    End If

    If ancora.cantClasif = 0 Then
        MessageDlg "Imposible continuar", "No se ha introducido clasificaciones", vbExclamation, "Aceptar"
        Exit Sub
    End If
    Set frm = New frmDatosGrupos
    frm.creaMatrixSePuedeTocar ancora.getCantBrg, ancora.cantClasif

    For i = 1 To ancora.cantBrg
        console.Progress "Trabajando...", kernel.utils.Porciento(i, ancora.cantBrg)
        For j = 1 To ancora.cantClasif
            DoEvents
            frm.setSePuedeTocar i, j, ancora.BrgClasifAsignada(i, j)
        Next
    Next

    ancora.reparaGxClasifBrigada
   
    frm.Refresca1
    frm.refresca
    frm.Show vbModal

    If frm.resultbutton = 1 Then ancora.GuardarTodo

    Set frm = Nothing

End Sub
Public Sub goKernelDatosDistancias() 'Lanzar editor de distancias entre lugares
    If ancora.cantLug > 0 Then
        If (ancora.cantLug > 1) Then
            frmDatosDistancias.Refresca1
            frmDatosDistancias.Show vbModal
        Else
            MessageDlg "No es necesario...", "Existe solo un lugar en su base de datos. No tiene sentido utilizar esta funcionalidad del sistema.", vbInformation, "Aceptar"
        End If
    Else
        MessageDlg "Faltan datos", "No se ha introducido lugares", vbCritical, "Aceptar"
    End If
End Sub

'Reports Strings
Public Function getRS_Generico(arreglo As Long, ix As Long, Optional id As String) As String
    Dim result As String
    Select Case arreglo
        Case dPERIODO: result = getRS_Periodo(ix, id)
        Case dESPECIALIDAD: result = getRS_Especialidad(ix, id)
        Case dCLASIF: result = getRS_Clasificacion(ix, id)
        Case dPROFE: result = getRS_Profe(ix, id)
        Case dBRIGADA: result = getRS_Brigada(ix, id)
        Case dLUGAR: result = getRS_Lugar(ix, id)
        Case dASIG: result = getRS_Asignatura(ix, id)
        Case dRECURSO: result = getRS_Recurso(ix, id)
    End Select
    getRS_Generico = result
End Function

Public Function getNameOfArreglo(ByVal arreglo As Long, Optional ByVal plural As Boolean = False) As String
    Dim result As String, s As String, es As String
    s = IIf(plural, "s", "")
    es = IIf(plural, "es", "")
    Select Case arreglo
        Case dPERIODO: result = "Período" & s
        Case dESPECIALIDAD: result = "Especialidad" & es
        Case dCLASIF: result = "Clasificaci" & IIf(plural, "ones", "ón") & " de actividad" & es
        Case dPROFE: result = "Profesor" & IIf(plural, "es", "")
        Case dBRIGADA: result = "Brigada" & s
        Case dLUGAR: result = "Lugar" & es
        Case dASIG: result = "Asignatura" & s
        Case dRECURSO: result = "Recurso" & s
    End Select
    getNameOfArreglo = result
End Function

Public Function getRS_cantImposibles() As String
    getRS_cantImposibles = ancora.getCantImposibles & " actividad(es) rechazadas durante la generación"
End Function
Public Function getRS_CantActSinGenerar() As String
    getRS_CantActSinGenerar = ancora.getCantActSinGenerar & " actividad(es) sin generar/colocar"
End Function
Public Function getRS_TotalActSinGenerar() As String
    getRS_TotalActSinGenerar = getRS_cantImposibles & ", " & getRS_CantActSinGenerar & ", para un total de " & ancora.getCantImposibles + ancora.getCantActSinGenerar & " actividades sin asignar "
End Function
Public Function getRS_Periodo(ix As Long, Optional id As String) As String
    If ix = 0 Then ix = ancora.IndexById(dPERIODO, id)
    getRS_Periodo = "(" & kernel.utils.trunca(ancora.periodos(ix).id) & ") " & kernel.utils.trunca(ancora.periodos(ix).descrip)
End Function
Public Function getRS_Lugar(ix As Long, Optional id As String) As String
    If ix = 0 Then ix = ancora.IndexById(dLUGAR, id)
    getRS_Lugar = "(" & lugar(ix).id & ") " & lugar(ix).descrip
End Function
Public Function getRS_Recurso(ix As Long, Optional id As String) As String
    If ix = 0 Then ix = ancora.IndexById(dRECURSO, id)
    If ix > 0 And ix <= ancora.recursos.Count Then
        With ancora.recursos(ix)
            getRS_Recurso = "(" & kernel.utils.trunca(.id) & ") " & kernel.utils.trunca(.descrip)
        End With
    End If
End Function
Public Function getRS_Profe(ix As Long, Optional id As String) As String
    If ix = 0 Then ix = ancora.IndexById(dPROFE, id)
    getRS_Profe = "(" & profe(ix).id & ") " & profe(ix).descrip
End Function
Public Function getRS_Especialidad(ix As Long, Optional id As String) As String
    If ix = 0 Then ix = ancora.IndexById(dESPECIALIDAD, id)
    getRS_Especialidad = "(" & kernel.utils.trunca(Especialidad(ix).id) & ") " & kernel.utils.trunca(Especialidad(ix).descrip)
End Function
Public Function getRS_Brigada(ix As Long, Optional id As String) As String
    If ix = 0 Then ix = ancora.IndexById(dBRIGADA, id)
    getRS_Brigada = "(" & kernel.utils.trunca(Brigada(ix).comun.id) & ") " & kernel.utils.trunca(Brigada(ix).comun.descrip)
End Function
Public Function getRS_Asignatura(ix As Long, Optional id As String) As String
    If ix = 0 Then ix = ancora.IndexById(dASIG, id)
    getRS_Asignatura = "(" & kernel.utils.trunca(asig(ix).comun.id) & ") " & kernel.utils.trunca(asig(ix).comun.descrip)
End Function
Public Function getRS_Clasificacion(ix As Long, Optional id As String) As String
    If ix = 0 Then ix = ancora.IndexById(dCLASIF, id)
    getRS_Clasificacion = "(" & kernel.utils.trunca(clasif(ix).comun.id) & ") " & kernel.utils.trunca(clasif(ix).comun.descrip)
End Function

Public Function showMsg_ProcesoTerminado()
    MessageDlg "Proceso terminado", "!Proceso terminado satisfactoriamente!", vbInformation, "Aceptar"
End Function

Public Sub XCHANGE_ListItem(ByRef lvw As MSComctlLib.ListView, ByVal id1 As Long, ByVal id2 As Long)
    With lvw
        .ListItems.add
        .ListItems(.ListItems.Count).ListSubItems.add
        .ListItems.Item(.ListItems.Count) = .ListItems.Item(id1)
        .ListItems.Item(id1) = .ListItems.Item(id2)
        .ListItems.Item(id2) = .ListItems.Item(.ListItems.Count)
        .ListItems.Remove (.ListItems.Count)
    End With
End Sub

'Common Dialog
Public Property Get commondlg() As CommonDialog
Set commondlg = mvarcomponents.dlgCommonDialog
End Property


Public Function abrir(path As String) As Boolean
    On Error GoTo errdep
    kernel.setDireccionFichero path
    kernel.Ancora_Reinicia
    ancora.AbrirTodo
    abrir = True
finish:
    Exit Function
errdep:
    MessageDlg "Archivo corrupto", "El archivo no pudo abrirse. Puede que haya sido dañado o no es un archivo de horarios.", vbCritical, "Aceptar"
    abrir = False
    Resume finish
End Function

'Reyenadores de boxs
Public Sub fillCboConsecutivos(ByRef cbo As ComboBox, ByVal n As Long, Optional aditivo As String = "", Optional ByVal pExtraBegin As String = "")
    cbo.clear
    Dim i As Long
    If pExtraBegin <> "" Then cbo.AddItem pExtraBegin
    For i = 1 To n
        cbo.AddItem Trim("" & i & " " & aditivo)
    Next
    If n > 0 Then cbo.ListIndex = 0
End Sub

Public Sub fillCboPer(ByRef cbo As ComboBox, Optional ByVal pExtraBegin As String = "")
    cbo.clear
    Dim i As Long
    If pExtraBegin <> "" Then cbo.AddItem pExtraBegin
    For i = 1 To ancora.periodos.Count
        cbo.AddItem getRS_Periodo(i)

    Next
    If ancora.periodos.Count > 0 Then cbo.ListIndex = 0
End Sub
Public Sub fillCboEspecialidades(ByRef cbo As ComboBox, Optional ByVal pExtraBegin As String = "")
    Dim i As Long
    With cbo
        .clear
        If pExtraBegin <> "" Then .AddItem pExtraBegin
        For i = 1 To ancora.getCantEspecialidades
            .AddItem getRS_Especialidad(i)
        Next
        If ancora.cantEsp > 0 Then .ListIndex = 0
    End With
End Sub
Public Sub fillCboRecursos(ByRef cbo As ComboBox, Optional ByVal pExtraBegin As String = "")
    Dim i As Long
    With cbo
        .clear
        If pExtraBegin <> "" Then .AddItem pExtraBegin
        For i = 1 To ancora.recursos.Count
            .AddItem getRS_Recurso(i)
        Next
        If ancora.recursos.Count > 0 Then .ListIndex = 0
    End With
End Sub
Public Sub fillCboTurnos(ByRef cbo As ComboBox, Optional ByVal pExtraBegin As String = "")
    Dim i As Long
    With cbo
        .clear
        If pExtraBegin <> "" Then .AddItem pExtraBegin
        For i = 1 To ancora.ct
            .AddItem i & " turno" & IIf(i > 1, "s", "")
        Next
        If ancora.ct > 0 Then .ListIndex = 0
    End With
End Sub
Public Sub fillCboNiveles(ByRef cbo As ComboBox, Optional ByVal pExtraBegin As String = "")
    Dim i As Long
    With cbo
        .clear
        If pExtraBegin <> "" Then .AddItem pExtraBegin
        For i = 1 To ancora.cantNiveles
            .AddItem "" & i
        Next
        If ancora.cantNiveles > 0 Then .ListIndex = 0
    End With
End Sub
Public Sub fillCboBrigadas(ByRef cbo As ComboBox, Optional ByVal pExtraBegin As String = "")
    Dim i As Long
    With cbo
        .clear
        If pExtraBegin <> "" Then .AddItem pExtraBegin
        For i = 1 To ancora.getCantBrg
            .AddItem getRS_Brigada(i)
        Next
    End With
End Sub
Public Sub fillCboProfesores(ByRef cbo As ComboBox, Optional ByVal pExtraBegin As String = "")
    Dim i As Long
    With cbo
        .clear
        If pExtraBegin <> "" Then .AddItem pExtraBegin
        For i = 1 To ancora.cantProfe
            .AddItem getRS_Profe(i)
        Next
    End With
End Sub
Public Sub fillCboLugares(ByRef cbo As ComboBox, Optional ByVal pExtraBegin As String = "")
    Dim i As Long
    With cbo
        .clear
        If pExtraBegin <> "" Then .AddItem pExtraBegin
        For i = 1 To ancora.cantLug
            .AddItem getRS_Lugar(i)
        Next
    End With
End Sub
Public Sub fillCboAsig(ByRef cbo As ComboBox, Optional ByVal pExtraBegin As String = "")
    Dim i As Long
    With cbo
        .clear
        If pExtraBegin <> "" Then .AddItem pExtraBegin
        For i = 1 To ancora.cantAsig
            .AddItem getRS_Asignatura(i)
        Next
    End With
End Sub
Public Sub fillCboClasif(ByRef cbo As ComboBox, Optional ByVal pExtraBegin As String = "")
    Dim i As Long
    With cbo
        .clear
        If pExtraBegin <> "" Then .AddItem pExtraBegin
        For i = 1 To ancora.cantClasif
            .AddItem getRS_Clasificacion(i)
        Next
    End With
End Sub
Public Sub fillListClasif(ByRef lst As VB.ListBox, Optional ByVal pExtraBegin As String = "")
    Dim i As Long
    With lst
        .clear
        If pExtraBegin <> "" Then .AddItem pExtraBegin
        For i = 1 To ancora.cantClasif
            .AddItem getRS_Clasificacion(i)
        Next
    End With
End Sub

Public Sub fillCboGenerico(arreglo As Long, ByRef cbo As ComboBox, Optional ByVal pExtraBegin As String = "")
    Select Case arreglo
        Case dESPECIALIDAD: fillCboEspecialidades cbo, pExtraBegin
        Case dPROFE: fillCboProfesores cbo, pExtraBegin
        Case dLUGAR: fillCboLugares cbo, pExtraBegin
        Case dBRIGADA: fillCboBrigadas cbo, pExtraBegin
        Case dRECURSO: fillCboRecursos cbo, pExtraBegin
        Case dPERIODO: fillCboPer cbo, pExtraBegin
        Case dASIG: fillCboAsig cbo, pExtraBegin
        Case dCLASIF: fillCboClasif cbo, pExtraBegin
    End Select
End Sub
'Insertadores

Public Sub goDataInsertarPeriodos(Optional repeat As Boolean = True)
    Dim frm As frmDatosData, plantilla As String
    Set frm = New frmDatosData
    ancora.BuscaPorHASH = False

    With frm
        .resultbutton = vbOK
        .labEspBrg.Caption = "Plantilla"

        While .resultbutton = vbOK
            .clear
            .resultbutton = vbCancel
            Dim i As Long
            .clearListaIds
            For i = 1 To ancora.periodos.Count
                .addToListaIds ancora.periodos(i).id
            Next
            fillCboPer .cboEspBrgTurno, "<ninguna>"
            .go "Agregando período", 1, True, True, True
            If .resultbutton = vbOK Then
                plantilla = ""
                If .cboEspBrgTurno.ListIndex > 0 Then plantilla = ancora.periodos(.cboEspBrgTurno.ListIndex).id
                ancora.insertPeriodo .txtID.Text, .txtDescrip.Text, .txtAlias.Text, plantilla
                If Not repeat Then .resultbutton = vbCancel
            End If
        Wend

    End With
    Set frm = Nothing
End Sub
Public Sub goDataInsertarEspecialdiades(Optional repeat As Boolean = True)
    Dim frm As frmDatosData
    Set frm = New frmDatosData
    ancora.BuscaPorHASH = False

    With frm
        .resultbutton = vbOK

        While .resultbutton = vbOK
            Dim i As Long
            .clear
            .clearListaIds
            For i = 1 To ancora.cantEsp
                .addToListaIds Especialidad(i).id
            Next
            .go "Agregando especialidad", 2, True, True
            If .resultbutton = vbOK Then
                ancora.insertEspecialidad .txtID.Text, .txtDescrip.Text, .txtAlias.Text
                If Not repeat Then .resultbutton = vbCancel
            End If
        Wend
    End With
    Set frm = Nothing
End Sub
Public Sub goDataInsertarClasificacion(Optional repeat As Boolean = True)
    Dim frm As frmDatosData
    Set frm = New frmDatosData
    ancora.BuscaPorHASH = False
    With frm
        .labEspBrg.Caption = "Cantidad de turnos"
        fillCboTurnos .cboEspBrgTurno
        .resultbutton = vbOK
        While .resultbutton = vbOK
            .resultbutton = vbCancel
            Dim i As Long
            .clearListaIds
            For i = 1 To ancora.cantClasif
                .addToListaIds clasif(i).comun.id
            Next
            .go "Agregando clasificación de actividad", 3, True, False, True
            If .resultbutton = vbOK Then
                ancora.insertClasifAct .txtID.Text, .txtDescrip.Text, .cboEspBrgTurno.ListIndex + 1, , .txtAlias.Text
                If Not repeat Then .resultbutton = vbCancel
            End If
        Wend
    End With
    Set frm = Nothing
End Sub
Public Sub goDataInsertarBrigadas(Optional repeat As Boolean = True)
    Dim frm As frmDatosData
    Set frm = New frmDatosData
    ancora.BuscaPorHASH = False

    With frm
        .resultbutton = vbOK
        .labEspBrg.Caption = "Especialidad"
        fillCboEspecialidades .cboEspBrgTurno
        fillCboNiveles .cboNivel
        While .resultbutton = vbOK
            .clear
            .resultbutton = vbCancel
            Dim i As Long
            .clearListaIds
            For i = 1 To ancora.cantBrg
                .addToListaIds Brigada(i).comun.id
            Next
            .go "Agregando brigada", 4, True, True, True, True
            If .resultbutton = vbOK Then
                ancora.insertBrigada .txtID.Text, .txtDescrip.Text, Especialidad(.cboEspBrgTurno.ListIndex + 1).id, .cboNivel.ListIndex + 1, .txtAlias.Text
                If Not repeat Then .resultbutton = vbCancel
            End If
        Wend
    End With
    Set frm = Nothing
End Sub
Public Sub goDataInsertarAsignaturas(Optional repeat As Boolean = True)
    Dim frm As frmDatosData
    Set frm = New frmDatosData
    ancora.BuscaPorHASH = False
    
    With frm
        .resultbutton = vbOK
        .labEspBrg.Caption = "Especialidad"
        fillCboEspecialidades .cboEspBrgTurno
        fillCboNiveles .cboNivel
        While .resultbutton = vbOK
            .clear
            .resultbutton = vbCancel
            Dim i As Long
            .clearListaIds
            For i = 1 To ancora.cantAsig
                .addToListaIds asig(i).comun.id
            Next
            .go "Agregando asignatura", 5, True, True, True, True
            If .resultbutton = vbOK Then
                ancora.insertAsignatura .txtID.Text, .txtDescrip.Text, Especialidad(.cboEspBrgTurno.ListIndex + 1).id, .cboNivel.ListIndex + 1, .txtAlias.Text
                If Not repeat Then .resultbutton = vbCancel
            End If
        Wend
    End With
    Set frm = Nothing
End Sub
Public Sub goDataInsertarProfesor(Optional repeat As Boolean = True)
    Dim frm As frmDatosData
    Set frm = New frmDatosData
    ancora.BuscaPorHASH = False
    With frm
        .cboEspBrgTurno.Visible = False
        .labEspBrg.Visible = False
        
        .resultbutton = vbOK
        While .resultbutton = vbOK
            .clear
            .resultbutton = vbCancel
            Dim i As Long
            .clearListaIds
            For i = 1 To ancora.cantProfe
                .addToListaIds profe(i).id
            Next
            .go "Agregando profesor", 6, True, True
            If .resultbutton = vbOK Then
                ancora.insertProfe .txtID.Text, .txtDescrip.Text, .txtAlias.Text
                If Not repeat Then .resultbutton = vbCancel
            End If
        Wend
    End With
    Set frm = Nothing
End Sub
Public Sub goDataInsertarLugar(Optional repeat As Boolean = True)
    Dim frm As frmDatosData
    Set frm = New frmDatosData
    ancora.BuscaPorHASH = False
    With frm
        .resultbutton = vbOK
        While .resultbutton = vbOK
            .clear
            .resultbutton = vbCancel
            Dim i As Long
            .clearListaIds
            For i = 1 To ancora.cantLug
                .addToListaIds lugar(i).id
            Next
            .go "Agregando lugar", 7, True, True
            If .resultbutton = vbOK Then
                ancora.insertLugar .txtID.Text, .txtDescrip.Text, .txtAlias.Text
                If Not repeat Then .resultbutton = vbCancel
            End If
        Wend
    End With
    Set frm = Nothing
End Sub
Public Sub goDataInsertarRecurso(Optional repeat As Boolean = True)
    Dim frm As frmDatosData
    Set frm = New frmDatosData
    ancora.BuscaPorHASH = False
    With frm
        .resultbutton = vbOK
        While .resultbutton = vbOK
            .clear
            .resultbutton = vbCancel
            Dim i As Long
            .clearListaIds
            For i = 1 To ancora.recursos.Count
                .addToListaIds ancora.recursos(i).id
            Next
            .go "Agregando recurso", 8, True, True
            If .resultbutton = vbOK Then
                ancora.recursos.add New TGOH_arrRestriccion, .txtID.Text, .txtAlias.Text, .txtDescrip.Text, 0, ""
                If Not repeat Then .resultbutton = vbCancel
            End If
        Wend
    End With
    Set frm = Nothing
End Sub

Public Sub goKernelBienvenido()

    Dim frm As frmKernelBienvenido

    Set frm = New frmKernelBienvenido

    frm.go

    With frm

        Select Case .resultbutton
            Case 1
                frmKernelMain.goOpcion "archivo_nuevo"
            Case 2
                goAsistente
            Case 3
                goAsistente False
            Case 4
                frmKernelMain.goOpcion "archivo_abrir"
        End Select

        If Me.estado = ARCHIVO_ABIERTO Then
            frmKernelMain.Enabled = True
            frmKernelMain.ArchivoAbierto = True
            frmKernelMain.ShowfrmExplorerSchedule
            frmKernelMain.goMuestraHorario
        End If
    
    End With

    Set frm = Nothing

End Sub

Public Sub goKernelDatosDesgloses()
    Dim frm As frmDatosDesgloseAct
    Set frm = New frmDatosDesgloseAct
    frm.Show vbModal
    If frm.resultbutton = 1 Then ancora.GuardarTodo
    Set frm = Nothing
End Sub

Public Sub goKernelDatosRxAct()
    Dim frm As frmDatosAsignacionRxAct
    Set frm = New frmDatosAsignacionRxAct
        
    If ancora.getCantLug = 0 Then
        MessageDlg "Imposible continuar", "No se ha introducido lugares", vbCritical, "Aceptar"
        Exit Sub
    End If

    If ancora.getCantAsig = 0 Then
        MessageDlg "Imposible continuar", "No se ha introducido asignaturas", vbCritical, "Aceptar"
        Exit Sub
    End If

    If ancora.getCantBrg = 0 Then
        MessageDlg "Imposible continuar", "No se ha introducido brigadas", vbCritical, "Aceptar"
        Exit Sub
    End If

    If ancora.getCantPer = 0 Then
        MessageDlg "Imposible continuar", "No se ha introducido períodos", vbCritical, "Aceptar"
        Exit Sub
    End If

    frm.Show vbModal
    Set frm = Nothing
End Sub
Public Sub goKernelGenerar()

    If Not ColaDeGeneracion Is Nothing Then Set ColaDeGeneracion = Nothing
    Set ColaDeGeneracion = New TKernel_arrProcesoEnCola

    With frmGeneradorGenerar
        fillCboEspecialidades .cboEsp
        fillCboNiveles .cboNivel
        fillCboPer .cboPer
        .Show vbModal
    End With
End Sub

'Lanza el assistente del sistema
'El asistente guía paso a paso para confeccionar un archivo de horarios
Public Sub goAsistente(Optional nuevo As Boolean = True, Optional abrir As Boolean = True)

    Dim frm As frmKernelAssistant
    Dim paso As Long
    Dim r As Variant
    Dim dobleespacio As String

    dobleespacio = Chr(13) & Chr(10) & Chr(13) & Chr(10)

    Set frm = New frmKernelAssistant

    'crear el archivo
10
    frm.go "Hola, soy el asistente de Áncora GOH.", _
    "Mi misión es guiarlo paso a paso para confeccionar un archivo de horarios. " & _
    "El uso y comprensión de las funcionalidades del sistema exigen que el usuario interiorice " & _
    "algunos conceptos. " & dobleespacio & dobleespacio & "Los conceptos se explicarán brevemente en cada paso. " & _
    "La ayuda del sistema proporciona más información." & doblespacio & _
    dobleespacio & dobleespacio & "Haga click en el botón 'Empezar'", , False, False

    paso = 1
    If abrir Then
        frm.go "Paso 1: " & IIf(nuevo, "Crear", "Abrir") & " el archivo", "Empezaremos " & IIf(nuevo, "creando un Nuevo ", "abriendo un ") & _
        "Archivo de Horarios. En un archivo usted tendrá toda la información de una planificación, como puede ser la de un curso o semestre. " & dobleespacio & _
        "Cuando desee comenzar otra planificación debe crear un archivo o abrir otro y modificarlo." & dobleespacio & dobleespacio & _
        "A continuación se muestra un cuadro de diálogo para que especifique el nombre y la ubicación del archivo." & dobleespacio & _
        dobleespacio & "Haga click en 'Adelante'", , False

        If frm.resultbutton = 1 Then GoTo 10
        If frm.resultbutton = 4 Then GoTo interrumpir
crear:
        If nuevo Then frmKernelMain.goOpcion "archivo_nuevo" Else frmKernelMain.goOpcion "archivo_abrir"
        If Not EstadoApp Then
interrumpir:
            r = MessageDlg("Interrumpir al asistente", "¿Está seguro que desea interrumpir el asistente?", vbQuestion, "No", "Sí")
            If r = 2 Then GoTo abort
            GoTo crear
        End If
    End If

    If Not abrir Then
        paso = 2
        GoTo 40
    End If

    If EstadoApp Then

        While paso < 16
20:
            Select Case frm.resultbutton
                Case 1:
30:
                    EstadoApp = False

                    GoTo 10
                Case 2: paso = paso - 1
                Case 3: paso = paso + 1
                Case 4:

                    r = MessageDlg("Interrumpir al asistente", "¿Está seguro que desea interrumpir el asistente?", vbQuestion, "No", "Sí")
                    If r = 2 Then GoTo finish
            End Select
40:
            Select Case paso
                Case 1:
                    GoTo 30
                Case 2:
                    frm.go "Paso " & paso & ": La configuración de tiempo", _
                    "La configuración de tiempo es determinar como se trata al tiempo, " & _
                    "en que intervalos se divide, con cuáles parámetros se mide, etcétera. " & dobleespacio & _
                    "En Áncora GOH la planificación se realiza por Períodos. " & _
                    "Un período es un conjunto de días, dígase una semana o una quincena." & dobleespacio & dobleespacio & _
                    "En la presente versión del sistema, el máximo de días por período es " & MAX_DIAS & " y cada día " & _
                    "tiene " & MAX_TURNOS & " turnos como máximo." & dobleespacio & dobleespacio & _
                    "En los Datos Generales se establecen la cantidad de días y de turnos que poseen los " & _
                    "Períodos de su planificación." & dobleespacio & _
                     dobleespacio & dobleespacio & "Haga click en 'Adelante'"
                    
                    If frm.resultbutton = 6 Then
                        paso = paso + 1
                        GoTo 40
                    End If
                    If frm.resultbutton <> 3 Then GoTo 20

                    goKernelDatosGenerales

                Case 3:
                    frm.go "Paso " & paso & ": Introducir los Períodos", "En todo el sistema se trabaja con las Identificaciones. " & _
                    "La Identificación es un texto que hace único a un elemento en una colección de muchos elementos. " & dobleespacio & dobleespacio & _
                    "Los Períodos son ejemplos de elementos que poseen Identificación. Ocasionalmente se asocia " & _
                    "Identificación con Abreviatura. Por ejemplo: 'SI' puede ser 'Semana Impar'. " & dobleespacio & dobleespacio & _
                    "Una Identificación solo puede contener los caracteres " & dobleespacio & dobleespacio & "a b c d e f g h i j k l m n o p q r s t u v w x y z 1 2 3 4 5 6 7 8 9 0 _ - / ( ) ." & dobleespacio & _
                    dobleespacio & "En la siguiente ventana establezca cuáles son sus períodos " & _
                    dobleespacio & dobleespacio & "Haga click en 'Adelante' para continuar"
                    If frm.resultbutton = 6 Then
                        paso = paso + 1
                        GoTo 40
                    End If
                    If frm.resultbutton <> 3 Then GoTo 20
                    goKernelDatosPeriodos
               Case 4:
                    If ancora.periodos.Count = 0 Then
                        MessageDlg "Debe repetir el paso anterior", "Para continuar tiene que introducir al menos un Período.", vbCritical, "Aceptar"
                        paso = paso - 1
                        GoTo 40
                    End If
                    frm.go "Paso " & paso & ": Definir los niveles", "Nivel se asocia a Nivel de Complejidad del conocimiento que aprenden los estudiantes a lo largo de su trayectoria académica. Suele llamarse Grado Escolar en escuelas primarias, secundarias y preuniversitarios y Año Académico en las universidades." & dobleespacio & dobleespacio & _
                    "A continuación debe definir la cantidad de niveles con los cuales va a trabajar. Debe existir al menos un nivel." & dobleespacio & _
                    dobleespacio & dobleespacio & "Haga click en 'Adelante' para continuar"
                    If frm.resultbutton = 6 Then
                        paso = paso + 1
                        GoTo 40
                    End If
                    If frm.resultbutton <> 3 Then GoTo 20
                    goKernelDatosNiveles
                Case 5:
                    frm.go "Paso " & paso & ": Conformar las Especialidades", "Los estudiantes se agrupan en Brigadas. " & _
                    "Una Especialidad junto a un Nivel es la forma de conectar a las Brigadas con sus Asignaturas. " & _
                    "Una Brigada realizará las actividades de las Asignaturas que sean de su misma Especialidad y Nivel." & dobleespacio & dobleespacio & dobleespacio & _
                    "En planificación docente se asocian las Especialidades a las carreras en las universidades. " & _
                    "Por ejemplo, Ingeniería en Automática, Ciencias de la Computación, Derecho, entre otras." & _
                    dobleespacio & dobleespacio & "Haga click en 'Adelante' para continuar"
                    If frm.resultbutton = 6 Then
                        paso = paso + 1
                        GoTo 40
                    End If
                    If frm.resultbutton <> 3 Then GoTo 20
                    goKernelDatosEspecialidades

                Case 6:
                    
                    If ancora.cantEsp = 0 Then
                        MessageDlg "Debe repetir el paso anterior", "Para continuar tiene que introducir al menos una Especialidad.", vbCritical, "Aceptar"
                        paso = paso - 1
                        GoTo 40
                    End If
                    
                    frm.go "Paso " & paso & ": Construir Brigadas", "Una brigada es conjunto de estudiantes." & _
                    "Cada brigada pertenece a una Especialidad y un Nivel. " & _
                    "Además, opcionalmente se le puede establecer una matrícula." & _
                    dobleespacio & dobleespacio & "El dato de la matrícula es utilizado en comparación con las capacidades de los " & _
                    "lugares (véase más adelante). El generador no colocará a una o varias brigadas juntas en un lugar " & _
                    "que no quepan. Si la matrícula es igual a cero, no se tendrá en cuenta esta comparación." & _
                    dobleespacio & dobleespacio & "Haga click en 'Adelante' para construir las brigadas"
                    
                    If frm.resultbutton = 6 Then
                        paso = paso + 1
                        GoTo 40
                    End If
                    
                    If frm.resultbutton <> 3 Then GoTo 20
                    goKernelDatosBrigadas
                    
                Case 7:
                    frm.go "Paso " & paso & ": Clasificar actividades", "Una Clasificación de Actividad, " & _
                    "conocida en planificación docente como 'Forma de enseñanza', es la forma de agrupar " & _
                    "las actividades por su comportamiento y características comunes. " & dobleespacio & dobleespacio & "Como ejemplos de clasificaciones " & _
                    "tenemos a las Conferencias, Clases prácticas, Clase de Educación Física, Laboratorio, Taller, etc. " & _
                    dobleespacio & "Haga click en 'Adelante' para introducir las Clasificaciones de Actividades"
                    If frm.resultbutton = 6 Then
                        paso = paso + 1
                        GoTo 40
                    End If
                    If frm.resultbutton <> 3 Then GoTo 20
                    goKernelDatosClasificaciones
                Case 8:
                    If ancora.cantClasif = 0 Then
                        MessageDlg "Debe repetir el paso anterior", "Para continuar tiene que introducir al menos una Clasificación de Actividad.", vbCritical, "Aceptar"
                        paso = paso - 1
                        GoTo 40
                    End If
                    frm.go "Paso " & paso & ": ¿Dónde realizo las actividades?", "Un Lugar es una parte del espacio, no " & _
                    "necesariamente un Aula, donde se pueden realizar actividades. Pueden ser lugares, un Taller, " & _
                    "un Laboratorio, una Plaza, un Edificio." & dobleespacio & dobleespacio & "A continuación especifique cuales son los lugares de su centro de enseñanza dirigidos a la labor docente." & dobleespacio & dobleespacio & "Haga click en 'Adelante' para insertarlos"

                    If frm.resultbutton = 6 Then
                        paso = paso + 1
                        GoTo 40
                    End If
                    If frm.resultbutton <> 3 Then GoTo 20
                    goKernelDatosLugares
                    
                Case 9:
                    If ancora.cantLug = 0 Then
                        MessageDlg "Debe repetir el paso anterior", "Para continuar tiene que introducir al menos un Lugar.", vbCritical, "Aceptar"
                        paso = paso - 1
                        GoTo 40
                    End If

                    frm.go "Paso " & paso & ": Otros recursos", "Además de los recursos humanos y los espaciales, existen otros, que por naturaleza deben ser transportables. Los recursos transportables son aquellos objetos que son necesarios para realizar una actividad y que pueden ser trasladados de un lugar a otro. Generalmente se les conoce como medios de enseñanza. " & _
                    dobleespacio & dobleespacio & "A continuación establezca los recursos transportables a utilizar en la labor docente de su centro de enseñanza." & dobleespacio & dobleespacio & "Haga click en 'Adelante' para continuar"

                    If frm.resultbutton = 6 Then
                        paso = paso + 1
                        GoTo 40
                    End If
                    If frm.resultbutton <> 3 Then GoTo 20
                    goKernelOtrosRecursos
                Case 10:
                    frm.go "Paso " & paso & ": ¿Cómo agrupo a las brigadas?", "Un Grupo por Clasificación de Actividad es un conjunto de Brigadas que existe cuando se realizan las actividades de una misma clasificación. Es decir, las brigadas que pertenezcan a un mismo grupo para una clasificación de actividad dada, realizarán las actividades de esa clasificación al mismo tiempo. " & _
                    dobleespacio & dobleespacio & "Por ejemplo puede que las brigadas B1 y B2 se agrupen para dar las Conferencias y las brigadas B3 y B4 en otro grupo. Luego puede que se separen cada una para dar las Clases Prácticas. Se dice entonces que B1 y B2 forman el Grupo 1 de Conferencia  y que B2 y B3 el Grupo 2 de Conferencia. A su vez se dice que las brigadas B1, B2, B3 y B4, forman los grupos 1, 2, 3 y 4 de Clase Práctica respectivamente." & dobleespacio & dobleespacio & _
                    "A continuación establezca cómo se agrupan las brigadas de su centro de enseñanza para cada clasificación de actividad. " & dobleespacio & dobleespacio & "Haga click en 'Adelante' para continuar"
                    If frm.resultbutton = 6 Then
                        paso = paso + 1
                        GoTo 40
                    End If
                    If frm.resultbutton <> 3 Then GoTo 20
                    goKernelDatosGrupoXClasif

                Case 11:
                    frm.go "Paso " & paso & ": Los profesores", "Un profesor es considerado el dirigente de una actividad. " & dobleespacio & dobleespacio & "Introduzca a continuación la información acerca de los profesores de su centro de enseñanza." & _
                    dobleespacio & dobleespacio & "Haga click en 'Adelante' para continuar"
                    If frm.resultbutton = 6 Then
                        paso = paso + 1
                        GoTo 40
                    End If
                    If frm.resultbutton <> 3 Then GoTo 20
                    goKernelDatosProfesores
                Case 12:
                    If ancora.cantProfe = 0 Then
                        MessageDlg "Debe repetir el paso anterior", "Para continuar tiene que introducir al menos un Profesor.", vbCritical, "Aceptar"
                        paso = paso - 1
                        GoTo 40
                    End If
                    frm.go "Paso " & paso & ": Las Asignaturas", "Una Asignatura abarca un conjunto de conocimientos que imparten los profesores a sus estudiantes en las distintas actividades. Como ejemplos de asignaturas se tiene a Matemática, Física, Economía Política, entre otras." & _
                    dobleespacio & dobleespacio & "Defina a continuación cuáles son las asignaturas que se imparten en cada Especialidad y Nivel de Enseñanza de su centro." & dobleespacio & dobleespacio & "Haga click en 'Adelante' para continuar"
                    If frm.resultbutton = 6 Then
                        paso = paso + 1
                        GoTo 40
                    End If
                    If frm.resultbutton <> 3 Then GoTo 20
                    goKernelDatosAsignaturas
                Case 13:
                    If ancora.cantAsig = 0 Then
                        MessageDlg "Debe repetir el paso anterior", "Para continuar tiene que introducir al menos una Asignatura.", vbCritical, "Aceptar"
                        paso = paso - 1
                        GoTo 40
                    End If
                    frm.go "Paso " & paso & ": ¿Y las actividades en un período?", "Cada asignatura posee Desgloses de Actividades por Período, no necesariamente en todos. Un Desglose describe cuáles actividades deben realizar las Brigadas, en qué orden y bajo qué circunstancias." & _
                    dobleespacio & dobleespacio & "Especifica a continuación las actividades para cada asignatura que se van a realizar en cada período de tiempo." & dobleespacio & dobleespacio & "Haga click en 'Adelante' para continuar"
                    If frm.resultbutton = 6 Then
                        paso = paso + 1
                        GoTo 40
                    End If
                    If frm.resultbutton <> 3 Then GoTo 20
                    goKernelDatosDesgloses
                Case 14:
                    frm.go "Paso " & paso & ": Los estudiantes se trasladan mucho", "La distancia o costo de traslado entre lugares se puede especificar en este paso. Esta información la utiliza el generador para minimizar el costo de traslado de los estudiantes entre un lugar y otro. Para especificar que una distancia determinada no interesa tenerla en cuenta, establézcala como igual a cero. " & _
                    dobleespacio & dobleespacio & "A continuación se muestra la ventana para gestionar las distancias entre lugares. Existen dos formas de trabajar con ellas: de forma tabular o en forma de gráfico o mapa. La ventaja de utilizar la forma gráfica es que las distancias pueden ser actualizadas automáticamente a partir de la distribución de los lugares que usted defina en el plano." & dobleespacio & dobleespacio & "Haga click en 'Adelante' para continuar"
                    If frm.resultbutton = 6 Then
                        paso = paso + 1
                        GoTo 40
                    End If
                    If frm.resultbutton <> 3 Then GoTo 20
                    goKernelDatosDistancias
                Case 15:
                    frm.go "Paso " & paso & ": Los recursos", "Los recursos en Áncora GOH, son considerados los lugares como recursos espaciales, a los profesores como recursos humanos y otros recursos transportables. En se especifica que recursos están disponibles para cada actividad. " & _
                    dobleespacio & dobleespacio & "Se considera que este paso es el más tedioso y trabajoso de todo el proceso de planificación. Pero gracias a la herramienta 'Clonar recursos' usted puede con un solo clic asignar automáticamente recursos para un conjunto específico de actividades." & dobleespacio & dobleespacio & "Haga click en 'Adelante' para continuar"
                    If frm.resultbutton = 6 Then
                        paso = paso + 1
                        GoTo 40
                    End If
                    If frm.resultbutton <> 3 Then GoTo 20
                    goKernelDatosRxAct
                Case 16:
                    frm.go "Estamos listos para generar!", "A continuación se guardarán los datos y se mostrará el generador de horarios. Asegúrese de haber agrupado las brigadas por clasificaciones de actividades, y haber establecido los recursos necesarios para las actividades, de lo contrario no se generarán los horarios." & _
                    dobleespacio & dobleespacio & "Haga click en 'Adelante' para continuar"
                    If frm.resultbutton = 6 Then
                        paso = paso + 1
                        GoTo 40
                    End If
                    If frm.resultbutton <> 3 Then GoTo 20
                    ancora.GuardarTodo
                    goKernelGenerar
            End Select
        Wend
    End If
finish:
    ancora.GuardarTodo
abort:            Set frm = Nothing

End Sub

Public Sub goKernelAutoRestricc()
    Dim ix As Long, i As Long, j As Long
    Dim frm As frmDatosAutoRestricc
    Set frm = New frmDatosAutoRestricc
    With frm

        fillCboPer .cboPer, "<todos>"
        LimpiaBotonesRestriccion
        For i = 1 To MAX_DIAS
            For j = ancora.ct + 1 To MAX_TURNOS
                ix = (j - 1) * MAX_DIAS + i
                .cmdRes(ix - 1).BackColor = &H808080
                .cmdRes(ix - 1).Enabled = False
            Next
        Next
        For i = ancora.CD + 1 To MAX_DIAS
            For j = 1 To MAX_TURNOS
                ix = (j - 1) * MAX_DIAS + i
                .cmdRes(ix - 1).BackColor = &H808080
                .cmdRes(ix - 1).Enabled = False
            Next
        Next
    End With


    frm.Show vbModal
    Set frm = Nothing
End Sub

Public Sub fillLvwBrigadas(ByRef lvw As MSComctlLib.ListView, Optional icon As Long = 1, Optional ByVal cantids As Long = -1, Optional ByVal ids As Variant)
    Dim i As Long, j As Long, ix As Long, cant As Long
    With lvw
        .ListItems.clear
        .ColumnHeaders.clear
        .ColumnHeaders.add , , "Identificación"
        .ColumnHeaders.add , , "Descripción"
        .ColumnHeaders.add , , "Especialidad"
        .ColumnHeaders.add , , "Nivel"
        
        If cantids = -1 Then cant = ancora.getCantBrg Else cant = cantids
        
        For j = 1 To cant
            If cantids = -1 Then i = j Else i = ids(j)
            .ListItems.add , , Brigada(i).comun.id, icon, icon
            .ListItems(j).ListSubItems.add , , Brigada(i).comun.descrip
            ix = ancora.IndexById(dESPECIALIDAD, Brigada(i).idesp, 0)
            .ListItems(j).ListSubItems.add , , getRS_Especialidad(ix)
            .ListItems(j).ListSubItems.add , , "" & Brigada(i).Nivel
        Next
    End With
End Sub

Public Sub fillLvwAsig(ByRef lvw As MSComctlLib.ListView, Optional icon As Long = 1)
    Dim i As Long
    With lvw
        .ListItems.clear
        .ColumnHeaders.clear
        .ColumnHeaders.add , , "Identificación"
        .ColumnHeaders.add , , "Descripción"
        .ColumnHeaders.add , , "Especialidad"
        .ColumnHeaders.add , , "Nivel"
        For i = 1 To ancora.getCantAsig
            .ListItems.add , , asig(i).comun.id, icon, icon
            .ListItems(i).ListSubItems.add , , asig(i).comun.descrip
            Dim ix As Long
            ix = ancora.IndexById(dESPECIALIDAD, asig(i).idesp, 0)
            .ListItems(i).ListSubItems.add , , getRS_Especialidad(ix)
            .ListItems(i).ListSubItems.add , , "" & asig(i).Nivel
        Next
    End With
End Sub

Public Sub fillLvwProfe(ByRef lvw As MSComctlLib.ListView, Optional icon As Long = 1)
    Dim i As Long
    With lvw
        .ListItems.clear
        .ColumnHeaders.clear
        .ColumnHeaders.add , , "Identificación"
        .ColumnHeaders.add , , "Descripción"
        For i = 1 To ancora.cantProfe
            .ListItems.add , , profe(i).id, icon, icon
            .ListItems(i).ListSubItems.add , , profe(i).descrip
        Next
    End With
End Sub

Public Sub fillLvwLugar(ByRef lvw As MSComctlLib.ListView, Optional icon As Long = 1)
    Dim i As Long
    With lvw
        .ListItems.clear
        .ColumnHeaders.clear
        .ColumnHeaders.add , , "Identificación"
        .ColumnHeaders.add , , "Descripción"
        For i = 1 To ancora.cantLug
            .ListItems.add , , lugar(i).id, icon, icon
            .ListItems(i).ListSubItems.add , , lugar(i).descrip
        Next
    End With
End Sub
Public Sub fillLvwRecurso(ByRef lvw As MSComctlLib.ListView, Optional icon As Long = 1, Optional cant As Long = -1, Optional lista As Variant)
    Dim i As Long, cc As Long, j As Long
    With lvw
        .ListItems.clear
        .ColumnHeaders.clear
        .ColumnHeaders.add , , "Identificación"
        .ColumnHeaders.add , , "Descripción"
        
        If cant = -1 Then cc = ancora.recursos.Count Else cc = cant
        For j = 1 To cc
             If cant = -1 Then i = j Else i = lista(j)
            .ListItems.add , , ancora.recursos(i).id, icon, icon
            .ListItems(i).ListSubItems.add , , ancora.recursos(i).descrip
        Next
    End With
End Sub
Public Sub fillLvwHRT(ByRef lvw As MSComctlLib.ListView, Optional icon As Long = 1)
    
    Dim i As Long
    
    With lvw
        
        .ListItems.clear
        
        .ColumnHeaders.clear
        
        .ColumnHeaders.add , , "Elemento que hereda"
        .ColumnHeaders.add , , "Elemento que transmite"
        
        .ColumnHeaders(1).Width = .Width / 2
        .ColumnHeaders(2).Width = .Width / 2
        
        Dim hrt As TGOH_HRT
        
        For i = 1 To ancora.hrt.Count
            
            Set hrt = ancora.hrt(i)
            
            Select Case hrt.tipoObjetoA
                Case dESPECIALIDAD: icon = 2
                Case dBRIGADA: icon = 3
                Case dPROFE: icon = 4
                Case dLUGAR: icon = 5
                Case dRECURSO: icon = 6
            End Select
            
            .ListItems.add , , getNameOfArreglo(hrt.tipoObjetoA) & " - " & getRS_Generico(hrt.tipoObjetoA, 0, hrt.idObjetoA), icon, icon
            
            Select Case hrt.tipoObjetoB
                Case dESPECIALIDAD: icon = 2
                Case dBRIGADA: icon = 3
                Case dPROFE: icon = 4
                Case dLUGAR: icon = 5
                Case dRECURSO: icon = 6
            End Select
            
            .ListItems(i).ListSubItems.add , , getNameOfArreglo(hrt.tipoObjetoB) & " - " & getRS_Generico(hrt.tipoObjetoB, 0, hrt.idObjetoB), icon
            
        Next
    End With
End Sub
Public Sub fillLvwEspec(ByRef lvw As MSComctlLib.ListView, Optional icon As Long = 1)
    Dim i As Long
    With lvw
        .ListItems.clear
        .ColumnHeaders.clear
        .ColumnHeaders.add , , "Identificación"
        .ColumnHeaders.add , , "Descripción"
        For i = 1 To ancora.cantEsp
            .ListItems.add , , Especialidad(i).id, icon, icon
            .ListItems(i).ListSubItems.add , , Especialidad(i).descrip
        Next
    End With
End Sub

Public Sub fillLvwPeriodo(ByRef lvw As MSComctlLib.ListView, Optional icon As Long = 1)
    Dim i As Long
    With lvw
        .ListItems.clear
        .ColumnHeaders.clear
        .ColumnHeaders.add , , "Identificación"
        .ColumnHeaders.add , , "Descripción"
        For i = 1 To ancora.periodos.Count
            .ListItems.add , , ancora.periodos(i).id, icon, icon
            .ListItems(i).ListSubItems.add , , ancora.periodos(i).descrip
        Next
    End With
End Sub

Public Sub fillLvwClasif(ByRef lvw As MSComctlLib.ListView, Optional icon As Long = 1)
    Dim i As Long
    With lvw
        .ListItems.clear
        .ColumnHeaders.clear
        .ColumnHeaders.add , , "Identificación"
        .ColumnHeaders.add , , "Descripción"
        For i = 1 To ancora.cantClasif
            .ListItems.add , , clasif(i).comun.id, icon, icon
            .ListItems(i).ListSubItems.add , , clasif(i).comun.descrip
        Next
    End With
End Sub

Public Sub SelectAll_Lvw(ByRef lvw As MSComctlLib.ListView, Optional value As Long = 1, Optional sele As Boolean = False)
    'value=1 todos, value=0 ninguno, value=2 invertir
    Dim i As Long
    With lvw.ListItems
        For i = 1 To .Count
            If .Item(i).Selected = sele Or Not sele Then .Item(i).Checked = IIf(value = 1, True, IIf(value = 0, False, Not .Item(i).Checked))
        Next
    End With
End Sub
Public Sub filllvwColumnHeaders(ByRef lvw As MSComctlLib.ListView, data As Variant, cant As Long, Optional limpiar As Boolean = True)
    Dim i As Long
    With lvw.ColumnHeaders
        If limpiar Then .clear
        For i = 1 To cant
            .add , , "" & data(i - 1)
        Next
    End With
End Sub
Public Sub filllvwSubItems(ByRef lvw As MSComctlLib.ListView, row As Long, data As Variant, cant As Long, Optional limpiar As Boolean = True)
    Dim i As Long
    With lvw.ListItems(row).ListSubItems
        If limpiar Then .clear
        For i = 1 To cant
            .add , , "" & data(i - 1)
        Next
    End With
End Sub
Public Sub filllvwImposibles(ByRef lvw As MSComctlLib.ListView, Optional icon As Integer = 1)
    Dim i As Long

    lvw.ListItems.clear
    filllvwColumnHeaders lvw, Array("Fecha", "Hora", "Brigada", "Asignatura", "Período", "Actividad", "Clasificación", "Máximo de Colocaciones", "Rechazos por falta de profesor", "Rechazos por falta de lugar", "Rechazos por restricciones"), 11

    For i = 1 To ancora.getCantImposibles
        With Imposibles(i)
            lvw.ListItems.add , , .fecha, icon, icon
            filllvwSubItems lvw, i, Array(.hora, getRS_Brigada(0, .idbrigada), getRS_Asignatura(0, .idasig), getRS_Periodo(0, .idperiodo), .idact, getRS_Clasificacion(ancora.getClasifOfActivity(.idasig, .idperiodo, .idact)), .MAXPI, .RechazosXProf, .RechazosXLug, .RechazosXRest), 10
            If Mid(Imposibles(i).idbrigada, 1, 1) = "_" Then lvw.ListItems.Item(i).ListSubItems(2).ReportIcon = 2
        End With
    Next
End Sub

Public Sub filllvwActividadesSinGenerar(ByRef lvw As MSComctlLib.ListView, Optional icon As Integer = 1)
    Dim i As Long

    'busco actividades no generadas, ni fijadas
    lvw.ListItems.clear

    filllvwColumnHeaders lvw, Array("Especialidad", "Nivel", "Asignatura", "Período", "Actividad", "Clasificación", "Brigadas"), 7

    For i = 1 To cantSgenerar
        With Sgenerar(i)
            lvw.ListItems.add , , getRS_Especialidad(0, .idesp), icon, icon
            filllvwSubItems lvw, i, Array(.Nivel, getRS_Asignatura(0, .idasig), getRS_Periodo(0, .idper), .idact, getRS_Clasificacion(0, .idclasif), .brgs), 6
        End With
    Next

End Sub
Public Sub goReporteHuecosComunes()
    Dim frm As New frmReportesHuecosComunes
    Dim i As Long
    fillCboPer frm.cboPeriod

    'especialidades
    Load frm.lvw(1)
    fillLvwEspec frm.lvw(1), 6

    'brigadas
    Load frm.lvw(2)
    fillLvwBrigadas frm.lvw(2), 2

    'asignaturas
    Load frm.lvw(3)
    fillLvwAsig frm.lvw(3), 5

    'clasif
    Load frm.lvw(4)
    fillLvwClasif frm.lvw(4)

    'profes
    Load frm.lvw(5)
    fillLvwProfe frm.lvw(5), 1

    'lugar
    Load frm.lvw(6)
    fillLvwLugar frm.lvw(6), 3

    'recurso
    Load frm.lvw(7)
    fillLvwRecurso frm.lvw(7), 7

    For i = 1 To frm.lvw.Count - 1
        With frm.lvw(i)
            .Top = frm.lvw(0).Top
            .Left = frm.lvw(0).Left
            .Width = frm.lvw(0).Width
            .Height = frm.lvw(0).Height
        End With
    Next

    frm.lvw(1).Visible = True

otravez:
    frm.buttonresult = 2
    frm.Show vbModal

    If frm.buttonresult = 1 Then
        Dim esp() As Boolean, brg() As Boolean, asg() As Boolean, cla() As Boolean, prof() As Boolean, lug() As Boolean, res() As Boolean

        ReDim esp(ancora.cantEsp)
        ReDim brg(ancora.cantBrg)
        ReDim asg(ancora.cantAsig)
        ReDim cla(ancora.cantClasif)
        ReDim prof(ancora.cantProfe)
        ReDim lug(ancora.cantLug)
        ReDim res(ancora.recursos.Count)

        Dim usos() As Long, total As Long
        
        ReDim usos(ancora.CD, ancora.ct)
        total = 0
        Dim idper As String
        idper = ancora.periodos(frm.cboPeriod.ListIndex + 1).id
        
        For i = 1 To ancora.cantEsp
            esp(i) = frm.lvw(1).ListItems(i).Checked
            If esp(i) Then
                total = total + 1
                For j = 1 To ancora.CD
                    For k = 1 To ancora.ct
                        If ancora.getRestriccion(dESPECIALIDAD, Especialidad(i).id, idper, j, k) Then usos(j, k) = usos(j, k) + 1
                    Next
                Next
            End If
        Next

        For i = 1 To ancora.cantBrg
            brg(i) = frm.lvw(2).ListItems(i).Checked
            If brg(i) Then
                total = total + 1
                For j = 1 To ancora.CD
                    For k = 1 To ancora.ct
                        If ancora.getRestriccion(dBRIGADA, Brigada(i).comun.id, idper, j, k) Then usos(j, k) = usos(j, k) + 1
                    Next
                Next
            End If
        Next

        For i = 1 To ancora.cantAsig
            asg(i) = frm.lvw(3).ListItems(i).Checked
            If asg(i) Then
                total = total + 1
                For j = 1 To ancora.CD
                    For k = 1 To ancora.ct
                        If ancora.getRestriccion(dASIG, asig(i).comun.id, idper, j, k) Then usos(j, k) = usos(j, k) + 1
                    Next
                Next
            End If
        Next

        For i = 1 To ancora.cantClasif
            cla(i) = frm.lvw(4).ListItems(i).Checked
            If cla(i) Then
                total = total + 1
                For j = 1 To ancora.CD
                    For k = 1 To ancora.ct
                        If ancora.getRestriccion(dCLASIF, clasif(i).comun.id, idper, j, k) Then usos(j, k) = usos(j, k) + 1
                    Next
                Next
            End If
        Next

        For i = 1 To ancora.cantProfe
            prof(i) = frm.lvw(5).ListItems(i).Checked
            If prof(i) Then
                total = total + 1
                For j = 1 To ancora.CD
                    For k = 1 To ancora.ct
                        If ancora.getRestriccion(dPROFE, profe(i).id, idper, j, k) Then usos(j, k) = usos(j, k) + 1
                    Next
                Next
            End If
        Next

        For i = 1 To ancora.cantLug
            lug(i) = frm.lvw(6).ListItems(i).Checked
            If lug(i) Then
                total = total + 1
                For j = 1 To ancora.CD
                    For k = 1 To ancora.ct
                        If ancora.getRestriccion(dLUGAR, lugar(i).id, idper, j, k) Then usos(j, k) = usos(j, k) + 1
                    Next
                Next
            End If
        Next

        For i = 1 To ancora.recursos.Count
            res(i) = frm.lvw(7).ListItems(i).Checked
            If res(i) Then
                total = total + 1
                For j = 1 To ancora.CD
                    For k = 1 To ancora.ct
                        If ancora.getRestriccion(dRECURSO, ancora.recursos(i).id, idper, j, k) Then usos(j, k) = usos(j, k) + 1
                    Next
                Next
            End If
        Next

        Dim r As TGOH_arrRestriccion
        Set r = Nothing

        Dim msg As frmKernelMensajeDeEstado
        Set msg = New frmKernelMensajeDeEstado
        msg.mensaje.Caption = "Analizando restricciones..."
        msg.Show

        Set r = ancora.getANDRestrictions(frm.cboPeriod.ListIndex + 1, esp, brg, asg, cla, prof, lug, res)
        msg.Hide
        Set msg = Nothing
        
        

        Dim flag As Boolean, matrix() As String
        
        flag = False
        ReDim matrix(ancora.ct, ancora.CD)
        
        For i = 1 To ancora.CD
            matrix(0, i) = "" & i
            For j = 1 To ancora.ct
                matrix(j, 0) = "" & j
                
                If r.getRest(ancora.periodos(frm.cboPeriod.ListIndex + 1).id, i, j) = 0 Then
                    matrix(j, i) = "H"
                    flag = True
                End If
            Next
        Next
        
        If flag Then

            Dim frmr As New frm_generic_flexgrid
        
            frmr.tabla.Rows = ancora.ct + 1
            frmr.tabla.cols = ancora.CD + 1
            frmr.Caption = "Resultado huecos comunes "
        
            For i = 0 To ancora.ct
                frmr.tabla.RowHeight(i) = 600
                If i > 0 Then frmr.tabla.TextMatrix(i, 0) = "" & i
            Next
            For i = 0 To ancora.CD
                frmr.tabla.ColWidth(i) = 600
                If i > 0 Then frmr.tabla.TextMatrix(0, i) = "" & i
            Next
            For i = 0 To ancora.ct
                For j = 0 To ancora.CD
                        frmr.tabla.row = i
                        frmr.tabla.col = j
                    If matrix(i, j) <> "" And i > 0 And j > 0 Then
                        frmr.tabla.TextMatrix(i, j) = matrix(i, j)
                        frmr.tabla.CellBackColor = vbWhite
                        frmr.tabla.CellForeColor = vbBlue
                    Else
                        If i > 0 And j > 0 Then
                            frmr.tabla.TextMatrix(i, j) = "" & kernel.utils.Porciento(usos(j, i), total) & "%"
                            frmr.tabla.CellBackColor = RGB(70 + Int(Rnd * 160), 70 + Int(Rnd * 160), 70 + Int(Rnd * 160))
                            frmr.tabla.CellForeColor = vbBlack
                        End If
                    End If
                Next
            Next
            frmr.Show vbModal
            Set frmr = Nothing

        Else
            MessageDlg "Resultado", "No se encontraron huecos comunes para los elementos seleccionados", vbInformation, "Aceptar"
        End If

        GoTo otravez

    End If

    Set frm = Nothing
End Sub
Public Sub goReporteAnalisisComparativo()
    Dim frm As New frmReportesHuecosComunes
    Dim frmr As frmReportesGrafico

    Dim i As Long
    fillCboPer frm.cboPeriod

    'especialidades
    Load frm.lvw(1)
    fillLvwEspec frm.lvw(1), 6

    'brigadas
    Load frm.lvw(2)
    fillLvwBrigadas frm.lvw(2), 2

    'asignaturas
    Load frm.lvw(3)
    fillLvwAsig frm.lvw(3), 5

    'clasif
    Load frm.lvw(4)
    fillLvwClasif frm.lvw(4)

    'profes
    Load frm.lvw(5)
    fillLvwProfe frm.lvw(5), 1

    'lugar
    Load frm.lvw(6)
    fillLvwLugar frm.lvw(6), 3

    'recurso
    Load frm.lvw(7)
    fillLvwRecurso frm.lvw(7), 7

    For i = 1 To frm.lvw.Count - 1
        With frm.lvw(i)
            .Top = frm.lvw(0).Top
            .Left = frm.lvw(0).Left
            .Width = frm.lvw(0).Width
            .Height = frm.lvw(0).Height
        End With
    Next

    frm.lvw(2).Visible = True
    frm.Caption = "Análisis comparativo de restricciones"
    frm.lvw(1).Enabled = False
    frm.lvw(3).Enabled = False
    frm.lvw(4).Enabled = False

otravez:
    frm.buttonresult = 2
    frm.Show vbModal

    If frm.buttonresult = 1 Then

        Dim esp() As Boolean, brg() As Boolean, asg() As Boolean, cla() As Boolean, prof() As Boolean, lug() As Boolean, res() As Boolean

        ReDim esp(ancora.cantEsp)
        ReDim brg(ancora.cantBrg)
        ReDim asg(ancora.cantAsig)
        ReDim cla(ancora.cantClasif)
        ReDim prof(ancora.cantProfe)
        ReDim lug(ancora.cantLug)
        ReDim res(ancora.recursos.Count)

        For i = 1 To ancora.cantEsp
            esp(i) = frm.lvw(1).ListItems(i).Checked
        Next

        For i = 1 To ancora.cantBrg
            brg(i) = frm.lvw(2).ListItems(i).Checked
        Next

        For i = 1 To ancora.cantAsig
            asg(i) = frm.lvw(3).ListItems(i).Checked
        Next

        For i = 1 To ancora.cantClasif
            cla(i) = frm.lvw(4).ListItems(i).Checked
        Next

        For i = 1 To ancora.cantProfe
            prof(i) = frm.lvw(5).ListItems(i).Checked
        Next

        For i = 1 To ancora.cantLug
            lug(i) = frm.lvw(6).ListItems(i).Checked
        Next

        For i = 1 To ancora.recursos.Count
            res(i) = frm.lvw(7).ListItems(i).Checked
        Next

        Dim xvalues() As Variant, yvalues() As Variant
        Dim cant As Long
        Set frmr = New frmReportesGrafico

        With frmr
            .Caption = "Resultado del Análisis"
            .grafico.Charts.add
        End With

        '' Brigadas

        For i = 1 To ancora.cantBrg
            If brg(i) Then
                cant = cant + 1
                ReDim Preserve xvalues(cant)
                ReDim Preserve yvalues(cant)
                xvalues(cant) = "Brigada::" & kernel.utils.trunca(Brigada(i).comun.id)
                yvalues(cant) = PercentRestriccion(Brigada(i).comun, frm.cboPeriod.ListIndex + 1).parte
            End If
        Next

        'AgregaSerie 0, frmr, "Brigada", xvalues, yvalues
        'ReDim xvalues(1)
        'ReDim yvalues(1)

        '' Profesores
        For i = 1 To ancora.cantProfe
            If prof(i) Then
                cant = cant + 1
                ReDim Preserve xvalues(cant)
                ReDim Preserve yvalues(cant)
                xvalues(cant) = "Profe::" & kernel.utils.trunca(profe(i).id)
                yvalues(cant) = PercentRestriccion(profe(i), frm.cboPeriod.ListIndex + 1).parte
            End If

        Next

        'AgregaSerie 0, frmr, "Profesor", xvalues, yvalues
        'ReDim xvalues(1)
        'ReDim yvalues(1)
        '' Lugares

        For i = 1 To ancora.cantLug
            If lug(i) Then
                cant = cant + 1
                ReDim Preserve xvalues(cant)
                ReDim Preserve yvalues(cant)
                xvalues(cant) = "Lugar::" & kernel.utils.trunca(lugar(i).id)
                yvalues(cant) = PercentRestriccion(lugar(i), frm.cboPeriod.ListIndex + 1).parte
            End If

        Next

        '' Otros recursos

        For i = 1 To ancora.recursos.Count
            If res(i) Then
                cant = cant + 1
                ReDim Preserve xvalues(cant)
                ReDim Preserve yvalues(cant)
                xvalues(cant) = "Lugar::" & kernel.utils.trunca(lugar(i).id)
                yvalues(cant) = ancora.recursos(i).PercentRestricc(ancora.periodos(frm.cboPeriod.ListIndex + 1).id)
            End If
        Next

        If cant > 0 Then AgregaSerie 0, frmr, "Análisis Comparativo", xvalues, yvalues

        frmr.Show vbModal

        GoTo otravez

    End If

    Set frm = Nothing
End Sub
Public Sub AgregaSerie(idchart As Long, ByRef frm As frmReportesGrafico, Caption As String, xvalues As Variant, yvalues As Variant)
    frm.grafico.Charts(idchart).SeriesCollection.add
    With frm.grafico.Charts(idchart).SeriesCollection(frm.grafico.Charts(idchart).SeriesCollection.Count - 1)
        .Caption = Caption
        .SetData chDimCategories, chDataLiteral, xvalues
        .SetData chDimValues, chDataLiteral, yvalues
        .Type = chChartTypeColumn3D
    End With
End Sub

Public Sub filllvwGeneraciones(ByRef lvw As MSComctlLib.ListView, Optional icon As Integer = 1)
    Dim i As Long

    lvw.ListItems.clear
    filllvwColumnHeaders lvw, Array("Fecha", "Especialidad", "Nivel", "Período"), 4

    For i = 1 To cantGeneraciones
        With Generaciones(i)
            lvw.ListItems.add , , Generaciones(i).fecha, icon, icon
            filllvwSubItems lvw, i, Array(getRS_Especialidad(0, .idesp), .Nivel, getRS_Periodo(0, .idper)), 3
        End With
    Next

End Sub

Public Sub showHorariosGenerados()
    Dim frm As frm_generic_listview

    ancora.CalcGeneraciones
    If cantGeneraciones = 0 Then
20      MessageDlg "Terminando", "No existen horarios generados", vbExclamation, "Aceptar"
        Exit Sub
    End If

    Set frm = New frm_generic_listview

    
    frm.Caption = "Horarios generados"
    
    Set frm.tabla.Icons = frm.imgList
    Set frm.tabla.SmallIcons = frm.imgList
    frm.ribbon.ImageList = frm.imgList

    frm.ribbon.addTab "opciones", "Opciones"
    frm.ribbon.addCat "copciones", "opciones", "Opciones", False
    
    frm.ribbon.addButton "analize", "copciones", "Analizar", 4
    frm.ribbon.addButton "del", "copciones", "Eliminar", 2
    frm.ribbon.addButton "finish", "copciones", "Terminar", 5

    frm.ribbon.Theme = 2
    frm.ribbon.Refresh
    
    frm.Tag = "frmGeneradorDegenerar"
    frm.tabla.MultiSelect = True
    Do
        filllvwGeneraciones frm.tabla
        frm.resultHerramientas = ""
        frm.barraestado.Caption = cantGeneraciones & " generaciones"
        frm.Resize
        frm.ribbon.Visible = True
        frm.Resize
        frm.Show vbModal

        If frm.resultHerramientas = "analize" Then
            If Not frm.tabla.SelectedItem Is Nothing Then
                Dim ix As Long
                ix = frm.tabla.SelectedItem.index
                With Generaciones(ix)
                    showAnalisisHorario ancora.IndexById(dESPECIALIDAD, .idesp, 0), Generaciones(ix).Nivel, ancora.IndexById(dPERIODO, .idper, 0), True
                    frm.resultHerramientas = "*"
                End With
            End If
        End If

        If frm.resultHerramientas = "del" Then
            Dim r As Variant, i As Long, ini As Long
            
            Dim msg As New frmKernelMensajeDeEstado
            msg.mensaje.Caption = "Eliminando horarios"
            msg.Show
            
            ini = 1
10

            For i = ini To frm.tabla.ListItems.Count
                If frm.tabla.ListItems(i).Selected Then
                    ancora.degenerar ancora.IndexById(dESPECIALIDAD, Generaciones(i).idesp, 0), Generaciones(i).Nivel, ancora.IndexById(dPERIODO, Generaciones(i).idper, 0)
                    frm.tabla.ListItems(i).Selected = False
                    DoEvents
                    If i < cantGeneraciones Then
                        For j = i To cantGeneraciones - 1
                            Generaciones(j) = Generaciones(j + 1)
                        Next
                    End If
                    cantGeneraciones = cantGeneraciones - 1
                    frm.tabla.ListItems.Remove i
                    ini = i
                    GoTo 10
                End If

            Next
            If cantGeneraciones = 0 Then GoTo 20
            Set msg = Nothing
            
            frm.resultHerramientas = "*"
        End If
    Loop While frm.resultHerramientas = "*"
    Set frm = Nothing
End Sub

Public Sub filllvwAnalisisPercentRestricc(ByRef lvw As MSComctlLib.ListView, Optional icon As Integer = 1)
    Dim i As Long, ii As Long, a As String
    Dim b As String, c As String, p As String, j As Long

    lvw.ListItems.clear
    filllvwColumnHeaders lvw, Array("Información", "Identificación", "Períodos", "Total de restricciones", "Porcentaje de restricciones"), 5

    For i = 1 To cantPercentRestricc
        With PercentRestricc(i)
            c = getNameOfArreglo(.dato)
            a = getRS_Generico(.dato, .id)
            If .dato = dPERIODO Then p = ""
            lvw.ListItems.add , , c, icon, icon
            filllvwSubItems lvw, i, Array(a, p, "" & .parte, kernel.utils.Porciento(.parte, ancora.CD * ancora.ct) & " %"), 4
        End With
    Next

End Sub

Public Sub filllvwAnalisisRestriccionesResumen(ByRef lvw As MSComctlLib.ListView, icon As Integer)
    Dim i As Long, ii As Long, a As String
    Dim b As String, c As String, p As String, j As Long

    lvw.ListItems.clear

    filllvwColumnHeaders lvw, Array("Información", "Cantidad con este Porciento", "Total de restricciones", "Porcentaje de restricción"), 4

    For i = 1 To cantResumenRestricc
        With ResumenRestricc(i)
            c = getNameOfArreglo(.dato)
            lvw.ListItems.add , , c, icon, icon
            filllvwSubItems lvw, i, Array(.cantidad, .parte, kernel.utils.Porciento(.parte, ancora.CD * ancora.ct) & " %"), 3
        End With
    Next
End Sub

Public Function getDescripFormaInicioSesionTrabajo(index As Long) As String
    Dim Comentario As Variant
    Comentario = Array("", "Esta forma de empezar generalmente la utilizan personas con experiencia con Áncora GOH", _
    "Utilice el asistente si es novato con la aplicación. El asistente le guiará paso a paso para crear un archivo de horarios.", _
    "Esta opción le parecerá atractiva si usted posee habilidad para aprender de los ejemplos", _
    "Al asistente le complace que usted lo solicite nuevamente", _
    "Normalmente esta forma de empezar es para continuar o revisar un trabajo anterior hecho o no por usted.", _
    "Puede continuar el trabajo de ayer. Note en la lista que se despliega los archivos utilizados, las carpetas donde se encuentran y la fecha y hora de trabajo con ellos")

    getDescripFormaInicioSesionTrabajo = Comentario(index)
End Function



Public Sub showScheduleOf(ByRef flex As MSFlexGrid, arreglo As Long, id As String, Optional ix As Long = 0, Optional showprofe As Boolean = True, Optional showlugar As Boolean = True, Optional showclasif As Boolean = True, Optional showasig As Boolean = True, Optional showbrg As Boolean = True, Optional showres As Boolean = True, Optional ByRef imgRestricc As Image)

    Dim i As Long

    If ix = 0 Then id = ancora.IndexById(arreglo, id)

    With flex

        Select Case arreglo
            Case dBRIGADA
                For i = 1 To ancora.cantAsignaciones

                Next
            Case dPROFE
            Case dLUGAR
            Case dRECURSO
        End Select

    End With

End Sub


Public Sub MuestraMiniHorario(id As String, tipo As Long)

    Dim i As Long, k As Long, j As Long
    Dim h As Long, w As Long
    
    Dim frm As frmMiniHorario
    Set frm = New frmMiniHorario
    
        k = 0
        h = (frm.Height - 200) / ancora.ct - 60
        w = frm.Width / ancora.CD - 15

            For j = 1 To ancora.ct
                For i = 1 To ancora.CD
                     k = k + 1
                     Load frm.casilla(k)
                     With frm.casilla(k)
                         .Visible = True
                         .Height = h
                         .Width = w
                         .Left = (i - 1) * w + 1
                         .Top = (j - 1) * h + 1
                         Dim kk As Long
                         kk = (j - 1) * ancora.CD + i
                         kk = kk - 1
                         .Caption = frmKernelMain.casilla(kk).Caption
                         .BackColor = frmKernelMain.casilla(kk).BackColor
                         .Height = h * CantTurnosAct(kk)
                         .FontSize = 8
                         .ToolTipText = TextfrmExplorerSchedule(kk)
                     End With
                Next
            Next

        Dim a As String
        If tipo = dBRIGADA Then a = "Brigada: "
        If tipo = dPROFE Then a = "Profesor: "
        If tipo = dLUGAR Then a = "Lugar: "
        If tipo = dRECURSO Then a = "Recurso: "
        frm.Caption = "Áncora GOH :: MiniHorario " + a + id
        frm.Show
End Sub

Public Function Question_InterrumpirProceso() As Boolean
    Dim r As Variant
    r = MessageDlg("Sistema", "Esta acción dentendrá el proceso en curso. ¿Desea abortarlo?", vbQuestion, "No", "Sí")
    Question_InterrumpirProceso = False
    If r = 2 Then Question_InterrumpirProceso = True
End Function

Public Function Question_Eliminar() As Boolean
    Dim r As Variant
    r = MessageDlg("Eliminar", "¿Está seguro que desea eliminar?", vbQuestion, "No", "Sí")
    Question_Eliminar = False
    If r = 2 Then Question_Eliminar = True
End Function

Sub goExplorerAct()

    On Error GoTo errdep

    fillTvwExplorerAct frmExplorerAct.twActividades, True

    With frmExplorerAct
        .StatusBar1.Panels(1).Text = "Especialidades: " & ancora.cantEsp
        .StatusBar1.Panels(2).Text = "Asignaturas: " & ancora.cantAsig
        .StatusBar1.Panels(3).Text = "Actividades: " & ancora.getTotalDeActividades
    End With

    frmExplorerAct.Show
    Exit Sub
errdep:
    Debug.Print Err.Number, Erl, Err.Description
    Resume Next
End Sub

Public Sub LimpiaBotonesRestriccion()

    Dim i As Long, j As Long

    For i = 1 To ancora.CD

        For j = 1 To ancora.ct
            BotonesRestriccion(i, j) = False
        Next

    Next

End Sub

Public Sub goResumenhueco(per As Long)

    
    IniResumenHueco
    Dim i As Long, j As Long, k As Long
    Dim sper As String
    sper = ancora.periodos(per).id

    For i = 1 To ancora.CD

        For j = 1 To ancora.ct
            console.Progress "Analizando el día " & i & ", turno " & j, kernel.utils.Porciento(i, ancora.CD)

            For k = 1 To ancora.cantLug
                If Not ancora.getRestriccion(dLUGAR, lugar(k).id, sper, i, j) Then
                    ResumenHueco(i, j).cantLug = ResumenHueco(i, j).cantLug + 1
                    ResumenHueco(i, j).idlug(ResumenHueco(i, j).cantLug) = k
                End If

            Next

            For k = 1 To ancora.cantBrg
                If Not ancora.getRestriccion(dBRIGADA, Brigada(k).comun.id, sper, i, j) Then
                    ResumenHueco(i, j).cantBrg = ResumenHueco(i, j).cantBrg + 1
                    ResumenHueco(i, j).idbrg(ResumenHueco(i, j).cantBrg) = k
                End If

            Next

            For k = 1 To ancora.cantProfe
                If Not ancora.getRestriccion(dPROFE, profe(k).id, sper, i, j) Then
                    ResumenHueco(i, j).cantprof = ResumenHueco(i, j).cantprof + 1
                    ResumenHueco(i, j).idprof(ResumenHueco(i, j).cantprof) = k
                End If

            Next

        Next

    Next

    
End Sub

Public Sub goTurnosExtremos(per As Long, extremo As Long)

    Dim i As Long, j As Long, k As Long, t1 As Long, t As Long, ii As Long
    Dim a As String
    IniResumenHueco
    

    For i = 1 To ancora.CD
        console.Progress "Analizando el día " & i, kernel.utils.Porciento(i, ancora.CD)

        For k = 1 To ancora.cantLug
            t = ancora.TurnoExtremo(dLUGAR, lugar(k).id, extremo, per, i)
            If t <> 0 Then
                ResumenHueco(i, t).cantLug = ResumenHueco(i, t).cantLug + 1
                ReDim Preserve ResumenHueco(i, t).idlug(ResumenHueco(i, t).cantLug)
                ResumenHueco(i, t).idlug(ResumenHueco(i, t).cantLug) = k
            End If

        Next

        For k = 1 To ancora.cantBrg
            t = ancora.TurnoExtremo(dBRIGADA, Brigada(k).comun.id, extremo, per, i)
            t1 = ancora.TurnoExtremo(dESPECIALIDAD, Especialidad(ancora.IndexById(dESPECIALIDAD, Brigada(k).idesp, 0)).id, extremo, per, i)
            If extremo = 1 Then
                If t > t1 And t1 <> 0 Then t = t1
            Else
                If t < t1 And t <> 0 Then t = t1
            End If

            If t <> 0 Then
                ResumenHueco(i, t).cantBrg = ResumenHueco(i, t).cantBrg + 1
                ReDim Preserve ResumenHueco(i, t).idbrg(ResumenHueco(i, t).cantBrg)
                ResumenHueco(i, t).idbrg(ResumenHueco(i, t).cantBrg) = k
            End If

        Next

        For k = 1 To ancora.cantProfe
            t = ancora.TurnoExtremo(dPROFE, profe(k).id, extremo, per, i)
            t1 = 0

            If extremo = 1 Then
                If t > t1 And t1 <> 0 Then t = t1
            Else
                If t < t1 And t <> 0 Then t = t1
            End If

            If t <> 0 Then
                ResumenHueco(i, t).cantprof = ResumenHueco(i, t).cantprof + 1
                ReDim Preserve ResumenHueco(i, t).idprof(ResumenHueco(i, t).cantprof)
                ResumenHueco(i, t).idprof(ResumenHueco(i, t).cantprof) = k
            End If

        Next

    Next

    
    
End Sub

Public Function IniBotonesZpriori()
    Dim k As Long, i As Long, j As Long

    For k = 1 To ancora.periodos.Count
        If kernel.utils.idigual(clasif(Trabajando_IdZpriori).zpriori(k).idperiodo, ancora.periodos(Trabajando_PerZpriori).id) Then

            For i = 1 To ancora.CD

                For j = 1 To ancora.ct
                    BotonesZPriori(i, j) = clasif(Trabajando_IdZpriori).zpriori(k).rest(i, j)
                Next
            Next
            Exit For
        End If
    Next
End Function


Public Function DameMaxZPrioriEnBotones() As Long

    Dim i As Long, j As Long

    Dim maxx As Long
    maxx = 0

    For i = 1 To ancora.CD

        For j = 1 To ancora.ct
            If BotonesZPriori(i, j) > maxx Then maxx = BotonesZPriori(i, j)
        Next

    Next

    DameMaxZPrioriEnBotones = maxx
End Function

Public Function DameCantMax(max As Long)
    Dim cant As Long
    cant = 0
    Dim i As Long, j As Long
    For i = 1 To ancora.CD

        For j = 1 To ancora.ct
            If BotonesZPriori(i, j) = max Then cant = cant + 1
        Next

    Next

    DameCantMax = cant
End Function

Public Sub SumaBotonesZpriori(f As Long, c As Long)
    Dim maxx As Long
    maxx = DameMaxZPrioriEnBotones
    If DameCantMax(maxx) = 1 And BotonesZPriori(f, c) = maxx Then BotonesZPriori(f, c) = 1 Else BotonesZPriori(f, c) = BotonesZPriori(f, c) + 1
End Sub

Public Function showAnalisisHorario(esp As Long, Nivel As Long, per As Long, Optional modal As Boolean = True) As frmReportesAnalizaHorario
    Dim analisis As TAna_Optimo
    Dim labels As Variant, values As Variant
    Set AnalisisOptimo = ancora.AnalizaOptimo(esp, Nivel, per)

    With AnalisisOptimo
        frmReportesAnalizaHorario.go "(" + kernel.utils.trunca(Especialidad(esp).id) + ") " + kernel.utils.trunca(Especialidad(esp).descrip), "(" + kernel.utils.trunca(ancora.periodos(per).id) + ") " + kernel.utils.trunca(ancora.periodos(per).descrip), .Nivel, .totalAct, .cantasignadas, .cantActFijas, .totalTurnos, .cantenzpriori, .percentActAsig, .percentZpriori, True
    End With

End Function

Public Sub fillTvwExplorerAct(tvw As MSComctlLib.TreeView, Optional showresources As Boolean = True)

    On Error GoTo errdep

    Dim i As Long, j As Long, l As Long, myll As Long, ll As Long, kl As Long, myj As Long
    Dim k As Long, ini As Long, lll As Long
    Dim keyespec As String, keyAsig As String, keyDesglose As String, keyact As String
    Dim superIDProfe() As Long
    Dim superIDLugar() As Long
    Dim superCantpxAct As Long
    Dim superCantlxAct As Long
    Dim inii As Long, keylxact As String
    Dim prof As String
    Dim keypxact As String
    Dim per As Long
    Dim superIdAsig() As Long
    Dim supercantAsig As Long
    Dim cla As Long
    Dim idlug As Long, idprofe As Long, iddesglose As Long, idasig As Long
    ReDim superIDProfe(ancora.cantPxAct)
    ReDim superIDLugar(ancora.cantLxAct)
    ReDim superIdAsig(ancora.cantAsig)

    For i = 1 To ancora.cantPxAct
        superIDProfe(i) = i
    Next

    For i = 1 To ancora.cantLxAct
        superIDLugar(i) = i
    Next

    superCantlxAct = ancora.cantLxAct
    superCantpxAct = ancora.cantPxAct

    For i = 1 To ancora.cantAsig
        superIdAsig(i) = i
    Next

    supercantAsig = ancora.cantAsig

    With tvw
        .Nodes.clear
        ancora.updatehash
        ancora.updateHash_objects
        ancora.BeginIDX
        

        For i = 1 To ancora.cantEsp
            keyespec = "esp_" + kernel.utils.trunca(Especialidad(i).id)
            .Nodes.add , , keyespec, "(" + kernel.utils.trunca(Especialidad(i).id) + ") " + kernel.utils.trunca(Especialidad(i).descrip), 1, 1

            For j = 1 To ancora.cantNiveles
                .Nodes.add keyespec, tvwChild, "Nivel_" & j & "_" & keyespec, "" & j, 2, 2
            Next

        Next

        For i = 1 To ancora.cantAsig
            console.Progress "Trabajando...Esto puede tardar un poco...", kernel.utils.Porciento(i, ancora.cantAsig)
            keyAsig = "asig_" + kernel.utils.trunca(asig(i).comun.id) + "_Nivel_" & asig(i).Nivel & "_esp_" + kernel.utils.trunca(kernel.utils.trunca(asig(i).idesp))
            .Nodes.add "Nivel_" & asig(i).Nivel & "_esp_" + kernel.utils.trunca(asig(i).idesp), tvwChild, keyAsig, getRS_Asignatura(i), 3, 3

            For j = 1 To ancora.periodos.Count
                .Nodes.add keyAsig, tvwChild, "per_" + kernel.utils.trunca(ancora.periodos(j).id) + "_" + keyAsig, getRS_Periodo(j), 4, 4
            Next

            For j = 1 To ancora.periodos.Count
                keyDesglose = "per_" + kernel.utils.trunca(asig(i).desglose(j).idperiodo) + "_" + keyAsig

                For k = 1 To asig(i).desglose(j).cantact
                    cla = ancora.IndexById(dCLASIF, asig(i).desglose(j).act(k).idclasif, 0)
                    keyact = "act_" & k & "_" & kernel.utils.trunca(asig(i).desglose(j).act(k).idclasif) & "_" & keyDesglose
                    .Nodes.add keyDesglose, tvwChild, keyact, "actividad #" & k & getRS_Clasificacion(cla), 5, 5
                    Dim c As Long
                    c = ancora.getCantPxActOfActivity(asig(i).comun.id, ancora.periodos(j).id, k)
                    If c = 0 Then
                        .Nodes(keyact).ForeColor = vbRed
                        .Nodes(keyact).Bold = True
                        .Nodes(keyDesglose).ForeColor = vbRed
                        .Nodes(keyDesglose).Bold = True
                        .Nodes(keyAsig).ForeColor = vbRed
                        .Nodes(keyAsig).Bold = True
                    End If
                    If showresources Then
                        .Nodes.add keyact, tvwChild, "pxact_" + keyact, "Profesores asignados", 6, 6
                        .Nodes.add keyact, tvwChild, "lxact_" + keyact, "Lugares asignados", 7, 7
                    End If

                Next

            Next

        Next

        If showresources Then

            For i = 1 To ancora.cantPxAct
                console.Progress "Trabajando...analizando profesores por actividad", kernel.utils.Porciento(i, ancora.cantPxAct)

                With ProfeXAct(i)
                    idasig = ancora.IndexById(dASIG, .para.idasig, 0)
                    iddesglose = ancora.IndexById(dDESGLOSE, .para.idper, idasig)
                    'idprofe =  ancora.IndexById(dPROFE, .idprofes, 0)
                    idprofe = .idxprofe
                    keyact = "pxact_act_" & .para.idact & "_" & kernel.utils.trunca(asig(idasig).desglose(iddesglose).act(.para.idact).idclasif) & "_per_" + kernel.utils.trunca(.para.idper) + "_asig_" + kernel.utils.trunca(.para.idasig) + "_Nivel_" & asig(idasig).Nivel & "_esp_" + kernel.utils.trunca(asig(idasig).idesp)
                    Dim grupos As String
                    grupos = ""

                    For j = 1 To .cantGrupos
                        grupos = grupos & .grupos(j) & IIf(j < .cantGrupos, ",", "")
                    Next

                    tvw.Nodes.add keyact, tvwChild, keyact + "_" & i, getRS_Profe(idprofe) & " para grupos " & grupos, 5, 5
                End With

            Next

            For i = 1 To ancora.cantLxAct
                console.Progress "Trabajando...analizando lugares por actividad", kernel.utils.Porciento(i, ancora.cantLxAct)

                With LugXact(i)
                    idasig = ancora.IndexById(dASIG, .para.idasig, 0)
                    iddesglose = ancora.IndexById(dDESGLOSE, .para.idper, idasig)
                    keyact = "lxact_act_" & .para.idact & "_" & kernel.utils.trunca(asig(idasig).desglose(iddesglose).act(.para.idact).idclasif) & "_per_" + kernel.utils.trunca(.para.idper) + "_asig_" + kernel.utils.trunca(.para.idasig) + "_Nivel_" & asig(idasig).Nivel & "_esp_" + kernel.utils.trunca(asig(idasig).idesp)

                    For j = 1 To .cantLug
                        tvw.Nodes.add keyact, tvwChild, keyact & "_" & .idlug(j) & "_" & i, getRS_Lugar(.idxlug(j)) & " prioridad " & .priori(j), 6, 6
                    Next

                End With

            Next

        End If

        .Style = tvwTreelinesPlusMinusPictureText
        .HideSelection = False
    End With

    
    Exit Sub
errdep:
    Debug.Print Err.Description
    Resume Next
End Sub

Public Function getIdOrAlias(arreglo As Long, Optional id As String = "", Optional idx As Long = 0) As String
    
    Dim r As String
    
    If idx = 0 Then idx = ancora.IndexById(arreglo, id)
       
    Select Case arreglo
        Case dPERIODO
            With ancora.periodos(idx)
                r = .id
                If .Caption <> "" Then r = .Caption
            End With
        
        Case dESPECIALIDAD
            With Especialidad(idx)
                r = .id
                If .titulo <> "" Then r = .titulo
            End With
        
        Case dBRIGADA
            With Brigada(idx).comun
                r = .id
                If .titulo <> "" Then r = .titulo
            End With

        Case dCLASIF
            With clasif(idx).comun
                r = .id
                If .titulo <> "" Then r = .titulo
            End With

        Case dASIG
            With asig(idx).comun
                r = .id
                If .titulo <> "" Then r = .titulo
            End With
        
        Case dPROFE
            With profe(idx)
                r = .id
                If .titulo <> "" Then r = .titulo
            End With
       
        Case dLUGAR
            With lugar(idx)
                r = .id
                If .titulo <> "" Then r = .titulo
            End With
        
        Case dRECURSO
            With ancora.recursos(idx)
                r = .id
                If .Caption <> "" Then r = .Caption
            End With
        
    End Select
    
    getIdOrAlias = r
    
End Function


Public Function MessageDlg(titulo As String, mensaje As String, ico As Integer, Optional b1 As String = "", Optional b2 As String = "", Optional b3 As String = "", Optional default As Integer) As Integer
    Dim frm As New frm_generic_msgbox
    MessageDlg = frm.go(titulo, mensaje, ico, b1, b2, b3, default)
    Set frm = Nothing
End Function

Public Sub SkinFor(ByVal frm As Form)
       frmKernelMain.Skin1.LoadSkin App.path & "\ancora.skn"
       frmKernelMain.Skin1.ApplySkin frm.hWnd
End Sub

'Editar datos de un objeto
Public Sub goDatosEditar(ByVal arreglo As Integer, Optional ByVal id As String = "", Optional ByVal idx As Long = 0)

    If idx = 0 Then idx = ancora.IndexById(arreglo, id)
    id = ancora.getIdGenerico(arreglo, idx)
    
    Dim frm As New frmDatosEditar
    
    With frm
        .labCapacidad.Visible = (arreglo = dLUGAR)
        .labMatricula.Visible = (arreglo = dBRIGADA)
        .labNivel.Visible = (arreglo = dBRIGADA Or arreglo = dASIG)
        .labEsp.Visible = .labNivel.Visible
        .labPlantilla.Visible = (arreglo = dPERIODO)
        .labTurnos.Visible = (arreglo = dCLASIF)
        
        .txtCapacidad.Visible = .labCapacidad.Visible
        .txtMatricula.Visible = .labMatricula.Visible
        .cboNivel.Visible = .labNivel.Visible
        .cboEsp.Visible = .labEsp.Visible
        .cboPlantilla.Visible = .labPlantilla.Visible
        .cboTurnos.Visible = .labTurnos.Visible
        .chkVirtual.Visible = (arreglo = dBRIGADA Or arreglo = dPROFE Or arreglo = dLUGAR Or arreglo = dRECURSO)
        
        If .labNivel.Visible Then fillCboNiveles .cboNivel
        If .labEsp.Visible Then fillCboEspecialidades .cboEsp
        If .labTurnos.Visible Then fillCboTurnos .cboTurnos
        If .labPlantilla.Visible Then fillCboPer .cboPlantilla, "<ninguna>"
        
        .cmdZPriori.Visible = arreglo = dCLASIF And ancora.periodos.Count > 0
        
        .Caption = "Editando " & getNameOfArreglo(arreglo)
        
        Select Case arreglo
            Case dPERIODO
                With ancora.periodos(idx)
                    frm.txtID.Text = .id
                    frm.txtDescrip.Text = .descrip
                    frm.txtAlias.Text = .Caption
                    frm.cboPlantilla.ListIndex = ancora.IndexById(dPERIODO, .template)
                End With
            Case dESPECIALIDAD
                With Especialidad(idx)
                    frm.txtID.Text = .id
                    frm.txtDescrip.Text = .descrip
                    frm.txtAlias.Text = .titulo
                End With
            Case dCLASIF
                With clasif(idx)
                    frm.txtID.Text = .comun.id
                    frm.txtDescrip.Text = .comun.descrip
                    frm.txtAlias.Text = .comun.titulo
                    If .ct < frm.cboTurnos.ListCount Then frm.cboTurnos.ListIndex = .ct - 1 Else frm.cboTurnos.ListIndex = frm.cboTurnos.ListCount - 1
                End With
            Case dBRIGADA
                With Brigada(idx)
                    frm.txtID.Text = .comun.id
                    frm.txtDescrip.Text = .comun.descrip
                    frm.txtAlias.Text = .comun.titulo
                    frm.cboEsp.ListIndex = ancora.IndexById(dESPECIALIDAD, .idesp) - 1
                    frm.cboNivel.ListIndex = .Nivel - 1
                    frm.chkVirtual.value = IIf(.comun.virtual, 1, 0)
                    frm.txtMatricula.Text = "" & .matricula
                End With
            Case dASIG
                With asig(idx)
                    frm.txtID.Text = .comun.id
                    frm.txtDescrip.Text = .comun.descrip
                    frm.txtAlias.Text = .comun.titulo
                    frm.cboEsp.ListIndex = ancora.IndexById(dESPECIALIDAD, .idesp) - 1
                    frm.cboNivel.ListIndex = .Nivel - 1
                End With
            Case dPROFE
                With profe(idx)
                    frm.txtID.Text = .id
                    frm.txtDescrip.Text = .descrip
                    frm.txtAlias.Text = .titulo
                    frm.chkVirtual.value = IIf(.virtual, 1, 0)
                End With
            Case dLUGAR
                With lugar(idx)
                    frm.txtID.Text = .id
                    frm.txtDescrip.Text = .descrip
                    frm.txtAlias.Text = .titulo
                    frm.txtCapacidad.Text = "" & .capacidad
                    frm.chkVirtual.value = IIf(.virtual, 1, 0)
                End With
            Case dRECURSO
                With ancora.recursos(idx)
                    frm.txtID.Text = .id
                    frm.txtDescrip.Text = .descrip
                    frm.txtAlias.Text = .Caption
                    frm.chkVirtual.value = IIf(.virtual, 1, 0)
                End With
        End Select
        
otravez:
        .resultbutton = 0
        .Show vbModal
        
        If .resultbutton = 1 Then
            If id <> .txtID.Text Then
                Dim ix As Long
                ix = ancora.IndexById(arreglo, .txtID.Text)
                If ix > 0 Then
                    MessageDlg "Error en la entrada de datos", "El identificador introducido ya está siendo utilizado", vbCritical, "Aceptar"
                    GoTo otravez
                End If
                ancora.setId arreglo, id, .txtID.Text
            End If
            
            id = .txtID.Text
            
            idx = ancora.IndexById(arreglo, id)
            
            Select Case arreglo
                Case dPERIODO
                    With ancora.periodos(idx)
                       .descrip = frm.txtDescrip.Text
                       .Caption = frm.txtAlias.Text
                       If frm.cboPlantilla.ListIndex = 0 Then .template = ""
                       If frm.cboPlantilla.ListIndex > 0 Then
                           Dim idp As String
                           idp = ancora.periodos(frm.cboPlantilla.ListIndex).id
                           If kernel.utils.idigual(id, idp) Then
                                MessageDlg "Error en la entrada de datos", "Un período no puede tener por plantilla a él mismo", vbCritical, "Aceptar"
                                GoTo otravez
                           Else
                                .template = idp
                           End If
                       End If
                    End With
                Case dESPECIALIDAD
                    With Especialidad(idx)
                         .descrip = frm.txtDescrip.Text
                         .titulo = frm.txtAlias.Text
                    End With
                Case dCLASIF
                    With clasif(idx)
                        .comun.descrip = frm.txtDescrip.Text
                        .comun.titulo = frm.txtAlias.Text
                        
                        If frm.cboTurnos.ListIndex > -1 Then
                            If ancora.PosibleAumentarTurnosClasif(clasif(ix).comun.id, frm.cboTurnos.ListIndex + 1) Then
                                .ct = frm.cboTurnos.ListIndex + 1
                            Else
                                MessageDlg "No se puede realizar la acción", "Existen actividades de esta clasificación asignadas. " & vbLf & "No se puede cambiar su cantidad de turnos.", vbInformation, "Aceptar"
                                GoTo otravez
                            End If
                        End If
                    End With
                Case dBRIGADA
                    With Brigada(idx)
                        .comun.descrip = frm.txtDescrip.Text
                        .comun.titulo = frm.txtAlias.Text
                        If frm.cboEsp.ListIndex > -1 Then .idesp = Especialidad(frm.cboEsp.ListIndex + 1).id
                        If frm.cboNivel.ListIndex > -1 Then .Nivel = frm.cboNivel.ListIndex + 1
                        .comun.virtual = frm.chkVirtual.value
                        .matricula = Val(frm.txtMatricula.Text)
                    End With
                Case dASIG
                    With asig(idx)
                        .comun.descrip = frm.txtDescrip.Text
                        .comun.titulo = frm.txtAlias.Text
                        If frm.cboEsp.ListIndex > -1 Then .idesp = Especialidad(frm.cboEsp.ListIndex + 1).id
                        If frm.cboNivel.ListIndex > -1 Then .Nivel = frm.cboNivel.ListIndex + 1
                    End With
                Case dPROFE
                    With profe(idx)
                        .descrip = frm.txtDescrip.Text
                        .titulo = frm.txtAlias.Text
                        .virtual = frm.chkVirtual.value
                    End With
                Case dLUGAR
                    With lugar(idx)
                        .descrip = frm.txtDescrip.Text
                        .titulo = frm.txtAlias.Text
                        .capacidad = Val(frm.txtCapacidad.Text)
                        .virtual = frm.chkVirtual.value
                    End With
                Case dRECURSO
                    With ancora.recursos(idx)
                        .descrip = frm.txtDescrip.Text
                        .Caption = frm.txtAlias.Text
                        .virtual = frm.chkVirtual.value
                    End With
            End Select
        End If
              
         'zonas de prioridad
        If .resultbutton = 3 Then
          goKernelDatosZpriori id, idx
          GoTo otravez
        End If
        
    End With
    Set frm = Nothing
End Sub
Public Sub goDataInsertarObjeto(ByVal arreglo As Long)
    Select Case arreglo
        Case dPERIODO: goDataInsertarPeriodos
        Case dESPECIALIDAD: goDataInsertarEspecialdiades
        Case dCLASIF: goDataInsertarClasificacion
        Case dPROFE: goDataInsertarProfesor
        Case dLUGAR: goDataInsertarLugar
        Case dRECURSO: goDataInsertarRecurso
        Case dBRIGADA: goDataInsertarBrigadas
        Case dASIG: goDataInsertarAsignaturas
    End Select
End Sub
Public Sub filllvwEstadisticas(ByRef lvw As MSComctlLib.ListView, Optional icon As Long = 1)
    Dim i As Long
    With lvw
        .ListItems.clear
        .ColumnHeaders.clear
        .ColumnHeaders.add , , "Parámetro", 5000
        .ColumnHeaders.add , , "Valor"
        
        
        .ListItems.add , , "Total de turnos por período", icon, icon
        .ListItems(1).ListSubItems.add , , "" & (ancora.CD * ancora.ct)
        
        .ListItems.add , , "Períodos", icon, icon
        .ListItems(2).ListSubItems.add , , "" & (ancora.periodos.Count)
        
        .ListItems.add , , "Especialidades", icon, icon
        .ListItems(3).ListSubItems.add , , "" & (ancora.getCantEspecialidades)
        
        .ListItems.add , , "Brigadas", icon, icon
        .ListItems(4).ListSubItems.add , , "" & (ancora.getCantBrg)
        
        .ListItems.add , , "Asignaturas", icon, icon
        .ListItems(5).ListSubItems.add , , "" & (ancora.getCantAsig)
        
        .ListItems.add , , "Clasificaciones de actividades", icon, icon
        .ListItems(6).ListSubItems.add , , "" & (ancora.cantClasif)
        
        .ListItems.add , , "Profesores", icon, icon
        .ListItems(7).ListSubItems.add , , "" & (ancora.cantProfe)
        
        .ListItems.add , , "Lugares", icon, icon
        .ListItems(8).ListSubItems.add , , "" & (ancora.cantLug)
                
        .ListItems.add , , "Otros recursos", icon, icon
        .ListItems(9).ListSubItems.add , , "" & (ancora.recursos.Count)
        
        .ListItems.add , , "Actividades con lugares asignados", icon, icon
        .ListItems(10).ListSubItems.add , , "" & (ancora.cantLxAct)
        
        .ListItems.add , , "Asignaciones de profesores a actividades", icon, icon
        .ListItems(11).ListSubItems.add , , "" & (ancora.cantPxAct)
        
        .ListItems.add , , "Asignaciones de recursos a actividades", icon, icon
        .ListItems(12).ListSubItems.add , , "" & (ancora.recursosXact.Count)
        
        .ListItems.add , , "Actividades asignadas", icon, icon
        .ListItems(13).ListSubItems.add , , "" & (ancora.cantAsignaciones)
        
        .ListItems.add , , "Actividades rechazadas al generar", icon, icon
        .ListItems(14).ListSubItems.add , , "" & (ancora.cantImposibles)
        
        
    End With
End Sub
Public Sub filllvwAnalisisRecursos(ByRef lvw As MSComctlLib.ListView, Optional icon As Long = 1)
    
    Dim analisis As TAna_arrRecursos
    Set analisis = ancora.getAnalisisRecursos
   
    If analisis.Count > 0 Then
        With lvw
            .ListItems.clear
            .ColumnHeaders.clear
            .ColumnHeaders.add , , "Asignatura"
            .ColumnHeaders.add , , "Período"
            .ColumnHeaders.add , , "Actividad"
            .ColumnHeaders.add , , "Clasificación"
            .ColumnHeaders.add , , "Falta de lugar"
            .ColumnHeaders.add , , "Falta de profesor"
            .ColumnHeaders.add , , "Grupos sin profesor"
            
        End With
            Dim ite As TAna_Recursos

            With lvw.ListItems
                .clear
                For Each ite In analisis
                    .add , , ite.idasig, icon, icon
                    .Item(.Count).ListSubItems.add , , ite.idper
                    .Item(.Count).ListSubItems.add , , Str(ite.idact)
                    .Item(.Count).ListSubItems.add , , ite.idclasif
                    .Item(.Count).ListSubItems.add
                    .Item(.Count).ListSubItems.add
                    If ite.sinLugar Then .Item(.Count).ListSubItems(4).ReportIcon = 7
                    If ite.sinProfe Then .Item(.Count).ListSubItems(5).ReportIcon = 7
                    .Item(.Count).ListSubItems.add , , ite.gruposSinProfe
                Next
            End With
    Else
        With lvw
            .ListItems.clear
            .ColumnHeaders.clear
            .ColumnHeaders.add , , "No existen problemas con la asignación de recursos", 9000
            .ListItems.add , , "Todas las actividades tienen recursos asignados"
        End With
    End If
    
End Sub
    

Public Function Pertenece_a_la_linea(X1 As Integer, Y1 As Integer, X2 As Integer, Y2 As Integer, x As Single, y As Single) As Boolean
    Dim m As Single, n As Single, m1 As Single
    Pertenece_a_la_linea = False
    If (X1 <= X2 And (x < X1 Or x > X2)) _
        Or (X1 > X2 And (x > X1 Or x < X2)) _
        Or (Y1 <= Y2 And (y < Y1 Or y > Y2)) _
        Or (Y1 > Y2 And (y > Y1 Or y < Y2)) Then Exit Function
    
    m = 0
    m1 = 0
    If X2 - X1 <> 0 Then m = (Y2 - Y1) / (X2 - X1)
    If X2 - x <> 0 Then m1 = (Y2 - y) / (X2 - x)
    m = m * 10:    m = Int(m):    m = m / 10
    m1 = m1 * 10:    m1 = Int(m1):    m1 = m1 / 10
    If Abs(m1) = Abs(m) Then Pertenece_a_la_linea = True
End Function

Public Function getFromImputBox(titulo As String, prompt As String, caracteres As String, default As String, Optional longitud As Integer = 200) As String
    Dim frm As New frm_generic_inputbox
    frm.original = default
    frm.caracteres = caracteres
    frm.labPrompt.Caption = prompt
    frm.Caption = titulo
    frm.txtDato.MaxLength = longitud
    frm.go
    getFromImputBox = default
    If frm.result = 1 Then getFromImputBox = frm.txtDato.Text
End Function
Public Function getTextOfCasilla(brg As Boolean, prof As Boolean, lug As Boolean, clas As Boolean, asg As Boolean, idasignacion As Long, Optional newline As String = vbNewLine) As String
    Dim r As String
    With Asignaciones(idasignacion)
        Dim iclas As Long
        Dim ibrg As Long
        Dim iprof As Long
        Dim ilug As Long
        Dim subg As Long
        Dim iasig As Long
        
        If clas Then
            iclas = ancora.getClasifOfActivity(.idasig, .idperiodo, .idact)
            r = IIf(clasif(iclas).comun.titulo = "", clasif(iclas).comun.id, clasif(iclas).comun.titulo)
        End If
        
        If asg Then
            iasig = ancora.IndexById(dASIG, .idasig)
            r = r & IIf(r <> "", newline, "") & IIf(asig(iasig).comun.titulo = "", asig(iasig).comun.id, asig(iasig).comun.titulo)
        End If
        
        If brg Then
            ibrg = ancora.IndexById(dBRIGADA, .idbrigada)
            r = r & IIf(r <> "", newline, "") & IIf(Brigada(ibrg).comun.titulo = "", Brigada(ibrg).comun.id, Brigada(ibrg).comun.titulo)
        End If
        
        If prof Then
            iprof = ancora.IndexById(dPROFE, .idprofe)
            r = r & IIf(r <> "", newline, "") & IIf(profe(iprof).titulo = "", profe(iprof).id, profe(iprof).titulo)
        End If
        
        If lug Then
            For i = 1 To ancora.cantAsignaciones
                If kernel.utils.idigual(Asignaciones(i).idasig, .idasig) _
                    And kernel.utils.idigual(Asignaciones(i).idbrigada, .idbrigada) _
                    And kernel.utils.idigual(Asignaciones(i).idperiodo, .idperiodo) _
                    And Asignaciones(i).idact = .idact Then
                    
                    ilug = ancora.IndexById(dLUGAR, Asignaciones(i).idlugar)
                    r = r & IIf(r <> "", newline, "") & IIf(lugar(ilug).titulo = "", lugar(ilug).id, lugar(ilug).titulo)
                    
                End If
            Next
        End If
        
       
    End With
    getTextOfCasilla = r
End Function
Public Sub goPublicarEnHTML()
    Dim frm As New frmReportesPublicarHTML
    frm.Show vbModal
    Set frm = Nothing
End Sub

Public Sub fillLvwGruposXClasif(ByRef lvw As ListView, Optional icon As Long = 0)
    
    Dim i As Long, j As Long, g As Long, l As Long, k As Long
    Dim cla As String, icla As Long
    Dim puestos As New TAtom_arrVariant
    lvw.ListItems.clear
        
    lvw.ColumnHeaders.clear
    lvw.ColumnHeaders.add , , "Grupo", 1000
    lvw.ColumnHeaders.add , , "Clasif. Act.", 2000
    lvw.ColumnHeaders.add , , "Brigadas pertenecientes", 3000
    lvw.ColumnHeaders.add , , "Lugar Fijo", 1000
    lvw.ColumnHeaders.add , , "Lugares prohibidos", 3000
    lvw.Sorted = True
    For i = 1 To ancora.cantBrg
        For j = 1 To Brigada(i).cantGxClasif
            
            cla = Brigada(i).GrupoXClasif(j).idclasif
            icla = ancora.IndexById(dCLASIF, cla)
            g = Brigada(i).GrupoXClasif(j).grupo
            If puestos(cla & "_" & g) Is Nothing Then
                puestos.add cla & "_" & g, cla & "_" & g
                If icon > 0 Then
                    lvw.ListItems.add , cla & "_" & g, "" & g, icon, icon
                Else
                    lvw.ListItems.add , cla & "_" & g, "" & g
                End If
                lvw.ListItems(cla & "_" & g).ListSubItems.add , , getRS_Clasificacion(icla)
                lvw.ListItems(cla & "_" & g).ListSubItems.add , , ""
                lvw.ListItems(cla & "_" & g).ListSubItems.add , , ""
                lvw.ListItems(cla & "_" & g).ListSubItems.add , , ""
                
                For k = 1 To ancora.cantfijas
                    With AulasFijas(k)
                        If kernel.utils.idigual(.idclasif, cla) And .idgrupo = g Then
                            lvw.ListItems(cla & "_" & g).ListSubItems(3).Text = getRS_Lugar(0, .idlug)
                            Exit For
                        End If
                    End With
                Next
                
                For k = 1 To ancora.cantAccesos
                    With AccesosProhibidos(k)
                        If kernel.utils.idigual(.idclasif, cla) And .idgrupo = g Then
                            For l = 1 To .cantLugs
                                lvw.ListItems(cla & "_" & g).ListSubItems(4).Text = lvw.ListItems(cla & "_" & g).ListSubItems(4).Text & .idlugs(l) & IIf(l < .cantLugs, ", ", "")
                            Next
                            Exit For
                        End If
                    End With
                Next
                
                
            End If
            lvw.ListItems(cla & "_" & g).ListSubItems(2).Text = lvw.ListItems(cla & "_" & Brigada(i).GrupoXClasif(j).grupo).ListSubItems(2).Text + Brigada(i).comun.id & ", "
            
        Next
    Next
        
End Sub
Public Sub fillTvwEspecialidadesNiveles(ByRef tvw As TreeView, Optional ByVal espicon As Integer = 0, Optional ByVal Nivelicon As Integer = 0)
    
    Dim keyespec  As String
    Dim i As Long
    
    With tvw
        .Nodes.clear
        For i = 1 To ancora.cantEsp
            keyespec = "esp_" + kernel.utils.trunca(Especialidad(i).id)
            .Nodes.add , , keyespec, "(" + kernel.utils.trunca(Especialidad(i).id) + ") " + kernel.utils.trunca(Especialidad(i).descrip), espicon, espicon

            For j = 1 To ancora.cantNiveles
                .Nodes.add keyespec, tvwChild, "Nivel_" & j & "_" & keyespec, "" & j, Nivelicon, Nivelicon
            Next

        Next
    End With
    
End Sub



Public Sub goKernelDatosActividad(ix As Long)

    Dim frm As New frmDatosActividad, cla As Long
    Dim gxc As Long, clas As Long, p As Long, i As Long, j As Long
    Dim esp As Long, rangobusqueda As TRango, actasignadas As TArrInt
    Dim posiblesinicios As Variant
    
    Dim brgs() As Long, cbrgs As Long
    Dim prfs() As Long, cprfs As Long
    Dim lugs() As Long, clugs As Long
    Dim recs() As Long, crecs As Long
    Dim grecs() As Long, cgrecs As Long
    Dim iasg As Long
    Dim cc As Long
    Dim pd As Long
    
    iasg = ancora.IndexById(dASIG, asg)
    pd = ancora.IndexById(dDESGLOSE, per, iasg)
    
    ancora.updateHashLxAct
    ancora.updateHashPxAct
    ancora.updatehash_asignaciones_asig
    
    With Asignaciones(ix)
        cla = ancora.getClasifOfActivity(.idasig, .idperiodo, .idact)
        g = ancora.getGrupoAsignacion(ix)
        ibrg = ancora.IndexById(dBRIGADA, .idbrigada)
        brgs = ancora.getBrigadasDeGrupo(cla, Brigada(ibrg).idesp, Brigada(ibrg).Nivel, Val(g), cbrgs)
            
        prfs = ancora.getProfesParaActividad(.idasig, .idperiodo, .idact, g, cprfs)
        lugs = ancora.getLugaresParaActividad(.idasig, .idperiodo, .idact, clugs)
        grecs = ancora.getIndexesRecursosParaActividad(.idasig, .idperiodo, .idact, cgrecs)
                
        frm.edtFecha.Caption = .fecha & " " & .hora & " hrs"
        frm.edtAsignatura.Caption = getRS_Asignatura(0, .idasig)
        frm.edtPeriodo.Caption = getRS_Periodo(0, .idperiodo)
        frm.edtClasif.Caption = "" & getRS_Clasificacion(cla)
        frm.edtNumero.Caption = "" & .idact
        frm.edtGrupo.Caption = "" & g
                
        fillLvwBrigadas frm.lvwBrigadas, 1, cbrgs, brgs
        
        frm.dia = .dia
        frm.turno = .turno
        
        posiblesinicios = ancora.getPosiblesInicios(.idasig, .idperiodo, .idact, .idbrigada)
    
        frm.tablaPosiblesInicios.Rows = ancora.ct + 1
        frm.tablaPosiblesInicios.cols = ancora.CD + 1
        
        
        frm.tablaPosiblesInicios.RowHeight(0) = 500
        frm.tablaPosiblesInicios.ColWidth(0) = 500
        For i = 1 To ancora.CD
            frm.tablaPosiblesInicios.TextMatrix(0, i) = "" & i
            frm.tablaPosiblesInicios.ColWidth(i) = 500
        Next
        
        For i = 1 To ancora.ct
            frm.tablaPosiblesInicios.TextMatrix(i, 0) = "" & i
            frm.tablaPosiblesInicios.RowHeight(i) = 500
        Next

        For i = 1 To ancora.CD
            For j = 1 To ancora.ct
                frm.tablaPosiblesInicios.TextMatrix(j, i) = IIf(posiblesinicios(i, j), " ", "X")
            Next
        Next
        
        frm.cboProfesor.clear
        For i = 1 To cprfs
            frm.cboProfesor.AddItem getRS_Profe(prfs(i))
            If kernel.utils.idigual(.idprofe, profe(prfs(i)).id) Then frm.cboProfesor.ListIndex = i - 1
        Next
        frm.cboLugar.clear
        For i = 1 To clugs
            frm.cboLugar.AddItem getRS_Lugar(lugs(i))
            If kernel.utils.idigual(.idlugar, lugar(lugs(i)).id) Then frm.cboLugar.ListIndex = i - 1
        Next
        
        For i = 1 To cgrecs
            Dim gr As TGOH_GroupRest, rc As TAtom_Variant
            For Each gr In ancora.recursosXact(grecs(i)).gruposRecursos
                For Each rc In gr.recursos
                    crecs = crecs + 1
                    ReDim Preserve recs(crecs)
                    recs(crecs) = ancora.IndexById(dRECURSO, rc.value & "")
                Next
            Next
        Next
        
        fillLvwRecurso frm.lvwRecursos, 2, crecs, recs
        
        For i = 1 To crecs
            For j = 1 To .cantrecursos
                If kernel.utils.idigual(ancora.recursos(recs(i)).id, .recursos(j)) Then frm.lvwRecursos.ListItems(i).Checked = True
            Next
        Next
        
        frm.chkFija.value = IIf(.fija, 1, 0)
        frm.dia = .dia
        frm.turno = .turno
    End With
otravez:
    frm.Show vbModal
    
    If frm.resultbutton = 1 Then
    
        'validar los cambios
        
        'posible inicio
            If (Not posiblesinicios(frm.dia, frm.turno)) And (frm.dia <> Asignaciones(ix).dia And frm.turno <> Asignaciones(ix).turno) And (frm.dia <> 0 And frm.turno <> 0) Then
                MessageDlg "Error en la entrada de datos", "El turno seleccionado no corresponde con un posible inicio de la actividad en el período. Seleccione otro turno.", vbCritical, "Aceptar"
                GoTo otravez
            End If
        
        'profesor habilitado
                        
            If (frm.dia <> Asignaciones(ix).dia And frm.turno <> Asignaciones(ix).turno) Or Not kernel.utils.idigual(profe(prfs(frm.cboProfesor.ListIndex + 1)).id, Asignaciones(ix).idprofe) Then
                For i = 1 To clasif(cla).ct
                    If ancora.getRestriccion(dPROFE, profe(prfs(frm.cboProfesor.ListIndex + 1)).id, Asignaciones(ix).idperiodo, frm.dia, frm.turno + i - 1) Then
                        MessageDlg "Error en la entrada de datos", "El profesor seleccionado no está habilitado para el turno seleccionado. Seleccione otro turno u otro profesor.", vbCritical, "Aceptar"
                        GoTo otravez
                    End If
                Next
            End If
        
        'lugar habilitado
            If (frm.dia <> Asignaciones(ix).dia And frm.turno <> Asignaciones(ix).turno) Or Not kernel.utils.idigual(lugar(lugs(frm.cboLugar.ListIndex + 1)).id, Asignaciones(ix).idlugar) Then
                For i = 1 To clasif(cla).ct
                    If ancora.getRestriccion(dLUGAR, lugar(lugs(frm.cboLugar.ListIndex + 1)).id, Asignaciones(ix).idperiodo, frm.dia, frm.turno + i - 1) Then
                        MessageDlg "Error en la entrada de datos", "El lugar seleccionado no está habilitado para el turno seleccionado. Seleccione otro turno u otro lugar.", vbCritical, "Aceptar"
                        GoTo otravez
                    End If
                Next
            End If
        
        'recursos imprescindibles habilitados y marcados
            For j = 1 To crecs
                If frm.lvwRecursos.ListItems(j).Checked Then
                    Dim esta As Boolean
                    esta = False
                    For i = 1 To Asignaciones(ix).cantrecursos
                        If kernel.utils.idigual(Asignaciones(ix).recursos(i), ancora.recursos(recs(i)).id) Then
                            esta = True
                            Exit For
                        End If
                    Next
                    If (frm.dia <> Asignaciones(ix).dia And frm.turno <> Asignaciones(ix).turno) Or Not esta Then
                        For i = 1 To clasif(cla).ct
                            If ancora.getRestriccion(dRECURSO, ancora.recursos(recs(j)).id, Asignaciones(ix).idperiodo, frm.dia, frm.turno + i - 1) Then
                                MessageDlg "Error en la entrada de datos", "El recurso " & getRS_Recurso(recs(j)) & " seleccionado no está habilitado para el turno seleccionado. Desmárquelo o seleccione otro turno.", vbCritical, "Aceptar"
                                GoTo otravez
                            End If
                        Next
                    End If
                End If
            Next
        
            Dim impres As Long
            
            
            For i = 1 To cgrecs
                For Each gr In ancora.recursosXact(grecs(i)).gruposRecursos
                    If gr.imprescindibles Then
                        impres = 0
                        For Each rc In gr.recursos
                            For j = 1 To crecs
                                If frm.lvwRecursos.ListItems(i).Checked And kernel.utils.idigual(rc.value & "", ancora.recursos(recs(j)).id) Then impres = impres + 1
                            Next
                        Next
                        If impres < gr.cantNecesarios Then
                            MessageDlg "Error en la entrada de datos", "No todos los recursos imprescidibles están seleccionados. Revise su selección. Si tiene dudas cancele y analice los recursos asignados a esta actividad.", vbCritical, "Aceptar"
                            GoTo otravez
                        End If
                    End If
                Next
            Next
           
        'se procede a realizar los cambios
        
        
        Dim lista As Variant
        Dim cantlista As Long
        Dim ii As Long
                
        lista = ancora.MarcaAsignacionesIgualGrupo(ix, cantlista)

        For ii = 1 To cantlista
            ancora.setAsignaciones_lugar Val(lista(ii)), lugar(lugs(frm.cboLugar.ListIndex + 1)).id
            ancora.setAsignaciones_profe Val(lista(ii)), profe(prfs(frm.cboProfesor.ListIndex + 1)).id
            If frm.dia <> 0 And frm.turno <> 0 Then ancora.moveAsignacion Val(lista(ii)), frm.dia, frm.turno
            Asignaciones(Val(lista(ii))).fija = IIf(frm.chkFija.value = 0, False, True)
        Next
        MessageDlg "Proceso terminado", "Cambios realizados satisfactoriamente.", vbInformation, "Aceptar"
    End If
    
    If frm.resultbutton = 2 Then
    
    End If
End Sub
Public Sub goKernelDatosNiveles()
    Dim frm As frmDatosNiveles
    Set frm = New frmDatosNiveles
    frm.Show vbModal
End Sub

