class Flor {
  final String id;
  final String nombre;
  final String descripcion;
  final double precio;
  final String imageUrl;
  final String categoria;
  final bool disponible;
  final int stock;

  Flor({
    required this.id,
    required this.nombre,
    required this.descripcion,
    required this.precio,
    required this.imageUrl,
    required this.categoria,
    this.disponible = true,
    this.stock = 10,
  });

  factory Flor.fromJson(Map<String, dynamic> json) {
    return Flor(
      id: json['id'] ?? '',
      nombre: json['nombre'] ?? '',
      descripcion: json['descripcion'] ?? '',
      precio: (json['precio'] ?? 0.0).toDouble(),
      imageUrl: json['imageUrl'] ?? '',
      categoria: json['categoria'] ?? '',
      disponible: json['disponible'] ?? true,
      stock: json['stock'] ?? 10,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nombre': nombre,
      'descripcion': descripcion,
      'precio': precio,
      'imageUrl': imageUrl,
      'categoria': categoria,
      'disponible': disponible,
      'stock': stock,
    };
  }

  Flor copyWith({
    String? id,
    String? nombre,
    String? descripcion,
    double? precio,
    String? imageUrl,
    String? categoria,
    bool? disponible,
    int? stock,
  }) {
    return Flor(
      id: id ?? this.id,
      nombre: nombre ?? this.nombre,
      descripcion: descripcion ?? this.descripcion,
      precio: precio ?? this.precio,
      imageUrl: imageUrl ?? this.imageUrl,
      categoria: categoria ?? this.categoria,
      disponible: disponible ?? this.disponible,
      stock: stock ?? this.stock,
    );
  }
}