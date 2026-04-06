# ETAPA 3: Separación de Responsabilidades

> **Objetivo**: Extraer lógica de negocio de UI y formularios, crear módulos de dominio  
> **Riesgo**: Medio (reorganización de código)  
> **Prerrequisito**: Etapas 1 y 2 completadas

---

## Visión General

```
┌─────────────────────────────────────────────────────────────────┐
│ ANTES                              DESPUÉS                       │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│ frmDatosBrigada.cmdGuardar_Click()                            │
│   Dim i As Long                                               │
│   For i = 1 To ancora.cantBrg   ' ← Acceso directo a global│
│       If Brigade(i).id = txtId Then                            │
│           Brigade(i).Nivel = txtNivel  ' ← Lógica en UI       │
│       End If                                                   │
│   Next                                                        │
│   ancora.updateHash_brg              ' ← Sincronización manual │
│ End Sub                                                       │
│                                                                 │
│                                                                 │
│ DESPUÉS:                                                      │
│                                                                 │
│ clsGestorBrigadas.Crear()                                     │
│ clsGestorBrigadas.Actualizar()    ' ← Lógica en clase        │
│ clsGestorBrigadas.Eliminar()                                  │
│                                                                 │
│ frmDatosBrigada.cmdGuardar_Click()                           │
│   clsGestorBrigadas.Actualizar txtId, txtNivel  ' ← UI limpia│
│ End Sub                                                       │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

---

## 3.1 Diagnóstico de Acoplamiento

### 3.1.1 Problema: Lógica en Formularios

```vb
'===============================================================================
' ANTES: Lógica de negocio en formulario
'===============================================================================

Private Sub cmdGuardarBrigada_Click()
    ' ┌─────────────────────────────────────────────────────────────┐
    ' │ PROBLEMA: Este código mezcla:                              │
    ' │   1. Validación de entrada (UI)                         │
    ' │   2. Navegación de arrays (Datos)                       │
    ' │   3. Actualización de estado (Negocio)                   │
    ' │   4. Sincronización de índices (Infraestructura)         │
    ' │   5. Feedback al usuario (UI)                            │
    ' └─────────────────────────────────────────────────────────────┘
    
    ' Validación de entrada (¿pertenece a UI?)
    If txtId.Text = "" Then
        MsgBox "ID requerido"
        Exit Sub
    End If
    
    ' Navegación de arrays (¿pertenece a dominio?)
    For i = 1 To ancora.cantBrg
        If kernel.utils.idigual(Brigadier(i).comun.id, txtId.Text) Then
            ' Actualización de estado (¿pertenece a negocio?)
            Brigadier(i).Nivel = CLng(txtNivel)
            Brigadier(i).matricula = CLng(txtMatricula)
            
            ' Sincronización de índices (¿pertenece a infraestructura?)
            ancora.updateHash_brg
            
            ' Feedback (¿pertenece a UI)
            MsgBox "Brigada actualizada"
            Exit Sub
        End If
    Next
    
    ' Si no existe, crear
    ancora.cantBrg = ancora.cantBrg + 1
    ReDim Preserve Brigadier(ancora.cantBrg)
    Brigadier(ancora.cantBrg).comun.id = txtId.Text
    Brigadier(ancora.cantBrg).Nivel = CLng(txtNivel)
    ' ... más código
    
    MsgBox "Brigada creada"
End Sub
```

### 3.1.2 Problema: Acceso Directo a Arrays Globales

```vb
'===============================================================================
' ACCESO DIRECTO A GLOBALES EN MÚLTIPLES LUGARES
'===============================================================================

' En frmDatosBrigada:
Brigadier(i).Nivel = valor

' En frmDatosAsignatura:
Brigadier(idx).comun.id = id

' En modDataGenerator:
If Brigadier(i).Nivel = nivel Then

' En modDataAnalizer:
For i = 1 To ancora.cantBrg
    With Brigadier(i)
        ' ...
    End With
Next

