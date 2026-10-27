# 06 — Convenciones de Nomenclatura: Figma → React Native

## Pantallas

| Capa en Figma | Archivo React Native |
|:---|:---|
| `Screen / Auth / Login` | `screens/auth/LoginScreen.tsx` |
| `Screen / Admin / Dashboard` | `screens/admin/DashboardAdmin.tsx` |
| `Screen / Admin / ControlesHW` | `screens/admin/ControlesHardware.tsx` |
| `Screen / Admin / ConfigUmbrales` | `screens/admin/ConfigUmbrales.tsx` |
| `Screen / Admin / DashboardBI` | `screens/admin/DashboardBI.tsx` |
| `Screen / Admin / GestionUsuarios` | `screens/admin/GestionUsuarios.tsx` |
| `Screen / User / EstadoAgua` | `screens/user/EstadoAgua.tsx` |
| `Screen / User / Historial` | `screens/user/HistorialLecturas.tsx` |
| `Screen / User / Camara` | `screens/user/CamaraInspeccion.tsx` |

## Componentes

| Capa en Figma | Archivo React Native |
|:---|:---|
| `Component / CardLectura` | `components/CardLectura.tsx` |
| `Component / SemaforoAgua` | `components/SemaforoAgua.tsx` |
| `Component / BtnPurga` | `components/BtnPurga.tsx` |
| `Component / ContenedorVisionAI` | `components/ContenedorVisionAI.tsx` |
| `Component / GaugeNivel` | `components/GaugeNivel.tsx` |
| `Component / AlertaCard` | `components/AlertaCard.tsx` |

## Variables Figma → Tokens CSS/RN

| Variable Figma | Token en código |
|:---|:---|
| `Colors / Status / Green` | `colors.status.optimal` → `#2D8B4E` |
| `Colors / Status / Yellow` | `colors.status.warning` → `#D4A017` |
| `Colors / Status / Red` | `colors.status.danger` → `#B7312C` |
| `Colors / BG / Primary` | `colors.bg.primary` → `#FAFBFC` |
| `Typography / Metric` | `typography.metric` → JetBrains Mono 32 Bold |
| `Spacing / MD` | `spacing.md` → 16 |

## Regla de Auto Layout

- Todas las pantallas: **portrait only**, width flexible, padding horizontal 16px
- Cards: Auto Layout vertical, padding 16px, gap 8px
- Listas: Auto Layout vertical, gap 4px
- Botones: Auto Layout horizontal, padding horizontal 24px, vertical 12px
