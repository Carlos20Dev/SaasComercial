# ProyectoMype — instrucciones para agentes

## Producto y arquitectura acordada
- SaaS multi-tenant de gestión comercial para MYPE en Perú.
- Monolito modular para el MVP; no proponer microservicios sin una razón demostrable.
- Frontend Next.js App Router + React + TypeScript.
- Navegador → Next.js BFF → Express REST API `/api/v1`.
- El BFF usa `API_INTERNAL_URL` solo en servidor; nunca exponerla como `NEXT_PUBLIC_*`.
- Express es la autoridad final de autenticación contextual, autorización, tenant y reglas de negocio.
- PostgreSQL + Prisma 7 (versión fijada; Decisión D-014); Zod para validar entradas.
- UI: Tailwind CSS, shadcn/ui, Lucide. Pruebas: Vitest, Supertest, Playwright.
- Planes/suscripciones/límites SaaS están separados de membresías y RBAC.
- Licencia propietaria de elaboración propia de Carlos Colan Tezen (todos los derechos reservados); ver `LICENSE`.

## Seguridad y dominio
- Nunca confiar en `tenantId` enviado por el navegador.
- Construir tenant context desde la sesión validada y comprobar pertenencia de todas las relaciones.
- Toda consulta de negocio debe estar aislada por tenant.
- Los controles de permisos del frontend son UX; Express vuelve a verificar autorización.
- Las mutaciones con cookies necesitan protección CSRF explícita.
- No guardar tokens en localStorage/sessionStorage.
- Dinero con decimales exactos; no acumular dinero con `float`.
- Inventario basado en movimientos; no cambiar saldos directamente sin movimiento.
- Operaciones críticas deben considerar transacciones, concurrencia, idempotencia y auditoría.
- No borrar físicamente transacciones comerciales confirmadas; usar reversión/compensación.
- No llamar a proveedores externos dentro de la transacción principal de venta; usar outbox/worker.

## Fuente documental (vault Obsidian)
- El vault canónico de Obsidian está fuera de este repositorio; por defecto es la carpeta hermana `../ProyectoMype` (configurable localmente). No asumir acceso si la ruta no existe.
- Mapa documento → carpeta del vault:
  - 01–05 → `01 - Producto y Requisitos/`; 06 y 15 → `02 - Arquitectura/`; 07, 08 y 16 → `03 - Datos y Base de Datos/`; 09 → `04 - API y Backend/`; 10 → `05 - Seguridad/`; 13 y 14 → `06 - Frontend/`; 11 → `07 - Calidad y Despliegue/`; 17 y 18 → `08 - Integraciones/`; 12 y Roadmap → `09 - Planificacion/`; control y registro → `00 - Inicio/` y `10 - Registro y Seguimiento/`.
- No duplicar ni versionar el contenido del vault en el repositorio sin decisión explícita.

## Uso de documentación
- Leer primero el vault (`../ProyectoMype`, ver arriba) y los documentos de `docs/`.
- Si el vault no es accesible, decirlo y no afirmar que se leyó.
- Mantener la documentación de `docs/` sincronizada con decisiones técnicas importantes y registrar qué nota del vault debe actualizar el usuario.
- No inventar ni reemplazar decisiones aprobadas.
- El Documento 08 (diccionario de datos/schema Prisma) requiere verificación completa antes de definir migraciones definitivas; el original NO está en el vault (solo un resumen "Incompleto; requiere original").
- Precisión de cantidad de inventario **decidida**: `DECIMAL(14,3)` en el esquema Prisma (resuelve el conflicto Doc 07 vs Doc 16; Decisión D-010).

## Skills de agente y validación de UI
- Ubicaciones de descubrimiento: `.opencode/skills/<nombre>/SKILL.md` (proyecto), `.agents/skills/<nombre>/SKILL.md` (importadas con `npx skills add`) y `~/.config/opencode/skills/<nombre>/SKILL.md` (global). Reiniciar opencode tras añadir o cambiar una skill.
- Skills del proyecto (`.opencode/skills/`): `project-context`, `api-contracts-zod`, `tenant-security`, `prisma-migration-safety`, `verification-before-completion`, `doc-sync`.
- Skills importadas (`.agents/skills/`; no editar sin revisar el diff, se reinstalan con `npx skills add`): `prisma-cli` (Prisma ORM 7) y `browser-validation` (validación de UI con navegador).
- Skills globales (`~/.config/opencode/skills/`): `reviewing-security`, `evolving-apis-and-schemas`, `reviewing-interface-quality`.
- Las skills se cargan bajo demanda y no se auto-activan; restringirlas por agente requiere `permission.skill`.
- Algunas skills globales/importadas (`evolving-apis-and-schemas`, `reviewing-interface-quality`, `prisma-cli`) referencian skills compañeras que no están instaladas; no asumir que existen.
- `prisma-cli` corresponde a Prisma ORM 7; el proyecto fija **Prisma 7** (Decisión D-014), por lo que la skill es aplicable.
- `browser-validation` usa dos CLIs externos que deben estar instalados: `agent-browser` y `playwright-cli` (`npm install -g agent-browser @playwright/cli`), más el navegador de agent-browser (`agent-browser install`). Requiere Node.js ≥ 18.
- En Windows con PowerShell, `agent-browser`/`playwright-cli` (shims `.ps1`) requieren `Set-ExecutionPolicy -Scope CurrentUser RemoteSigned`; si no, invocar los `.cmd`.
- El modo `chat` de agent-browser envía contenido de página a un modelo externo y requiere `AI_GATEWAY_API_KEY`; usar solo con aprobación explícita y en URLs locales/de prueba/aprobadas.
- La salida de `chat` es exploración, no evidencia: verificar resultados con comandos deterministas. Usar sesiones con nombre por tarea y cerrarlas al terminar.
- No versionar artefactos generados (`.playwright-cli/`, screenshots, snapshots, traces, estado de navegador); limpiarlos tras cada validación.

## Protocolo de trabajo
1. Inspeccionar el código y documentos existentes antes de editar.
2. Resumir objetivo, alcance, supuestos, dependencias y archivos que se planean tocar.
3. Si falta una decisión de dominio crítica, detener solo la parte afectada y pedir aclaración.
4. Proponer un plan breve para cambios medianos/grandes.
5. Implementar el cambio mínimo coherente con las convenciones existentes.
6. Ejecutar las pruebas y verificaciones disponibles; no afirmar que se ejecutaron si no se ejecutaron.
7. Revisar el diff, los riesgos de seguridad y los efectos secundarios.
8. Informar archivos cambiados, comandos ejecutados, resultados y tareas pendientes.

## Reglas de colaboración multiagente
- El Tech Lead es responsable de dividir el trabajo y resolver conflictos.
- Delegar en paralelo solo tareas que no modifiquen los mismos archivos o contratos.
- Un agente no debe sobrescribir cambios de otro agente sin revisar el diff.
- Database Engineer es responsable de proponer migraciones; no debe aplicarlas a producción.
- Security Reviewer y Code Reviewer deben informar hallazgos con severidad, evidencia y ruta/archivo; no deben arreglar silenciosamente la implementación que revisan.
- QA debe diferenciar pruebas añadidas, pruebas ejecutadas y pruebas pendientes.
- Ningún agente declara una tarea terminada sin evidencias de verificación.
