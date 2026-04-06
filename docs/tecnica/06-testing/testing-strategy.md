# Testing Strategy

> Quality assurance approach for Áncora VB6 application.

---

## Testing Philosophy

### Principles
1. **No regression**: Changes must not alter observable behavior
2. **Incremental verification**: Test after each small change
3. **Manual testing**: VB6 requires manual testing (no automated UI tests)
4. **Comparison testing**: Compare before/after behavior

### Test Levels

| Level | Scope | Automation | Frequency |
|-------|-------|------------|------------|
| **Unit** | Individual functions | Limited | Per module |
| **Integration** | Component interaction | Limited | Per feature |
| **System** | End-to-end | Manual | Per release |
| **Acceptance** | User workflows | Manual | Per sprint |

---

## Test Scenarios

### T1: File Operations

| Test | Steps | Expected Result | Priority |
|------|-------|-----------------|----------|
| **T1.1** | Create new file | Empty file created, state = ARCHIVO_ABIERTO | Critical |
| **T1.2** | Open existing .anc | Data loaded correctly | Critical |
| **T1.3** | Save with changes | File updated on disk | Critical |
| **T1.4** | Save As to new location | New file created | High |
| **T1.5** | Open corrupted file | Error message shown | Medium |
| **T1.6** | Open missing file | Error message shown | Medium |

### T2: Entity CRUD

| Entity | Create | Read | Update | Delete |
|--------|--------|------|--------|--------|
| Período | T2.1 | T2.2 | T2.3 | T2.4 |
| Especialidad | T2.5 | T2.6 | T2.7 | T2.8 |
| Brigada | T2.9 | T2.10 | T2.11 | T2.12 |
| Asignatura | T2.13 | T2.14 | T2.15 | T2.16 |
| Profesor | T2.17 | T2.18 | T2.19 | T2.20 |
| Lugar | T2.21 | T2.22 | T2.23 | T2.24 |

#### Sample Test: T2.5 - Create Especialidad

```
Steps:
1. Open Áncora
2. Click Especialidades → Nueva
3. Enter ID: "test_esp"
4. Enter Descripción: "Especialidad de Prueba"
5. Click Guardar

Expected:
- Entity appears in list
- Can be selected
- Can be deleted
- No errors in log
```

### T3: Schedule Generation

| Test | Steps | Expected Result | Priority |
|------|-------|-----------------|----------|
| **T3.1** | Generate with empty data | Message: "No hay datos" | High |
| **T3.2** | Generate with minimal data | Schedule created | Critical |
| **T3.3** | Generate with conflicts | Impossibles reported | Critical |
| **T3.4** | Regenerate after manual edit | Previous edits preserved? | High |
| **T3.5** | Generate single brigade | Only that brigade scheduled | Medium |

#### Sample Test: T3.2 - Minimal Generation

```
Setup:
- 1 Period with 5 days × 5 turns
- 1 Specialty
- 1 Brigade (matrícula: 20)
- 1 Subject with 1 activity (teoría, ct=1)
- 1 Classification (teoría, ct=1)
- 1 Professor
- 1 Place (capacidad: 30)
- PxAct: professor → subject
- LxAct: place → subject

Steps:
1. Select period
2. Select brigade
3. Click Generar

Expected:
- Activity assigned to valid slot
- Professor unavailable for that slot
- Place unavailable for that slot
- TActAsignada created
```

### T4: Constraint Verification

| Test | Description | Expected | Priority |
|------|-------------|----------|----------|
| **T4.1** | Professor conflict | Cannot assign professor to 2 activities same slot | Critical |
| **T4.2** | Place conflict | Cannot assign place to 2 activities same slot | Critical |
| **T4.3** | Brigade conflict | Cannot assign brigade to 2 activities same slot | Critical |
| **T4.4** | Capacity check | Cannot assign 30-student brigade to 20-capacity place | Critical |
| **T4.5** | HRT inheritance | Period restriction propagates to entities | High |
| **T4.6** | ZPriori preference | Activity placed in preferred zone | Medium |

#### Sample Test: T4.1 - Professor Conflict

```
Setup:
- Same as T3.2, but:
- 2 subjects with activities
- Professor assigned to both

Steps:
1. Assign first subject manually to slot (1, 1)
2. Try to generate or assign second subject

Expected:
- Second subject cannot use slot (1, 1) for same professor
- Alternative slot found or impossible reported
```

### T5: MPI Algorithm

| Test | Description | Expected | Priority |
|------|-------------|----------|----------|
| **T5.1** | No valid slots | Activity marked impossible | Critical |
| **T5.2** | Single valid slot | Activity placed there | High |
| **T5.3** | Multiple valid slots | Best slot selected by heuristic | High |
| **T5.4** | Multi-slot activity | All consecutive slots reserved | Critical |
| **T5.5** | AND_MPI | Only common slots for all brigades | High |
| **T5.6** | OR_MPI | Any valid slot acceptable | Medium |

