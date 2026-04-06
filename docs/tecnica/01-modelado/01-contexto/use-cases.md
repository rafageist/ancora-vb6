# Use Cases

> User interactions with the Áncora system.

## Actor Definitions

| Actor | Description | Type |
|-------|-------------|------|
| **Administrador** | Schedule Administrator | Primary |
| **Coordinador** | Academic Coordinator | Secondary |
| **Sistema Exportación** | Export System | Automated |
| **Profesor** | Professor | Secondary |

## Use Case Diagram

```mermaid
graph TB
    subgraph "Gestión de Datos"
        UC1[Crear Período]
        UC2[Crear Especialidad]
        UC3[Crear Brigada]
        UC4[Crear Asignatura]
        UC5[Crear Profesor]
        UC6[Crear Lugar]
        UC7[Crear Recurso]
    end
    
    subgraph "Programación"
        UC10[Generar Horario]
        UC11[Asignar Manualmente]
        UC12[Marcar como Fija]
        UC13[Redistribuir]
    end
    
    subgraph "Análisis"
        UC20[Ver Estadísticas]
        UC21[Detectar Conflictos]
        UC22[Ver Distribución]
    end
    
    subgraph "Exportación"
        UC30[Exportar HTML]
        UC31[Exportar a Excel]
        UC32[Duplicar Escenario]
    end
    
    Admin([Administrador]) --> UC1
    Admin --> UC3
    Admin --> UC5
    Admin --> UC10
    Admin --> UC20
    Admin --> UC30
    
    Coord([Coordinador]) --> UC11
    Coord --> UC12
    Coord --> UC21
    Coord --> UC22
    
    Export([Sistema]) --> UC30
```

## Use Case Details

### UC1: Crear Período

| Field | Value |
|-------|-------|
| ID | UC-001 |
| Actor | Administrador |
| Preconditions | Archivo abierto |
| Postconditions | Nuevo período disponible |
| Main Flow | 1. Abrir diálogo de período<br>2. Ingresar nombre (ej: "2024-1")<br>3. Definir días y turnos<br>4. Confirmar creación |
| Exceptions | Nombre duplicado → mostrar error |

---

### UC2: Crear Especialidad

| Field | Value |
|-------|-------|
| ID | UC-002 |
| Actor | Administrador |
| Preconditions | Archivo abierto |
| Postconditions | Nueva especialidad en sistema |
| Main Flow | 1. Abrir formulario de especialidad<br>2. Ingresar ID y descripción<br>3. Definir restricciones HRT<br>4. Guardar |

---

### UC3: Crear Brigada

| Field | Value |
|-------|-------|
| ID | UC-003 |
| Actor | Administrador |
| Preconditions | Especialidad existe |
| Postconditions | Nueva brigada asociada a especialidad |
| Main Flow | 1. Seleccionar especialidad<br>2. Crear brigada (ej: "1A", "2B")<br>3. Definir matrícula<br>4. Asignar a clasificaciones<br>5. Guardar |

---

### UC4: Crear Asignatura

| Field | Value |
|-------|-------|
| ID | UC-004 |
| Actor | Administrador |
| Preconditions | Especialidad existe |
| Postconditions | Nueva asignatura con desglose |
| Main Flow | 1. Seleccionar especialidad<br>2. Crear asignatura<br>3. Definir desglose (actividades)<br>4. Asignar profesores y lugares<br>5. Guardar |

---

### UC5: Crear Profesor

| Field | Value |
|-------|-------|
| ID | UC-005 |
| Actor | Administrador |
| Preconditions | Archivo abierto |
| Postconditions | Nuevo profesor disponible |
| Main Flow | 1. Abrir formulario de profesor<br>2. Ingresar ID y nombre<br>3. Definir disponibilidad<br>4. Asignar a asignaturas<br>5. Guardar |

---

### UC6: Crear Lugar

| Field | Value |
|-------|-------|
| ID | UC-006 |
| Actor | Administrador |
| Preconditions | Archivo abierto |
| Postconditions | Nuevo lugar disponible |
| Main Flow | 1. Abrir formulario de lugar<br>2. Ingresar ID y descripción<br>3. Definir capacidad<br>4. Establecer restricciones<br>5. Guardar |

---

### UC7: Crear Recurso

| Field | Value |
|-------|-------|
| ID | UC-007 |
| Actor | Administrador |
| Preconditions | Archivo abierto |
| Postconditions | Nuevo recurso disponible |
| Main Flow | 1. Abrir formulario de recurso<br>2. Ingresar ID y descripción<br>3. Definir tipo (virtual/físico)<br>4. Establecer disponibilidad<br>5. Guardar |

---

### UC10: Generar Horario

