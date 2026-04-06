# ETAPA 4: Explicitación del Dominio

> **Objetivo**: Documentar completamente el dominio, reglas, invariantes y procesos  
> **Riesgo**: Bajo (solo documentación)  
> **Prerrequisito**: Etapas 1, 2 y 3 completadas

---

## Visión General

```
┌─────────────────────────────────────────────────────────────────┐
│ ANTES                              DESPUÉS                       │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│ Type TBrigada                       ' Tipo sin documentación     │
│   comun As TRecurso                                               │
│   idesp As String                                                 │
│   Nivel As Long                                                   │
│ End Type                                                          │
│                                                                 │
│                                                                 │
│                                                                 │
│                                                                 │
│ ' DESPUÉS:                                                       │
│                                                                 │
│ '==============================================================================='│
│ ' TBrigada - Grupo de estudiantes                                 │
│ '==============================================================================='│
│ ' Definición:                                                      │
│ '   Representa un grupo de estudiantes que asisten juntos a        │
│ '   las mismas clases. Las brigadas son la unidad de              │
│ '   asignación más pequeña para actividades académicas.              │
│ '                                                                            │
│ ' Propiedades:                                                     │
│ '   - id: Identificador único (ej: "b1", "info-1-3")             │
│ '   - idesp: Especialidad a la que pertenece                       │
│ '   - Nivel: Año o grado dentro de la especialidad (1-6)         │
│ '   - matricula: Cantidad de estudiantes en el grupo              │
│ '                                                                            │
│ ' Invariantes:                                                     │
│ '   - id no puede estar vacío                                     │
│ '   - id debe ser único en el sistema                             │
│ '   - Nivel >= 1                                                  │
│ '   - matricula >= 1                                              │
│ '                                                                            │
│ ' Relaciones:                                                      │
│ '   - Pertenece a una Especialidad                               │
│ '   - Puede tener múltiples asignaciones                           │
│ '   - Agrupa estudiantes para actividades                          │
│ '------------------------------------------------------------------------------'│
│ Type TBrigada                                                     │
│     comun As TRecurso           ' Datos comunes                  │
│     idesp As String             ' Especialidad padre             │
│     Nivel As Long               ' Año/grado (1-6)               │
│     cantGxClasif As Long        ' Cantidad de grupos por clasif │
│     GrupoXClasif() As TGxClasif                                │
│     matricula As Long            ' Cantidad de estudiantes       │
│ End Type                                                          │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

---

## 4.1 Modelo de Dominio Documentado

### 4.1.1 Entidades Principales

```
┌─────────────────────────────────────────────────────────────────────────┐
│                        MODELO DE DOMINIO - ÁNCORA                      │
├─────────────────────────────────────────────────────────────────────────┤
│                                                                         │
│   ┌─────────────┐     ┌─────────────┐     ┌─────────────┐             │
│   │ESPECIALIDAD│◄────│  ASIGNATURA │     │  PERÍODO    │             │
│   │            │     │             │     │             │             │
│   │ id         │     │ id          │     │ id (si/sp)  │             │
│   │ descrip    │     │ idesp       │     │ template     │             │
│   │ restricciones     │ Nivel       │     │ restricciones │             │
│   └──────┬──────┘     └──────┬──────┘     └──────┬──────┘             │
│          │                   │                   │                      │
│          │    ┌─────────────┼─────────────┐    │                      │
│          │    │             │             │    │                      │
│          ▼    ▼             ▼             ▼    ▼                      │
│   ┌─────────────────────────────────────────────────────────┐         │
│   │                    BRIGADA                               │         │
│   │                                                         │         │
│   │  Una brigada es un grupo de estudiantes que asisten      │         │
│   │  juntos. Es la unidad mínima de asignación.            │         │
│   └─────────────────────────────────────────────────────────┘         │
│          │                                                          │
│          │ agrupa por clasificación (G×Clasif)                        │
│          ▼                                                          │
│   ┌─────────────────────────────────────────────────────────┐         │
│   │                    CLASIFICACIÓN                          │         │
│   │                                                         │         │
│   │  Define el tipo de actividad:                           │         │
│   │  - teoría (conf)                                        │         │
│   │  - laboratorio (lab)                                     │         │
│   │  - práctica (cp)                                         │         │
│   │                                                         │         │
│   │  Propiedades:                                           │         │
│   │  - ct: slots consecutivos requeridos                     │         │
│   │  - continuos: debe ser mismo día                       │         │
│   │  - zpriori: prioridad de zona horaria                   │         │
│   └─────────────────────────────────────────────────────────┘         │
│          │                                                          │
│          ▼                                                          │
│   ┌─────────────────────────────────────────────────────────┐         │
│   │                    ASIGNACIÓN                             │         │
│   │                                                         │         │
│   │  Representa una actividad programada en el horario:      │         │
│   │  - Qué brigada asiste                                   │         │
│   │  - Qué asignatura/actividad                             │         │
│   │  - Qué profesor la imparte                             │         │
│   │  - En qué lugar                                        │         │
│   │  - En qué día y turno                                 │         │
│   │  - En qué período (semana impar/par)                  │         │
│   └─────────────────────────────────────────────────────────┘         │
│                                                                         │
└─────────────────────────────────────────────────────────────────────────┘
```

---

## 4.2 Documentación de Entidades

### 4.2.1 Entidad: Braga

```vb
'===============================================================================
' TBrigada - Grupo de estudiantes
'===============================================================================
' Definición:
'   Representa un grupo de estudiantes que asisten juntos a las mismas clases.
'   Las brigadas son la unidad de asignación más pequeña para actividades.
'
' Ejemplos de ID:
'   - "b1" (genérico)
'   - "info-1-1" (Ingeniería Informática, año 1, grupo 1)
'   - "civil-3-a" (Civil, año 3, grupo A)
'
' Propiedades:
'   - id: Identificador único dentro del sistema
'   - descrip: Descripción/nombre legible
'   - idesp: ID de la especialidad a la que pertenece
'   - Nivel: Año o grado dentro de la especialidad (1-6 típicamente)
'   - matricula: Cantidad de estudiantes en el grupo
'   - GrupoXClasif: Define cómo se agrupan para cada clasificación
'
' Invariantes:
'   - id no puede estar vacío
'   - id debe ser único en el sistema
'   - Nivel >= 1
'   - matricula >= 1
'   - idesp debe existir en Especialidad[]
'
' Ciclos de vida:
'   1. Creación: Nueva brigada en el sistema
'   2. Asignación: Se le asignan actividades
'   3. Modificación: Cambian sus datos (nivel, matrícula)
'   4. Eliminación: Se da de baja (no común, mantener historial)
'
' Notas:
'   - La matrícula es importante para validar capacidad de lugares
'   - GrupoXClasif permite diferentes agrupaciones según el tipo de actividad
'===============================================================================
Type TBrigada
    comun As TRecurso           ' Datos comunes (id, descrip, restricciones)
    idesp As String            ' Especialidad a la que pertenece
    Nivel As Long             ' Año/grado (1-6)
    cantGxClasif As Long     ' Cantidad de entradas en GrupoXClasif
    GrupoXClasif() As TGxClasif  ' Cómo se agrupa para cada clasificación
    matricula As Long         ' Cantidad de estudiantes
