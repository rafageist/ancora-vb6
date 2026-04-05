# Architecture Documentation

## System Architecture Overview

```mermaid
flowchart TB
    subgraph PRESENTATION["Presentation Layer"]
        subgraph FORMS
            FM[Main Window<br/>frmKernelMain]
            FD[Data Forms<br/>frmDatos*]
            FR[Report Forms<br/>frmReportes*]
            FG[Generator Forms<br/>frmGenerador*]
            FH[Tool Forms<br/>frmHerramientas*]
            FX[Generic Dialogs<br/>frm_generic_*]
        end
        
        subgraph CONTROLS
            RB[Ribbon Menu<br/>Ribbon.ctl]
            CL[Schedule Cell<br/>casillero.ctl]
            BT[Styled Button<br/>XPButton.ctl]
        end
    end
    
    subgraph BUSINESS_LOGIC["Business Logic Layer"]
        subgraph CORE
            KG[clsKernel<br/>Application Controller]
            IF[clsInterface<br/>UI Controller]
            RP[clsReport<br/>Report Generator]
        end
        
        subgraph SCHEDULING_ENGINE
            AN[clsAncora<br/>Data Controller]
            GE[modDataGenerator<br/>Generation Algorithms]
            AL[modDataAnalizer<br/>Analysis Algorithms]
            RE[modDataRepair<br/>Conflict Repair]
        end
    end
    
    subgraph DATA_ACCESS["Data Access Layer"]
        TY[modDataTypes<br/>Type Definitions]
        GL[modDataGlobals<br/>Global Variables]
        CN[modDataConstants<br/>Constants]
        FS[libFiles<br/>File I/O]
    end
    
    subgraph INFRASTRUCTURE["Infrastructure"]
        subgraph UTILITIES
            UT[libUtils<br/>General Utilities]
            ST[libStrings<br/>String Operations]
            EX[libExcelSheets<br/>Excel Integration]
        end
        
        subgraph CACHE
            HS[TKernel_Hash<br/>Hash Index]
            HC[TKernel_HashCollection<br/>Hash Manager]
            CD[TCacheID<br/>ID Cache]
        end
    end
    
    PRESENTATION --> BUSINESS_LOGIC
    BUSINESS_LOGIC --> DATA_ACCESS
    BUSINESS_LOGIC --> INFRASTRUCTURE
```

---

## Component Responsibilities

### 1. Presentation Layer

| Component | Responsibility |
|-----------|----------------|
| `frmKernelMain` | Main application window, menu system |
| `frmDatos*` | CRUD operations for entities |
| `frmReportes*` | Report generation and display |
| `frmGenerador*` | Schedule generation wizard |
| `Ribbon.ctl` | Modern menu interface |

### 2. Business Logic Layer

| Component | Responsibility |
|-----------|----------------|
| `clsKernel` | Initialize/teardown, global coordination |
| `clsAncora` | All data operations, entity management |
| `modDataGenerator` | MPI algorithm, assignment creation |
| `modDataAnalizer` | Statistics, gap detection |
| `modDataRepair` | Conflict resolution |
| `clsInterface` | UI state management |
| `clsReport` | Report formatting and export |

### 3. Data Layer

| Component | Responsibility |
|-----------|----------------|
| `modDataTypes` | UDT definitions |
| `modDataGlobals` | Global variable declarations |
| `modDataConstants` | Constant definitions |

### 4. Infrastructure

| Component | Responsibility |
|-----------|----------------|
| `libUtils` | ID comparison, percentage, formatting |
| `libStrings` | String manipulation |
| `libFiles` | File path operations |
| `TKernel_Hash*` | Fast index lookup |

---

## Data Flow Architecture

```mermaid
flowchart LR
    subgraph INPUT
        A[.anc File]
        U[User Input]
    end
    
    subgraph PROCESS
        F1[File Load<br/>libFiles]
        V1[Validation<br/>clsAncora]
        P1[Parse<br/>modDataTypes]
        C1[Cache Update<br/>TKernel_Hash]
    end
    
    subgraph ENGINE
        G1[MPI Matrix<br/>modDataGenerator]
        G2[Constraint Check<br/>HRT System]
        G3[Assignment<br/>clsAncora]
    end
    
    subgraph OUTPUT
        O1[Report<br/>clsReport]
        O2[HTML Export]
        O3[Statistics<br/>modDataAnalizer]
    end
    
    A --> F1
    F1 --> V1
    V1 --> P1
    P1 --> C1
    C1 --> G1
    G1 --> G2
    G2 --> G3
    G3 --> O1
    G3 --> O2
    G3 --> O3
    
    U --> V1
```

---

## Module Interaction Patterns

### Singleton Pattern
```mermaid
classDiagram
    class clsKernel {
        -Shared Instance
        +GetInstance() clsKernel
    }
    
    class clsAncora {
        -Shared Instance
        +GetInstance() clsAncora
    }
    
    class clsInterface {
        -Shared Instance
        +GetInstance() clsInterface
    }
    
    clsKernel o-- clsAncora
    clsKernel o-- clsInterface
```

### Observer Pattern (Progress Updates)
```mermaid
sequenceDiagram
    participant G as Generator
    participant I as Interface
    participant C as Console
    
    loop For Each Activity
        G->>G: Process Activity
        G->>I: Update Progress
        I->>C: console.Progress()
        C-->>I: Show Progress Bar
    end
```

---

## Concurrency Model

```mermaid
flowchart LR
    subgraph MAIN_THREAD
        UI[UI Updates]
        GE[Generator Loop]
        EV[Event Handler]
    end
    
    subgraph BACKGROUND
        CALC[MPI Calculation]
        FILE_IO[File Operations]
    end
    
    UI -->|DoEvents| EV
    GE -->|Yield| UI
    CALC -->|Complete| GE
    FILE_IO -->|Complete| GE
```

> **Note**: VB6 is single-threaded. Background operations use `DoEvents` for UI responsiveness.

---

## Error Handling Strategy

```mermaid
flowchart TD
    A[Operation] --> B{Error?}
    B -->|No| C[Continue]
    B -->|Yes| D{Error Type}
    
    D -->|Data| E[Show Data Error]
    D -->|File| F[Show File Error]
    D -->|Constraint| G[Mark as Impossible]
    D -->|System| H[Log & Abort]
    
    E --> I[User Correction]
    F --> J[Retry/Cancel]
    G --> K[Continue Generation]
    H --> L[Exit]
    
    I --> A
    J --> A
    K --> A
```

---

## Performance Optimization

### 1. Hash-Based Lookups
```mermaid
flowchart LR
    A[Lookup by ID] --> B{Hash Exists?}
    B -->|Yes| C[O(1) Access]
    B -->|No| D[Rebuild Hash]
    D --> C
```

### 2. Constraint Caching
- HRT (Herencia de Restricciones de Tiempo) cached per entity
- Invalidation on data modification

### 3. MPI Matrix Optimization
- Lazy evaluation of possible starts
- Incremental updates on single assignment

---

## Extension Points

| Extension | Implementation |
|-----------|----------------|
| New Entity Type | Extend constants + entity classes |
| New Constraint | Add to HRT system |
| New Report | Implement in clsReport |
| New Algorithm | Add to modDataGenerator |

---

## Security Considerations

1. **File Access**: Local .anc files only
2. **No Authentication**: Single-user desktop application
3. **Input Validation**: All user inputs validated before processing
4. **Error Messages**: Sanitized to prevent information leakage

---

*Document Status: 🔄 In Progress*
