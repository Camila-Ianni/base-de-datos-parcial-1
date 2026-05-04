# Base de Datos - Proyecto Imperio

Proyecto de base de datos relacional para un juego espacial, con gestión de jugadores, planetas, recursos, naves, edificios y armamentos.

## Descripción

Este proyecto contiene:

- **`base de datos/imperio.sql`**: Script SQL completo con creación de tablas, inserción de datos y consultas de configuración
- **`docs/DER_conceptual.mmd`**: Diagrama Entidad-Relación conceptual (sin detalles técnicos)
- **`docs/Modelo_Logico.mmd`**: Modelo lógico con estructura técnica completa (PK, FK, tablas intermedias)

## Ejecución

Para recrear la base de datos:

```bash
mysql -u root -p < "base de datos/imperio.sql"
```

## Cambios Realizados

- ✅ Punto 5 (Parte 3): Inserción de edificio id=4 en ambos planetas del usuario 'galactic_ruler' usando `WHERE NOT EXISTS`
