# Documentación técnica del repositorio

Este directorio reúne las copias de trabajo que el agente necesita leer directamente desde el repositorio. La **fuente documental canónica** es el vault Obsidian.

## Conexión con el vault Obsidian
- Ruta del vault: por defecto `../ProyectoMype` (carpeta hermana del repositorio); configurable localmente.
- Validado: el vault es legible y contiene 30 documentos `.md` en 12 carpetas (`00 - Inicio` … `99 - Plantillas`).
- No asumir acceso si la ruta no existe o no es legible; en ese caso decirlo y no afirmar que se leyó.

### Mapa documento → carpeta del vault
| Rango | Carpeta |
|---|---|
| 01–05 | `01 - Producto y Requisitos/` |
| 06, 15 | `02 - Arquitectura/` |
| 07, 08, 16 | `03 - Datos y Base de Datos/` |
| 09 | `04 - API y Backend/` |
| 10 | `05 - Seguridad/` |
| 13, 14 | `06 - Frontend/` |
| 11 | `07 - Calidad y Despliegue/` |
| 17, 18 | `08 - Integraciones/` |
| 12, Roadmap | `09 - Planificacion/` |
| Control y registro | `00 - Inicio/` y `10 - Registro y Seguimiento/` |

### Estado real de los documentos de datos
- Doc 07 y Doc 16: "Reconstruido desde resumen".
- Doc 08: "Incompleto; requiere original". El original **no está en el vault**; recuperarlo antes de definir `schema.prisma`.
- Precisión de cantidad de inventario decidida: `DECIMAL(14,3)` (D-010). El proyecto fija Prisma 7 (D-014).

## Recomendación
- Mantener en `docs/` solo la especificación activa que el agente deba leer desde el repo; el resto vive en el vault.
- Usar el vault para el mapa global, la bitácora y el seguimiento.
- Evitar copias divergentes: acordar la fuente de verdad por archivo. No versionar el contenido del vault en el repositorio sin decisión explícita.

### Skills y permisos (vault y herramientas)
- Inventario oficial de skills (instaladas y compañeras no instaladas): [`skills.md`](./skills.md).
- El acceso al vault se declara en la configuración **global** del usuario (`~/.config/opencode/opencode.jsonc` → `RUTA_ABS_DEL_VAULT/*` y `RUTA_ABS_DEL_VAULT/**`, siendo `RUTA_ABS_DEL_VAULT` la ruta local absoluta del vault, por defecto la carpeta hermana del repositorio). opencode matchea rutas canónicas absolutas y no admite patrones relativos; la ruta local no se versiona por privacidad.

## Bloqueo conocido
No finalizar el esquema Prisma inicial hasta recuperar y validar el **Documento 08 original** (su original **no** está en el vault). La precisión de cantidad de inventario ya está decidida: `DECIMAL(14,3)` (D-010).
