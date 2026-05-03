**DER del proyecto Imperio**

- Archivo mermaid: `docs/DER.imperio.mmd`
- Diagrama validado y listo para render.

**Relaciones clave (basadas en `base de datos/imperio.sql`):**
- `Planetas.id_galaxia` -> 1:N `Galaxias` → `GALAXIAS ||--o{ PLANETAS`.
- `Planetas.jugador_id` -> 1:N `Jugadores` → `JUGADORES ||--o{ PLANETAS` (sin tabla pivote de jugadores/planetas).
- `Lunas.planeta_id` -> 1:N `Planetas`.
- Pivotes N:M: `Planetas_Recursos(cantidad)`, `Planetas_Naves(cantidad)`, `Planetas_Edificios(nivel)`, `Planetas_Armamentos(cantidad)`.

**Notas importantes**
- No existe `Jugadores_Planetas`; la relación jugador↔planeta es directa con FK en `Planetas`.
- `Planetas_Edificios` incluye `nivel`.
- Naves, Armamentos y Edificios incluyen costos (`costo_metal`, `costo_cristal`, `costo_energia`).

**Cómo generar `DER.png` localmente**

1) Instalar `mermaid-cli` (requiere Node.js):

```powershell
npm install -g @mermaid-js/mermaid-cli
```

2) Generar PNG desde el archivo mermaid:

```powershell
mmdc -i "docs/DER.imperio.mmd" -o "docs/DER.png" -w 1600 -H 900
```

3) Alternativa (si usas Docker):

```powershell
docker run --rm -v "${PWD}:/data" minlag/mermaid-cli -i /data/docs/DER.imperio.mmd -o /data/docs/DER.png
```

Si quieres, puedo intentar generar el PNG aquí y añadirlo al repo; si prefieres que lo haga, dime y lo intento (puede requerir render remoto o herramientas adicionales).
