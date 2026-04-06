# Constants Reference

> System-wide constants defined in `modDataConstants.bas`

## Dimension Limits

| Constant | Value | Description |
|----------|-------|-------------|
| `MAX_DIAS` | 7 | Maximum number of days in a week |
| `MAX_TURNOS` | 12 | Maximum periods per day |
| `MAX_ACT` | 5 | Maximum activities per period |

## Array Indices (dCantArreglos = 9)

Used throughout the codebase to index into dimensioned arrays:

| Constant | Value | Entity Type |
|----------|-------|-------------|
| `dPERIODO` | 1 | Period (time slots) |
| `dESPECIALIDAD` | 2 | Specialty |
| `dCLASIF` | 3 | Classification (activity type) |
| `dPROFE` | 4 | Professor |
| `dLUGAR` | 5 | Place (classroom) |
| `dBRIGADA` | 6 | Brigade (student group) |
| `dASIG` | 7 | Asignatura (subject) |
| `dDESGLOSE` | 8 | Breakdown (activity breakdown) |
| `dRECURSO` | 9 | Resource (equipment) |

## Kernel States

| Constant | Value | Description |
|----------|-------|-------------|
| `ARCHIVO_ABIERTO` | 1 | File is open, data loaded |
| `ARCHIVO_CERRADO` | 2 | No file open, no data |

## Usage Example

```vb
' Checking if we can add more periods
If currentDay <= MAX_DIAS And currentTurno <= MAX_TURNOS Then
    ' Safe to add assignment
End If

' Iterating through all entity types
For i = 1 To dCantArreglos
    Select Case i
        Case dPERIODO: ProcessPeriods()
        Case dESPECIALIDAD: ProcessSpecialties()
        Case dCLASIF: ProcessClassifications()
        ' ... etc
    End Select
Next i
```

## Related Files

- `modDataTypes.bas` - Uses these constants in type definitions
- `modDataGlobals.bas` - Global arrays sized by these constants
- `modKernell.bas` - Uses kernel state constants

---

*Last Updated: 2026-04-06*