### T6: Analysis & Reporting

| Test | Description | Expected | Priority |
|------|-------------|----------|----------|
| **T6.1** | Coverage calculation | % = assigned / total | High |
| **T6.2** | Conflict detection | All overlaps identified | Critical |
| **T6.3** | HTML export | Valid HTML files created | Medium |
| **T6.4** | Excel export | Workbook opens correctly | Medium |

### T7: HRT (Herencia de Restricciones en Tiempo)

| Test | Description | Expected | Priority |
|------|-------------|----------|----------|
| **T7.1** | Period restriction | Affects all child entities | High |
| **T7.2** | Exception rule | Period NOT affect excepted entity | High |
| **T7.3** | HRT cascade | Restrictions propagate correctly | Medium |

---

## Regression Test Suite

Run these tests after ANY code change:

### Core Regression

- [ ] **R1**: Open sample file → verify data loads
- [ ] **R2**: Save → close → reopen → verify data intact
- [ ] **R3**: Generate schedule → verify no crashes
- [ ] **R4**: Basic CRUD operations still work
- [ ] **R5**: No new compilation errors/warnings

### Minimal Smoke Test

```
1. Open application
2. Create new file
3. Add 1 period (5 días × 5 turnos)
4. Add 1 specialty
5. Add 1 brigade
6. Add 1 subject with 1 activity
7. Add 1 classification
8. Add 1 professor
9. Add 1 place
10. Create PxAct relationship
11. Create LxAct relationship
12. Generate schedule
13. Verify 1 assignment created
14. Save file
15. Close application
16. Reopen and verify data
```

---

## Test Data

### Minimal Test File
Create `test_minimal.anc` with:
- 1 period
- 1 specialty
- 1 brigade (20 students)
- 1 subject with 1 activity (teoría, ct=1)
- 1 classification
- 1 professor
- 1 place (30 capacity)
- Basic relationships

### Conflict Test File
Create `test_conflicts.anc` with:
- Overlapping professor assignments
- Overlapping place assignments
- Capacity mismatches

### HRT Test File
Create `test_hrt.anc` with:
- Period restrictions
- HRT rules configured
- Exception cases

---

## Verification Checklist

After any refactoring:

### Functionality
- [ ] Application starts without error
- [ ] File open/save works
- [ ] All CRUD operations work
- [ ] Generation produces assignments
- [ ] Constraints enforced correctly
- [ ] Analysis reports correct values
- [ ] Export produces valid output

### Code Quality
- [ ] No new compilation warnings
- [ ] No runtime errors in immediate window
- [ ] Variable naming consistent
- [ ] Comments accurate (or removed if wrong)

### Data Integrity
- [ ] Existing .anc files still load
- [ ] No data loss on save/reload
- [ ] Hash indices work correctly
- [ ] HRT inheritance correct

---

## Test Environment

### Requirements
- Windows XP or later (tested on actual OS)
- VB6 IDE or compiled .exe
- Sample .anc files

### Test Machine Setup
```
D:\test\
├── ancora.exe
├── test_minimal.anc
├── test_conflicts.anc
├── test_hrt.anc
└── results\
    ├── test_runs.log
    └── screenshots\
```

### Test Execution Log
```text
Date: YYYY-MM-DD
Tester: [Name]
VB6 Version: [Version]
Test Duration: [Minutes]

Test Run 1: [Description]
  Result: PASS/FAIL
  Notes: [Observations]

Test Run 2: [Description]
  Result: PASS/FAIL
  Notes: [Observations]
```

---

## Known Issues to Test

| Issue | Description | Test | Expected After Fix |
|-------|-------------|------|-------------------|
| #001 | File encoding issues | Open files with Spanish chars | Correct display |
| #002 | .frx corruption | Load forms | No visual glitches |
| #003 | Missing OCX | Start without registration | Fail gracefully |

---

## Appendix: VB6 Testing Limitations

### What CAN Be Tested
- Module-level functions (with test harness)
- Data structures
- Algorithm correctness
- File format parsing
- Business logic

### What CANNOT Be Tested Easily
- UI interactions (no automation)
- Event handling
- Form state
- Visual components

### Workarounds
1. **Extract logic to modules**: Test module functions directly
2. **Create test harness**: Simple form to call test functions
3. **Log assertions**: Write results to file
4. **Before/after comparison**: Capture state before change, verify after

---

*Document Status: 🟢 Complete*
*Last Updated: 2026-04-06*
