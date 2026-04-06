# ETAPA 5: Preparación para Migración

> **Objetivo**: Identificar núcleo portable, dependencias, contratos funcionales y estrategia de migración  
> **Riesgo**: Medio (planificación, no implementación)  
> **Prerrequisito**: Etapas 1, 2, 3 y 4 completadas

---

## Visión General

```
┌─────────────────────────────────────────────────────────────────┐
│                    META: MIGRACIÓN EXITOSA                     │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│   VB6                    →              MODERNO                 │
│   ┌─────────────┐                             ┌─────────────┐   │
│   │  Dominio    │ ────────────────────────► │  Dominio    │   │
│   │  (stable)  │    Lógica portable        │  (nuevo)   │   │
│   └─────────────┘                             └─────────────┘   │
│          │                                            │            │
│          │                                            ▼            │
│          │                                    ┌─────────────┐   │
│          │                                    │  Persistencia   │
│          │                                    │  (PostgreSQL)  │
│          │                                    └─────────────┘   │
│          │                                            │            │
│          ▼                                            ▼            │
│   ┌─────────────┐                             ┌─────────────┐   │
│   │    UI      │                             │     UI      │   │
│   │   (VB6)   │ ────────────────────────► │  (Web/API)  │   │
│   └─────────────┘    Reemplazar al final   └─────────────┘   │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

---

## 5.1 Análisis de Dependencias

### 5.1.1 Capas del Sistema

```
┌─────────────────────────────────────────────────────────────────────────┐
│                         CAPAS DE ÁNCORA                               │
├─────────────────────────────────────────────────────────────────────────┤
│                                                                         │
│   ┌─────────────────────────────────────────────────────────────┐       │
│   │                    PRESENTATION (UI)                        │       │
│   │                                                             │       │
│   │   Formularios VB6                                          │       │
│   │   ├─ frmKernel* (kernel principal)                       │       │
│   │   ├─ frmDatos* (CRUD entidades)                        │       │
│   │   ├─ frmReportes* (reportes)                           │       │
│   │   ├─ frmGenerador* (generación)                         │       │
│   │   └─ frm_generic* (dialogs genéricos)                  │       │
│   │                                                             │       │
│   │   Controles                                               │       │
│   │   ├─ Ribbon.ctl (menú)                                  │       │
│   │   ├─ casillero.ctl (celda horario)                     │       │
│   │   └─ XPButton.ctl (botón)                              │       │
│   │                                                             │       │
│   │   ⚠️ DEPENDENCIAS: VB6 Forms, MSForms, OCX              │       │
│   └─────────────────────────────────────────────────────────────┘       │
│                               │                                        │
│                               ▼                                        │
│   ┌─────────────────────────────────────────────────────────────┐       │
│   │                    SERVICE LAYER                            │       │
│   │                                                             │       │
│   │   Lógica de negocio en clases                              │       │
│   │   ├─ clsGestor* (CRUD wrapper)                          │       │
│   │   ├─ clsGeneradorHorarios (generación)                   │       │
│   │   ├─ clsAnalizadorHorarios (análisis)                    │       │
│   │   └─ clsReportes (reportes)                              │       │
│   │                                                             │       │
│   │   ✅ PURO VB6, PORTABLE                                  │       │
│   └─────────────────────────────────────────────────────────────┘       │
│                               │                                        │
│                               ▼                                        │
│   ┌─────────────────────────────────────────────────────────────┐       │
│   │                    DOMAIN LAYER                           │       │
│   │                                                             │       │
│   │   Entidades y reglas de negocio                           │       │
│   │   ├─ Tipos de datos (TBrigada, TAsig, etc.)            │       │
│   │   ├─ Constantes del dominio                              │       │
│   │   ├─ Reglas de validación                               │       │
│   │   └─ Algoritmos (MPI, análisis)                          │       │
│   │                                                             │       │
│   │   ✅ MUY PORTABLE (lógica pura)                        │       │
│   └─────────────────────────────────────────────────────────────┘       │
│                               │                                        │
│                               ▼                                        │
│   ┌─────────────────────────────────────────────────────────────┐       │
│   │                 INFRASTRUCTURE LAYER                       │       │
│   │                                                             │       │
│   │   Persistencia y comunicación                             │       │
│   │   ├─ Carga/guardado de archivos .anc                    │       │
│   │   ├─ Acceso a base de datos (legacy)                     │       │
│   │   └─ Servicios externos                                  │       │
│   │                                                             │       │
│   │   ⚠️ TIENE DEPENDENCIAS                                │       │
│   └─────────────────────────────────────────────────────────────┘       │
│                                                                         │
└─────────────────────────────────────────────────────────────────────────┘
```

### 5.1.2 Dependencias Externas

```
┌─────────────────────────────────────────────────────────────────────────┐
│                    DEPENDENCIAS EXTERNAS                              │
├─────────────────────────────────────────────────────────────────────────┤
│                                                                         │
│   ┌─────────────────┐     ┌─────────────────┐                       │
│   │  VB6 RUNTIME   │     │  OCX CONTROLS   │                       │
│   │                 │     │                 │                       │
│   │ - msvbvm60.dll │     │ - MSCOMCTL.OCX  │                       │
│   │ - stdole2.tlb  │     │ - MSFLXGRD.OCX  │                       │
│   │ - oleaut32.dll │     │ - RICHTX32.OCX  │                       │
│   └─────────────────┘     │ - COMDLG32.OCX  │                       │
│                             │ - actskin4.ocx  │                       │
│                             │ - buttonskin.ocx│                       │
│                             └─────────────────┘                       │
│                                                                         │
│   ┌─────────────────┐     ┌─────────────────┐                       │
│   │  OFFICE INTEROP │     │   DATABASE      │                       │
│   │                 │     │                 │                       │
│   │ - OWC10.dll    │     │ - PostgreSQL    │                       │
│   │ - FM20.DLL     │     │   (legacy)      │                       │
│   └─────────────────┘     └─────────────────┘                       │
│                                                                         │
└─────────────────────────────────────────────────────────────────────────┘
```

---

## 5.2 Núcleo Portable Identificado

### 5.2.1 Componentes Portables

```
┌─────────────────────────────────────────────────────────────────────────┐
│                    NÚCLEO PORTABLE                                    │
├─────────────────────────────────────────────────────────────────────────┤
│                                                                         │
│   DOMINIO (100% portable)                                             │
│   ├── Tipos de datos (UDTs)                                           │
│   │   ├── TBrigada, TAsig, TClasif, TRecurso                        │
│   │   ├── TActAsignada, TActividad                                   │
│   │   ├── TRestriccion, TZPriori                                     │
│   │   └── TGOH_HRT (herencia restricciones)                          │
│   │                                                                   │
│   ├── Constantes                                                      │
│   │   ├── MAX_DIAS, MAX_TURNOS, MAX_ACT                               │
│   │   └── Índices de entidad (dPERIODO, dBRIGADA, etc.)             │
│   │                                                                   │
│   └── Algoritmos                                                      │
│       ├── MPI (Matriz de Posibles Inicios)                           │
│       ├── AND_MPI, OR_MPI (operaciones de matriz)                    │
│       └── Cálculo de restricciones                                    │
│                                                                         │
│   SERVICE (80% portable)                                              │
│   ├── Lógica de generación                                            │
│   │   ├── AsignaActividad()                                           │
│   │   ├── PosibleInicio()                                             │
│   │   └── SelectLugarOptimo()                                         │
│   │                                                                   │
│   ├── Lógica de análisis                                             │
│   │   ├── DameHuecosComunes()                                        │
│   │   ├── PercentRestriccion()                                        │
│   │   └── getAnalisisRecursos()                                       │
│   │                                                                   │
│   └── Validaciones                                                    │
│       └── Todas las reglas de negocio documentadas                     │
│                                                                         │
└─────────────────────────────────────────────────────────────────────────┘
```

### 5.2.2 Componentes NO Portables

```
┌─────────────────────────────────────────────────────────────────────────┐
│                  COMPONENTES NO PORTABLES                              │
├─────────────────────────────────────────────────────────────────────────┤
│                                                                         │
│   UI (0% portable)                                                    │
│   ├── Todos los formularios (frm*)                                    │
│   ├── Controles de usuario (Ribbon.ctl, casillero.ctl)                 │
│   ├── Lógica de presentación en código de formularios                  │
│   └── Interacción con usuario                                          │
│                                                                         │
│   INFRAESTRUCURA (20% portable)                                      │
│   ├── Carga de archivos .anc (parseo) → Portar a JSON/XML           │
│   ├── Acceso a VB6 Forms → Eliminar                                 │
│   └── Acceso a OCX/ActiveX → Reemplazar                             │
│                                                                         │
│   DEPENDENCIAS LEGACY                                                │
│   ├── Conexión PostgreSQL (legacy) → Nueva conexión moderna          │
│   └── Acceso a postgres.dll (N/A en .NET)                            │
│                                                                         │
└─────────────────────────────────────────────────────────────────────────┘
```

---

## 5.3 Contratos Funcionales

### 5.3.1 Contrato: Generación de Horarios

```vb
'===============================================================================
' CONTRATO: IGeneradorHorarios
'===============================================================================
' INTERFAZ PÚBLICA:
'
' Procedure: Generar(rutaArchivo As String) As ResultadoGeneracion
'
' ENTRADA:
'   - rutaArchivo: Ruta al archivo .anc con datos cargados
'
' PROCESO:
'   1. Cargar datos desde archivo
'   2. Para cada brigada × asignatura × período:
'      - Calcular MPI
'      - Seleccionar mejor slot
'      - Crear asignación o marcar imposible
'   3. Retornar resultado
'
' SALIDA:
'   - Estructura ResultadoGeneracion conteniendo:
'     * Asignaciones: Lista de TActAsignada creadas
'     * Imposibles: Lista de actividades no asignadas
'     * Estadisticas: Coverage%, Conflictos, etc.
'     * Errores: Lista de errores si los hay
'
' INVARIANTES:
'   - Todas las asignaciones retornadas son válidas
'   - No hay overlaps en el resultado
'   - Las estadísticas son consistentes con las asignaciones
'
' EFECTOS SECUNDARIOS:
'   - Puede modificar el archivo de datos si se especifica
'   - Genera logs de progreso (opcional)
'
' EXCEPCIONES:
'   - ErrorCargaDatos: No se pudieron cargar los datos
'   - ErrorDatosInvalidos: Los datos tienen inconsistencias
'   - ErrorSistema: Error interno del generador
'
'===============================================================================
```

### 5.3.2 Contrato: Análisis de Horarios

```vb
'===============================================================================
' CONTRATO: IAnalizadorHorarios
'===============================================================================
' INTERFAZ PÚBLICA:
'
' Function: Analizar(asignaciones As Collection) As ResultadoAnalisis
'
' PARÁMETROS:
'   - asignaciones: Colección de asignaciones a analizar
'
' RETORNA:
'   - ResultadoAnalisis conteniendo:
'     * Cobertura: Porcentaje de actividades asignadas
'     * Huecos: Slots sin actividad por entidad
'     * Conflictos: Violaciones de reglas
'     * Utilizacion: Uso de profesores, lugares, etc.
'     * Calidad: Score general 0-100
'
'===============================================================================
```

### 5.3.3 Contrato: Carga de Datos

```vb
'===============================================================================
' CONTRATO: ICargadorDatos
'===============================================================================
' INTERFAZ PÚBLICA:
'
' Function: Cargar(ruta As String) As ModeloDominio
'
' PARÁMETROS:
'   - ruta: Ruta al archivo .anc o conexión a BD
'
' RETORNA:
'   - ModeloDominio: Objeto con todas las entidades cargadas
'
' CONTRATO:
'   - El ModeloDominio retornado debe tener todas las entidades
'   - Brigadas, Asignaturas, Profesores, Lugares, etc.
'   - Todas las relaciones intactas
'   - Sin datos faltantes o inconsistentes
'
'===============================================================================
```

---

## 5.4 Puntos de Entrada

### 5.4.1 Entradas al Dominio

```
┌─────────────────────────────────────────────────────────────────────────┐
│                    PUNTOS DE ENTRADA                                  │
├─────────────────────────────────────────────────────────────────────────┤
│                                                                         │
│   1. CARGA DE DATOS                                                  │
│   ┌─────────────────────────────────────────────────────────────┐   │
│   │ Procedimiento: clsAncora.LeeTXT(ruta)                      │   │
│   │ Punto de entrada: Archivo .anc                              │   │
│   │ Dependencias: modDataTypes, modDataGlobals                │   │
│   │ Salida: Arrays globales llenos                             │   │
│   └─────────────────────────────────────────────────────────────┘   │
│                              │                                         │
│                              ▼                                         │
│   2. GENERACIÓN DE HORARIOS                                         │
│   ┌─────────────────────────────────────────────────────────────┐   │
│   │ Procedimiento: AsignaActividad()                            │   │
│   │ Punto de entrada: Datos cargados en arrays                 │   │
│   │ Dependencias: modDataGenerator, clsAncora                 │   │
│   │ Salida: Asignaciones[], Imposibles[]                     │   │
│   └─────────────────────────────────────────────────────────────┘   │
│                              │                                         │
│                              ▼                                         │
│   3. ANÁLISIS                                                       │
│   ┌─────────────────────────────────────────────────────────────┐   │
│   │ Funciones: modDataAnalizer.*                               │   │
│   │ Punto de entrada: Asignaciones[], datos cargados           │   │
│   │ Dependencias: modDataAnalizer                              │   │
│   │ Salida: Estadísticas, reportes                             │   │
│   └─────────────────────────────────────────────────────────────┘   │
│                                                                         │
└─────────────────────────────────────────────────────────────────────────┘
```

### 5.4.2 Salidas del Dominio

```
┌─────────────────────────────────────────────────────────────────────────┐
│                    SALIDAS DEL DOMINIO                                │
├─────────────────────────────────────────────────────────────────────────┤
│                                                                         │
│   1. GUARDADO DE DATOS                                               │
│   ┌─────────────────────────────────────────────────────────────┐   │
│   │ Procedimiento: clsAncora.GuardaTXT(ruta)                   │   │
│   │ Punto de salida: Archivo .anc actualizado                   │   │
│   │ Dependencias: Serialización de arrays                     │   │
│   │ Entrada: Arrays globales con datos                         │   │
│   └─────────────────────────────────────────────────────────────┘   │
│                                                                         │
│   2. REPORTES                                                       │
│   ┌─────────────────────────────────────────────────────────────┐   │
│   │ Procedimiento: clsReport.CreateHTMLSchedule()               │   │
│   │ Punto de salida: Archivos HTML                             │   │
│   │ Dependencias: clsReport                                   │   │
│   │ Entrada: Asignaciones[], configuración                     │   │
│   └─────────────────────────────────────────────────────────────┘   │
│                                                                         │
│   3. ESTADÍSTICAS                                                   │
│   ┌─────────────────────────────────────────────────────────────┐   │
│   │ Funciones: DameHuecosComunes(), PercentRestriccion()      │   │
│   │ Punto de salida: Colecciones de datos                     │   │
│   │ Dependencias: Ninguna (puro cálculo)                   │   │
│   │ Entrada: Asignaciones[], restricciones                    │   │
│   └─────────────────────────────────────────────────────────────┘   │
│                                                                         │
└─────────────────────────────────────────────────────────────────────────┘
```

---

## 5.5 Estrategia de Migración Propuesta

### 5.5.1 Estrategia: Extracción Gradual

```
┌─────────────────────────────────────────────────────────────────────────┐
│                    ESTRATEGIA DE MIGRACIÓN                             │
├─────────────────────────────────────────────────────────────────────────┤
│                                                                         │
│   FASE A: Aislar Dominio                                              │
│   ┌─────────────────────────────────────────────────────────────┐   │
│   │                                                             │   │
│   │  1. Extraer dominio a DLL COM o .NET Assembly             │   │
│   │  2. Crear interfaz COM para comunicación                 │   │
│   │  3. Mantener UI VB6 existente                           │   │
│   │  4. VB6 llama a dominio migrado                        │   │
│   │                                                             │   │
│   │  RESULTADO: Dominio portable, UI legacy                  │   │
│   └─────────────────────────────────────────────────────────────┘   │
│                              │                                         │
│                              ▼                                         │
│   FASE B: Migrar Persistencia                                         │
│   ┌─────────────────────────────────────────────────────────────┐   │
│   │                                                             │   │
│   │  1. Crear capa de persistencia moderna                    │   │
│   │  2. Migrar formato .anc → PostgreSQL                    │   │
│   │  3. Mantener compatibilidad hacia atrás                   │   │
│   │  4. Dominar puede usar cualquier persistencia            │   │
│   │                                                             │   │
│   │  RESULTADO: Persistencia flexible                        │   │
│   └─────────────────────────────────────────────────────────────┘   │
│                              │                                         │
│                              ▼                                         │
│   FASE C: Migrar UI (Opcional)                                      │
│   ┌─────────────────────────────────────────────────────────────┐   │
│   │                                                             │   │
│   │  1. Desarrollar nueva UI en tecnología moderna           │   │
│   │     (React, Vue, Angular, Blazor, etc.)                 │   │
│   │  2. UI moderna consume dominio via API                  │   │
│   │  3. VB6 puede coexistir temporalmente                   │   │
│   │  4. Descomisionar VB6 cuando nueva UI esté estable    │   │
│   │                                                             │   │
│   │  RESULTADO: Sistema moderno completo                     │   │
│   └─────────────────────────────────────────────────────────────┘   │
│                                                                         │
└─────────────────────────────────────────────────────────────────────────┘
```

### 5.5.2 Tecnologías Recomendadas

```
┌─────────────────────────────────────────────────────────────────────────┐
│                    TECNOLOGÍAS RECOMENDADAS                            │
├─────────────────────────────────────────────────────────────────────────┤
│                                                                         │
│   DOMINIO PORTABLE                                                     │
│   ┌─────────────────────────────────────────────────────────────┐   │
│   │ Opción 1: .NET Standard Class Library (RECOMENDADA)       │   │
│   │   - C# o VB.NET                                         │   │
│   │   - Compatible con .NET Framework y .NET Core            │   │
│   │   - Fácil de integrar con cualquier tecnología           │   │
│   │                                                            │   │
│   │ Opción 2: COM DLL (VB6 compatible)                     │   │
│   │   - VB6 puede llamar directamente                        │   │
│   │   - Más difícil de mantener                             │   │
│   │                                                            │   │
│   │ Opción 3: Python/Rust/Go                                 │   │
│   │   - Para microservicio separado                         │   │
│   │   - Requiere API layer adicional                        │   │
│   └─────────────────────────────────────────────────────────────┘   │
│                                                                         │
│   PERSISTENCIA                                                        │
│   ┌─────────────────────────────────────────────────────────────┐   │
│   │ PostgreSQL (ya se usó en v2.0)                          │   │
│   │   - Robusto y escalable                                 │   │
│   │   - JSONB para datos semi-estructurados                 │   │
│   │   - Experiencia previa del equipo                        │   │
│   │                                                            │   │
│   │ ORM recomendado:                                         │   │
│   │   - Entity Framework Core (C#)                          │   │
│   │   - Dapper (micro-ORM, más control)                    │   │
│   └─────────────────────────────────────────────────────────────┘   │
│                                                                         │
│   API (si se separa dominio)                                          │
│   ┌─────────────────────────────────────────────────────────────┐   │
│   │ REST API con OpenAPI/Swagger                            │   │
│   │   - ASP.NET Core Web API                               │   │
│   │   - Documentación automática                            │   │
│   │   - Fácil de consumir desde cualquier cliente            │   │
│   └─────────────────────────────────────────────────────────────┘   │
│                                                                         │
│   UI MODERNA (futura)                                                 │
│   ┌─────────────────────────────────────────────────────────────┐   │
│   │ Opciones:                                                │   │
│   │   - Blazor (si se usa .NET)                           │   │
│   │   - React/Vue + API REST                              │   │
│   │   - Electron para desktop                              │   │
│   └─────────────────────────────────────────────────────────────┘   │
│                                                                         │
└─────────────────────────────────────────────────────────────────────────┘
```

---

## 5.6 Casos de Regresión

### 5.6.1 Casos de Prueba Funcional

```vb
'===============================================================================
' CASOS DE REGRESIÓN - ÁNCORA
'===============================================================================
' Estos casos deben ejecutarse después de cualquier cambio
' para asegurar que el comportamiento no cambió.
'
' FORMATO: Given-When-Then
'
'-------------------------------------------------------------------------------

' CASO 1: Carga básica de datos
'───────────────────────────────────────────────────────────────────────────────
' Given: Archivo prueba.anc existente con datos válidos
' When: Usuario abre el archivo
' Then: 
'   - Todos los datos se cargan correctamente
'   - Especialidades, brigadas, asignaturas visibles
'   - Sin errores de carga

' CASO 2: Generación simple
'───────────────────────────────────────────────────────────────────────────────
' Given: Archivo de ejemplo elektrika.anc cargado
' When: Usuario ejecuta generación de horarios
' Then:
'   - Generación completa sin errores
'   - Asignaciones creadas para todas las actividades posibles
'   - Actividades imposibles marcadas correctamente

' CASO 3: Restricción de overlap
'───────────────────────────────────────────────────────────────────────────────
' Given: Dos actividades que requieren el mismo profesor
' When: Se intenta asignar ambas al mismo día/turno
' Then:
'   - Solo una actividad se asigna
'   - La otra se marca como imposible por "profesor"

' CASO 4: Capacidad de lugar
'───────────────────────────────────────────────────────────────────────────────
' Given: Braga con matrícula 40 y lugar con capacidad 30
' When: Se intenta asignar la brigada al lugar
' Then:
'   - Asignación NO se crea
'   - Lugar no disponible para esta brigada

' CASO 5: Slots consecutivos
'───────────────────────────────────────────────────────────────────────────────
' Given: Clasificación con ct=2 (2 slots consecutivos)
' When: Se intenta asignar en slot no disponible
' Then:
'   - Solo se asigna si hay 2 slots consecutivos libres
'   - Si no hay 2 consecutivos, se marca imposible

' CASO 6: HRT - Herencia de restricciones
'───────────────────────────────────────────────────────────────────────────────
' Given: HRT rule: Period "si" → Especialidad "info"
' And: Period "si" tiene restricción día 3 slot 2
' When: Se intenta asignar brigada de "info" día 3 slot 2
' Then:
'   - Asignación NO se crea (heredó restricción)

' CASO 7: Archivo IDA → Guardar → Cargar → Ida
'───────────────────────────────────────────────────────────────────────────────
' Given: Horario generado con 50 asignaciones
' When: Usuario guarda, cierra, abre y vuelve a cargar
' Then:
'   - Los 50 asignaciones se recuperan exactamente igual
'   - Sin cambios en horarios

' CASO 8: ZPriori - Preferencia de zona
'───────────────────────────────────────────────────────────────────────────────
' Given: Clasificación "conf" tiene ZPriori alta para mañana
' When: Se genera horario
' Then:
'   - Actividades "conf" se prefieren en mañanas
'   - No es obligatorio, pero es preferido
```

### 5.6.2 Archivos de Prueba

```
┌─────────────────────────────────────────────────────────────────────────┐
│                    ARCHIVOS DE PRUEBA                                   │
├─────────────────────────────────────────────────────────────────────────┤
│                                                                         │
│   PRUEBAS MÍNIMAS (testing rápido)                                     │
│   ├── prueba.anc                # Mínimo, rápido de cargar             │
│   │                                # 1 especialidad, 3 brigadas     │
│   │                                                                │
│   PRUEBAS DE CATEGORÍA                                               │
│   ├── arquitectura/*.anc     # Carreras de arquitectura              │
│   ├── civil/*.anc           # Ingeniería civil                     │
│   ├── electrica/*.anc       # Ingeniería eléctrica                 │
│   ├── industrial/*.anc       # Ingeniería industrial               │
│   ├── informatica/*.anc     # Ingeniería informática              │
│   ├── mecanica/*.anc        # Ingeniería mecánica                 │
│   └── quimica/*.anc         # Ingeniería química                   │
│                                                                         │
│   PRUEBAS DE CASOS ESPECIALES                                         │
│   ├── demo/                   # Casos de prueba específicos         │
│   │   ├── restricciones.anc  # Muchas restricciones              │
│   │   ├── muchas_actividades.anc  # Overflow test               │
│   │   └── imposible.anc     # Caso donde todo falla              │
│                                                                         │
└─────────────────────────────────────────────────────────────────────────┘
```

---

## 5.7 Roadmap de Migración

```
┌─────────────────────────────────────────────────────────────────────────┐
│                    ROADMAP DE MIGRACIÓN                              │
├─────────────────────────────────────────────────────────────────────────┤
│                                                                         │
│   FASE 1: Preparación (Actual)                                       │
│   └── □ Completar Etapas 1-5 de refactorización                     │
│       □ Dominar documentado y estable                                │
│       □ Casos de regresión definidos                                 │
│                                                                         │
│   FASE 2: Extracción de Dominio                                      │
│   └── □ Crear .NET Standard Library                                  │
│       □ Migrar tipos y algoritmos                                    │
│       □ Crear pruebas unitarias                                     │
│       □ Validar contra casos de regresión                             │
│                                                                         │
│   FASE 3: Capa de Persistencia                                       │
│   └── □ Diseñar esquema PostgreSQL                                   │
│       □ Crear ORM o repositorios                                     │
│       □ Migrar datos .anc → PostgreSQL                               │
│       □ Mantener import/export .anc                                  │
│                                                                         │
│   FASE 4: API REST (Opcional)                                        │
│   └── □ Crear ASP.NET Core Web API                                   │
│       □ Documentar con OpenAPI                                       │
│       □ Probar con Postman/curl                                     │
│                                                                         │
│   FASE 5: Nueva UI (Futuro)                                          │
│   └── □ Elegir tecnología                                           │
│       □ Desarrollar UI moderna                                      │
│       □ Integrar con API                                            │
│       □ Beta testing                                                │
│                                                                         │
│   FASE 6: Descomisionar VB6                                         │
│   └── □ Asegurar que nueva UI cumple todo                           │
│       □ Documentar nueva arquitectura                                │
│       □ Archivar código VB6                                         │
│                                                                         │
└─────────────────────────────────────────────────────────────────────────┘
```

---

## 5.8 Criterios de Éxito

### 5.8.1 Criterios para Migración Completa

```
┌─────────────────────────────────────────────────────────────────────────┐
│                    CRITERIOS DE ÉXITO                                │
├─────────────────────────────────────────────────────────────────────────┤
│                                                                         │
│   □ Dominio migrado produce resultados idénticos al original          │
│   □ Todos los casos de regresión pasan                             │
│   □ Performance aceptable (dentro de 2x del original)              │
│   □ Documentación completa y actualizada                            │
│   □ Código fuente en nuevo lenguaje/framework                       │
│   □ Tests automatizados para lógica core                           │
│   □ UI moderna (si aplica) funcional                               │
│   □ Sin deuda técnica mayor que el sistema original               │
│                                                                         │
└─────────────────────────────────────────────────────────────────────────┘
```

---

## Criterios de Finalización - Etapa 5

- [ ] Núcleo portable identificado
- [ ] Dependencias mapeadas
- [ ] Contratos funcionales definidos
- [ ] Puntos de entrada documentados
- [ ] Estrategia de migración propuesta
- [ ] Tecnologías recomendadas
- [ ] Casos de regresión definidos
- [ ] Roadmap creado

---

## Conclusión

Este documento completa las 5 etapas del plan de refactorización y preparación para migración.

**Resumen del plan:**

| Etapa | Objetivo | Estado |
|--------|----------|--------|
| 1. Arqueología | Entender el sistema | ✅ Planificado |
| 2. Convenciones | Limpiar nomenclatura | ✅ Planificado |
| 3. Separación | Extraer lógica de UI | ✅ Planificado |
| 4. Explicitación | Documentar dominio | ✅ Planificado |
| 5. Preparación | Planificar migración | ✅ Este documento |

**Próximo paso**: Ejecutar las etapas en orden, comenzando con Etapa 1 (Arqueología) si no está completa.
