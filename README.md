# Mundo Multijugador

Juego Android multijugador cooperativo (mundo compartido estilo Minecraft) que mezcla:

- **GTA**: mundo abierto, vehículos, misiones
- **Plants vs Zombies**: defensa de base con torretas/plantas
- **Doom**: combate de disparos rápido
- **Resident Evil**: supervivencia, munición limitada, zonas de infectados

## Por qué Godot 4 + 2D
Pensado para correr en una netbook x86 de 4 GB de RAM y para trabajar todo en la nube:
- Godot es liviano (editor ~100 MB), exporta a Android y trae multijugador integrado (ENet).
- Vista 2D cenital: corre fluido en celulares baratos y es mucho más simple de construir.
- Servidor dedicado "headless" (sin gráficos) barato de alojar en la nube.

## Trabajo 100% en la nube
1. Subí este repo a GitHub.
2. Abrí **GitHub Codespaces** (usa `.devcontainer`): editás código y corrés el servidor desde el navegador.
3. **GitHub Actions** compila el APK (`.github/workflows/build-android.yml`) y lo podés descargar.
4. El servidor corre en cualquier VPS/Codespace: `./server/run_server.sh`

## Probar multijugador
Servidor: `godot --headless --path . -- --server`
Cliente: abrir el juego, escribir la IP y tocar "Unirse".

## Estructura
- `scripts/network.gd`: conexión, lista de jugadores (autoload)
- `scripts/main.gd`: menú simple y creación de jugadores
- `scripts/player.gd`: movimiento sincronizado
- `docs/ROADMAP.md`: plan por fases