' ┌─────────────────────────────────────────────────────────────┐
' │ PROBLEMA: Si cambia la estructura de Brigadier,           │
' │           hay que actualizar TODOS estos lugares.          │
' │           No hay encapsulamiento.                         │
' └─────────────────────────────────────────────────────────────┘
```

---

## 3.2 Arquitectura Objetivo

```
┌─────────────────────────────────────────────────────────────────────────┐
│                    ARQUITECTURA OBJETIVO                                   │
├─────────────────────────────────────────────────────────────────────────┤
│                                                                         │
│   ┌─────────────────────────────────────────────────────────────┐       │
│   │                    PRESENTATION LAYER                        │       │
│   │                                                              │       │
│   │   frmDatosBrigada    frmDatosAsignatura    frmGenerador   │       │
│   │   ┌────────────┐      ┌────────────┐       ┌──────────┐ │       │
│   │   │  cmdGuardar│      │  cmdGuardar│       │ cmdGenerar│ │       │
│   │   └─────┬──────┘      └─────┬──────┘       └─────┬────┘ │       │
│   │         │                    │                    │        │       │
│   │         └────────────────────┼────────────────────┘        │       │
│   │                              │                              │       │
│   └──────────────────────────────┼──────────────────────────────┘       │
│                                  │                                       │
│                                  ▼                                       │
│   ┌─────────────────────────────────────────────────────────────┐       │
│   │                    SERVICE LAYER                             │       │
│   │                                                              │       │
│   │   ┌────────────────┐  ┌────────────────┐  ┌──────────────┐ │       │
│   │   │clsGestorBrigada│  │clsGestorAsignatura│  │clsGenerador│ │       │
│   │   └────────┬───────┘  └────────┬───────┘  └──────┬─────┘ │       │
│   │            │                    │                   │        │       │
│   └────────────┼────────────────────┼───────────────────┼────────┘       │
│                │                    │                   │                  │
│                ▼                    ▼                   ▼                  │
│   ┌─────────────────────────────────────────────────────────────┐       │
│   │                    DOMAIN LAYER                             │       │
│   │                                                              │       │
│   │   ┌────────────────────────────────────────────────┐      │       │
│   │   │                   clsAncora                         │      │       │
│   │   │  (Controlador de datos - por ahora sigue siendo)    │      │       │
│   │   └────────────────────────────────────────────────┘      │       │
│   │                                                              │       │
│   │   ┌────────────┐  ┌────────────┐  ┌────────────┐       │       │
│   │   │ brigadier() │  │  asig()    │  │ clasif()   │       │       │
│   │   │  (arrays)   │  │  (arrays)  │  │  (arrays)  │       │       │
│   │   └────────────┘  └────────────┘  └────────────┘       │       │
│   │                                                              │       │
│   └─────────────────────────────────────────────────────────────┘       │
│                                                                         │
└─────────────────────────────────────────────────────────────────────────┘
```

---

## 3.3 Plan de Extracción

### Paso 1: Crear Clase Wrapper para Brigadas

```vb
'===============================================================================
' clsGestorBrigadas.cls - Wrapper para acceso a brigadas
'===============================================================================
Option Explicit

'--------------------------------------------------------------------------------
' Resumen: Encapsula el acceso a las brigadas del sistema
' Notas: Esta clase es un paso intermedio hacia la encapsulación total
'       mientras se mantiene la compatibilidad con el código existente
'--------------------------------------------------------------------------------

'--------------------------------------------------------------------------------
' Resumen: Obtiene una brigada por su ID
' Parámetros:
'   - strId: ID de la brigada a buscar
' Retorna: Referencia a la brigada o Nothing si no existe
'--------------------------------------------------------------------------------
Public Function ObtenerPorId(strId As String) As TBrigada
    Dim i As Long
    For i = 1 To ancora.cantBrg
        If kernel.utils.idigual(Brigadier(i).comun.id, strId) Then
            Set ObtenerPorId = Brigadier(i)
            Exit Function
        End If
    Next
    Set ObtenerPorId = Nothing
End Function