End Type
```

### 4.2.2 Entidad: Asignatura

```vb
'===============================================================================
' TAsig - Materia/Asignatura
'===============================================================================
' Definición:
'   Representa una materia que imparte clases a brigadas.
'   Una asignatura tiene actividades (teoría, laboratorio, práctica) que
'   se desglosan por período.
'
' Ejemplos de ID:
'   - "mat" (Matemáticas)
'   - "bd" (Base de Datos)
'   - "prog1" (Programación 1)
'
' Estructura:
'   - Datos comunes: id, descripción, restricciones
'   - Desglose: Lista de actividades por período
'
' Ciclo de vida:
'   1. Creación: Se define la asignatura
'   2. Configuración: Se definen sus actividades por período
'   3. Asignación: Se le asignan profesores y lugares
'   4. Uso: Participa en la generación de horarios
'
' Notas:
'   - El desglose permite que la misma asignatura tenga diferentes
'     actividades en diferentes períodos (semanas)
'   - Por ejemplo: "Base de Datos" puede tener teoría los lunes
'     y laboratorio los miércoles
'===============================================================================
Type TAsig
    comun As TRecurso           ' Datos comunes
    idesp As String            ' Especialidad padre
    Nivel As Long              ' Año/grado
    desglose() As TDesglose   ' Actividades por período
