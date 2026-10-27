# Política de Seguridad

## Reportar Vulnerabilidades

Si encuentras una vulnerabilidad de seguridad, **no abras un issue público**. Contacta directamente al equipo por correo.

## Prácticas del Proyecto

- Autenticación JWT con roles (Admin / Residente)
- Secretos en variables de entorno, nunca en el código
- MQTT sobre TLS (puerto 8883) para la comunicación con IoT Hub
- CORS configurado solo para orígenes permitidos en producción
- Validación de entrada en todos los endpoints
