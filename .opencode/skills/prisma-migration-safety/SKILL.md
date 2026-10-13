---
name: prisma-migration-safety
description: Usa esta guía al crear o revisar schema.prisma, SQL, índices, constraints, migraciones o cambios de modelo de datos.
compatibility: opencode
---

# Seguridad de cambios de base de datos

1. Inspecciona el schema y migraciones existentes antes de proponer cambios.
2. Confirma la fuente documental. El Documento 08 debe validarse antes de cerrar el esquema inicial.
3. Identifica impacto en datos existentes, lecturas/escrituras, índices y despliegue.
4. Prefiere migraciones compatibles y estrategia expand/contract.
5. Revisa SQL generado y restricciones; no confíes solo en el schema visual.
6. No uses `migrate reset` ni comandos destructivos sobre datos valiosos.
7. Nunca ejecutes migraciones de producción sin aprobación explícita.
8. Para inventario, define invariantes y protección contra concurrencia.
9. Para dinero/cantidad, no uses tipos de coma flotante.
10. Registra rollback/mitigación y pruebas.

Conflicto conocido: Doc 07 menciona `DECIMAL(14,3)` para cantidad de inventario y Doc 16 propuso `NUMERIC(19,4)`. No resolverlo por inferencia.
