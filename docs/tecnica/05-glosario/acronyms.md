# Acronyms & Abbreviations

> Common abbreviations used throughout the Áncora codebase.

## System Acronyms

| Acronym | Spanish | English | Context |
|---------|---------|---------|---------|
| **GOH** | Generador de Horarios | Schedule Generator | Class prefix for generator classes |
| **TAncora** | - | - | Main controller class (T = Tipo/Type) |
| **TKernel** | - | - | Kernel controller class |
| **MPI** | Matriz de Posibles Inicios | Possible Starts Matrix | Core scheduling algorithm |
| **HRT** | Herencia de Restricciones en Tiempo | Time Restriction Inheritance | Constraint propagation system |
| **UDT** | Tipo de Dato Definido por Usuario | User-Defined Type | VB6 custom types |
| **OCX** | OLE Control Extension | - | COM controls |

## Entity Acronyms

| Acronym | Spanish | English | Notes |
|---------|---------|---------|-------|
| **Brig** | Brigada | Brigade/Class | Student group |
| **Esp** | Especialidad | Specialty | Academic program |
| **Asig** | Asignatura | Subject/Course | Academic subject |
| **Clasif** | Clasificación | Classification | Activity type |
| **Per** | Período | Period | Time slot |
| **Act** | Actividad | Activity | Activity instance |
| **Lug** | Lugar | Place/Room | Classroom |
| **Profe** | Profesor | Professor | Instructor |
| **Rec** | Recurso | Resource | Equipment |

## Variable Naming Patterns

| Pattern | Meaning | Example |
|---------|---------|---------|
| `cant*` | Count/Cantidad | `cantBrg`, `cantAsig` |
| `id*` | Identifier | `idBrigada`, `idProfe` |
| `idx*` | Index | `idxBrigada`, `idxProfe` |
| `cant*Necesarios` | Required count | `cantProfesNecesarios` |
| `*X*` | Cross-reference | `PxAct`, `LxAct`, `RxAct` |
| `rest` | Restriction/Restriction | `restricciones` |
| `zpriori` | Zone priority | Time preference zones |

## Cross-Reference Suffixes

| Suffix | Meaning | Full Form |
|--------|---------|-----------|
| `PxAct` | Profesor por Actividad | Professor-Activity mapping |
| `LxAct` | Lugar por Actividad | Place-Activity mapping |
| `RxAct` | Recurso por Actividad | Resource-Activity mapping |
| `GxClasif` | Grupo por Clasificación | Group-Classification mapping |

## File Extensions

| Extension | Meaning | Description |
|-----------|---------|-------------|
| `.anc` | Áncora | Project/data file format |
| `.frx` | Form Binary | Binary data for .frm files |
| `.ctx` | Control Binary | Binary data for .ctl files |
| `.vbp` | VB Project | Visual Basic project file |
| `.ocx` | OLE Control | COM control component |

## State Indicators

| Indicator | Meaning |
|-----------|---------|
| `ARCHIVO_ABIERTO` | File is open |
| `ARCHIVO_CERRADO` | File is closed |
| `fija` | Fixed assignment (doesn't move) |
| `virtual` | Virtual resource (not physical room) |
| `continuos` | Requires consecutive time slots |

## API Method Patterns

| Pattern | Meaning | Example |
|---------|---------|---------|
| `getCant*()` | Get count | `getCantBrg()` |
| `delete*()` | Delete entity | `deleteProfe()` |
| `insert*()` | Add entity | `insertLxAct_lug()` |
| `existe*()` | Check existence | `existeAsignatura()` |
| `buscar*()` | Search | `buscarBrigada()` |

## Related Documents

- [Terminology](./terminology.md) - Full Spanish-English glossary
- [LLM Survival Guide](./llm-survival-guide.md) - Codebase navigation

---

*Last Updated: 2026-04-06*
