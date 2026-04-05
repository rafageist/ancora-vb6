# 01. Context Model (Modelo de Contexto)

## 1.1 System Purpose

**Áncora** is an automatic scheduling system designed to generate and manage academic timetables for educational institutions.

### Mission Statement
> Automate the creation of conflict-free academic schedules by intelligently assigning activities to time slots while respecting physical, temporal, and human constraints.

---

## 1.2 System Scope

```mermaid
graph TB
    subgraph EXTERNAL["External Actors"]
        U[User/Administrator]
        E[Export System]
    end
    
    subgraph BOUNDARY["Áncora System Boundary"]
        subgraph UI["User Interface Layer"]
            FM[Forms & Dialogs]
            RB[Ribbon Menu]
        end
        
        subgraph CORE["Core Engine"]
            GE[Generator Engine]
            AN[Analyzer]
            RP[Report Generator]
        end
        
        subgraph DATA["Data Layer"]
            DS[Data Structures]
            FL[File Loader/Saver]
            HR[HRT Manager]
        end
    end
    
    U --> FM
    FM --> RB
    RB --> GE
    GE <--> DS
    DS <--> FL
    GE <--> AN
    AN --> RP
    RP --> E
    
    style BOUNDARY fill:#e6f3ff,stroke:#333,stroke-width:2px
    style EXTERNAL fill:#fff3e6,stroke:#333
```

---

## 1.3 External Entities (Actors)

### Primary Actors

| Actor | Description | Role |
|-------|-------------|------|
| **Schedule Administrator** | Manages data entry and system configuration | Primary user |
| **Academic Coordinator** | Reviews and adjusts generated schedules | Secondary user |
| **Export System** | Receives schedule data for external use | Automated consumer |

### Use Case Summary

```mermaid
graph LR
    A[Manage Data] --> B[CRUD Operations]
    B --> C[Periods]
    B --> D[Specialties]
    B --> E[Brigades]
    B --> F[Subjects]
    B --> G[Professors]
    B --> H[Places]
    B --> I[Resources]
    
    J[Generate Schedule] --> K[Validate]
    J --> L[Create Assignments]
    J --> M[Handle Conflicts]
    
    N[Analyze] --> O[Statistics]
    N --> P[Gap Detection]
    N --> Q[Utilization Reports]
```

---

## 1.4 Data Flow Overview

```mermaid
flowchart LR
    subgraph INPUT
        DC[Datos Generales<br/>5 dias, 5 turnos]
        PE[Periodos<br/>si, sp, etc.]
        ES[Especialidades<br/>info, civil, etc.]
        BR[Brigadas<br/>b1, b2, etc.]
        AS[Asignaturas<br/>mat, fis, etc.]
        PR[Profesores<br/>p1, p2, etc.]
        LG[Lugares<br/>a1, a2, etc.]
        RC[Recursos<br/>lab1, etc.]
    end
    
    subgraph PROCESS
        G[Generator]
        A[Analyzer]
        V[Validator]
    end
    
    subgraph OUTPUT
        ASG[Asignaciones]
        RPT[Reportes]
        EXP[Export]
    end
    
    DC --> V
    PE --> V
    ES --> V
    BR --> V
    AS --> V
    PR --> V
    LG --> V
    RC --> V
    
    V --> G
    G --> A
    A --> ASG
    ASG --> RPT
    RPT --> EXP
```

---

## 1.5 System Boundaries

### What Áncora DOES:
- ✅ Generate conflict-free schedules
- ✅ Manage complex multi-entity relationships
- ✅ Handle resource constraints
- ✅ Analyze schedule quality
- ✅ Export to multiple formats

### What Áncora DOES NOT:
- ❌ Manage student enrollment
- ❌ Handle billing/payments
- ❌ Provide course registration
- ❌ Integrate with SIS/SMS directly

---

## 1.6 Key Metrics

| Metric | Value |
|--------|-------|
| Maximum Days (MAX_DIAS) | 7 |
| Maximum Periods (MAX_TURNOS) | 12 |
| Maximum Activities per Period (MAX_ACT) | 5 |
| Entity Types | 9 |

---

## 1.7 Future Context Considerations

```mermaid
mindmap
  root((Áncora v1.2))
    Core Engine
      MPI Algorithm
      Constraint Propagation
      Resource Allocation
    Extensions
      Multi-language UI
      Database Backend
      Web Service API
      Cloud Deployment
    Integrations
      Student Information Systems
      Room Booking Systems
      Calendar Apps
      Mobile Access
```

---

*Document Status: 🔄 In Progress*
*Next: Move to Business Model (02-Negocio)*
