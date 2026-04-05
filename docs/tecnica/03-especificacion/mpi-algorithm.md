# MPI Algorithm Documentation

## Overview

The **Matriz de Posibles Inicios (MPI)** is the core algorithm in Áncora for determining valid starting positions for activities in the schedule.

---

## Algorithm Description

```mermaid
flowchart TD
    A[Start: For Each Activity] --> B[Get Activity Requirements]
    
    B --> C[Determine Required Slots: ct]
    C --> D{slot + ct <= MAX_TURNOS?}
    
    D -->|No| E[Skip - Cannot Fit]
    D -->|Yes| F[Check Constraints]
    
    F --> G{Period Available?}
    G -->|No| H[Mark: Period Restricted]
    G -->|Yes| I{Classification Available?}
    
    I -->|No| J[Mark: Class Restricted]
    I -->|Yes| K{Brigade Available?}
    
    K -->|No| L[Mark: Brigade Restricted]
    K -->|Yes| M{Professor Available?}
    
    M -->|No| N[Mark: No Professor]
    M -->|Yes| O{Place Available?}
    
    O -->|No| P[Mark: No Place]
    O -->|Yes| Q{Range Constraint Met?}
    
    Q -->|No| R[Mark: Zone Restricted]
    Q -->|Yes| S[Add to Possible Starts]
    
    E --> T[End Loop]
    H --> T
    J --> T
    L --> T
    N --> T
    P --> T
    R --> T
    S --> T
```

---

## Constraint Types

### 1. Period Constraints
```vb
' Check if period allows activity
Period.rest(day, slot) = False ' Available
```

### 2. Classification Constraints
```vb
' Activity type restrictions
Clasif(idClasif).rest(day, slot) = False
```

### 3. Brigade Constraints
```vb
' Student availability
Brigada(idBrig).rest(day, slot) = False
```

### 4. Professor Constraints
```vb
' Teacher availability
Profe(idProfe).rest(day, slot) = False
```

### 5. Place Constraints
```vb
' Room availability
Lugar(idLugar).rest(day, slot) = False
```

### 6. Zone Priority (ZPriori)
```vb
' Preferred time zones
Clasif(idClasif).zpriori(day, slot) >= threshold
```

---

## Data Structures

### TMPI_Casilla
```vb
Type TMPI_Casilla
    valor As Boolean        ' Is this a valid start?
    lug As TFiltro         ' Available places
    prof As TFiltro        ' Available professors
    motivo As Long         ' Reason if invalid (0=ok)
End Type
```

### TMPI1
```vb
Type TMPI1
    MPI(1 To MAX_DIAS, 1 To MAX_TURNOS) As TMPI_Casilla
    ct As Long             ' Consecutive slots needed
End Type
```

---

## Core Functions

### PosibleInicio

```mermaid
sequenceDiagram
    participant G as Generator
    participant A as Ancora
    participant H as HRT
    
    G->>G: Get classification info
    G->>G: Check slot + ct <= max
    loop For each slot in activity duration
        G->>A: getRestriccion(Period)
        A-->>G: isAvailable
        G->>A: getRestriccion(Clasif)
        A-->>G: isAvailable
        G->>A: getRestriccion(Brigada)
        A-->>G: isAvailable
        G->>H: estaRestringidoPorHerencia()
        H-->>G: inherited
    end
    
    alt All Constraints Met
        G->>G: Filter professors
        G->>G: Filter places
        G-->>G: Return valid MPI
    else Constraints Failed
        G-->>G: Return invalid with reason
    end
```

### AND_MPI

Combines MPI matrices for multiple brigades (logical AND):

```vb
' For multiple brigades doing the same activity
For each brigade
    MPI_combined = MPI_combined AND MPI_brigade
Next
```

```mermaid
flowchart LR
    subgraph Brigade1
        M1[Matrix A]
    end
    subgraph Brigade2
        M2[Matrix B]
    end
    
    M1 --> AND[AND Operation]
    M2 --> AND
    AND --> RESULT[Combined Valid Slots]
```

### OR_MPI

Combines multiple schedule options (logical OR):

```vb
' Combine multiple professor options
For each professor
    MPI_combined = MPI_combined OR MPI_professor
Next
```

---

## Heuristic Optimization

### Place Selection Priority

1. **Same as before**: Prefer same room used earlier
2. **Least used**: Choose least restricted room
3. **Distance**: Minimize travel between rooms

```vb
Function SelectLugarOptimo(...)
    ' Check if place used earlier today
    If SamePlaceAvailable Then
        Return SamePlace
    End If
    
    ' Check proximity
    If NearPlaceAvailable Then
        Return NearPlace
    End If
    
    ' Fall back to least used
    Return LeastRestrictedPlace
End Function
```

### Professor Selection Priority

1. **Already assigned to group**
2. **Available for entire duration**
3. **Minimum scheduling conflicts**

---

## Performance Considerations

### Caching
- MPI calculated on-demand, cached until data changes
- HRT constraints pre-computed per entity

### Optimization
- Early exit on first conflict
- Batch constraint checking
- Incremental updates when adding single assignment

---

## Edge Cases

| Case | Handling |
|------|----------|
| No valid slots | Activity marked as impossible |
| Multiple valid slots | Heuristics determine best choice |
| All professors busy | Include in rejection reason |
| Room capacity exceeded | Filtered from place options |
| Overlapping activities | Tracked in assignments |

---

## Future Improvements

1. **Backtracking**: Explore alternative schedules when stuck
2. **Genetic Algorithm**: Global optimization of entire schedule
3. **Parallel Processing**: Multi-threaded constraint checking
4. **Machine Learning**: Learn optimal heuristics from past schedules

---

*Document Status: ⏳ Planned*
