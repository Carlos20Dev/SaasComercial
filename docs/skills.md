# Inventario de skills

**Verificado:** 2026-10-13 con el CLI `skills` (`npx skills ls --json`, `npx skills update -y`).

## Instaladas y verificadas

| Skill | Origen | Ruta | Estado |
|---|---|---|---|
| `browser-validation` | `thekorsen/opencode-browser-skill` | `.agents/skills/browser-validation` | Al día (coincide con upstream `main`, salvo CRLF local) |
| `prisma-cli` | `prisma/skills` | `.agents/skills/prisma-cli` | Al día (coincide con upstream `main`, salvo CRLF local) |
| Skills de proyecto | — | `.opencode/skills/` | `project-context`, `api-contracts-zod`, `tenant-security`, `prisma-migration-safety`, `verification-before-completion`, `doc-sync` |
| Skills globales | — | `~/.config/opencode/skills/` | `reviewing-security`, `evolving-apis-and-schemas`, `reviewing-interface-quality` |

## Skills compañeras referenciadas pero NO instaladas

Referenciadas desde las secciones "Companion skills:" de las skills anteriores; **no existen localmente** y los agentes no deben asumir su contenido. Instalación a demanda con `npx skills add <origen>` (o buscar en `npx skills find <nombre>`).

| Skill compañera | Referenciada por | Estado |
|---|---|---|
| `prisma-orm-setup` | `prisma-cli` | No instalada |
| `prisma-compute` | `prisma-cli` | No instalada |
| `prisma-postgres-setup` | `prisma-cli` | No instalada |
| `writing-plans` | `evolving-apis-and-schemas` | No instalada |
| `verifying-before-completion` | `evolving-apis-and-schemas` | No instalada |
| `requesting-code-review` | `reviewing-security` | No instalada |
| `systematic-debugging` | `reviewing-security` | No instalada |
| `designing-frontend-interfaces` | `reviewing-interface-quality` | No instalada |
| `designing-user-experience` | `reviewing-interface-quality` | No instalada |
| `building-accessible-interfaces` | `reviewing-interface-quality` | No instalada |

> **Estado decidido (operativo, sin impacto de dominio):** mantenerlas sin instalar y cargarlas solo a demanda por el Tech Lead cuando una tarea las requiera. Instalar cualquiera de ellas es reversible (`npx skills remove <nombre>`).

## Integridad de `skills-lock.json`

- Verificación con el CLI nativo: `npx skills update -y` → `All project skills are up to date` (sin cambios).
- Los archivos locales coinciden con el `main` de sus repos de origen: comparación SHA256 con finales de línea normalizados a LF (iguales a los hashes del raw upstream).
- **Conclusión:** `computedHash` del lock **no es** el SHA256 crudo del archivo en disco (difiere incluso normalizando CRLF→LF); usa una canonicalización propia del CLI. **No usar `Get-FileHash` para auditar el lock**; usar `npx skills update` / `npx skills ls --json`.

## Notable: `external_directory` (vault)

- opencode matchea `external_directory` contra rutas canónicas **absolutas**; los patrones relativos (`../…`) no matchean de forma fiable.
- La regla efectiva vive en la configuración global del usuario (`~/.config/opencode/opencode.jsonc`): `RUTA_ABS_DEL_VAULT/*` y `RUTA_ABS_DEL_VAULT/**` (ambas, por un globstar conocido en opencode), donde `RUTA_ABS_DEL_VAULT` es la ruta local absoluta del vault (por defecto la carpeta hermana del repositorio). No se versiona en el repositorio por privacidad.