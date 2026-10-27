# Guía de Contribución

## Ramas

| Prefijo | Uso |
|:---|:---|
| `feature/` | Nueva funcionalidad |
| `fix/` | Corrección de bug |
| `docs/` | Documentación |
| `infra/` | Infraestructura y CI/CD |
| `test/` | Pruebas |

**Formato:** `prefijo/descripcion-corta` → Ejemplo: `feature/dashboard-admin`

## Commits

Usamos [Conventional Commits](https://www.conventionalcommits.org/):

```
feat: agregar pantalla de controles de hardware
fix: corregir lectura de pH cuando el sensor está en seco
docs: actualizar diagrama de arquitectura
infra: agregar bicep template para IoT Hub
test: agregar prueba de fusión de sensores
```

## Pull Requests

1. Crea tu rama desde `main`
2. Haz commits siguiendo la convención
3. Abre un PR usando la plantilla
4. Espera al menos 1 review de un compañero
5. Resuelve los comentarios antes de merge

## Estructura de Código

- **Mobile:** componentes en `src/mobile/components/`, pantallas en `src/mobile/screens/`
- **Backend:** cada microservicio tiene su carpeta con `Endpoints/`, `Models/`, `Services/`
- **Raspberry Pi:** módulos separados por función (`sensors/`, `actuators/`, `cloud/`)

## Secretos

**Nunca** hacer commit de:
- Archivos `.env`
- Connection strings
- Tokens o API keys
- Certificados `.pem` o `.key`

Usar variables de entorno o Azure Key Vault.