End Type
```

### 4.2.3 Entidad: Clasificación

```vb
'===============================================================================
' TClasif - Tipo de actividad
'===============================================================================
' Definición:
'   Define el tipo de actividad académica (teoría, laboratorio, práctica).
'   Cada clasificación tiene reglas específicas de asignación.
'
' Tipos típicos:
'   - "conf" (Conferencia): Teoría magistral, un solo slot
'   - "lab" (Laboratorio): Práctica en laboratorio, puede requerir más slots
'   - "cp" (Clase Práctica): Ejercicios, puede requerir múltiples slots
'   - "pe" (Educación Física): Actividades especiales
'
' Propiedades clave:
'   - ct (Consecutive): Cantidad de slots consecutivos requeridos
'   - continuos: Si TRUE, todas las sesiones deben ser el mismo día
'   - zpriori: Matriz de prioridad por zona (día × slot)
'
' ZPriori:
'   Define preferencias de horario para esta clasificación.
'   Valor más alto = más preferido.
'   Ejemplo: Teoría prefiere mañanas, laboratorio prefiere tardes.
'
' Ejemplo de ZPriori para "conf":
'   Lunes:    [10, 10, 10, 5, 5]  (prefiere mañana)
'   Martes:   [10, 10, 10, 5, 5]
'   Miércoles: [10, 10, 10, 5, 5]
'   ...
'
'===============================================================================
Type TClasif
    comun As TRecurso           ' Datos comunes
    ct As Long                 ' Slots consecutivos requeridos
    continuos As Boolean       ' Debe ser mismo día
    zpriori() As TZPriori      ' Prioridad por zona (día × slot)
End Type
```

### 4.2.4 Entidad: Asignación

```vb
'===============================================================================
' TActAsignada - Actividad programada en el horario
'===============================================================================
' Definición:
'   Representa una actividad académica asignada a un día y turno específico.
'   Es el resultado de la generación de horarios.
'
' Composición de una asignación:
'   - QUIÉN: idbrigada (qué brigada asiste)
'   - QUÉ: idasig, idact (qué materia y actividad)
'   - QUIÉN IMPARTE: idprofe (qué profesor)
'   - DÓNDE: idlugar (en qué aula)
'   - CUÁNDO: dia, turno, idperiodo
'   - ESTADO: fija (si está bloqueada por admin)
'
' Estados:
'   - Normal: Creada por el generador, puede ser movida
'   - Fija (fija=True): Bloqueada por el administrador, no se mueve
'
' Validez:
'   Una asignación es válida si:
'   - El profesor no tiene overlap en ese día/turno
'   - El lugar no tiene overlap en ese día/turno
'   - La brigada no tiene overlap en ese día/turno
'   - Se cumplen las reglas de ct y continuos
'
'===============================================================================
Type TActAsignada
    dia As Long               ' Día (1-7)
    turno As Long            ' Slot (1-12)
    idprofe As String       ' ID del profesor
    idasig As String       ' ID de la asignatura
    idact As Long          ' Índice de actividad en el desglose
    idlugar As String      ' ID del lugar/aula
    idperiodo As String   ' ID del período (si/sp)
    idbrigada As String    ' ID de la brigada
    fija As Boolean       ' TRUE = bloqueada por admin
    fecha As String        ' Fecha de creación
    hora As String * 8     ' Hora de creación
    recursos() As String    ' Recursos adicionales asignados
    cantrecursos As Long    ' Cantidad de recursos
