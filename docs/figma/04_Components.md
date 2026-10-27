# 04 — Componentes Reutilizables

## CardLectura

Muestra un valor de telemetría con su estado.

| Prop | Tipo | Ejemplo |
|:---|:---|:---|
| `label` | string | `"pH"` |
| `value` | string | `"7.8"` |
| `status` | `"normal" \| "warning" \| "danger"` | `"normal"` |
| `unit` | string? | `"%"` |

**Auto Layout:** Horizontal, padding 16px, gap 8px, ancho flexible.

---

## SemaforoAgua

Indicador visual grande del estado general del agua.

| Prop | Tipo | Ejemplo |
|:---|:---|:---|
| `estado` | `"optima" \| "observacion" \| "purga" \| "offline"` | `"optima"` |

**Variantes Figma:**
- `estado=optima` → Círculo verde `#2D8B4E`, texto "ÓPTIMA"
- `estado=observacion` → Círculo ámbar `#D4A017`, texto "EN OBSERVACIÓN"
- `estado=purga` → Círculo rojo `#B7312C`, texto "PURGANDO", animación pulso
- `estado=offline` → Círculo gris `#8C8C8C`, texto "SIN CONEXIÓN"

---

## BtnPurga

Botón de acción sobre actuadores del tinaco.

| Prop | Tipo | Ejemplo |
|:---|:---|:---|
| `action` | `"purga" \| "llenado" \| "foto"` | `"purga"` |
| `role` | `"admin" \| "residente"` | `"admin"` |
| `state` | `"default" \| "pressed" \| "disabled"` | `"default"` |

**Regla:** Si `role === "residente"` → forzar `state = "disabled"`, mostrar candado.

**Variantes Figma:** 6 combinaciones (3 actions × 2 states visibles por rol).

---

## ContenedorVisionAI

Contenedor crudo para fotos analizadas por Custom Vision.

| Prop | Tipo | Ejemplo |
|:---|:---|:---|
| `imageUri` | string | URL de Blob Storage |
| `predictions` | array | `[{label: "Pared Limpia", confidence: 0.923}]` |
| `timestamp` | string | `"Hace 45 min"` |

**Estilo:** Fondo `#1A1D23`, borde `1px dashed #3A3F47`, radio `8px`. Labels en `JetBrains Mono 13px`, color `#A0AEC0`. Aspecto de herramienta de diagnóstico.

---

## GaugeNivel

Barra de progreso horizontal que muestra el nivel del tinaco.

| Prop | Tipo | Ejemplo |
|:---|:---|:---|
| `porcentaje` | number | `72` |
| `estimacionDias` | number | `3.2` |

**Color de la barra:** `> 50%` verde, `20–50%` ámbar, `< 20%` rojo.

---

## AlertaCard

Tarjeta para el historial de alertas y eventos.

| Prop | Tipo | Ejemplo |
|:---|:---|:---|
| `tipo` | `"purga" \| "observacion" \| "offline_sync" \| "lectura"` | `"purga"` |
| `mensaje` | string | `"Vaciado automático iniciado. Causa: Algas 67%"` |
| `timestamp` | string | `"14:32"` |

**Fondo sutil:** purga → `#B7312C10`, observación → `#D4A01710`, sync → `#8C8C8C10`, lectura → transparente.
