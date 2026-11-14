# Firebase (login, progreso, ranking)

El multijugador en tiempo real lo hace el servidor de Godot (puerto 7777), NO Firebase.
Firebase se usa para: login, guardar progreso, rankings.

## Configuración
1. Proyecto en console.firebase.google.com
2. App Android con el mismo package name que el preset de exportación de Godot
3. Authentication: activar "Anónimo" y/o "Email/contraseña"
4. Firestore Database: crear en modo de prueba (ajustar reglas antes de publicar)
5. Copiar la "Web API Key" y el "Project ID" (Configuración del proyecto)

## Uso desde Godot (REST, sin SDK)
- Login anónimo: POST https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=API_KEY
- Guardar datos: PATCH https://firestore.googleapis.com/v1/projects/PROJECT_ID/databases/(default)/documents/jugadores/UID
  con cabecera `Authorization: Bearer ID_TOKEN`

No subir google-services.json ni claves privadas a repos públicos.
