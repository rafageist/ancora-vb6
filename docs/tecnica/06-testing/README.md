# Testing Documentation Index

> Overview of testing resources for Áncora.

## Documents

| Document | Description | Status |
|----------|-------------|--------|
| [Testing Strategy](./testing-strategy.md) | Overall QA approach | 🟢 Complete |

## Test Categories

### Unit Tests (Planned)
- Module function testing
- Algorithm verification
- Data structure integrity

### Integration Tests (Planned)
- Component interaction
- File format compliance
- HRT propagation

### System Tests (Manual)
- Full workflow testing
- Regression suite
- Acceptance testing

## Quick Test Commands

### Compile Project
```
1. Open Ancora.vbp in VB6 IDE
2. File → Make Ancora.exe
3. Verify no errors
```

### Run Smoke Test
1. Open application
2. Load sample file
3. Generate schedule
4. Export to HTML
5. Verify output

## Test Data Location

```
D:\repos\ancora\ancora-vb6\
├── archivos_ejemplos/
│   ├── minimal.anc
│   ├── ejemplo_basico.anc
│   └── ejemplo_completo.anc
└── docs/tecnica/06-testing/
    └── test_specifications.md
```

---

*Last Updated: 2026-04-06*
