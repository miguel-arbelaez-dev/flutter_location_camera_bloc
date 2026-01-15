# Flutter Location Camera BLoC

Flutter Location Camera BLoC es una aplicación móvil desarrollada con Flutter, enfocada en el uso de hardware del dispositivo y gestión de estado con BLoC, siguiendo principios de Clean Architecture.

La aplicación permite capturar una fotografía usando la cámara, obtener la ubicación GPS del dispositivo y guardar esta información como un registro persistente dentro de la app.

Este proyecto fue diseñado para demostrar el uso de Flutter en escenarios reales de producción, incluyendo permisos, integración con hardware y arquitectura escalable.

## Funcionalidades principales

- Captura de fotografías utilizando la cámara del dispositivo
- Obtención de la ubicación actual (GPS)
- Guardado de registros con:
  - Imagen capturada
  - Coordenadas de ubicación
  - Fecha de creación
- Listado de registros guardados
- Visualización del detalle de cada registro
- Manejo correcto de permisos de cámara y ubicación
- Interfaz reactiva mediante BLoC

## Arquitectura

El proyecto está estructurado siguiendo Clean Architecture, separando claramente responsabilidades:

- Data  
  - Data sources (cámara y ubicación)  
  - Implementaciones de repositorios  

- Domain  
  - Entidades  
  - Casos de uso  
  - Contratos de repositorios  

- Presentation  
  - BLoC (events, states, bloc)  
  - Screens  
  - Rutas  
  - Tema de la aplicación  

La gestión de estado se realiza exclusivamente con BLoC.

## Tecnologías y herramientas

- Flutter
- Dart
- flutter_bloc
- Camera
- Geolocator
- Clean Architecture
- Permisos Android
- Persistencia local

## Requisitos

- Flutter 3.8.6
- Android SDK configurado
- Permisos habilitados en AndroidManifest.xml:
  - Cámara
  - Ubicación (ACCESS_FINE_LOCATION / ACCESS_COARSE_LOCATION)

## Cómo ejecutar el proyecto

```bash
git clone https://github.com/tu-usuario/flutter_location_camera_bloc.git
cd flutter_location_camera_bloc
flutter pub get
flutter run

