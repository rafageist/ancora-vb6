# ETAPA 2: Convención y Saneamiento Superficial

> **Objetivo**: Limpiar nomenclatura, comentarios e inconsistencias sin cambiar lógica  
> **Riesgo**: Bajo (cambios de nombres, no de comportamiento)  
> **Prerrequisito**: Etapa 1 completada

---

## Visión General

```
┌─────────────────────────────────────────────────────────────────┐
│ ANTES                          DESPUÉS                        │
├─────────────────────────────────────────────────────────────────┤
│                                                         │
│ mixCaseEspañol()              →  MixCaseEspañol()         │
│ getCantBrg()                  →  GetCantidadBrigadas()     │
│ cantPxAct                     →  lngCantidadProfesorAct     │
│ //TODO fix this               →  // Pendiente: explicar     │
│                                                                 │
│ 1 archivo con 20 funciones   →  Archivo organizado           │
│ Comentarios en español/inglés → Comentarios consistentes │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

---

## 2.1 Convenciones de Nomenclatura

### 2.1.1 Principios

1. **Español único** para nuevos identificadores
2. **Conservar originales** cuando no sea crítico
3. **Prefijos consistentes** por tipo de elemento
4. **Nombres descriptivos** pero no excesivamente largos
5. **Evitar abreviaturas** excepto las universally understood

### 2.1.2 Reglas por Tipo

#### Módulos (Prefijo: `mod`)

```
ACTUAL                              PROPUESTO
─────────────────────────────────────────────────────────────
modDataTypes.bas                →  modDatos_Tipos.bas
modDataConstants.bas            →  modDatos_Constantes.bas
modDataGlobals.bas             →  modDatos_Globales.bas
modKernell.bas                 →  modKernel_PuntoEntrada.bas
modDataGenerator.bas            →  modHorario_Generador.bas
modDataAnalizer.bas            →  modHorario_Analizador.bas
modDataRepair.bas              →  modDatos_Reparador.bas
```

**Regla**: `mod` + `_` + `Contexto` + `_` + `Función`

#### Clases (Prefijo: `cls`)

```
ACTUAL                              PROPUESTO
─────────────────────────────────────────────────────────────
clsAncora.cls                   →  clsGestorDatos
clsInterface.cls                →  clsCoordinadorUI
clsKernel.cls                   →  clsKernel
clsReport.cls                   →  clsReportes
TGOH_HRT.cls                    →  clsHRT_Herencia
TAna_Optimo.cls                 →  clsAnalisis_Optimo
```

**Regla**: `cls` + `Contexto` + `_` + `Nombre`

#### Funciones y Procedimientos

```
ACTUAL                              PROPUESTO
─────────────────────────────────────────────────────────────
getCantBrg()                     →  GetCantidadBrigadas()
IndexById()                      →  BuscarIndicePorId()
deleteProfe()                     →  EliminarProfesor()
insertAsignacionAct()             →  CrearAsignacionActividad()
DameHuecosComunes()              →  ObtenerHuecosComunes()
PosibleInicio()                   →  CalcularPosibleInicio()
```

**Regla**: Verbo + SustantivoClaro

| Tipo | Verbo | Ejemplo |
|------|-------|---------|
| Consulta | Get/Obtener/Consultar | `GetCantidadBrigadas()` |
| Creación | Crear/Agregar/Insertar | `CrearBrigada()` |
| Modificación | Actualizar/Modificar | `ActualizarNivelBrigada()` |
| Eliminación | Eliminar/Remover | `EliminarProfesor()` |
| Verificación | Es/Esta/Tiene | `EstaActivo()` |

#### Variables

```
ACTUAL                              PROPUESTO
─────────────────────────────────────────────────────────────
cantBrg                            →  lngCantidadBrigadas
cantAsignaciones                   →  lngCantidadAsignaciones
cantPxAct                          →  lngCantidadProfesorActividad
idprofe                            →  strIdProfesor
Nivel                              →  intNivel
fija                               →  blnEstaBloqueada
```

**Regla**: `prefijo` + `NombreDescriptivo`

| Tipo | Prefijo | Ejemplo |
|------|---------|---------|
| String | `str` | `strIdBrigada` |
| Entero | `int` | `intNivel` |
| Long | `lng` | `lngCantidad` |
| Boolean | `bln` | `blnEstaActivo` |
| Array | `arr` | `arrBrigadas` |
| Contador | `cnt` | `cntElementos` |

#### Constantes

```
ACTUAL                              PROPUESTO
─────────────────────────────────────────────────────────────
MAX_DIAS                           →  C_MAX_DIAS
MAX_TURNOS                         →  C_MAX_TURNOS
dPERIODO                           →  C_INDICE_PERIODO
```

**Regla**: `C_` + `NOMBRE_MAYUSCULA`

---

## 2.2 Estilo de Comentarios

### 2.2.1 Encabezado de Módulo

```vb
'===============================================================================
' NOMBRE DEL MÓDULO
'===============================================================================
' Resumen: Qué hace este módulo
' Dependencias: modX, clsY
' Notas: Observaciones importantes
' Autor: [Nombre]
' Fecha: YYYY-MM-DD
' Versión: 1.0
'===============================================================================
```

### 2.2.2 Encabezado de Función

```vb
'-------------------------------------------------------------------------------
' Resumen: Comportamiento en una línea
' Parámetros:
'   - strId: Identificador de la brigada
'   - intNivel: Año o grado
' Retorna: Índice en el array o 0 si no existe
' Notas: Esta función es case-insensitive
' Ejemplo: GetIndiceBrigada("b1", 1)
'-------------------------------------------------------------------------------
```

### 2.2.3 Comentarios de Bloque

```vb
'================================================================================
' CARGA DE BRIGADAS
'================================================================================
' Carga cada brigada desde el archivo y actualiza los índices.
' El formato esperado es: ID,Descripcion,Especialidad,Nivel,Flag
'================================================================================

