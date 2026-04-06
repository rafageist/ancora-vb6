# Sequence Diagrams

> Interaction patterns and message flows between system components.

---

## S1: Cargar Archivo .anc

```mermaid
sequenceDiagram
    participant U as Usuario
    participant F as frmKernel
    participant K as clsKernel
    participant A as TAncora
    participant H as Hash Tables
    participant FS as File System
    
    U->>F: Click "Abrir"
    F->>K: AbrirArchivo()
    K->>FS: Open file dialog
    FS-->>K: File path selected
    K->>FS: Read file contents
    FS-->>K: Raw text data
    
    K->>K: Parse headers
    K->>A: Instantiate TAncora
    
    loop For each section
        K->>K: ParseSection()
        K->>A: AddEntity(type, data)
        A->>A: Create entity object
        A->>H: Add to hash index
    end
    
    K->>A: BuildRelationships()
    A->>A: Link brigadas to specialties
    A->>A: Link subjects to specialties
    A->>A: Build PxAct/LxAct maps
    
    A-->>K: Data loaded
    K-->>F: Success
    F-->>U: Update UI with data
```

---

## S2: Guardar Archivo .anc

```mermaid
sequenceDiagram
    participant U as Usuario
    participant F as frmKernel
    participant K as clsKernel
    participant A as TAncora
    participant H as Hash Tables
    participant FS as File System
    
    U->>F: Click "Guardar"
    F->>K: GuardarArchivo()
    K->>A: SerializeData()
    
    A->>A: Write header section
    loop For each entity type
        A->>A: FormatEntity()
    end
    
    A-->>K: Formatted text
    K->>FS: Write file
    FS-->>K: File saved
    
    K-->>F: Success
    F-->>U: Show confirmation
```

---

## S3: Generar Horario (MPI)

```mermaid
sequenceDiagram
    participant U as Usuario
    participant FG as frmGenerador
    participant A as TAncora
    participant G as modDataGenerator
    participant H as HRT Manager
    participant PX as PxAct Hash
    participant LX as LxAct Hash
    
    U->>FG: Click "Generar"
    FG->>A: Generate(brigadas[], per)
    
    A->>A: Initialize ProfesoresEnCurso
    A->>A: Initialize GruposEnCurso
    
    loop For each subject
        A->>G: ProcessSubject(asig, per)
        
        loop For each activity in desglose
            G->>G: Get classification ct
            G->>G: Get brigade group mapping
            
            loop For each brigade group
                G->>G: AND_MPI() for all brigades
                
                alt MPI has valid slots
                    G->>G: Select optimal slot using heuristics
                    G->>G: Filter professors (FiltraProfexAct)
                    G->>G: Filter places (FiltraLugxAct)
                    
                    alt Professor and place available
                        G->>G: SelectLugarOptimo()
                        G->>G: AsignaActividad()
                        G->>A: Update restrictions
                        A->>A: setNativeRestriccion()
                    else Cannot assign
                        G->>G: Record as impossible
                        G->>A: Add to TImposible
                    end
                else No valid slots
                    G->>G: Mark as impossible
                end
            end
        end
    end
    
    A-->>FG: Generation complete
    FG-->>U: Show results
```

---

## S4: Calcular MPI (PosibleInicio)

```mermaid
sequenceDiagram
    participant G as modDataGenerator
    participant A as TAncora
    participant C as Classification
    participant B as Brigade
    participant P as Professor
    participant L as Place
    participant H as HRT
    
    G->>G: Get activity requirements
    G->>G: Get classification info (ct, zpriori)
    
    alt Slot + ct exceeds MAX_TURNOS
        G-->>G: Return invalid (reason: cannot fit)
    end
    
    loop For each slot in activity duration (k = 1 to ct)
        G->>A: getRestriccion(PERIODO, day, slot+k-1)
        A-->>G: isAvailable
        
        alt Not available
            G-->>G: Return invalid (reason: period restriction)
        end
        
        G->>A: getRestriccion(CLASIF, day, slot+k-1)
        A-->>G: isAvailable
        
        alt Not available
            G-->>G: Return invalid (reason: class restriction)
        end
        
        G->>A: getRestriccion(BRIGADA, day, slot+k-1)
        A-->>G: isAvailable
        
        alt Not available
            G-->>G: Return invalid (reason: brigade restriction)
        end
        
        G->>H: estaRestringidoPorHerencia()
        H-->>G: isRestricted
        
        alt Restricted by HRT
            G-->>G: Return invalid (reason: HRT inheritance)
        end
    end
    
    G->>G: Get brigade group index
    G->>G: FiltraProfexAct() for professors
    G->>G: FiltraLugxAct() for places
    
    G->>G: FiltraProfeQuePermanece()
    G->>G: FiltraLugarQuePermanece()
    G->>G: QuitaSegunProhibidos()
    
    G->>G: Check resource availability
    
    alt Professor AND Place available
        G-->>G: Return valid TMPI_Casilla
    else No professor
        G-->>G: Return invalid (reason: no professor)
    else No place
        G-->>G: Return invalid (reason: no place)
    end
```

---

## S5: Asignar Actividad

```mermaid
sequenceDiagram
    participant G as modDataGenerator
    participant A as TAncora
    participant BR as Brigade
    participant PR as Professor
    participant LU as Place
    participant RE as Resource
    
    G->>G: Calculate activity duration (ct)
    
    loop For each brigade in group
        G->>A: setNativeRestriccion(BRIGADA, ...)
        A->>A: Mark day/slot as occupied
        
        G->>A: setNativeRestriccion(PROFE, ...)
        A->>A: Mark professor as busy
        
        G->>A: setNativeRestriccion(LUGAR, ...)
        A->>A: Mark place as occupied
        
        G->>A: insertAsignacionAct()
        A->>A: Create TActAsignada record
        A->>A: Increment cantAsignaciones
        A->>A: Update filter index
        
        alt Activity uses resources
            G->>A: getFreeRecursos()
            A-->>G: Available resources list
            
            loop For each required resource group
                G->>G: Select optimal resource
                G->>A: setNativeRestriccion(RECURSO, ...)
            end
        end
    end
    
    G-->>G: Assignment complete
```

