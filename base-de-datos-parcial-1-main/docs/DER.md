**DER del proyecto Imperio**

- Archivo mermaid: `docs/DER.imperio.mmd`
- Diagrama validado y listo para render.

**Relaciones clave (basadas en `base de datos/imperio.sql`):**
- `Planetas.galaxia_id` -> 1:N `Galaxias` → `GALAXIAS ||--o{ PLANETAS`.
- `Jugadores_Planetas` es una tabla pivote m:n entre `Jugadores` y `Planetas` (PK compuesto).
- Pivotes con atributos: `Planetas_Recursos(cantidad)`, `Planetas_Naves(cantidad)`, `Planeta_Armamentos(cantidad)`.
- `Lunas` referencia `Planetas` (1:N).

**Notas importantes**
- `Jugadores_Planetas` es la única relación jugador↔planeta en el modelo actual.
- `Planetas_Edificios` no tiene atributos extra; solo registra existencia.
- Naves, Armamentos y Edificios incluyen costos (`costo_r1`, `costo_r2`, `costo_r3`).

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