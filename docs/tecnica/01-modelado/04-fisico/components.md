# Component Diagram

> Component relationships and deployment architecture for Áncora.

---

## Component Overview

```mermaid
componentDiagram
    package "User Interface Layer" {
        [frmKernel*] as FK
        [frmDatos*] as FD
        [frmReportes*] as FR
        [frmGenerador*] as FG
        [Ribbon.ctl] as RB
        [casillero.ctl] as CA
        [XPButton.ctl] as XB
    }
    
    package "Business Logic Layer" {
        [TAncora.cls] as TA
        [clsKernel.cls] as CK
        [clsInterface.cls] as CI
        [clsReport.cls] as CR
        [TGOH_*.cls] as TG
        [TAna_*.cls] as TN
        [TKernel_*.cls] as TK
    }
    
    package "Core Algorithms" {
        [modKernell.bas] as MK
        [modDataGenerator.bas] as MG
        [modDataAnalizer.bas] as MA
        [modDataRepair.bas] as MR
    }
    
    package "Data Layer" {
        [modDataTypes.bas] as MT
        [modDataConstants.bas] as MC
        [modDataGlobals.bas] as MGlo
        [lib*.cls] as LB
    }
    
    FK --> CK : Uses
    FD --> CK : Uses
    FR --> CR : Uses
    FG --> TG : Uses
    
    CK --> TA : Creates/Manages
    TA --> TK : Uses
    TG --> MG : Uses
    
    MG --> MT : Type definitions
    MG --> MC : Constants
    MG --> MGlo : Global data
    MA --> MGlo : Analysis
    MR --> MGlo : Repair
    
    CR --> LB : Excel/File export
    LB --> MT : Data access
```

---

## Detailed Component Descriptions

### UI Components

| Component | Type | Purpose | Dependencies |
|-----------|------|---------|--------------|
| `frmKernel*` | Form | System shell, menu, file operations | clsKernel, clsInterface |
| `frmDatos*` | Form | Data entry for all entity types | TAncora, clsKernel |
| `frmReportes*` | Form | Report viewer and exporter | clsReport |
| `frmGenerador*` | Form | Generation UI and progress | TGOH_*, modDataGenerator |
| `Ribbon.ctl` | Control | Office-style ribbon menu | - |
| `casillero.ctl` | Control | Schedule cell display | - |
| `XPButton.ctl` | Control | Styled button | - |

### Business Components

| Component | Type | Purpose | Dependencies |
|-----------|------|---------|--------------|
| `TAncora` | Class | Main controller, data management | modData*, TKernel_* |
| `clsKernel` | Class | File I/O, utilities | libUtils |
| `clsInterface` | Class | UI coordination | All forms |
| `clsReport` | Class | Report generation | libExcel, libFiles |
| `TGOH_*` | Classes | Schedule generation | modDataGenerator |
| `TAna_*` | Classes | Analysis operations | modDataAnalizer |
| `TKernel_*` | Classes | Kernel utilities (Hash, HRT) | modDataTypes |

### Algorithm Components

| Component | Purpose | Key Functions |
|-----------|---------|---------------|
| `modKernell` | Entry point | Main, Initialize, Cleanup |
| `modDataGenerator` | MPI algorithm | PosibleInicio, AND_MPI, OR_MPI |
| `modDataAnalizer` | Statistics | Coverage, Conflicts, Utilization |
| `modDataRepair` | Conflict resolution | Reorder, Reassign |

### Data Components

| Component | Purpose |
|-----------|---------|
| `modDataTypes` | All UDT definitions |
| `modDataConstants` | System constants |
| `modDataGlobals` | Global arrays and variables |
| `libExcel` | Excel integration |
| `libFiles` | File operations |
| `libStrings` | String utilities |

---

## Component Dependencies (Detailed)

```mermaid
flowchart TD
    subgraph "UI Layer"
        UI1[frmKernel]
        UI2[frmDatosBrigada]
        UI3[frmDatosAsignatura]
        UI4[frmDatosProfe]
        UI5[frmDatosLugar]
        UI6[frmReportes]
        UI7[frmGenerador]
    end
    
    subgraph "Controllers"
        C1[clsKernel]
        C2[TAncora]
        C3[clsInterface]
        C4[clsReport]
    end
    
    subgraph "Generator Classes"
        G1[TGOH_Asignador]
        G2[TGOH_Generador]
        G3[TGOH_Recursos]
    end
    
    subgraph "Kernel Classes"
        K1[TKernel_HRT]
        K2[TKernel_Hash]
        K3[TKernel_Utils]
    end
    
    subgraph "Modules"
        M1[modDataGenerator]
        M2[modDataAnalizer]
        M3[modDataRepair]
        M4[modDataTypes]
        M5[modDataGlobals]
    end
    
    UI1 --> C1
    UI2 --> C2
    UI3 --> C2
    UI4 --> C2
    UI5 --> C2
    UI6 --> C4
    UI7 --> G1
    
    C1 --> C2
    C3 --> UI1
    C3 --> UI2
    C3 --> UI6
    
    C2 --> K1
    C2 --> K2
    C2 --> G1
    
    G1 --> M1
    G2 --> M1
    G3 --> M1
    
    M1 --> M4
    M1 --> M5
    M2 --> M5
    M3 --> M5
```

