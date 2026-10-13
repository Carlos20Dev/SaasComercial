---
name: tenant-security
description: Aplica al diseñar, implementar o revisar autenticación, RBAC, membresías, sucursales, consultas y mutaciones de datos multi-tenant.
compatibility: opencode
---

# Checklist de seguridad multi-tenant

- Derivar tenant activo desde sesión/contexto validado; nunca confiar en un tenantId del body/query.
- Comprobar pertenencia de la entidad objetivo al tenant.
- Comprobar que relaciones referenciadas pertenecen al mismo tenant.
- Aplicar autorización en Express para cada operación.
- Verificar el alcance de sucursal/almacén además del tenant cuando corresponda.
- Evitar filtraciones por búsquedas, contadores, reportes, exportaciones y errores.
- Probar intentos cross-tenant en lectura y escritura.
- Al cambiar de tenant, renovar contexto y limpiar datos privados en caché.
- Para cookies, definir y probar defensa CSRF en las mutaciones.
- Registrar operaciones sensibles sin escribir secretos en logs.

Entrega una tabla con escenario, control aplicado y prueba que lo verifica.
