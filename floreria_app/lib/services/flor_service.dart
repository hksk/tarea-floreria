import '../models/flor.dart';

class FlorService {
  static List<Flor> getFloresMock() {
    return [
      Flor(
        id: '1',
        nombre: 'Rosa Roja',
        descripcion: 'Hermosas rosas rojas frescas, perfectas para expresar amor y pasión. Cada rosa está cuidadosamente seleccionada para garantizar la máxima frescura y belleza.',
        precio: 15.99,
        imageUrl: 'assets/images/malwina-nogaj-AuFLUJD7414-unsplash.jpg',
        categoria: 'Flores Frescas',
        stock: 50,
      ),
      Flor(
        id: '2',
        nombre: 'Lirio Blanco',
        descripcion: 'Elegantes lirios blancos con un perfume delicado. Símbolo de pureza y nobleza, ideales para ocasiones especiales.',
        precio: 12.50,
        imageUrl: 'assets/images/europeana-ZgIYk4kzts0-unsplash.jpg',
        categoria: 'Flores Frescas',
        stock: 30,
      ),
      Flor(
        id: '3',
        nombre: 'Girasol Gigante',
        descripcion: 'Alebres girasoles grandes y brillantes que siguen el sol. Perfectos para alegrar cualquier espacio y transmitir positividad.',
        precio: 8.75,
        imageUrl: 'assets/images/jessica-m-jones-urO6u0wGfyw-unsplash.jpg',
        categoria: 'Flores de Campo',
        stock: 25,
      ),
      Flor(
        id: '4',
        nombre: 'Ramo de Tulipanes',
        descripcion: 'Coloridos tulipanes holandeses en una variedad de tonos vibrantes. Un clásico elegante para cualquier ocasión.',
        precio: 22.00,
        imageUrl: 'assets/images/patrick-langwallner-Rx51u2hx55w-unsplash.jpg',
        categoria: 'Ramos',
        stock: 15,
      ),
      Flor(
        id: '5',
        nombre: 'Orquídea Phalaenopsis',
        descripcion: 'Exótica orquídea blanca con flores duraderas y elegantes. Una planta sofisticada que embellece cualquier ambiente.',
        precio: 35.00,
        imageUrl: 'assets/images/zoshua-colah--gVx4BTDwbQ-unsplash.jpg',
        categoria: 'Plantas',
        stock: 12,
      ),
      Flor(
        id: '6',
        nombre: 'Ramo de Fresias',
        descripcion: 'Fragantes fresias en colores pastel, con un aroma dulce y embriagador. Perfectas para regalar sorpresas olfativas.',
        precio: 18.50,
        imageUrl: 'assets/images/filiz-mehmed-oY-V-pjfNEU-unsplash.jpg',
        categoria: 'Flores Aromáticas',
        stock: 20,
      ),
      Flor(
        id: '7',
        nombre: 'Mini Rosa en Maceta',
        descripcion: 'Encantadora mini rosa en maceta decorativa. Una planta compacta que florece continuamente y alegra cualquier espacio.',
        precio: 14.25,
        imageUrl: 'assets/images/hena-das-HJHGJUJEFZ8-unsplash.jpg',
        categoria: 'Plantas',
        stock: 18,
      ),
      Flor(
        id: '8',
        nombre: 'Ramo de Lavanda',
        descripcion: 'Fresca lavanda con su característico aroma relajante. Ideal para aromaterapia y decoración con propiedades calmantes.',
        precio: 16.75,
        imageUrl: 'assets/images/ruslan-sikunov-7bBEvrGldEc-unsplash.jpg',
        categoria: 'Flores Aromáticas',
        stock: 35,
      ),
    ];
  }

  static Future<List<Flor>> getFlores() async {
    // Simulación de una llamada a API
    await Future.delayed(const Duration(seconds: 1));
    return getFloresMock();
  }

  static Future<Flor?> getFlorById(String id) async {
    await Future.delayed(const Duration(milliseconds: 500));
    try {
      return getFloresMock().firstWhere((flor) => flor.id == id);
    } catch (e) {
      return null;
    }
  }

  static Future<List<Flor>> getFloresByCategoria(String categoria) async {
    await Future.delayed(const Duration(milliseconds: 300));
    return getFloresMock().where((flor) => flor.categoria == categoria).toList();
  }
}