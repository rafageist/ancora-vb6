# Áncora - Automatic Schedule Generation System

> A robust Visual Basic 6 application for generating and managing academic timetables.

## Overview

Áncora is a desktop application designed to automate the creation of educational timetables for universities and schools. It intelligently assigns courses, professors, students, classrooms, and resources to time slots while respecting complex scheduling constraints.

## Features

### Core Functionality
- **Automatic Schedule Generation** - Algorithmic engine attempts to place all activities in valid time slots
- **Multi-entity Management** - Manage specialties, brigades (student groups), subjects, professors, classrooms, and resources
- **Constraint Management** - Complex rules for availability, preferences, and restrictions
- **Conflict Resolution** - Handles overlapping assignments and suggests alternatives

### Entities Managed

| Entity | Spanish | Description |
|--------|---------|-------------|
| Especialidad | Specialty | Academic programs (Engineering, Architecture, etc.) |
| Brigada | Brigade | Student groups/classes |
| Asignatura | Subject | Courses with activity breakdowns |
| Clasificación | Classification | Activity types (theory, lab, practice) |
| Profesor | Professor | Instructors with availability |
| Lugar | Place | Classrooms with capacity |
| Período | Period | Time slots (days × periods) |
| Recurso | Resource | Equipment and facilities |
| HRT | Time Inheritance | Cross-entity constraint inheritance |

### Analysis & Reporting
- **Schedule Analysis** - Detect gaps, conflicts, and resource utilization
- **Statistics Dashboard** - Coverage, conflicts, and efficiency metrics
- **Export Options** - HTML publishing for web distribution
- **Visual Charts** - Graphical representation of schedules

### Tools
- **Duplication** - Copy schedules between scenarios
- **Redistribution** - Redistribute activities across time slots
- **Manual Override** - Fix assignments directly

## Project Structure

```
ancora-vb6/
├── bas/                    # Standard modules
│   ├── modDataTypes.bas           # Data structures & UDTs
│   ├── modDataConstants.bas       # Constants
│   ├── modDataGlobals.bas         # Global variables
│   ├── modKernell.bas            # Core engine
│   ├── modDataGenerator.bas      # Schedule generation algorithm
│   ├── modDataAnalizer.bas       # Analysis routines
│   ├── modDataRepair.bas         # Conflict resolution
│   └── atareas.bas              # TODO/backlog notes
├── cls/                    # Class modules
│   ├── TAncora.cls               # Main controller class
│   ├── TGOH_*.cls                # GOH = Schedule Generator classes
│   ├── TAna_*.cls                # Analysis classes
│   ├── TKernel_*.cls             # Core/utility classes
│   └── lib*.cls                  # Library classes (Excel, Files, Strings, Utils)
├── frm/                    # Form modules (UI)
│   ├── frmKernel*.frm             # Kernel/system forms
│   ├── frmDatos*.frm             # Data entry forms
│   ├── frmReportes*.frm          # Report forms
│   └── frmGenerador*.frm         # Generator forms
├── ctl/                    # User controls
│   └── Ribbon.ctl                  # Ribbon menu control
├── res/                    # Resources
│   └── Themes.res
├── lib/                    # Shared libraries
├── archivos_ejemplos/      # Sample data files (.anc)
├── ayuda/                  # Help documentation
└── Ancora.vbp             # VB6 project file
```

## Data Model

### Key Data Structures

```vb
' Activity assignment
Type TActAsignada
    dia As Long              ' Day
    turno As Long            ' Period/Time slot
    idprofe As String       ' Professor ID
    idasig As String        ' Subject ID
    idact As Long           ' Activity ID
    idlugar As String       ' Classroom ID
    idperiodo As String     ' Period ID
    idbrigada As String     ' Brigade ID
    fija As Boolean         ' Fixed assignment flag
End Type

' Professor assignment to activity
Type TProfeXAct
    para As TAsignaRecurso  ' Subject, period, activity
    idprofes As String       ' Professor ID
    cantGrupos As Long       ' Number of groups
    grupos() As Long         ' Group indices
End Type

' Classroom assignment to activity
Type TLugarXAct
    para As TAsignaRecurso
    cantLug As Long
    idlug() As String        ' Classroom IDs
    priori() As Long         ' Preferences
End Type
```

## File Format (.anc)

Áncora uses a plain-text format for data storage:
- Section-based structure with headers
- Comma-separated values
- Supports import/export of schedules

## Technical Debt & Refactoring Notes

The codebase contains areas for improvement:

1. **Naming** - Mix of Spanish/English identifiers
2. **Code Organization** - Some modules have grown beyond single responsibility
3. **Documentation** - Inline comments are sparse
4. **Error Handling** - Could benefit from centralized error management

See `atareas.bas` for historical TODO items and deferred features.

## Development

### Requirements
- Visual Basic 6.0 Enterprise Edition
- Windows XP or later (tested on Windows XP VM)
- Microsoft Windows Installer for runtime components

### Running
```bash
registrar.bat    ' Register OCX/DLL dependencies
Ancora.exe       ' Launch application
```

### Building
Open `Ancora.vbp` in VB6 IDE and compile.

## History

- **Version 1.2.0** - Current stable release
- **15+ years** of development and refinement
- Originally conceived for the Cuban educational system at any level (primary, secondary, university)
- Evolved into a **universal scheduling engine** that adapts to any educational institution worldwide

### Design Philosophy

Áncora is not bound to specific business rules of any educational system. Instead, it operates on **reality-based logic** — the fundamental constraints that exist regardless of geography:

- Teachers have availability windows
- Classrooms have capacity limits
- Subjects require specific activity types (theory, lab, practice)
- Students belong to groups with shared schedules
- Resources (equipment, labs) have limited availability

This parametric approach makes Áncora **highly customizable** to model any real-world scheduling scenario.

## License

This program is free software: you can redistribute it and/or modify it under the terms of the **GNU General Public License version 3** as published by the Free Software Foundation.

See [LICENSE](LICENSE) for the full license text.

---

*Este proyecto fue originalmente desarrollado en español. La refactorización a identificadores en inglés está planeada.*