'--------------------------------------------------------------------------------
' Resumen: Actualiza los datos de una brigada existente
' Parámetros:
'   - strId: ID de la brigada a actualizar
'   - strDescripcion: Nueva descripción
'   - intNivel: Nuevo nivel
'   - lngMatricula: Nueva matrícula
' Retorna: True si se actualizó, False si no existe
'--------------------------------------------------------------------------------
Public Function Actualizar(strId As String, strDescripcion As String, _
                          intNivel As Long, lngMatricula As Long) As Boolean
    Dim i As Long
    For i = 1 To ancora.cantBrg
        If kernel.utils.idigual(Brigadier(i).comun.id, strId) Then
            Brigadier(i).comun.descrip = strDescripcion
            Brigadier(i).Nivel = intNivel
            Brigadier(i).matricula = lngMatricula
            Actualizar = True
            Exit Function
        End If
    Next
    Actualizar = False
End Function

'--------------------------------------------------------------------------------
' Resumen: Crea una nueva brigada
' Retorna: Índice de la brigada creada o 0 si falló
'--------------------------------------------------------------------------------
Public Function Crear(strId As String, strDescripcion As String, _
                      strIdEsp As String, intNivel As Long, _
                      lngMatricula As Long) As Long
    ' Validar que no exista
    If ObtenerPorId(strId) Is Nothing Then
        ancora.cantBrg = ancora.cantBrg + 1
        ReDim Preserve Brigadier(ancora.cantBrg)
        Brigadier(ancora.cantBrg).comun.id = strId
        Brigadier(ancora.cantBrg).comun.descrip = strDescripcion
        Brigadier(ancora.cantBrg).idesp = strIdEsp
        Brigadier(ancora.cantBrg).Nivel = intNivel
        Brigadier(ancora.cantBrg).matricula = lngMatricula
        Crear = ancora.cantBrg
    Else
        Crear = 0  ' Ya existe
    End If
End Function
```

### Paso 2: Actualizar Formularios para Usar la Clase

```vb
'===============================================================================
' DESPUÉS: Formulario usa la clase wrapper
'===============================================================================

Private Sub cmdGuardarBrigada_Click()
    ' Validación de entrada (UI)
    If txtId.Text = "" Then
        MsgBox "ID requerido", vbExclamation
        Exit Sub
    End If
    
    ' Uso de la clase wrapper (Negocio)
    If clsGestorBrigadas.Actualizar(txtId.Text, txtDescripcion.Text, _
                                    CLng(txtNivel.Text), CLng(txtMatricula.Text)) Then
        MsgBox "Brigada actualizada", vbInformation
    Else
        If clsGestorBrigadas.Crear(txtId.Text, txtDescripcion.Text, _
                                   cboEspecialidad.Text, CLng(txtNivel.Text), _
                                   CLng(txtMatricula.Text)) > 0 Then
            MsgBox "Brigada creada", vbInformation
        Else
            MsgBox "Error al guardar", vbExclamation
        End If
    End If
    
    ' Recargar grilla (UI)
    CargarGrilla
