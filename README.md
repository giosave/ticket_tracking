# Ticket_tracking

Seguimiento de tickets por usuario con notificacion por correo, principales funciones:
- Actualizar estatus del ticket (notifica al correo del responsable)
- Notificar evidencia enviada anteriormente (notifica al correo del responsable)
- Cambio de color de la aplicacion

## Estructura del Proyecto
```sql
docs
├── tickets_dia.drawio
images
├── logo.png
lib
├── models
│   └── screen_manager.dart
│   └── theme_notifier.dart
│   └── ticket.dart
│   └── ticket_model.dart
├── providers
│   └── alert_provider.dart
│   └── new_ticket_provider.dart
│   └── ticket_provider.dart
├── screens
│   └── configuration_app.dart
│   └── home_screen.dart
│   ├── login_screen.dart
│   └── new_ticket.dart
├── services
│   └── api_service.dart
│   └── ticket_service.dart
├── utils
│   ├── helpers.dart
├── widgets
│   └── home_ticket.dart
│   └── ticket_dard.dart
└── main.dart
```
## Configuracion
Para comenzar a usar este proyecto

- Clona o descarga el repositorio: `git clone https://github.com/giosave/ticket_tracking.git`
- Abra el proyecto en cualquier entorno de desarrollo con Dart/Flutter instalado
- Ejecute `flutter pub get` para obtener las dependencias del proyecto
- Listo, ejecute la aplicacion si es en modo debug, seleccionando main.dart

## Capturas de Pantalla

## Versiones
Version de SDK instalada para el uso de este proyecto: 

- Flutter 3.24.3
- Dart 3.5.3