| Field | Value |
|-------|-------|
| ID | UC-010 |
| Actor | Administrador |
| Preconditions | Datos cargados, entidades definidas |
| Postconditions | Horario generado o imposible |
| Main Flow | 1. Seleccionar período destino<br>2. Elegir brigadas a programar<br>3. Ejecutar generación MPI<br>4. Revisar resultados<br>5. Guardar horario |
| Exceptions | Asignación imposible →报告显示 |

---

### UC11: Asignar Manualmente

| Field | Value |
|-------|-------|
| ID | UC-011 |
| Actor | Coordinador |
| Preconditions | Horario existente |
| Postconditions | Asignación modificada |
| Main Flow | 1. Seleccionar celda vacía<br>2. Elegir asignatura/actividad<br>3. Seleccionar profesor y lugar<br>4. Confirmar asignación |

---

### UC12: Marcar como Fija

| Field | Value |
|-------|-------|
| ID | UC-012 |
| Actor | Coordinador |
| Preconditions | Asignación existe |
| Postconditions | Asignación no se mueve en regeneración |
| Main Flow | 1. Seleccionar asignación<br>2. Marcar checkbox "fija"<br>3. Confirmar |

---

### UC13: Redistribuir

| Field | Value |
|-------|-------|
| ID | UC-013 |
| Actor | Administrador |
| Preconditions | Horario existente |
| Postconditions | Actividades redistribuidas |
| Main Flow | 1. Seleccionar brigadas<br>2. Ejecutar redistribución<br>3. Revisar cambios |

---

### UC20: Ver Estadísticas

| Field | Value |
|-------|-------|
| ID | UC-020 |
| Actor | Administrador, Coordinador |
| Preconditions | Horario generado |
| Postconditions | Ninguna (solo lectura) |
| Main Flow | 1. Abrir panel de estadísticas<br>2. Ver cobertura, conflictos<br>3. Analizar utilización |

---

### UC21: Detectar Conflictos

| Field | Value |
|-------|-------|
| ID | UC-021 |
| Actor | Coordinador |
| Preconditions | Horario existente |
| Postconditions | Ninguna (solo lectura) |
| Main Flow | 1. Ejecutar análisis<br>2. Ver lista de conflictos<br>3. Navegar a cada conflicto |

---

### UC22: Ver Distribución

| Field | Value |
|-------|-------|
| ID | UC-022 |
| Actor | Coordinador |
| Preconditions | Horario existente |
| Postconditions | Ninguna (solo lectura) |
| Main Flow | 1. Seleccionar vista de distribución<br>2. Ver gráfico de carga<br>3. Identificar huecos |

---

### UC30: Exportar HTML

| Field | Value |
|-------|-------|
| ID | UC-030 |
| Actor | Administrador |
| Preconditions | Horario generado |
| Postconditions | Archivos HTML en directorio |
| Main Flow | 1. Seleccionar exportar HTML<br>2. Elegir brigadas a exportar<br>3. Definir directorio destino<br>4. Generar archivos<br>5. Abrir en navegador |

---

### UC31: Exportar a Excel

| Field | Value |
|-------|-------|
| ID | UC-031 |
| Actor | Administrador |
| Preconditions | Horario generado |
| Postconditions | Archivo Excel generado |
| Main Flow | 1. Seleccionar exportar Excel<br>2. Elegir contenido<br>3. Generar libro<br>4. Abrir o guardar |

---

### UC32: Duplicar Escenario

| Field | Value |
|-------|-------|
| ID | UC-032 |
| Actor | Administrador |
| Preconditions | Archivo abierto |
| Postconditions | Nuevo escenario idéntico |
| Main Flow | 1. Seleccionar duplicar<br>2. Ingresar nuevo nombre<br>3. Confirmar<br>4. Trabajar con copia |

---

## Sequence Examples

### Generar Horario (UC10)

```mermaid
sequenceDiagram
    participant Admin
    participant frmGenerador
    participant modKernell
    participant modDataGenerator
    participant TAncora
    
    Admin->>frmGenerador: Click "Generar"
    frmGenerador->>TAncora: Generate(brigadas)
    TAncora->>modKernell: PrepareData()
    modKernell-->>TAncora: Data ready
    TAncora->>modDataGenerator: GenerarMPI()
    loop MPI Algorithm
        modDataGenerator->>modDataGenerator: CalculateMPI()
        modDataGenerator->>modDataGenerator: AssignActivity()
        modDataGenerator->>modDataGenerator: UpdateRestrictions()
    end
    modDataGenerator-->>TAncora: Assignments or Impossibles
    TAncora-->>frmGenerador: DisplayResults()
    frmGenerador-->>Admin: Show schedule
```

---

*Document Status: 🔄 In Progress*
*Next: Add error scenarios and alternative flows*
