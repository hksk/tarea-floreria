import 'flor.dart';

class CarritoItem {
  final Flor flor;
  int cantidad;

  CarritoItem({
    required this.flor,
    this.cantidad = 1,
  });

  double get subtotal => flor.precio * cantidad;

  Map<String, dynamic> toJson() {
    return {
      'flor': flor.toJson(),
      'cantidad': cantidad,
    };
  }

  factory CarritoItem.fromJson(Map<String, dynamic> json) {
    return CarritoItem(
      flor: Flor.fromJson(json['flor']),
      cantidad: json['cantidad'] ?? 1,
    );
  }

  CarritoItem copyWith({
    Flor? flor,
    int? cantidad,
  }) {
    return CarritoItem(
      flor: flor ?? this.flor,
      cantidad: cantidad ?? this.cantidad,
    );
  }
}