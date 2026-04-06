# Data Structures Reference

> User-Defined Types (UDTs) defined in `modDataTypes.bas`

## Core Types

### TRestriccion (Restriction)

Availability matrix for a time slot.

```vb
Type TRestriccion
    rest(1 To MAX_DIAS, 1 To MAX_TURNOS) As Boolean  ' Availability matrix
    idperiodo As String                               ' Period ID reference
End Type
```

**Usage**: `True` = available, `False` = restricted/blocked

---

### TRecurso (Resource - Base Type)

Base type for professors, places, and other resources.

```vb
Type TRecurso
    id As String              ' Unique identifier
    descrip As String         ' Description/name
    rest() As TRestriccion    ' Availability by period
    virtual As Boolean       ' Virtual resource flag
    titulo As String          ' Title/label
    capacidad As Long         ' Capacity (for places)
End Type
```

**Extended by**: `TClasif`, `TAsig`, `TBrigada`

---

### TZPriori (Zone Priority)

Priority zones for preferred time slots.

```vb
Type TZPriori
    idperiodo As String
    rest(1 To MAX_DIAS, 1 To MAX_TURNOS) As Byte  ' Priority 0-255
End Type
```

**Usage**: Higher values = higher priority for scheduling

---

## Entity Types

### TClasif (Classification)

Activity classification (theory, lab, practice, etc.)

```vb
Type TClasif
    comun As TRecurso     ' Base resource properties
    ct As Long           ' Continuous flag
    continuos As Boolean ' Require consecutive slots
    zpriori() As TZPriori ' Priority zones by period
End Type
```

---

### TActividad (Activity)

An activity type within a subject breakdown.

```vb
Type TActividad
    idclasif As String              ' Classification ID
    cantProfesNecesarios As Long   ' Required professors
    cantLugaresNecesarios As Long  ' Required classrooms
End Type
```

---

### TDesglose (Breakdown)

Describes how a subject splits into activities.

```vb
Type TDesglose
    act(1 To MAX_ACT) As TActividad   ' Activities
    idperiodo As String                ' Period reference
    cantact As Long                    ' Count of activities
    RespetarOrden As Boolean          ' Respect order flag
    min As Byte                        ' Minimum slots
    max As Byte                        ' Maximum slots
    mismodia As Boolean               ' Same day flag
End Type
```

---

### TAsig (Asignatura - Subject)

A course/subject offered by a specialty.

```vb
Type TAsig
    comun As TRecurso      ' Base resource properties
    idesp As String        ' Specialty ID
    Nivel As Long          ' Academic level
    desglose() As TDesglose ' Activity breakdown
    examenes As String     ' Exam schedule
End Type
```

---

### TBrigada (Brigade - Student Group)

A student cohort/class.

```vb
Type TBrigada
    comun As TRecurso         ' Base resource properties
    idesp As String           ' Specialty ID
    Nivel As Long             ' Academic level
    cantGxClasif As Long     ' Classification-group count
    GrupoXClasif() As TGxClasif ' Group by classification
    matricula As Long         ' Enrollment count
End Type
```

---

### TGxClasif (Grupo por Clasificación)

Maps student groups to activity classifications.

```vb
Type TGxClasif
    idclasif As String  ' Classification ID
    grupo As Long       ' Group index
End Type
```

---

## Assignment Types

### TAsignaRecurso (Resource Assignment Reference)

Reference to an assignment target.

```vb
Type TAsignaRecurso
    idasig As String    ' Subject ID
    idact As Long       ' Activity index
    idper As String     ' Period ID
End Type
```

---

### TLugarXAct (Place by Activity)

Maps classrooms to activities.

```vb
Type TLugarXAct
    para As TAsignaRecurso     ' Assignment reference
    cantLug As Long            ' Number of places
    idlug() As String          ' Place IDs
    idxlug() As Long           ' Place indices
    priori() As Long           ' Preferences
End Type
```

---

### TProfeXAct (Professor by Activity)

Maps professors to activities.

```vb
Type TProfeXAct
    para As TAsignaRecurso   ' Assignment reference
    idprofes As String       ' Professor ID
    idxprofe As Long         ' Professor index
    cantGrupos As Long      ' Number of groups
    grupos() As Long         ' Group indices
End Type
```

---

### TActAsignada (Assigned Activity)

A scheduled activity instance.

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
    lugs() As String         ' All places (expanded)
    profes() As String       ' All professors (expanded)
    cantProfes As Long      ' Professor count
    cantLugs() As Long       ' Place count per slot
    fecha As String         ' Date string
    hora As String * 8       ' Time (fixed 8 chars)
    fija As Boolean         ' Fixed assignment flag
    recursos() As String    ' Resources
    cantrecursos As Long    ' Resource count
End Type
```

---

### TImposible (Impossible Assignment)

Records failed assignment attempts.

```vb
Type TImposible
    idasig As String       ' Subject ID
    idact As Long         ' Activity index
    idbrigada As String   ' Brigade ID
    idperiodo As String   ' Period ID
    fecha As String       ' Date
    hora As String * 8    ' Time
    MAXPI As Long         ' Max possible iterations
    RechazosXRest As Long ' Rejected by restriction
    RechazosXProf As Long ' Rejected by professor
    RechazosXLug As Long   ' Rejected by place
End Type
```

---

## Utility Types

### TImprimir (Print Configuration)

Used for report generation.

```vb
Type TImprimir
    esp As Long     ' Specialty index
    Nivel As Long   ' Level index
    per As Long     ' Period index
    tipo As Long    ' Report type
    id As Long      ' Entity ID
End Type
```

---

### TGenerando (Generation State)

Tracks schedule generation progress.

```vb
Type TGenerando
    cantBrg As Long   ' Brigade count
    id() As Long      ' Brigade IDs
    brgs As TFiltro   ' Brigade filter
End Type
```

---

## Helper Functions

### IndexRestRecurso

```vb
Public Function IndexRestRecurso(per As String, ByRef rest As TRecurso) As Long
```

Returns the array index for a period's restriction data.

**Parameters**:
- `per`: Period ID string
- `rest`: Resource with restrictions array

**Returns**: Index (1-based) or 0 if not found

---

## Related Files

- `modDataGlobals.bas` - Global arrays of these types
- `modDataGenerator.bas` - Uses types for MPI algorithm
- `modDataAnalizer.bas` - Analyzes assignment collections

---

*Last Updated: 2026-04-06*
