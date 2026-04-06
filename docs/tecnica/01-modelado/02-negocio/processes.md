# Process Flows (Flujos de Procesos)

> Detailed business process workflows for Áncora scheduling system.

---

## P1: Crear Archivo Nuevo

```
┌─────────────────────────────────────────────────────────────────────┐
│ PROCESO: Crear Archivo de Horarios                                  │
├─────────────────────────────────────────────────────────────────────┤
│ OBJETIVO: Inicializar un nuevo archivo .anc con estructura vacía   │
│ ACTOR: Administrador                                                │
│ PRECONDICIÓN: Ninguna                                               │
│ POSTCONDICIÓN: Archivo .anc creado con encabezado válido             │
└─────────────────────────────────────────────────────────────────────┘
```

### Diagrama de Flujo

```mermaid
flowchart TD
    A([Inicio]) --> B[Menú: Archivo → Nuevo]
    B --> C{¿Hay cambios sin guardar?}
    C -->|Sí| D[Mostrar diálogo guardar]
    D --> E{Usuario elige?}
    E -->|Guardar| F[Proceso: Guardar]
    E -->|Descartar| G[Continuar]
    E -->|Cancelar| Z([Cancelar])
    C -->|No| G
    
    G --> H[Crear instancia TAncora]
    H --> I[Inicializar colecciones vacías]
    I --> J[Establecer estado: ARCHIVO_CERRADO]
    J --> K[Limpiar variables globales]
    K --> L[Mostrar interfaz vacía]
    L --> M[Establecer estado: ARCHIVO_ABIERTO]
    M --> N([Fin: Listo para editar])
    
    F --> H
```

### Detalle de Pasos

| Paso | Acción | Responsable | Sistema |
|------|--------|-------------|---------|
| 1 | Seleccionar menú Archivo → Nuevo | Usuario | - |
| 2 | Verificar estado actual | - | kernel |
| 3 | Confirmar si hay cambios pendientes | - | UI |
| 4 | Inicializar nuevo archivo | - | TAncora |
| 5 | Mostrar interfaz vacía | - | Forms |
| 6 | Listo para edición | - | - |

---

## P2: Cargar Datos desde Archivo

```
┌─────────────────────────────────────────────────────────────────────┐
│ PROCESO: Cargar Archivo .anc                                        │
├─────────────────────────────────────────────────────────────────────┤
│ OBJETIVO: Leer y validar un archivo .anc existente                  │
│ ACTOR: Administrador                                                │
│ PRECONDICIÓN: Archivo existe en disco                               │
│ POSTCONDICIÓN: Datos cargados en memoria, UI actualizada           │
└─────────────────────────────────────────────────────────────────────┘
```

### Diagrama de Flujo

```mermaid
flowchart TD
    A([Inicio]) --> B[Archivo → Abrir]
    B --> C[Mostrar selector de archivos]
    C --> D[Usuario selecciona .anc]
    D --> E{Archivo existe?}
    E -->|No| Z([Error: Archivo no encontrado])
    E -->|Sí| F[Abrir archivo]
    
    F --> G[Leer encabezado]
    G --> H{Formato válido?}
    H -->|No| Y([Error: Formato inválido])
    H -->|Sí| I[Parsear secciones]
    
    I --> J[Validar referencias cruzadas]
    J --> K{Referencias válidas?}
    K -->|No| X([Error: Datos inconsistentes])
    K -->|Sí| L[Crear entidades en memoria]
    
    L --> M[Construir índices hash]
    M --> N[Cargar asignaciones existentes]
    N --> O[Verificar restricciones HRT]
    O --> P[Actualizar UI]
    P --> Q([Fin: Archivo cargado])
```

### Validaciones

| Validación | Descripción |
|------------|-------------|
| `V001` | Encabezado presente con `app_name=Áncora` |
| `V002` | Versión compatible (1.0.0 - 1.2.0) |
| `V003` | Secciones requeridas presentes |
| `V004` | Campos obligatorios no vacíos |
| `V005` | IDs únicos dentro de cada entidad |
| `V006` | Referencias foráneas válidas |
| `V007` | Matrices de restricción consistentes |

---

## P3: Crear Entidad (Especialidad/Brigada/Asignatura/etc.)

```
┌─────────────────────────────────────────────────────────────────────┐
│ PROCESO: Crear Nueva Entidad                                        │
├─────────────────────────────────────────────────────────────────────┤
│ OBJETIVO: Agregar nueva entidad al sistema                          │
│ ACTOR: Administrador                                                │
│ VARIANTES: Especialidad, Brigada, Asignatura, Profesor, Lugar,      │
│            Recurso, Clasificación, Período                           │
└─────────────────────────────────────────────────────────────────────┘
```