' Primero leemos la cantidad
lngCantidadBrigadas = Val(LeeLinea)

' Luego iteramos sobre cada brigada
For i = 1 To lngCantidadBrigadas
    ...
Next
```

### 2.2.4 Comentarios Inline

```vb
' BIEN: Explica el "por qué"
lngResultado = lngValor / 100  ' Porcentaje sobre 100, no sobre 1

' BIEN: Marca código incompleto
lngResultado = -1  ' TODO: Implementar validación de rango

' MAL: No aporta información
lngResultado = lngValor / 100
```

---

## 2.3 Limpieza de Código

### 2.3.1 Código Muerto

```vb
' IDENTIFICAR: Buscar en el código
' - Funciones nunca llamadas
' - Variables asignadas pero nunca usadas
' - Bloques If con código commented out
' - Select Case con cases vacíos

' EJEMPLO DE CÓDIGO MUERTO:
Public Function CalcularViejo() As Long
    ' Esta función ya no se usa desde la refactorización de 2015
    'Reemplazada por CalcularNuevo()
End Function

' ACCIÓN: Eliminar o marcar claramente como deprecated
```

### 2.3.2 Consolidador de Duplicación

```vb
' ANTES: Código duplicado en múltiples formularios
Private Sub cmdGuardar_Click()
    For i = 1 To ancora.cantBrg
        If kernel.utils.idigual(Brigada(i).comun.id, txtId.Text) Then
            Brigadier(i).Nivel = CLng(txtNivel)
        End If
    Next
End Sub

' DESPUÉS: Función compartida
Public Sub ActualizarNivelBrigada(strId As String, intNivel As Long)
    Dim i As Long
    For i = 1 To ancora.cantBrg
        If kernel.utils.idigual(Brigada(i).comun.id, strId) Then
            Brigadier(i).Nivel = intNivel
            Exit Sub
        End If
    Next
End Sub
```

### 2.3.3 Constantes en Lugar Correcto

```vb
' ANTES: Magic numbers dispersos
If i > 100 Then  ' ¿Por qué 100?
    ...
End If

' DESPUÉS: Constante con nombre
If i > C_MAXIMO_INTENTOS Then
    ...
End If
```

---

## 2.4 Saneamiento de Tipos

### 2.4.1 Type Aliases

```vb
' En modDataTypes.bas, agregar al final:

'===============================================================================
' TYPE ALIASES - Aliases para mejor legibilidad
'===============================================================================

' Contexto de Brigadas
Type TBrigadaCompleta
    datos As TBrigada
    restricciones As TRestriccion
End Type

' Contexto de Asignación
Type TDatosAsignacion
    horario As TActAsignada
    esValida As Boolean
    mensajeError As String
