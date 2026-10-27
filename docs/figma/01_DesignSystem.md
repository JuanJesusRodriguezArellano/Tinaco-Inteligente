# 01 — Design System: Tinaco Inteligente

## Paleta de Estados (Semáforo del Hardware)

| Estado | Color | Hex | Uso |
|:---|:---|:---:|:---|
| 🟢 Agua Óptima | Verde orgánico | `#2D8B4E` | pH 6.5–8.5, Pared Limpia > 80% |
| 🟡 Observación | Ámbar cálido | `#D4A017` | Riesgo químico leve, alerta Custom Vision |
| 🔴 Purga / Contaminación | Rojo profundo | `#B7312C` | Contaminación biológica, pH fuera de rango |
| ⚪ Offline / Sincronizando | Gris neutro | `#8C8C8C` | Sin conexión, sincronizando SQLite |
| 🔵 Informativo | Azul agua | `#2B6CB0` | Datos de telemetría, estados neutros |

### Fondos y Superficies

| Token | Light | Dark |
|:---|:---:|:---:|
| `bg-primary` | `#FAFBFC` | `#121418` |
| `bg-card` | `#FFFFFF` | `#1C1F26` |
| `bg-elevated` | `#F0F2F5` | `#252830` |
| `border-subtle` | `#E2E6EA` | `#2E3138` |

## Tipografía

| Nivel | Font | Tamaño | Peso | Uso |
|:---|:---|:---:|:---:|:---|
| H1 | Inter | 28px | Bold | Título de pantalla |
| H2 | Inter | 22px | SemiBold | Secciones |
| H3 | Inter | 18px | SemiBold | Subtítulos |
| Body | Inter | 16px | Regular | Texto general |
| Caption | Inter | 13px | Regular | Timestamps, metadata |
| Metric | JetBrains Mono | 32px | Bold | Valores de pH, porcentajes |

## Espaciado (Escala de 4px)

| Token | Valor | Uso |
|:---|:---:|:---|
| `space-xs` | 4px | Separación mínima entre elementos inline |
| `space-sm` | 8px | Padding interno de badges y chips |
| `space-md` | 16px | Gutter lateral de pantalla (obligatorio) |
| `space-lg` | 24px | Separación entre secciones |
| `space-xl` | 32px | Separación entre bloques mayores |
| `space-2xl` | 48px | Margen superior de pantalla |

## Radios de Borde

| Token | Valor | Uso |
|:---|:---:|:---|
| `radius-sm` | 6px | Badges, chips |
| `radius-md` | 12px | Cards, inputs |
| `radius-lg` | 16px | Contenedores principales |
| `radius-full` | 999px | Avatares, indicadores circulares |

## Composición: Principios Anti-Genérico

- **Asimetría intencional:** Los datos de telemetría (pH, nivel) van alineados a la izquierda con peso visual fuerte. Los controles de hardware van en zona separada con más whitespace.
- **Nada de degradados cósmicos:** Los fondos son planos. El color comunica estado, no decoración.
- **Contenedores de Visión Artificial:** Aspecto crudo, borde `1px dashed`, fondo oscuro `#1A1D23`, tipografía monoespaciada para las etiquetas de clasificación. Parece herramienta de diagnóstico, no galería de fotos.

## Componentes Base y Variantes

### Botones

| Variante | Fondo | Texto | Borde | Uso |
|:---|:---:|:---:|:---:|:---|
| Primary | `#2B6CB0` | `#FFFFFF` | ninguno | Acciones principales |
| Danger | `#B7312C` | `#FFFFFF` | ninguno | Activar purga manual |
| Ghost | transparente | `#2B6CB0` | `1px #2B6CB0` | Acciones secundarias |
| Disabled | `#E2E6EA` | `#8C8C8C` | ninguno | Bloqueado por rol o estado |

### Estados de Botón

| Estado | Cambio Visual |
|:---|:---|
| Default | Colores base |
| Pressed | Opacidad 0.8 |
| Disabled | Fondo gris, texto gris, no interactivo |

> **Regla de roles:** `BtnPurga` y `BtnLlenado` aparecen `Disabled` para el rol Residente. En la implementación, el componente recibe `role` del `AuthContext` y condiciona la variante.
