# Plan de Refactorización - Áncora VB6

> **Proyecto**: Áncora - Sistema de Generación y Organización de Horarios  
> **Versión actual**: 1.2.0 (VB6)  
> **Fecha**: 2026-04-06  
> **Estado**: Fase de Planificación

---

## Resumen Ejecutivo

Sistema legacy en VB6 (~15 años de desarrollo) para generación automática de horarios académicos.  
**Objetivo de esta fase**: Análisis completo y plan de refactorización incremental.

### Restricciones fundamentales
- **NO** agregar funcionalidades nuevas
- **NO** cambiar comportamiento observable
- **NO** migrar a otra tecnología
- **Conservar** versión VB6 como referencia funcional
- **Prefere** español para nuevas nomenclaturas

---

## Arquitectura de Fases

```
┌─────────────────────────────────────────────────────────────────┐
│                    META: VB6 MANTENIBLE                        │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│  ┌─────────────┐                                               │
│  │  ETAPA 1    │  Arqueología del Sistema                      │
│  │  (Mapeo)    │  ─────────────────────────────────            │
│  └──────┬──────┘    Inventario, dependencias, flujos          │
│         │                                                    │
│         ▼                                                    │
│  ┌─────────────┐                                               │
│  │  ETAPA 2    │  Convención y Saneamiento                    │
│  │  (Limpieza) │  ─────────────────────────────────            │
│  └──────┬──────┘    Nombres, comentarios, consistencia        │
│         │                                                    │
│         ▼                                                    │
│  ┌─────────────┐                                               │
│  │  ETAPA 3    │  Separación de Responsabilidades              │
│  │  (Estructura│  ─────────────────────────────────            │
│  └──────┬──────┘    Lógica de negocio vs UI                  │
│         │                                                    │
│         ▼                                                    │
│  ┌─────────────┐                                               │
│  │  ETAPA 4    │  Explicitación del Dominio                    │
│  │  (Documentar│  ─────────────────────────────────            │
│  └──────┬──────┘    Reglas, invariantes, formatos             │
│         │                                                    │
│         ▼                                                    │
│  ┌─────────────┐                                               │
│  │  ETAPA 5    │  Preparación para Migración                  │
│  │  (Migración)│  ─────────────────────────────────            │
│  └─────────────┘    Núcleo portable, contratos                 │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

---

## Detalle de Etapas

| Etapa | Objetivo | Duración Estimada | Riesgo |
|-------|----------|------------------|--------|
| 1. Arqueología | Entender | 1-2 sprints | Muy bajo |
| 2. Convenciones | Limpiar | 2-3 sprints | Bajo |
| 3. Separación | Estructurar | 3-4 sprints | Medio |
| 4. Explicitación | Documentar | 2-3 sprints | Bajo |
| 5. Preparación | Planificar | 2-3 sprints | Medio |

---

## Navegación del Plan

- [Etapa 1: Arqueología](./ETAPA-01-arqueologia.md)
- [Etapa 2: Convenciones](./ETAPA-02-convenciones.md)
- [Etapa 3: Separación](./ETAPA-03-separacion.md)
- [Etapa 4: Explicitación](./ETAPA-04-explicitacion.md)
- [Etapa 5: Preparación](./ETAPA-05-preparacion.md)

---

## Reglas de Trabajo

1. **Commit por módulo**: Cada cambio significativo = un commit
2. **Verificación obligatoria**: Compilar + probar después de cada cambio
3. **Documentar antes de cambiar**: Entender antes de modificar
4. **Revertir si hay duda**: Mejor revertir que romper
5. **Preservar historial**: No reescribir git history excepto por seguridad

---

*Última actualización: 2026-04-06*