End Type

' Contexto de Análisis
Type TResultadoAnalisis
    cobertura As Double        ' Porcentaje 0-100
    conflictos As Long
    huecos As Long
    calidad As Double         ' Score 0-1
End Type
```

### 2.4.2 Comentarios de Tipo

```vb
' ANTES: Tipo sin documentación
Type TBrigada
    comun As TRecurso
    idesp As String
    Nivel As Long
End Type

' DESPUÉS: Tipo con documentación
' Representa un grupo de estudiantes que asisten juntos a clases
' Una brigada pertenece a una especialidad y tiene un nivel/año
Type TBrigada
    comun As TRecurso           ' Datos comunes (id, descrip, restricciones)
    idesp As String             ' ID de la especialidad a la que pertenece
    Nivel As Long               ' Año o grado (1-6 típicamente)
End Type
```

---

## 2.5 Tareas de Saneamiento

### Fase 2.1: Constantes (Riesgo: Muy Bajo)

- [ ] Renombrar constantes a convención `C_NOMBRE`
- [ ] Mover magic numbers a constantes
- [ ] Documentar propósito de cada constante
- [ ] Verificar que compila

### Fase 2.2: Tipos (Riesgo: Bajo)

- [ ] Agregar comentarios a tipos principales
- [ ] Crear type aliases para contextos comunes
- [ ] Verificar que compila

### Fase 2.3: Funciones Utilitarias (Riesgo: Bajo)

- [ ] Renombrar funciones inconsistentes
- [ ] Agregar comentarios de encabezado
- [ ] Verificar que compila

### Fase 2.4: Variables Globales (Riesgo: Medio)

- [ ] Renombrar contadores a convención
- [ ] Agregar comentarios sobre propósito
- [ ] Verificar que compila

### Fase 2.5: Módulos (Riesgo: Medio)

- [ ] Renombrar archivos de módulo
- [ ] Agregar encabezados descriptivos
- [ ] Verificar que compila

### Fase 2.6: Comentarios (Riesgo: Muy Bajo)

- [ ] Limpiar comentarios obsoletos
- [ ] Agregar comentarios faltantes
- [ ] Traducir comentarios mezclados
- [ ] Marcar código deprecated

---

## 2.6 Criterios de Verificación

### Después de cada submódulo:

```vb
' 1. COMPILAR (debe pasar sin errores)
' 2. ABRIR archivo de ejemplo
' 3. EJECUTAR operación básica (cargar, generar)
' 4. VERIFICAR resultado igual que antes
' 5. SI todo OK → COMMIT
' 6. SI error → REVERTIR
```

### Checklist de Verificación

```
□ Compilación exitosa
□ Archivo de prueba carga correctamente
□ Generación produce resultados esperados
□ Análisis muestra métricas coherentes
□ Sin errores en runtime
□ Output de reportes correcto
```

---

## 2.7 Orden Sugerido de Trabajo

```
SEMANA 1:
  □ Renombrar constantes
  □ Mover magic numbers

SEMANA 2:
  □ Documentar tipos principales
  □ Agregar comentarios a funciones críticas

SEMANA 3:
  □ Renombrar variables globales
  □ Estandarizar nombres de funciones

SEMANA 4:
  □ Limpiar comentarios
  □ Marcar código deprecated
  □ Testing completo
```

---

## 2.8 Peligros a Evitar

| Peligro | Cómo Evitarlo |
|---------|---------------|
| Romper compilación | Commit por cada cambio pequeño |
| Cambiar comportamiento | Verificar antes/después con mismos datos |
| Perder funcionalidad | Mantener backup del .vbp antes de renombrar |
| Inconsistencia | Renombrar TODAS las referencias juntas |

---

## Criterios de Finalización - Etapa 2

- [ ] Constantes renombradas a convención
- [ ] Variables renombradas a convención
- [ ] Funciones renombradas a convención
- [ ] Módulos renombrados a convención
- [ ] Comentarios agregados donde faltaban
- [ ] Código muerto identificado/marcado
- [ ] Sistema compila y funciona igual
- [ ] Documentación actualizada

---

## Siguiente Etapa

**[Etapa 3: Separación de Responsabilidades](./ETAPA-03-separacion.md)**

> Extraer lógica de negocio de UI, crear módulos de dominio.