End Sub
```

---

## 3.4 Módulos de Dominio Propuestos

### Estructura Objetivo

```
cls/
├── dominiol
│   ├── clsGestorBrigadas.cls
│   ├── clsGestorAsignaturas.cls
│   ├── clsGestorProfesores.cls
│   ├── clsGestorLugares.cls
│   ├── clsGestorClasificaciones.cls
│   ├── clsGestorEspecialidades.cls
│   ├── clsGestorRecursos.cls
│   └── clsGestorAsignaciones.cls
│
├── generacion/
│   ├── clsGeneradorHorarios.cls
│   ├── clsCalculadorMPI.cls
│   └── clsHeuristico.cls
│
├── analisis/
│   ├── clsAnalizadorHorarios.cls
│   ├── clsCalculadorEstadisticas.cls
│   └── clsDetectorConflictos.cls
│
└── [clases existentes...]
```

### Responsabilidades de Cada Gestor

| Gestor | Responsabilidad | Métodos Principales |
|--------|---------------|-------------------|
| `clsGestorBrigadas` | CRUD brigadas | Crear, Obtener, Actualizar, Eliminar |
| `clsGestorAsignaturas` | CRUD asignaturas | Crear, Obtener, Actualizar, Eliminar |
| `clsGestorProfesores` | CRUD profesores | Crear, Obtener, Actualizar, Eliminar |
| `clsGestorLugares` | CRUD lugares | Crear, Obtener, Actualizar, Eliminar |
| `clsGestorClasificaciones` | CRUD clasificaciones | Crear, Obtener, Actualizar, Eliminar |
| `clsGestorAsignaciones` | Gestionar asignaciones | Crear, Eliminar, ObtenerPorFiltro |

---

## 3.5 Tareas de Separación

### Fase 3.1: Wrapper para Brigadas
- [ ] Crear `clsGestorBrigadas`
- [ ] Implementar CRUD básico
- [ ] Actualizar un formulario para usar la clase
- [ ] Verificar que funciona
- [ ] Commit

### Fase 3.2: Wrapper para Profesores
- [ ] Crear `clsGestorProfesores`
- [ ] Implementar CRUD básico
- [ ] Actualizar formularios relevantes
- [ ] Verificar que funciona
- [ ] Commit

### Fase 3.3: Wrapper para Lugares
- [ ] Crear `clsGestorLugares`
- [ ] Implementar CRUD básico
- [ ] Actualizar formularios relevantes
- [ ] Verificar que funciona
- [ ] Commit

### Fase 3.4: Wrapper para Asignaturas
- [ ] Crear `clsGestorAsignaturas`
- [ ] Implementar CRUD básico
- [ ] Actualizar formularios relevantes
- [ ] Verificar que funciona
- [ ] Commit

### Fase 3.5: Wrapper para Asignaciones
- [ ] Crear `clsGestorAsignaciones`
- [ ] Mover lógica de inserción/eliminación
- [ ] Actualizar generador para usar la clase
- [ ] Verificar generación
- [ ] Commit

### Fase 3.6: Separar Generador
- [ ] Crear `clsGeneradorHorarios`
- [ ] Extraer lógica de `modDataGenerator`
- [ ] Mantener algoritmo MPI intacto
- [ ] Verificar generación identical
- [ ] Commit

---

## 3.6 Criterios de Verificación

```
DESPUÉS de cada fase:

□ Compilación exitosa
□ Archivo de prueba carga correctamente
□ CRUD funciona (crear, leer, actualizar, eliminar)
□ Generación produce resultados esperados
□ Resultado generado = Resultado anterior (bit a bit para mismos datos)
□ Sin regresiones en funcionalidades existentes
```

---

## 3.7 Patrones a Aplicar

### 3.7.1 Patrón: Repository

```vb
' Cada gestor implementa Repository Pattern
Interface IRepositorioBrigadas
    Function ObtenerPorId(id As String) As TBrigada
    Function ObtenerTodos() As Collection
    Function Crear(entidad As TBrigada) As Boolean
    Function Actualizar(entidad As TBrigada) As Boolean
    Function Eliminar(id As String) As Boolean
End Interface
```

### 3.7.2 Patrón: Factory

```vb
' Para crear entidades con validaciones
Public Function CrearBrigadaConValidacion(...) As TBrigada
    ' Validaciones de negocio
    If Not ValidarEspecialidad(idesp) Then
        Err.Raise vbObjectError + 1, "clsGestorBrigadas", "Especialidad inválida"
    End If
    
    ' Crear entidad
    Dim brigada As New TBrigada
    ' ... configurar
    
    Set CrearBrigadaConValidacion = brigada
End Function
```

---

## 3.8 Peligros y Mitigaciones

| Peligro | Probabilidad | Impacto | Mitigación |
|----------|--------------|---------|------------|
| Romper generación | Media | Alto | Comparar output antes/después |
| Perder funcionalidad | Baja | Alto | Commit por cambio, rollback rápido |
| Inconsistencia de estado | Media | Alto | Mantener arrays globales sincronizados |
| Duplicación de lógica | Alta | Medio | Crear clase una vez, usar en todos |

---

## Criterios de Finalización - Etapa 3

- [ ] clsGestorBrigadas creado y usado
- [ ] clsGestorProfesores creado y usado
- [ ] clsGestorLugares creado y usado
- [ ] clsGestorAsignaturas creado y usado
- [ ] clsGestorAsignaciones creado y usado
- [ ] Acceso directo a arrays global eliminado de formularios
- [ ] Generador usa clases wrapper
- [ ] Sistema compila y funciona igual
- [ ] Tests de regresión pasan

---

## Siguiente Etapa

**[Etapa 4: Explicitación del Dominio](./ETAPA-04-explicitacion.md)**

> Documentar entidades, reglas, invariantes y procesos.
