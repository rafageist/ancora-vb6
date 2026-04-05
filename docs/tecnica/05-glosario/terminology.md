# Terminology Glossary

## Spanish → English Reference

| Spanish Term | English Term | Definition |
|--------------|--------------|------------|
| **Áncora** | Anchor | System name, metaphor for stability |
| **Generador** | Generator | Schedule generation engine |
| **Horario** | Schedule/Timetable | Time-based activity plan |
| **Actividad** | Activity | A schedulable unit (class, lab, etc.) |
| **Asignación** | Assignment | Activity placed in a time slot |
| **Período** | Period | Time block (day × slot combination) |
| **Turno** | Shift/Period | Time slot within a day |
| **Día** | Day | Calendar day |
| **Especialidad** | Specialty | Academic program/career |
| **Brigada** | Brigade | Student group/class |
| **Asignatura** | Subject | Course/course unit |
| **Clasificación** | Classification | Activity type (theory, lab, practice) |
| **Profesor** | Professor/Teacher | Instructor |
| **Lugar** | Place | Physical space (classroom) |
| **Recurso** | Resource | Equipment/facility |
| **Matriz de Posibles Inicios** | MPI / Possible Starts Matrix | Core algorithm matrix |
| **Herencia de Restricciones de Tiempo** | HRT / Time Constraint Inheritance | Cross-entity constraint propagation |
| **Zona Prioritaria** | Priority Zone | Preferred time zones |
| **Restricción** | Constraint | Availability/requirement rule |
| **Conflictos** | Conflicts | Scheduling overlaps |
| **Huecos** | Gaps/Holes | Empty slots in schedule |
| **Cobertura** | Coverage | Assigned vs total activities |

---

## Algorithm Terminology

| Term | Definition |
|------|------------|
| **MPI (Matriz de Posibles Inicios)** | Matrix showing valid starting positions for activities |
| **PosibleInicio** | Function determining if activity can start at given slot |
| **AND_MPI** | Logical AND of multiple brigades' MPI matrices |
| **OR_MPI** | Logical OR for combining schedules |
| **ZPriori** | Zone priority - preferred time zones for activity types |
| **HRT (Herencia de Restricciones de Tiempo)** | Inheritance of time restrictions between entities |
| **FIJA** | Fixed assignment (locked, cannot be moved) |
| **IMPOSIBLE** | Activity that couldn't be assigned |
| **Parche** | Workaround/hack for specific issues |

---

## Entity Identifiers

| Constant | Value | Entity |
|----------|-------|--------|
| `dPERIODO` | 1 | Period |
| `dESPECIALIDAD` | 2 | Specialty |
| `dCLASIF` | 3 | Classification |
| `dPROFE` | 4 | Professor |
| `dLUGAR` | 5 | Place |
| `dBRIGADA` | 6 | Brigade |
| `dASIG` | 7 | Subject |
| `dDESGLOSE` | 8 | Activity breakdown |
| `dRECURSO` | 9 | Resource |

---

## Variable Naming Patterns

| Pattern | Example | Meaning |
|---------|---------|---------|
| `cant*` | `cantAsignaciones` | Count of items |
| `getCant*` | `getCantBrg` | Getter for count |
| `cantPxAct` | | Count of Professor×Activity |
| `cantLxAct` | | Count of Lugar×Activity |
| `cant*fijas` | `cantfijas` | Count of fixed items |
| `cantImposibles` | | Count of impossible assignments |

---

## Class Prefixes

| Prefix | Purpose | Example |
|--------|---------|---------|
| `T` | Type/Class | `TPeriodo`, `TBrigada` |
| `T*_arr*` | Collection | `TarrPeriodo`, `TGOH_arrRecurso` |
| `TGOH_*` | Schedule Generator | `TGOH_HRT`, `TGOH_Recurso` |
| `TAna_*` | Analysis | `TAna_Optimo`, `TAna_Recursos` |
| `TKernel_*` | Core Infrastructure | `TKernel_Hash`, `TKernel_Opcion` |
| `TAtom_*` | Atomic/Primitive | `TAtom_Variant`, `TAtom_matrixVariant` |
| `cls*` | Controller | `clsAncora`, `clsKernel`, `clsInterface` |
| `lib*` | Library | `libUtils`, `libStrings`, `libFiles` |

---

## State Variables

| Variable | Type | Purpose |
|----------|------|---------|
| `CD` | Long | Days count |
| `ct` | Long | Turns per day |
| `cantEsp` | Long | Specialty count |
| `cantBrg` | Long | Brigade count |
| `cantProfe` | Long | Professor count |
| `cantLug` | Long | Place count |
| `cantAsig` | Long | Subject count |
| `cantAsignaciones` | Long | Assignment count |
| `cantPxAct` | Long | Prof×Act count |
| `cantLxAct` | Long | Lug×Act count |

---

## UI Terminology

| Spanish | English | Component |
|---------|---------|-----------|
| **frmKernel** | Kernel forms | Core dialogs |
| **frmDatos** | Data forms | Entity editors |
| **frmReportes** | Report forms | Output views |
| **frmGenerador** | Generator forms | Generation wizard |
| **frmHerramientas** | Tool forms | Utility dialogs |
| **frm_generic** | Generic forms | Reusable dialogs |

---

## Abbreviations

| Abbreviation | Full Term |
|--------------|----------|
| MPI | Matriz de Posibles Inicios |
| HRT | Herencia de Restricciones de Tiempo |
| ZPriori | Zona Prioritaria |
| pxact | Profes×Actividad |
| lxact | Lugar×Actividad |
| rxact | Recurso×Actividad |
| gxclasif | Grupo×Clasificación |
| cant | Cantidad (Quantity) |
| clasif | Clasificación |
| esp | Especialidad |
| brg | Brigada |
| lug | Lugar |
| asig | Asignatura |
| pro/des | Profesor |
| per | Período |

---

## Mathematical Notation

| Symbol | Meaning |
|--------|---------|
| MAX_DIAS | Maximum days (7) |
| MAX_TURNOS | Maximum periods per day (12) |
| MAX_ACT | Maximum activities per period (5) |
| `rest(d, t)` | Restriction at day d, turn t |
| `ct` | Consecutive turns required |
| `zpriori(d, t)` | Zone priority score |
| `matricula` | Brigade student count |

---

*Document Status: 🔄 In Progress*
