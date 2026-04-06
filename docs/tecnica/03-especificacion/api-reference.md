# API Reference

> Public interfaces and method signatures for Áncora components.

---

## TAncora (Main Controller)

### File Operations

```vb
Public Function Load(path As String) As Boolean
```
Load data from .anc file.
- **param** `path`: Full path to .anc file
- **returns**: `True` if successful, `False` otherwise

```vb
Public Function Save(path As String) As Boolean
```
Save data to .anc file.
- **param** `path`: Full path to save to
- **returns**: `True` if successful, `False` otherwise

### Generation

```vb
Public Sub Generate(Optional filters As TFiltro)
```
Generate schedule for selected brigades.
- **param** `filters`: Optional brigade filter

### Entity Count

```vb
Public Function getCantPeriodos() As Long
Public Function getCantEspecialidades() As Long
Public Function getCantBrigadas() As Long
Public Function getCantAsignaturas() As Long
Public Function getCantProfesores() As Long
Public Function getCantLugares() As Long
Public Function getCantRecursos() As Long
Public Function getCantClasificaciones() As Long
```
Get count of each entity type.
- **returns**: Number of entities

### Lookup

```vb
Public Function IndexById(type As Long, id As String, Optional posInicial As Long = 1) As Long
```
Find entity index by ID.
- **param** `type`: Entity type (dPERIODO, dESPECIALIDAD, etc.)
- **param** `id`: Entity ID string
- **param** `posInicial`: Starting search position
- **returns**: Index (1-based) or 0 if not found

### Insert Operations

```vb
Public Function insertPeriodo(datos As String) As Boolean
Public Function insertEspecialidad(datos As String) As Boolean
Public Function insertBrigada(datos As String) As Boolean
Public Function insertAsignatura(datos As String) As Boolean
Public Function insertProfe(datos As String) As Boolean
Public Function insertLugar(datos As String) As Boolean
Public Function insertRecurso(datos As String) As Boolean
Public Function insertClasif(datos As String) As Boolean
```
Insert new entity.
- **param** `datos`: Serialized entity data
- **returns**: `True` if successful

### Delete Operations

```vb
Public Function DeletePeriodo(id As String) As Boolean
Public Function DeleteEspecialidad(id As String) As Boolean
Public Function DeleteBrigada(id As String) As Boolean
Public Function DeleteAsignatura(id As String) As Boolean
Public Function DeleteProfe(id As String) As Boolean
Public Function DeleteLugar(id As String) As Boolean
Public Function DeleteRecurso(id As String) As Boolean
Public Function DeleteClasif(id As String) As Boolean
```
Delete entity by ID.
- **param** `id`: Entity ID to delete
- **returns**: `True` if successful

### Assignment Operations

```vb
Public Function insertAsignacionAct(dia As Long, fecha As String, _
    fija As Boolean, hora As String,idact As Long, idasig As String, _
    idbrigada As String, idlugar As String, idperiodo As String, _
    idprofe As String, turno As Long) As Boolean
```
Create activity assignment.
- **returns**: `True` if successful

### Constraint Operations

```vb
Public Function getRestriccion(tipo As Long, id As String, per As String, _
    dia As Long, turno As Long) As Boolean
```
Get restriction status for slot.
- **returns**: `True` if restricted, `False` if available

```vb
Public Sub setNativeRestriccion(tipo As Long, id As String, per As String, _
    dia As Long, turno As Long, valor As Boolean, Optional ct As Long = 1)
```
Set restriction for slot(s).
- **param** `ct`: Duration in slots (for multi-slot activities)

```vb
Public Function estaRestringidoPorHerencia(per As String, dia As Long, _
    turno As Long, tipo As Long, id As String, _
    Optional soloExcepcion As Boolean = True, _
    Optional soloNoExcepcion As Boolean = False) As Boolean
```
Check HRT inheritance.
- **returns**: `True` if restricted by HRT

---

## clsKernel

### File Operations

```vb
Public Function AbrirArchivo() As Boolean
```
Show open dialog and load file.
- **returns**: `True` if successful

```vb
Public Function GuardarArchivo() As Boolean
```
Show save dialog and save file.
- **returns**: `True` if successful

```vb
Public Function LoadFile(path As String) As Boolean
```
Load file directly.
- **param** `path`: File path
- **returns**: `True` if successful

```vb
Public Function SaveFile(path As String) As Boolean
```
Save file directly.
- **param** `path`: File path
- **returns**: `True` if successful

### Properties

```vb
Public Property Get Status() As Long
Public Property Let Status(ByVal New_Status As Long)
```
Kernel state (ARCHIVO_ABIERTO or ARCHIVO_CERRADO)

```vb
Public Property Get utils() As libUtils
```
Utility functions instance

```vb
Public Property Get hrt() As TKernel_HRT
```
HRT manager instance

---

## clsReport

### Export Methods

```vb
Public Function ExportHTML(brigadas As TFiltro, path As String) As Boolean
```
Export schedules to HTML files.
- **param** `brigadas`: Brigades to export
- **param** `path`: Output directory
- **returns**: `True` if successful

