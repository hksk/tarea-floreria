# Florería Bella 🌸

Aplicación móvil de carrito de compras para una florería, desarrollada con Flutter.

## Características

- 🌺 **Catálogo de Productos**: Explora una hermosa selección de flores frescas, ramos, plantas y arreglos florales
- 🔍 **Filtros por Categoría**: Organiza los productos por categorías (Flores Frescas, Ramos, Plantas, etc.)
- 🛒 **Carrito de Compras**: Agrega, elimina y ajusta cantidades de productos
- 💳 **Proceso de Pago Simple**: Formulario de checkout con información de contacto y métodos de pago
- 📱 **Diseño Responsivo**: Interfaz moderna y amigable optimizada para dispositivos móviles

## Arquitectura del Proyecto

```
lib/
├── main.dart                 # Punto de entrada y configuración de la app
├── models/
│   ├── flor.dart            # Modelo de datos para flores
│   └── carrito_item.dart    # Modelo para items del carrito
├── providers/
│   └── carrito_provider.dart # Gestión de estado del carrito con Provider
├── screens/
│   ├── home_screen.dart     # Pantalla principal con catálogo
│   ├── flor_detalle_screen.dart # Detalles de producto
│   ├── carrito_screen.dart  # Vista del carrito de compras
│   └── pago_screen.dart     # Proceso de checkout
├── services/
│   └── flor_service.dart    # Servicio con datos mock de flores
└── widgets/
    └── flor_card.dart       # Widget reutilizable para tarjetas de flores
```

## Tecnologías Utilizadas

- **Flutter 3.32.2** - Framework de desarrollo multiplataforma
- **Dart 3.8.1** - Lenguaje de programación
- **Provider 6.1.2** - Gestión de estado
- **Cached Network Image** - Carga eficiente de imágenes
- **HTTP** - Para futuras integraciones con API

## Instalación y Ejecución

### Prerrequisitos

- Flutter SDK 3.8.1 o superior
- Dart SDK 3.8.1 o superior
- Xcode (para iOS/macOS)
- Android Studio (para Android)

### Pasos

1. Clona el repositorio:
   ```bash
   git clone [URL-del-repositorio]
   cd floreria_app
   ```

2. Instala las dependencias:
   ```bash
   flutter pub get
   ```

3. Ejecuta la aplicación:
   ```bash
   flutter run
   ```

   Para ejecutar en una plataforma específica:
   ```bash
   flutter run -d chrome    # Navegador web
   flutter run -d macos     # macOS
   flutter run -d ios       # iOS
   flutter run -d android   # Android
   ```

## Estructura de Datos

### Flor
```dart
class Flor {
  final String id;
  final String nombre;
  final String descripcion;
  final double precio;
  final String imageUrl;
  final String categoria;
  final bool disponible;
  final int stock;
}
```

### Categorías Disponibles
- Flores Frescas
- Ramos
- Flores de Campo
- Flores Aromáticas
- Plantas

## Flujo de la Aplicación

1. **Home Screen**: Catálogo principal con filtros por categoría
2. **Detalles del Producto**: Vista expandida con información completa
3. **Carrito**: Gestión de items seleccionados con cantidades y totales
4. **Checkout**: Formulario de contacto y método de pago
5. **Confirmación**: Resumen del pedido y número de seguimiento

## Personalización

### Colores y Tema
La aplicación utiliza una paleta de colores verde floral inspirada en la naturaleza:
- Primario: `#4CAF50` (Verde fresco)
- Secundario: `#8BC34A` (Verde lima)

### Datos de Productos
Los productos se definen en `flor_service.dart` con datos mock. Para integrar con una API real:

1. Modifica `FlorService.getFlores()` para consumir tu endpoint
2. Actualiza los modelos según necesites
3. Maneja estados de carga y error

## Contribución

Este proyecto fue desarrollado como tarea universitaria. Para contribuir:

1. Fork del proyecto
2. Crea una rama feature (`git checkout -b feature/NuevaCaracteristica`)
3. Commit de cambios (`git commit -am 'Agrega nueva característica'`)
4. Push a la rama (`git push origin feature/NuevaCaracteristica`)
5. Abre un Pull Request

## Licencia

Este proyecto es educativo y fue desarrollado para propósitos académicos.

## Autores

- [Tu Nombre] - Desarrollo completo de la aplicación Flutter

## Créditos

- Iconos por [Material Icons](https://fonts.google.com/icons)
- Imágenes placeholder generadas con [Lorem Picsum](https://picsum.photos/)
- Framework Flutter by Google