---

## Public Interfaces

### TAncora Public Interface

```mermaid
classDiagram
    class TAncora {
        +periodos : Collection
        +especialidades : Collection
        +brigadas : Collection
        +asignaturas : Collection
        +profesores : Collection
        +lugares : Collection
        +recursos : Collection
        +clasificaciones : Collection
        +asignaciones : Collection
        +hrt : THRT
        
        +Load(path) Boolean
        +Save(path) Boolean
        +Generate(filters) void
        +Analyze() AnalysisResult
        
        +InsertPeriodo(data) Boolean
        +InsertEspecialidad(data) Boolean
        +InsertBrigada(data) Boolean
        +InsertAsignatura(data) Boolean
        +InsertProfe(data) Boolean
        +InsertLugar(data) Boolean
        +InsertRecurso(data) Boolean
        +InsertClasif(data) Boolean
        
        +DeletePeriodo(id) Boolean
        +DeleteEspecialidad(id) Boolean
        +DeleteBrigada(id) Boolean
        +DeleteAsignatura(id) Boolean
        +DeleteProfe(id) Boolean
        +DeleteLugar(id) Boolean
        +DeleteRecurso(id) Boolean
        +DeleteClasif(id) Boolean
        
        +getCantPeriodos() Long
        +getCantEspecialidades() Long
        +getCantBrigadas() Long
        +getCantAsignaturas() Long
        +getCantProfesores() Long
        +getCantLugares() Long
        
        +IndexById(type, id) Long
        +estaRestringidoPorHerencia(...) Boolean
        +setNativeRestriccion(...) void
        +getRestriccion(...) Boolean
    }
```

### clsKernel Public Interface

```mermaid
classDiagram
    class clsKernel {
        +utils : libUtils
        +hrt : THRT
        
        +LoadFile(path) Boolean
        +SaveFile(path) Boolean
        +AbrirArchivo() Boolean
        +GuardarArchivo() Boolean
        +NuevoArchivo() void
        
        +GetStatus() KernelState
        +GetVersion() String
    }
```

### clsReport Public Interface

```mermaid
classDiagram
    class clsReport {
        +ExportHTML(brigadas, path) Boolean
        +ExportExcel(options) Boolean
        +PreviewReport(type) void
        
        +GenerateCoverage() Report
        +GenerateConflicts() Report
        +GenerateUtilization() Report
    }
```

---

## Deployment Structure

```
ancora-vb6/
│
├── Binaries/
│   ├── Ancora.exe           # Main executable
│   ├── actskin4.ocx         # Skin library
│   ├── ButtonSkin.ocx       # Button skin
│   ├── Comdlg32.ocx         # Common dialogs
│   └── hhctrl.ocx           # HTML Help
│
├── Source/
│   ├── bas/                 # Standard modules
│   ├── cls/                 # Class modules
│   ├── frm/                 # Form modules
│   ├── ctl/                 # User controls
│   ├── res/                 # Resources
│   └── lib/                 # Libraries
│
├── Data/
│   ├── archivos_ejemplos/   # Sample files
│   └── ayuda/              # Help files
│
└── Docs/
    ├── tecnica/             # Technical docs
    └── migration/           # Migration plan
```

---

## Component Communication Patterns

### Observer Pattern (UI Updates)
```mermaid
sequenceDiagram
    participant D as Data Change
    participant TA as TAncora
    participant CI as clsInterface
    participant UI as Forms
    
    D->>TA: Modify entity
    TA->>TA: Update collections
    TA->>CI: NotifyChange(type)
    CI->>UI: Refresh(type)
```

### Strategy Pattern (Report Generation)
```mermaid
classDiagram
    class clsReport {
        <<strategy>>
    }
    class ReportHTML {
        +Generate()
    }
    class ReportExcel {
        +Generate()
    }
    class ReportPrint {
        +Generate()
    }
    
    clsReport o-- ReportHTML
    clsReport o-- ReportExcel
    clsReport o-- ReportPrint
```

### Factory Pattern (Entity Creation)
```mermaid
classDiagram
    class TAncora {
        <<factory>>
        +CreateEntity(type) IEntity
    }
    class TBrigada {
        +Initialize()
    }
    class TAsig {
        +Initialize()
    }
    class TProfe {
        +Initialize()
    }
    
    TAncora ..> TBrigada : creates
    TAncora ..> TAsig : creates
    TAncora ..> TProfe : creates
```

---

## External Dependencies

| Component | Type | Purpose | Registration |
|-----------|------|---------|--------------|
| VB6 Runtime | Runtime | VB6 execution | System |
| Windows API | DLL | File dialogs, etc. | System |
| actskin4.ocx | OCX | Window skinning | `regsvr32` |
| ButtonSkin.ocx | OCX | Button styles | `regsvr32` |
| Comdlg32.ocx | OCX | Common dialogs | System |
| hhctrl.ocx | OCX | HTML Help | System |

---

*Document Status: 🟢 Complete*
*Last Updated: 2026-04-06*