```vb
Public Function ExportExcel(Optional options As TExportOptions) As Boolean
```
Export to Excel workbook.
- **param** `options`: Export configuration
- **returns**: `True` if successful

### Analysis Methods

```vb
Public Function GenerateCoverageReport() As clsReportData
```
Calculate coverage statistics.
- **returns**: Report data object

```vb
Public Function GenerateConflictReport() As clsReportData
```
Detect scheduling conflicts.
- **returns**: Report data object

```vb
Public Function GenerateUtilizationReport() As clsReportData
```
Calculate resource utilization.
- **returns**: Report data object

---

## modDataGenerator (Public Functions)

### MPI Functions

```vb
Public Function PosibleInicio(per As Long, dia As Long, turno As Long, _
    asg As Long, act As Long, brg As Long, zona As Long, _
    Optional ByRef freerecursos As TGOH_arrGroupRest) As TMPI_Casilla
```
Check if slot is valid for activity.
- **returns**: TMPI_Casilla with validity and options

```vb
Public Function AND_MPI(brgs As TFiltro, per As Long, asg As Long, _
    act As Long, zona As Long) As TMPI1
```
Combine MPI for multiple brigades (AND).
- **returns**: Combined MPI matrix

```vb
Public Function OR_MPI(mpi1 As TMPI1, mpi2 As TMPI1) As TMPI1
```
Combine MPI matrices (OR).
- **returns**: Combined MPI matrix

### Filter Functions

```vb
Public Function FiltraProfexAct(per As Long, asg As Long, act As Long, _
    grp As Long) As TFiltro
```
Filter professors assigned to activity.
- **returns**: Filter with valid professor indices

```vb
Public Function FiltraLugxAct(per As Long, asg As Long, act As Long) As TFiltro
```
Filter places assigned to activity.
- **returns**: Filter with valid place indices

```vb
Public Function FiltraProfeQuePermanece(per As Long, pProfes As TFiltro, _
    dia As Long, turno As Long, cantturnos As Long) As TFiltro
```
Filter professors available for duration.
- **returns**: Filter with available professors

```vb
Public Function FiltraLugarQuePermanece(per As Long, plug As TFiltro, _
    dia As Long, turno As Long, cantturnos As Long) As TFiltro
```
Filter places available for duration.
- **returns**: Filter with available places

### Assignment

```vb
Public Sub AsignaActividad(per As Long, brgs As TFiltro, asg As String, _
    act As Long, dia As Long, turno As Long, prof As String, lug As String, _
    cturnos As Long, Optional ByRef freerecursos As TGOH_arrGroupRest)
```
Create activity assignment and update restrictions.

### Selection

```vb
Public Function SelectLugarOptimo(listaidbrg As TFiltro, posibles As TFiltro, _
    dia As Long, per As Long, turno As Long, sentido As Long) As Long
```
Select optimal place using heuristics.
- **returns**: Selected place index

---

## Type Definitions (UDTs)

### TActAsignada
```vb
Type TActAsignada
    dia As Long              ' Day (1-MAX_DIAS)
    turno As Long            ' Period (1-MAX_TURNOS)
    idprofe As String       ' Professor ID
    idasig As String        ' Subject ID
    idact As Long           ' Activity index
    idlugar As String       ' Place ID
    idperiodo As String      ' Period ID
    idbrigada As String     ' Brigade ID
    lugs() As String         ' All places
    profes() As String       ' All professors
    cantProfes As Long      ' Professor count
    cantLugs() As Long       ' Place count
    fecha As String         ' Date
    hora As String * 8       ' Time
    fija As Boolean         ' Fixed flag
    recursos() As String     ' Resources
    cantrecursos As Long    ' Resource count
End Type
```

### TMPI_Casilla
```vb
Type TMPI_Casilla
    valor As Boolean        ' Is valid?
    lug As TFiltro         ' Available places
    prof As TFiltro        ' Available professors
    motivo As Long         ' Rejection reason (0=ok)
End Type
```

### TMPI1
```vb
Type TMPI1
    MPI(1 To MAX_DIAS, 1 To MAX_TURNOS) As TMPI_Casilla
    ct As Long             ' Required slots
End Type
```

---

## Error Codes

| Code | Constant | Meaning |
|------|----------|---------|
| 0 | - | Success |
| 1 | MPI_INVALID | Activity doesn't fit in slot range |
| 2 | MPI_NO_PROFE | No professor available |
| 3 | MPI_NO_LUGAR | No place available |
| 4 | MPI_NO_BOTH | Neither professor nor place |
| 5 | MPI_RESTRICTED | Slot is restricted |

---

## Events

### TAncora Events

```vb
Event DataChanged(entityType As Long)
```
Fired when any entity is modified.

```vb
Event AssignmentCreated(assignment As TActAsignada)
```
Fired when new assignment is created.

```vb
Event AssignmentDeleted(assignmentId As Long)
```
Fired when assignment is deleted.

```vb
Event GenerationProgress(percent As Long, message As String)
```
Fired during schedule generation.

```vb
Event GenerationComplete(success As Boolean, impossibles As Long)
```
Fired when generation finishes.

---

*Document Status: 🟢 Complete*
*Last Updated: 2026-04-06*