### Flujo Genérico

```mermaid
flowchart LR
    subgraph "1. Interfaz"
        A[Formulario de entrada] --> B{¿Datos válidos?}
        B -->|No| C[Mostrar errores]
        C --> A
        B -->|Sí| D[Confirmar]
    end
    
    subgraph "2. Negocio"
        D --> E[Validar reglas de negocio]
        E --> F{¿Reglas cumplidas?}
        F -->|No| G[Rechazar con mensaje]
        G --> C
        F -->|Sí| H[¿ID único?]
        H -->|No| I[Error: ID duplicado]
        I --> A
        H -->|Sí| J[Crear entidad]
    end
    
    subgraph "3. Persistencia"
        J --> K[Agregar a colección]
        K --> L[Actualizar índices]
        L --> M[Marcar archivo como modificado]
        M --> N[Actualizar UI]
    end
```

### Reglas por Entidad

#### Especialidad
- ID no puede repetirse
- Descripción obligatoria
- Puede tener brigadas y asignaturas asociadas

#### Brigada
- Debe pertenecer a una especialidad existente
- Nivel debe ser numérico (> 0)
- Matrícula debe ser >= cantidad de grupos

#### Asignatura
- Debe pertenecer a una especialidad
- Debe tener al menos un desglose
- Desglose debe tener actividades con clasificación válida

---

## P4: Generar Horario (MPI)

```
┌─────────────────────────────────────────────────────────────────────┐
│ PROCESO: Generar Horario Automático                                 │
├─────────────────────────────────────────────────────────────────────┤
│ OBJETIVO: Crear asignaciones para todas las actividades posibles    │
│ ACTOR: Administrador                                                │
│ PRECONDICIÓN: Datos cargados, entidades definidas                   │
│ POSTCONDICIÓN: Horario generado o lista de imposibles               │
└─────────────────────────────────────────────────────────────────────┘
```

### Algoritmo Principal

```mermaid
flowchart TD
    A([Inicio]) --> B[Seleccionar período destino]
    B --> C[Seleccionar brigadas]
    C --> D[Inicializar MPI]
    
    D --> E{Para cada actividad}
    E -->|Sí| F1[Obtener requisitos]
    E -->|No| Z1([Fin])
    
    F1 --> F2[Calcular MPI para actividad]
    F2 --> F3{MPI tiene slots válidos?}
    
    F3 -->|No| F4[Marcar como IMPOSIBLE]
    F4 --> F5[Registrar razón]
    F5 --> E
    
    F3 -->|Sí| F6[Seleccionar slot óptimo]
    F6 --> F7[Seleccionar profesor]
    F7 --> F8[Seleccionar lugar]
    F8 --> F9[¿Recursos disponibles?]
    
    F9 -->|No| F10[Buscar alternativos]
    F10 --> F11{¿Encontrados?}
    F11 -->|No| F4
    F11 -->|Sí| F12[Usar alternativo]
    F12 --> F13
    F9 -->|Sí| F13[Crear asignación]
    
    F13 --> F14[Actualizar restricciones]
    F14 --> F15[¿Actividad de ct > 1?]
    F15 -->|Sí| F16[Reservar slots consecutivos]
    F15 -->|No| E
    F16 --> E
```

### Funciones Clave

| Función | Descripción | Retorna |
|---------|-------------|---------|
| `PosibleInicio()` | Verifica si slot es válido | `TMPI_Casilla` |
| `AND_MPI()` | Combina MPI para múltiples brigadas | `TMPI1` |
| `OR_MPI()` | Combina MPI con alternativas | `TMPI1` |
| `FiltraProfexAct()` | Filtra profesores válidos | `TFiltro` |
| `FiltraLugxAct()` | Filtra lugares válidos | `TFiltro` |
| `AsignaActividad()` | Crea asignación real | `Boolean` |

---

## P5: Análisis de Horario

```
┌─────────────────────────────────────────────────────────────────────┐
│ PROCESO: Analizar Horario Generado                                  │
├─────────────────────────────────────────────────────────────────────┤
│ OBJETIVO: Calcular métricas y detectar problemas                     │
│ ACTOR: Administrador/Coordinador                                     │
│ PRECONDICIÓN: Horario generado                                      │
│ POSTCONDICIÓN: Reporte con estadísticas                             │
└─────────────────────────────────────────────────────────────────────┘
```

### Métricas Calculadas

```mermaid
graph LR
    subgraph "Métricas"
        A[Cobertura] --> |Asignadas/Totales| R[Porcentaje]
        B[Conflictos] --> |Superposiciones| R
        C[Utilización] --> |Slots usados/Total| R
        D[Huecos] --> |Espacios vacíos| R
    end
```

