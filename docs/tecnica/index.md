# RUP Documentation Index

## Rational Unified Process Structure

This follows the **Rational Unified Process (RUP)** methodology for software development documentation.

---

## 01. Modelado (Modeling)

### 1.1 Modelo de Contexto
- **Purpose**: Identify external actors and system boundaries
- **Artifacts**:
  - [Context Model](./01-contexto/contexto.md) - System context and actors
  - [Use Case Diagram](./01-contexto/use-cases.md) - User interactions ⏳

### 1.2 Modelo de Negocio
- **Purpose**: Business rules and processes
- **Artifacts**:
  - [Business Model](./02-negocio/negocio.md) - Business concepts and rules
  - [Process Flows](./02-negocio/processes.md) - Workflow diagrams ⏳

### 1.3 Modelo Lógico
- **Purpose**: Technical architecture without implementation details
- **Artifacts**:
  - [Logical Model](./03-logico/logico.md) - Class diagrams and packages
  - [Sequence Diagrams](./03-logico/sequences.md) - Interaction patterns ⏳
  - [Algorithm Documentation](./03-logico/algorithms.md) - MPI algorithm ⏳

### 1.4 Modelo Físico
- **Purpose**: Implementation-ready architecture
- **Artifacts**:
  - [Physical Model](./04-fisico/fisico.md) - File structure and deployment
  - [Component Diagram](./04-fisico/components.md) - Component relationships ⏳

---

## 02. Arquitectura (Architecture)

### Views
| View | Description | Status |
|------|-------------|--------|
| [System Architecture](./02-arquitectura/system-architecture.md) | High-level system structure | 🔄 |
| [Component Architecture](./02-arquitectura/component-diagram.md) | Component relationships | 🔄 |
| [Package Structure](./02-arquitectura/package-structure.md) | Module organization | 🔄 |

---

## 03. Especificación (Specifications)

| Module | Description | Status |
|--------|-------------|--------|
| [Data Structures](./03-especificacion/data-structures.md) | UDT definitions | 🔄 |
| [MPI Algorithm](./03-especificacion/mpi-algorithm.md) | Core scheduling algorithm | 🔄 |
| [LLM Survival Guide](./03-especificacion/llm-survival-guide.md) | AI assistant guide for codebase | 🟢 |
| [Design Decisions](./03-especificacion/design-decisions.md) | Architecture rationale | 🔄 |
| [Constants](./03-especificacion/constants.md) | System constants | ⏳ |
| [API Reference](./03-especificacion/api-reference.md) | Public interfaces | ⏳ |

---

## 04. Protocolos (Protocols)

| Protocol | Description | Status |
|----------|-------------|--------|
| [File Format](./04-protocolos/file-format.md) | .anc file specification | 🔄 |
| [Data Exchange](./04-protocolos/data-exchange.md) | Import/export formats | ⏳ |

---

## 05. Glosario (Glossary)

| Document | Description | Status |
|----------|-------------|--------|
| [Terminology](./05-glosario/terminology.md) | Spanish→English reference | 🔄 |
| [Acronyms](./05-glosario/acronyms.md) | Abbreviation list | ⏳ |

---

## RUP Discipline Mapping

| RUP Discipline | Áncora Documentation |
|----------------|---------------------|
| **Business Modeling** | 02-Negocio |
| **Requirements** | 01-Contexto (Use Cases) |
| **Analysis & Design** | 01-Lógico, 02-Arquitectura |
| **Implementation** | 01-Físico (File Structure) |
| **Testing** | Not yet documented ⏳ |
| **Deployment** | 01-Físico (Deployment) |

---

## Iteration Planning

### Iteration 1: Documentation (Current)
- [x] Create folder structure
- [x] Context model
- [x] Business model
- [x] Logical model
- [x] Physical model
- [x] System architecture
- [x] File format spec
- [x] Glossary
- [ ] Use case details
- [ ] Sequence diagrams
- [ ] Algorithm documentation

### Iteration 2: Refactoring Planning
- [ ] Identify rename candidates
- [ ] Create migration map
- [ ] Plan test strategy

### Iteration 3: Code Changes
- [ ] Rename modules (Spanish → English)
- [ ] Refactor class names
- [ ] Update function names
- [ ] Clean up dead code
- [ ] Add documentation comments

---

## Legend

| Symbol | Meaning |
|--------|---------|
| 🔄 | In Progress |
| 🟢 | Complete |
| ⏳ | Planned |
| ❌ | Blocked |

---

*Last Updated: 2026-04-05*
