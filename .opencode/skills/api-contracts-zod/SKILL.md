---
name: api-contracts-zod
description: Usa esta guía para diseñar endpoints REST, DTOs, validación Zod, respuestas de error o cambios de contrato entre frontend y backend.
compatibility: opencode
---

# Contratos de API

- Prefijo `/api/v1`; recursos plurales en inglés; JSON camelCase.
- Definir request DTO, response DTO, status codes, errores y permisos.
- Validar body, query y params con Zod.
- No exponer modelos Prisma directamente.
- Usar strings decimales para importes y fechas ISO 8601 para instantes.
- Paginar listados y permitir solo campos de ordenamiento conocidos.
- El BFF adapta/proxy la petición, pero Express conserva reglas de negocio y autorización.
- Documentar idempotencia y comportamiento de reintentos en operaciones críticas.
- Actualizar OpenAPI y pruebas de contrato cuando existan.