---

## S6: Insertar Profesor por Actividad

```mermaid
sequenceDiagram
    participant F as Form (frmDatosProfesor)
    participant A as TAncora
    participant K as clsKernel
    participant PX as PxAct Hash
    participant PR as Professor
    participant BG as Brigade
    
    F->>A: insertPxAct(data)
    
    A->>K: Validate data
    K->>PR: Verify professor exists
    K-->>A: Professor valid
    
    A->>PX: Get or create hash entry
    A->>PX: Add professor to activity
    
    loop For each brigade in selection
        A->>PR: Add group to professor
        A->>A: Update ProfeXAct record
    end
    
    A->>A: Increment cantIDPxAct
    A-->>F: Success
    F-->>K: Refresh UI
```

---

## S7: Análisis de Cobertura

```mermaid
sequenceDiagram
    participant U as Usuario
    participant FA as frmAnalisis
    participant AN as modDataAnalizer
    participant A as TAncora
    
    U->>FA: Click "Analizar"
    FA->>AN: AnalizarCobertura()
    
    AN->>A: Get all assignments
    A-->>AN: Assignment list
    
    AN->>AN: Count total activities
    AN->>AN: Count assigned activities
    AN->>AN: Calculate coverage percentage
    
    AN->>A: Get all subjects
    A-->>AN: Subject list
    
    loop For each subject
        AN->>AN: Count required activities
        AN->>AN: Count assigned activities
        AN->>AN: Calculate subject coverage
    end
    
    AN->>A: Get all brigades
    A-->>AN: Brigade list
    
    loop For each brigade
        AN->>AN: Analyze gaps
        AN->>AN: Detect conflicts
    end
    
    AN-->>FA: Analysis results
    FA-->>U: Display statistics
```

---

## S8: Exportar a Excel

```mermaid
sequenceDiagram
    participant U as Usuario
    participant FR as frmReportes
    participant R as clsReport
    participant X as libExcel
    participant A as TAncora
    
    U->>FR: Click "Exportar Excel"
    FR->>R: ExportToExcel(options)
    
    R->>X: CreateWorkbook()
    X-->>R: Workbook handle
    
    loop For each sheet type
        R->>X: AddSheet(name)
        
        loop For each row
            R->>R: FormatRow()
            R->>X: WriteRow(data)
        end
    end
    
    R->>X: Save(path)
    X-->>R: File saved
    
    R-->>FR: Success
    FR-->>U: Open file prompt
```

---

## S9: Gestionar HRT (Herencia)

```mermaid
sequenceDiagram
    participant U as Usuario
    participant FH as frmHRT
    participant A as TAncora
    participant H as HRT Manager
    
    U->>FH: Configure HRT rules
    FH->>A: setHRTRule(period, entity, rule)
    
    alt Add exception
        A->>H: AddException()
        H->>H: Store in exceptoEnTiempo
    end
    
    alt Set inheritance
        A->>H: SetInheritance()
        H->>H: Mark affected entities
    end
    
    alt Set preference
        A->>H: SetZonePriority()
        H->>H: Update zpriori matrices
    end
    
    A-->>FH: HRT updated
    FH-->>U: Confirmation
```

---

## S10: Buscar Horario Libre (Place Proximity)

```mermaid
sequenceDiagram
    participant G as modDataGenerator
    participant A as TAncora
    
    G->>A: getDistanciaResource(resource, lugar, per, dia, turno)
    
    A->>A: Get assigned places for day/per
    A->>A: Find previous assignment
    
    alt Same place exists
        A-->>G: Distance = 0
    end
    
    alt Adjacent place exists
        A-->>G: Distance = 1
    end
    
    alt Other places exist
        A->>A: Calculate physical distance
        A-->>G: Distance = calculated
    end
    
    alt No previous assignments
        A-->>G: Distance = Max
    end
```

---

## Communication Patterns

### Request-Response
```
Client -> Server: Operation()
Server -->> Client: Result/Error
```
Used for: All CRUD operations on entities

### Callback
```
Component -> System: RegisterEvent()
System -> Component: EventCallback(data)
```
Used for: Progress updates during generation

### Observer
```
Subject -> Observers: Notify()
Observers -> Observers: Update()
```
Used for: UI refresh after data changes

### Iterator
```
for each entity in collection:
    process(entity)
```
Used for: Batch operations, report generation

---

## Key Interface Contracts

### TAncora Public Methods

| Method | Parameters | Returns | Called By |
|--------|------------|---------|-----------|
| `Load(path)` | String | Boolean | clsKernel |
| `Save(path)` | String | Boolean | clsKernel |
| `Generate(...)` | filters | void | frmGenerador |
| `Insert*(data)` | entity data | Boolean | Forms |
| `Delete*(id)` | entity ID | Boolean | Forms |
| `getCant*()` | - | Long | Forms/Reports |
| `IndexById(type, id)` | Type, ID | Long | All |

### clsKernel Public Methods

| Method | Parameters | Returns | Called By |
|--------|------------|---------|-----------|
| `LoadFile(path)` | String | Boolean | Forms |
| `SaveFile(path)` | String | Boolean | Forms |
| `AbrirArchivo()` | - | Boolean | Forms |
| `GuardarArchivo()` | - | Boolean | Forms |

---

*Document Status: 🟢 Complete*
*Last Updated: 2026-04-06*