End Type
```

---

## 4.3 Reglas de Negocio Documentadas

### 4.3.1 Reglas de Asignación

```
┌─────────────────────────────────────────────────────────────────────────┐
│ REGLAS DE ASIGNACIÓN                                                  │
├─────────────────────────────────────────────────────────────────────────┤
│                                                                         │
│ REGLA R1: No Overlap de Profesor                                      │
│ ─────────────────────────────────────────────────────────────────────  │
│ Un profesor no puede impartir dos actividades en el mismo               │
│ día y turno.                                                          │
│                                                                         │
│   SI existe Asignación(dia=D, turno=T, idprofe=P)                    │
│   ENTONCES no puede existir otra Asignación(dia=D, turno=T,          │
│                                          idprofe=P)                    │
│                                                                         │
├─────────────────────────────────────────────────────────────────────────┤
│                                                                         │
│ REGLA R2: No Overlap de Braga                                        │
│ ─────────────────────────────────────────────────────────────────────  │
│ Una brigada no puede asistir a dos actividades en el mismo            │
│ día y turno.                                                          │
│                                                                         │
│   SI existe Asignación(dia=D, turno=T, idbrigada=B)                  │
│   ENTONCES no puede existir otra Asignación(dia=D, turno=T,          │
│                                          idbrigada=B)                  │
│                                                                         │
├─────────────────────────────────────────────────────────────────────────┤
│                                                                         │
│ REGLA R3: No Overlap de Lugar                                        │
│ ─────────────────────────────────────────────────────────────────────  │
│ Un lugar no puede hosting dos actividades en el mismo día y turno.     │
│                                                                         │
│   SI existe Asignación(dia=D, turno=T, idlugar=L)                    │
│   ENTONCES no puede existir otra Asignación(dia=D, turno=T,          │
│                                          idlugar=L)                   │
│                                                                         │
├─────────────────────────────────────────────────────────────────────────┤
│                                                                         │
│ REGLA R4: Capacidad del Lugar                                        │
│ ─────────────────────────────────────────────────────────────────────  │
│ Un lugar solo puede asignarse a una brigada si su capacidad          │
│ es mayor o igual a la matrícula de la brigada.                        │
│                                                                         │
│   SI lugar.capacidad >= brigada.matricula                             │
│   ENTONCES lugar puede ser asignado                                    │
│                                                                         │
├─────────────────────────────────────────────────────────────────────────┤
│                                                                         │
│ REGLA R5: Slots Consecutivos (ct)                                   │
│ ─────────────────────────────────────────────────────────────────────  │
│ Si una clasificación requiere ct > 1, todas las sesiones              │
│ deben ser en slots consecutivos.                                      │
│                                                                         │
│   SI clasif.ct = N Y N > 1                                          │
│   ENTONCES asignación(turno) debe ser consecutivos                    │
│   PARA i = turno HASTA turno+N-1                                     │
│                                                                         │
├─────────────────────────────────────────────────────────────────────────┤
│                                                                         │
│ REGLA R6: Mismo Día (continuos)                                      │
│ ─────────────────────────────────────────────────────────────────────  │
│ Si continuos = TRUE, todas las sesiones de una clasificación           │
│ deben ser el mismo día.                                               │
│                                                                         │
│   SI clasif.continuos = TRUE                                         │
│   ENTONCES todas las asignaciones para esa clasificación               │
│   DEBEN tener el mismo valor de dia                                   │
│                                                                         │
└─────────────────────────────────────────────────────────────────────────┘
```

### 4.3.2 Reglas de HRT (Herencia de Restricciones)

```
┌─────────────────────────────────────────────────────────────────────────┐
│ SISTEMA HRT - HERENCIA DE RESTRICCIONES DE TIEMPO                    │
├─────────────────────────────────────────────────────────────────────────┤
│                                                                         │
│ CONCEPTO:                                                              │
│ Si un Período tiene restricciones, estas pueden heredarse a           │
│ otras entidades.                                                       │
│                                                                         │
│ EJEMPLO:                                                              │
│ Período "si" (Semana Impar) tiene restricción el día lunes slot 3     │
│                                                                         │
│ Si existe HRT(Periodo=si, Especialidad=info)                          │
│ ENTONCES Especialidad "info" hereda la restricción                     │
│                                                                         │
│ USOS CONOCIDOS:                                                       │
│ - Semanas Impares/Pares                                               │
│ - Días de evento especial                                              │
│ - Vacaciones                                                          │
│                                                                         │
│ ESTRUCTURA DE HRT:                                                     │
│ Type TGOH_HRT                                                         │
│     tipoObjetoA As Long    ' Qué tipo causa (PERIODO=1)              │
│     tipoObjetoB As Long    ' Qué tipo hereda (ESPECIALIDAD=2, etc)  │
│     idObjetoA As String    ' ID del objeto A                         │
│     idObjetoB As String    ' ID del objeto B                         │
│     exceptoEnTiempo As TGOH_arrRestriccion  ' Excepciones              │
│ End Type                                                              │
│                                                                         │
│ ALGORITMO DE HERENCIA:                                                │
│ 1. Para cada Braga, asignatura, profesor, lugar                       │
│ 2. Buscar reglas HRT donde tipoObjetoA = Período                      │
│ 3. Si idObjetoA coincide con período de la asignación                │
│    Y tipoObjetoB coincide con tipo de la entidad                      │
│    Y idObjetoB coincide con ID de la entidad                           │
│ 4. ENTONCES aplicar restricciones heredadas                            │
│                                                                         │
└─────────────────────────────────────────────────────────────────────────┘
```

---

## 4.4 Documentación de Algoritmos

### 4.4.1 Algoritmo MPI (Matriz de Posibles Inicios)

```vb
'===============================================================================
' MPI - MATRIZ DE POSIBLES INICIOS
'===============================================================================
' PROPÓSITO:
'   Calcular todos los slots donde una actividad puede ser asignada,
'   considerando TODAS las restricciones del sistema.
'
' ENTRADA:
'   - Actividad (brigada, asignatura, actividad específica)
'   - Estado actual de asignaciones
'   - Restricciones de todas las entidades
'
' SALIDA:
'   Matriz MPI[día, slot] donde cada celda indica:
'   - ¿Es válido asignar aquí?
'   - ¿Por qué no es válido? (razón del rechazo)
'   - ¿Qué profesores están disponibles?
'   - ¿Qué lugares están disponibles?
'
' ALGORITMO:
'   ┌─────────────────────────────────────────────────────────────┐
'   │ Para cada día = 1 hasta CD (días configurados)           │
'   │   Para cada slot = 1 hasta ct (turnos por día)           │
'   │       │                                                     │
'   │       ├─► ¿El período (si/sp) permite este slot?        │
'   │       │      Check: Periodo.rest[día, slot] = FALSE       │
'   │       │                                                     │
'   │       ├─► ¿La clasificación permite este slot?             │
'   │       │      Check: Clasif.rest[día, slot] = FALSE       │
'   │       │                                                     │
'   │       ├─► ¿La brigada está disponible?                    │
'   │       │      Check: Braga.rest[día, slot] = FALSE        │
'   │       │                                                     │
'   │       ├─► ¿Hay profesores disponibles?                      │
'   │       │      Check: ProfeXAct tiene profesor para esta act  │
'   │       │      Check: Profe.rest[día, slot] = FALSE         │
'   │       │                                                     │
'   │       ├─► ¿Hay lugares disponibles?                        │
'   │       │      Check: LugXAct tiene lugar para esta act       │
'   │       │      Check: Lugar.rest[día, slot] = FALSE          │
'   │       │      Check: Lugar.capacidad >= Braga.matricula     │
'   │       │                                                     │
'   │       ├─► ¿HRT permite esta asignación?                   │
'   │       │      Check: Herencia de restricciones de período  │
'   │       │                                                     │
'   │       ├─► ¿ZPriori favorece este slot?                   │
'   │       │      Score: Clasif.zpriori[día, slot]             │
'   │       │                                                     │
'   │       └─► SI todos los checks pasan:                       │
'   │              MPI[día, slot].valor = TRUE                   │
'   │              MPI[día, slot].prof = [profesores disponibles]│
'   │              MPI[día, slot].lug = [lugares disponibles]    │
'   │                                                          │
'   │          SI algún check falla:                             │
'   │              MPI[día, slot].valor = FALSE                  │
'   │              MPI[día, slot].motivo = [razón]              │
'   └─────────────────────────────────────────────────────────────┘
'
' RESULTADOS POSIBLES:
'   - MPI con al menos un TRUE → Actividad asignable
'   - MPI con todos FALSE → Actividad imposible (Irreprochable)
'
'===============================================================================
```

### 4.4.2 Algoritmo de Generación

```vb
'===============================================================================
' ALGORITMO DE GENERACIÓN DE HORARIOS
'===============================================================================
' PROPÓSITO:
'   Generar automáticamente un horario que respete todas las reglas.
'
' ENTRADA:
'   - Datos cargados (brigadas, asignaturas, profesores, lugares)
'   - Configuración (días, turnos, restricciones)
'
' SALIDA:
'   - Asignaciones[]: Lista de actividades programadas
'   - Imposibles[]: Lista de actividades que no pudieron asignarse
'
' ALGORITMO:
'   ┌─────────────────────────────────────────────────────────────┐
'   │ 1. INICIALIZACIÓN                                          │
'   │    - Limpiar asignaciones anteriores                       │
'   │    - Calcular índices hash                                │
'   │    - Preparar contadores                                  │
'   └─────────────────────────────────────────────────────────────┘
'                           │
'                           ▼
'   ┌─────────────────────────────────────────────────────────────┐
'   │ 2. PARA CADA ESPECIALIDAD                                  │
'   │    Para cada nivel                                        │
'   │        Para cada brigada                                  │
'   │            Para cada asignatura                           │
'   │                Para cada período                           │
'   │                    Para cada actividad del desglose        │
'   │                        │                                   │
'   │                        ├─► Calcular MPI                     │
'   │                        ├─► ¿MPI tiene válidos?             │
'   │                        │                                    │
'   │                        │   SÍ ─► Seleccionar mejor slot     │
'   │                        │            │                       │
'   │                        │            ├─► Por ZPriori         │
'   │                        │            ├─► Por continuidad     │
'   │                        │            ├─► Por distancia       │
'   │                        │            │                        │
'   │                        │            ▼                       │
'   │                        │   Crear asignación                │
'   │                        │            │                       │
'   │                        │            ├─► Reservar profesor   │
'   │                        │            ├─► Reservar lugar      │
'   │                        │            └─► Actualizar estado   │
'   │                        │                                    │
'   │                        │   NO ─► Marcar como imposible     │
'   │                        │            │                        │
'   │                        │            └─► Registrar razón     │
'   └─────────────────────────────────────────────────────────────┘
'                           │
'                           ▼
'   ┌─────────────────────────────────────────────────────────────┐
'   │ 3. RESULTADOS                                             │
'   │    - Reportar asignaciones creadas                         │
'   │    - Reportar actividades imposibles                      │
'   │    - Calcular estadísticas de cobertura                    │
'   └─────────────────────────────────────────────────────────────┘
'
'===============================================================================
```

---

## 4.5 Formato de Archivo Documentado

```vb
'===============================================================================
' FORMATO DE ARCHIVO .ANC
'===============================================================================
' Extensión: .anc (Áncora Schedule File)
' Codificación: ANSI/Windows-1252
' Estructura: Texto plano, secciones separadas por comentarios
'
' SECCIONES:
'   ┌─────────────────────────────────────────────────────────────┐
'   │ HEADER                                                     │
'   │ Comment lines con versión y fecha                         │
'   ├─────────────────────────────────────────────────────────────┤
'   │ DATOS GENERALES                                            │
'   │ - Cantidad de días (CD)                                    │
'   │ - Cantidad de turnos por día (CT)                         │
'   ├─────────────────────────────────────────────────────────────┤
'   │ PERIODOS                                                   │
'   │ - Lista de períodos con restricciones                      │
'   │ - Formato: ID,descrip,caption,template,flag              │
'   ├─────────────────────────────────────────────────────────────┤
'   │ ENTIDADES                                                  │
'   │ - Especialidades                                           │
'   │ - Clasificaciones                                         │
'   │ - Brigadas                                                 │
'   │ - Asignaturas (con desglose)                             │
'   │ - Profesores                                              │
'   │ - Lugares                                                  │
'   ├─────────────────────────────────────────────────────────────┤
'   │ RELACIONES                                                 │
'   │ - Profes×Actividad                                         │
'   │ - Lugar×Actividad                                         │
'   │ - HRT (Herencia de restricciones)                         │
'   ├─────────────────────────────────────────────────────────────┤
'   │ RESULTADOS                                                 │
'   │ - Asignaciones                                             │
'   │ - Actividades rechazadas                                    │
'   └─────────────────────────────────────────────────────────────┘
'
' EJEMPLO DE ENCABEZADO:
'   ; Áncora, generación y organización de horarios Ver 1.2.0
'   ; Archivo de horarios
'   ; Fecha: 4/3/2026
'
' EJEMPLO DE DATOS GENERALES:
'   5               ; Cantidad de días (CD)
'   5               ; Cantidad de turnos por día (CT)
'
' EJEMPLO DE PERÍODO:
'   2               ; Cantidad de periodos
'   si,,,si,       ; Periodo 1: ID=si, template=si
'   0,0,0,0,0,    ; Restricciones para día 1
'   0,0,0,0,0,    ; Restricciones para día 2
'   ...
'
' NOTES:
'   - Líneas que comienzan con ; son comentarios
'   - Secciones marcadas con ;;;; en comentarios
'   - Valores separados por comas
'   - Matrices de restricción como filas de booleanos
'
'===============================================================================
```

---

## 4.6 Tareas de Documentación

### Fase 4.1: Documentar Todas las Entidades
- [ ] TBrigada
- [ ] TAsig
- [ ] TClasif
- [ ] TRecurso (base)
- [ ] TPeriodo
- [ ] TActAsignada
- [ ] TProfeXAct
- [ ] TLugarXAct
- [ ] TGOH_HRT

### Fase 4.2: Documentar Reglas de Negocio
- [ ] Regla R1: No Overlap Profesor
- [ ] Regla R2: No Overlap Braga
- [ ] Regla R3: No Overlap Lugar
- [ ] Regla R4: Capacidad
- [ ] Regla R5: Slots Consecutivos
- [ ] Regla R6: Mismo Día
- [ ] Sistema HRT

### Fase 4.3: Documentar Algoritmos
- [ ] MPI (Matriz de Posibles Inicios)
- [ ] Algoritmo de Generación
- [ ] Algoritmo de Análisis
- [ ] Algoritmo de Reparación

### Fase 4.4: Documentar Formato de Archivo
- [ ] Estructura general
- [ ] Sección de encabezado
- [ ] Sección de períodos
- [ ] Sección de entidades
- [ ] Sección de relaciones
- [ ] Sección de resultados

### Fase 4.5: Crear Documento Maestro
- [ ] Consolidar todo en `docs/tecnica/DOMINIO.md`
- [ ] Agregar diagramas UML
- [ ] Agregar ejemplos

---

## Criterios de Finalización - Etapa 4

- [ ] Todas las entidades documentadas
- [ ] Todas las reglas de negocio documentadas
- [ ] Algoritmos principales documentados
- [ ] Formato de archivo completamente especificado
- [ ] Documento maestro creado
- [ ] Diagramas UML incluidos

---

## Siguiente Etapa

**[Etapa 5: Preparación para Migración](./ETAPA-05-preparacion.md)**

> Identificar núcleo portable, contratos funcionales y puntos de entrada.
