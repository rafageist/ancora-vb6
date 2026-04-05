# Mermaid Diagram Examples

This file contains Mermaid diagrams used throughout the documentation.

---

## Entity Relationship Diagrams

### Basic ER
```mermaid
erDiagram
    CUSTOMER ||--o{ ORDER : places
    ORDER ||--|{ LINE-ITEM : contains
    PRODUCT ||--o{ LINE-ITEM : "is in"
```

### Áncora Entities
```mermaid
erDiagram
    SPECIALTY ||--o{ BRIGADE : contains
    SPECIALTY ||--o{ SUBJECT : contains
    SUBJECT ||--o{ ACTIVITY : breaks-down
    ACTIVITY ||--|| CLASIF : typed-as
    BRIGADE ||--o{ GROUP_X_CLASIF : assigned-to
    PROF ||--o{ PROF_X_ACT : teaches
    SUBJECT ||--o{ PROF_X_ACT : has
    PLACE ||--o{ PLACE_X_ACT : hosts
    SUBJECT ||--o{ PLACE_X_ACT : needs
```

---

## Flowcharts

### Process Flow
```mermaid
flowchart TD
    A[Start] --> B{Decision}
    B -->|Yes| C[Process 1]
    B -->|No| D[Process 2]
    C --> E[End]
    D --> E
```

### Data Flow
```mermaid
flowchart LR
    A[Input] --> B[Process]
    B --> C{Check}
    C -->|Pass| D[Output]
    C -->|Fail| E[Error]
```

---

## Sequence Diagrams

### Simple Sequence
```mermaid
sequenceDiagram
    A->>B: Message 1
    B-->>A: Response 1
    A->>B: Message 2
    B-->>A: Response 2
```

### With Decision
```mermaid
sequenceDiagram
    participant U as User
    participant S as System
    
    U->>S: Request
    S->>S: Process
    alt Success
        S-->>U: Result
    else Failure
        S-->>U: Error
    end
```

---

## Class Diagrams

### Basic Class
```mermaid
classDiagram
    class ClassName {
        +PublicField: Type
        -PrivateField: Type
        +PublicMethod(): ReturnType
        -PrivateMethod(): ReturnType
    }
```

### Class Relationships
```mermaid
classDiagram
    class A
    class B
    class C
    
    A *-- B : composition
    A o-- C : aggregation
    A --> C : association
    B --|> A : inheritance
```

---

## State Diagrams

### Simple State
```mermaid
stateDiagram-v2
    [*] --> State1
    State1 --> State2 : event
    State2 --> [*]
```

---

## Pie Charts

### Distribution
```mermaid
pie title Distribution
    "Category A" : 45
    "Category B" : 30
    "Category C" : 25
```

---

## Gantt Charts

### Timeline
```mermaid
gantt
    title Project Timeline
    dateFormat YYYY-MM-DD
    section Phase 1
    Task 1 :2026-04-01, 7d
    Task 2 :2026-04-08, 7d
    section Phase 2
    Task 3 :2026-04-15, 10d
```

---

## Mind Maps

### Concept Map
```mermaid
mindmap
  root((Topic))
    Subtopic A
      Detail 1
      Detail 2
    Subtopic B
      Detail 3
      Detail 4
```

---

## Git Graph

### Branch Example
```mermaid
gitGraph
    commit id: "Initial"
    commit id: "Add docs"
    branch feature
    checkout feature
    commit id: "New feature"
    checkout main
    commit id: "Bug fix"
    merge feature
```

---

## User Journey

```mermaid
journey
    title User Working Day
    section Morning
      Login: 5: User
      Check schedule: 4: User
      Generate: 3: User
    section Afternoon
      Review: 4: User
      Export: 3: User
```

---

*This file is a reference for Mermaid syntax used in the documentation.*
