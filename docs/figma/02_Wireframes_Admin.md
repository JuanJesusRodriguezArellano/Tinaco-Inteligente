# 02 — Wireframes: Administrador

## Bottom Tab Navigator (Admin)

| Tab | Icono | Pantalla | Nombre en código |
|:---|:---:|:---|:---|
| 1 | `activity` | Dashboard de Monitoreo | `screens/admin/DashboardAdmin` |
| 2 | `sliders` | Controles de Hardware | `screens/admin/ControlesHardware` |
| 3 | `settings` | Configuración de Umbrales | `screens/admin/ConfigUmbrales` |
| 4 | `bar-chart-2` | Dashboard BI (Power BI) | `screens/admin/DashboardBI` |
| 5 | `users` | Gestión de Usuarios | `screens/admin/GestionUsuarios` |

---

## Pantalla: DashboardAdmin

### Layout (Portrait)

```
┌─────────────────────────────────┐
│  Tinaco Inteligente     [🔔 3]  │  ← Header asimétrico, badge de alertas
│                                 │
│  ┌─────────┐                    │
│  │ pH 7.8  │   🟢 Agua Óptima  │  ← Métrica grande + semáforo
│  │ ──────  │                    │
│  │ Rango   │   Última lectura   │
│  │ 6.5-8.5 │   hace 12 seg     │
│  └─────────┘                    │
│                                 │
│  Nivel del Tinaco               │
│  ████████████░░░░  72%          │  ← Barra de progreso horizontal
│  Estimación vaciado: 3.2 días   │
│                                 │
│  ┌──────────────────────────┐   │
│  │ 📸 Última captura        │   │  ← Contenedor Vision AI
│  │ ┌──────────────────────┐ │   │
│  │ │                      │ │   │
│  │ │   [foto del tinaco]  │ │   │
│  │ │                      │ │   │
│  │ └──────────────────────┘ │   │
│  │ Pared Limpia    92.3%   │   │  ← Etiquetas monoespaciadas
│  │ Presencia Algas  3.1%   │   │
│  │ Presencia Sarro  4.2%   │   │
│  │ Tinaco Vacío     0.4%   │   │
│  │ Hace 45 min              │   │
│  └──────────────────────────┘   │
│                                 │
│  ═══════════════════════════    │
│  [Dashboard] [Ctrl] [Cfg] [BI] │  ← Bottom tabs
└─────────────────────────────────┘
```

### Datos Vivos (Zero Lorem Ipsum)

- pH: `7.8` · Rango ideal: `6.5 – 8.5`
- Nivel: `72%` · Sensor ultrasónico HC-SR04
- Estimación vaciado: `3.2 días` (regresión lineal)
- Clasificación Custom Vision: `Pared Limpia 92.3%`
- Última sincronización: `hace 12 seg`

---

## Pantalla: ControlesHardware

### Layout

```
┌─────────────────────────────────┐
│  Controles Remotos              │
│                                 │
│  Estado de Válvulas             │
│  ┌───────────┐ ┌───────────┐   │
│  │ Suministro│ │  Drenaje  │   │
│  │  🟢 Abierto│ │  🔴 Cerrado│   │
│  └───────────┘ └───────────┘   │
│                                 │
│  ┌──────────────────────────┐   │
│  │ [🔴 Activar Purga Manual]│   │  ← Botón Danger
│  └──────────────────────────┘   │
│  Vacía el tinaco y rellena      │
│  con agua limpia. Tiempo        │
│  estimado: 8 min                │
│                                 │
│  ┌──────────────────────────┐   │
│  │ [💧 Activar Bomba Llenado]│  │  ← Botón Primary
│  └──────────────────────────┘   │
│                                 │
│  ┌──────────────────────────┐   │
│  │ [📸 Solicitar Fotografía] │  │  ← Botón Ghost
│  └──────────────────────────┘   │
│  Enciende el anillo LED y       │
│  captura una foto del interior  │
│                                 │
└─────────────────────────────────┘
```

### Microcopy

- Botón purga: "Activar Purga Manual"
- Descripción: "Vacía el tinaco y rellena con agua limpia. Tiempo estimado: 8 min"
- Botón foto: "Solicitar Fotografía"
- Descripción: "Enciende el anillo LED y captura una foto del interior"
- Confirmación purga: "¿Confirmar vaciado completo del tinaco? Esta acción tarda aproximadamente 8 minutos."

---

## Pantalla: ConfigUmbrales

### Campos

| Parámetro | Valor Default | Rango | Unidad |
|:---|:---:|:---|:---|
| pH Mínimo | 6.5 | 0.0 – 14.0 | — |
| pH Máximo | 8.5 | 0.0 – 14.0 | — |
| Nivel Mínimo de Alerta | 15 | 0 – 100 | % |
| Confianza Mínima IA | 65 | 50 – 100 | % |

### Microcopy

- Título: "Umbrales de Operación"
- Subtitle: "Define los límites para activar alertas y purgas automáticas"
- Botón guardar: "Guardar Configuración"
- Toast éxito: "Umbrales actualizados. Los nuevos límites se aplicaron al dispositivo."
- Toast error: "No se pudo enviar al dispositivo. Se reintentará cuando haya conexión."

---

## Pantalla: DashboardBI

WebView embebido con el reporte de Power BI. Muestra:
- Tendencia de pH (últimos 7 días)
- Frecuencia de purgas por causa (algas, sarro, químico)
- Predicción de próximo vaciado (regresión lineal sobre nivel)
- Predicción de próxima limpieza (regresión lineal sobre purgas)
- Consumo diario estimado en litros
