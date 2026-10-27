# 03 — Wireframes: Usuario Estándar (Residente)

## Bottom Tab Navigator (Residente)

| Tab | Icono | Pantalla | Nombre en código |
|:---|:---:|:---|:---|
| 1 | `droplet` | Estado del Agua | `screens/user/EstadoAgua` |
| 2 | `clock` | Historial de Lecturas | `screens/user/HistorialLecturas` |
| 3 | `camera` | Inspección con Cámara | `screens/user/CamaraInspeccion` |

---

## Pantalla: EstadoAgua

### Layout

```
┌─────────────────────────────────┐
│  Mi Tinaco                      │
│                                 │
│         ┌───────────┐           │
│         │           │           │
│         │  🟢       │           │  ← Semáforo grande, centrado
│         │  ÓPTIMA   │           │
│         │           │           │
│         └───────────┘           │
│                                 │
│  El agua de tu tinaco está      │
│  en condiciones normales.       │
│                                 │
│  ┌─────────┐  ┌─────────┐      │
│  │ pH      │  │ Nivel   │      │
│  │  7.8    │  │  72%    │      │  ← Cards de métricas
│  │ Normal  │  │ Normal  │      │
│  └─────────┘  └─────────┘      │
│                                 │
│  Última foto analizada          │
│  ┌──────────────────────────┐   │
│  │ [foto interior tinaco]   │   │
│  │ Pared Limpia   92.3%    │   │
│  │ Hace 45 min              │   │
│  └──────────────────────────┘   │
│                                 │
│  Estado del sistema             │
│  Bomba llenado: Inactiva        │
│  Válvula drenaje: Cerrada       │
│  Última purga: hace 12 días     │
│                                 │
└─────────────────────────────────┘
```

### Microcopy por Estado

| Estado | Texto Principal | Texto Secundario |
|:---|:---|:---|
| 🟢 Óptima | "El agua de tu tinaco está en condiciones normales." | "pH 7.8 · Nivel 72%" |
| 🟡 Observación | "Se detectó una anomalía leve. El sistema está verificando." | "Tomando segunda captura con iluminación..." |
| 🔴 Purga | "Se detectó contaminación. El tinaco se está vaciando automáticamente." | "Progreso del vaciado: 34%. Tiempo restante: ~5 min" |
| ⚪ Offline | "Sincronizando estado offline mediante SQLite. El tinaco sigue protegido." | "Última lectura local: hace 3 min" |

---

## Pantalla: HistorialLecturas

Lista cronológica de las lecturas del día. Cada fila:

```
┌──────────────────────────────┐
│ 14:32   pH 7.8  Nivel 72%   │  ← Fondo blanco = normal
│ 14:17   pH 7.9  Nivel 73%   │
│ 13:45   pH 8.3  Nivel 74%   │  ← Fondo ámbar sutil = observación
│ 12:30   pH 8.1  Nivel 68%   │
│ 11:15   PURGA AUTOMÁTICA     │  ← Fondo rojo sutil = evento de purga
│         Causa: Algas 67%     │
│         pH alcalino: 8.4     │
│         Duración: 8 min      │
└──────────────────────────────┘
```

### Notificación Push (Copy Exacto)

- **Alerta crítica:** "Alerta: Presencia de algas (65%) y pH alcalino detectado. Vaciado automático iniciado."
- **Purga completada:** "El tinaco se vació y rellenó con agua limpia. pH actual: 7.2. Nivel: 89%."
- **Observación:** "Se detectó una anomalía visual leve. El sistema tomará una segunda foto para confirmar."
- **Offline resync:** "Tu tinaco estuvo sin conexión 23 min. Se sincronizaron 8 lecturas pendientes."

---

## Pantalla: CamaraInspeccion

```
┌─────────────────────────────────┐
│  Inspección Rápida              │
│                                 │
│  Toma una foto del interior     │
│  de un tinaco o muestra de      │
│  agua para analizarla.          │
│                                 │
│  ┌──────────────────────────┐   │
│  │                          │   │
│  │    [Vista de la cámara]  │   │
│  │                          │   │
│  └──────────────────────────┘   │
│                                 │
│       [📸 Capturar Foto]        │
│                                 │
│  ── Resultado del Análisis ──   │
│                                 │
│  ┌──────────────────────────┐   │
│  │ [foto capturada]         │   │  ← Contenedor Vision AI crudo
│  │ ─────────────────────    │   │
│  │ Presencia Algas  72.1%  │   │
│  │ Pared Limpia     18.4%  │   │
│  │ Presencia Sarro   8.9%  │   │
│  │ Tinaco Vacío      0.6%  │   │
│  └──────────────────────────┘   │
│                                 │
│  Recomendación:                 │
│  "Se detectaron algas con alta  │
│  probabilidad. Notifica al      │
│  administrador para programar   │
│  una limpieza."                 │
│                                 │
└─────────────────────────────────┘
```

> **Nota:** Ambos roles (Admin y Residente) tienen acceso a esta pantalla. La foto se sube a Azure Blob Storage y se analiza con Custom Vision.
