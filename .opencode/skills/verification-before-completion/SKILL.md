---
name: verification-before-completion
description: Usa esta guía antes de afirmar que una tarea, corrección, prueba o implementación está terminada.
compatibility: opencode
---

# Verificación antes de completar

1. Comprueba `git diff` y `git status`.
2. Ejecuta las pruebas pertinentes que estén disponibles.
3. Ejecuta lint, typecheck y build si corresponden y el entorno lo permite.
4. Lee los resultados completos y resuelve fallos introducidos por el cambio.
5. Si no puedes ejecutar algo, informa exactamente qué faltó y por qué.
6. Comprueba que no se añadieron secretos ni archivos generados innecesarios.
7. Verifica criterios de aceptación y documentación afectada.
8. Informa comandos ejecutados y resultados reales.

Nunca digas “todo funciona” si solo revisaste el código o si las pruebas no se ejecutaron.
