import 'package:flutter/material.dart';
import '../models/carrito_item.dart';
import '../models/flor.dart';

class CarritoProvider with ChangeNotifier {
  final List<CarritoItem> _items = [];

  List<CarritoItem> get items => [..._items];

  int get itemCount => _items.fold(0, (sum, item) => sum + item.cantidad);

  double get total => _items.fold(0.0, (sum, item) => sum + item.subtotal);

  void agregarFlor(Flor flor, {int cantidad = 1}) {
    final itemExistente = _items.indexWhere(
      (item) => item.flor.id == flor.id,
    );

    if (itemExistente >= 0) {
      _items[itemExistente].cantidad += cantidad;
    } else {
      _items.add(CarritoItem(flor: flor, cantidad: cantidad));
    }
    notifyListeners();
  }

  void removerFlor(String florId) {
    _items.removeWhere((item) => item.flor.id == florId);
    notifyListeners();
  }

  void actualizarCantidad(String florId, int cantidad) {
    if (cantidad <= 0) {
      removerFlor(florId);
      return;
    }

    final itemIndex = _items.indexWhere((item) => item.flor.id == florId);
    if (itemIndex >= 0) {
      _items[itemIndex].cantidad = cantidad;
      notifyListeners();
    }
  }

  void incrementarCantidad(String florId) {
    final itemIndex = _items.indexWhere((item) => item.flor.id == florId);
    if (itemIndex >= 0) {
      _items[itemIndex].cantidad++;
      notifyListeners();
    }
  }

  void decrementarCantidad(String florId) {
    final itemIndex = _items.indexWhere((item) => item.flor.id == florId);
    if (itemIndex >= 0) {
      if (_items[itemIndex].cantidad > 1) {
        _items[itemIndex].cantidad--;
      } else {
        removerFlor(florId);
      }
      notifyListeners();
    }
  }

  void vaciarCarrito() {
    _items.clear();
    notifyListeners();
  }

  bool isInCart(String florId) {
    return _items.any((item) => item.flor.id == florId);
  }

  int getQuantity(String florId) {
    final item = _items.firstWhere((item) => item.flor.id == florId);
    return item.cantidad;
  }
}