| Métrica | Fórmula | Valor Ideal |
|---------|---------|-------------|
| **Cobertura** | `asignadas / total` | 100% |
| **Conflictos** | `superposiciones` | 0 |
| **Utilización Lugares** | `slots_usados / capacidad_total` | 70-85% |
| **Huecos por Brigada** | `slots_vacíos` | Mínimo |
| **Huecos por Profesor** | `slots_vacíos` | Mínimo |

---

## P6: Exportar a HTML

```
┌─────────────────────────────────────────────────────────────────────┐
│ PROCESO: Exportar Horario a HTML                                    │
├─────────────────────────────────────────────────────────────────────┤
│ OBJETIVO: Generar páginas web estáticas del horario                  │
│ ACTOR: Administrador                                                │
│ PRECONDICIÓN: Horario generado                                      │
│ POSTCONDICIÓN: Archivos HTML en directorio                          │
└─────────────────────────────────────────────────────────────────────┘
```

### Diagrama de Flujo

```mermaid
flowchart TD
    A([Inicio]) --> B[Seleccionar Exportar HTML]
    B --> C[Seleccionar brigadas a exportar]
    C --> D[Seleccionar directorio destino]
    D --> E[Crear directorio si no existe]
    E --> F[Generar index.html]
    
    F --> G{Para cada brigada}
    G -->|Sí| H[Crear archivo brigade.html]
    H --> I[Insertar cabecera]
    I --> J[Insertar días y turnos]
    J --> K[Para cada slot ocupado]
    K -->|Sí| L[Mostrar asignatura + profesor]
    K -->|No| M[Mostrar celda vacía]
    L --> J
    M --> J
    
    G -->|No| N[¿Exportar profesores?]
    N -->|Sí| O[Generar profes.html]
    N -->|No| P[¿Exportar lugares?]
    P -->|Sí| Q[Generar lugares.html]
    P -->|No| R[Abrir navegador]
    
    O --> R
    Q --> R
    R --> S([Fin])
```

---

## P7: Mantenimiento de HRT

```
┌─────────────────────────────────────────────────────────────────────┐
│ PROCESO: Gestión de Herencia de Restricciones en Tiempo            │
├─────────────────────────────────────────────────────────────────────┤
│ OBJETIVO: Configurar propagación de restricciones entre entidades   │
│ ACTOR: Administrador                                                │
│ DESCRIPCIÓN: Las restricciones de Período se heredan a entidades    │
└─────────────────────────────────────────────────────────────────────┘
```

### Flujo de Herencia

```mermaid
flowchart LR
    A[Período] -->|restricciones| B{HRT activo?}
    B -->|Sí| C[Especialidad]
    B -->|Sí| D[Brigada]
    B -->|Sí| E[Profesor]
    B -->|Sí| F[Lugar]
    B -->|Sí| G[Asignatura]
    
    C -->|hereda| H[Asignaciones]
    D -->|hereda| H
    E -->|hereda| H
    F -->|hereda| H
    G -->|hereda| H
```

### Casos de Uso HRT

| Caso | Descripción |
|------|-------------|
| **Excepción** | Período no aplica a cierta entidad |
| **Bloqueo** | Entidad no disponible en ciertos slots |
| **Preferencia** | Entidad prefiere ciertos horarios |

---

## P8: Reparación de Conflictos

```
┌─────────────────────────────────────────────────────────────────────┐
│ PROCESO: Reparar Conflictos Detectados                              │
├─────────────────────────────────────────────────────────────────────┤
│ OBJETIVO: Resolver superposiciones y violaciones de reglas         │
│ ACTOR: Administrador                                                │
│ PRECONDICIÓN: Análisis completado con conflictos                   │
│ POSTCONDICIÓN: Conflictos resueltos o documentados                 │
└─────────────────────────────────────────────────────────────────────┘
```

### Tipos de Conflictos

| Código | Tipo | Descripción | Solución Manual |
|--------|------|-------------|-----------------|
| `C001` | Superposición Profesor | Profesor en dos lugares | Mover una |
| `C002` | Superposición Lugar | Dos actividades mismo lugar | Mover una |
| `C003` | Superposición Brigada | Brigada en dos lugares | Mover una |
| `C004` | Capacidad Excedida | Lugar muy pequeño | Cambiar lugar |
| `C005` | Restricción Violada | Actividad en slot bloqueado | Mover o desbloquear |

---

## Glosario de Procesos

| Símbolo | Significado |
|---------|-------------|
| `→` | Flujo normal |
| `→|` | Decisión (Sí) |
| `→|` | Decisión (No) |
| `([ ])` | Inicio/Fin |
| `{ }` | Decisión |
| `---` | Conector |

---

*Document Status: 🟢 Complete*
*Last Updated: 2026-04-06*
