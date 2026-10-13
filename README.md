# ProyectoMype

SaaS multi-tenant de gestión comercial para MYPE en Perú.

> **Estado:** repositorio en fase de **configuración técnica** (agentes, documentación y
> convenciones). Todavía **no** contiene el código de la aplicación.

## Arquitectura acordada

- Navegador → **Next.js (App Router)** BFF → **Express** REST `/api/v1`.
- `API_INTERNAL_URL` solo en servidor; nunca expuesta como `NEXT_PUBLIC_*`.
- Express es la autoridad final de autenticación, autorización, tenant y reglas de negocio.
- **PostgreSQL + Prisma**; validación de entradas con **Zod**.
- Multi-tenant con aislamiento por tenant en la capa de aplicación (RLS post-MVP).
- Planes/suscripciones SaaS separados de membresías y RBAC.

## Estructura del repositorio

- `AGENTS.md` — reglas para los agentes de trabajo.
- `opencode.jsonc` — configuración de opencode (agente por defecto, permisos).
- `.opencode/` — agentes, comandos y skills del proyecto.
- `.agents/skills/` — skills importadas (Prisma CLI, validación con navegador).
- `docs/` — documentación técnica sincronizada con el vault.

## Documentación

La fuente documental canónica es un vault de Obsidian **externo** al repositorio (por defecto
la carpeta hermana `../ProyectoMype`). No se versiona aquí. Ver `docs/README.md` para el mapa
documento → carpeta y bloqueos conocidos.

## Estado

- [x] Configuración de agentes (tech-lead + 7 especialistas) y comandos.
- [x] Conexión documental vault ↔ repositorio.
- [x] Publicación del repositorio en GitHub.
- [ ] Andamiaje de aplicación (monorepo, CI, base de datos).
- [ ] Modelo de datos definitivo (bloqueado: falta el Documento 08 original y la precisión decimal).

## Licencia

Pendiente de definir.
