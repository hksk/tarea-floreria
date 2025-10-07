import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/flor.dart';
import '../services/flor_service.dart';
import '../providers/carrito_provider.dart';
import '../widgets/flor_card.dart';
import 'flor_detalle_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Flor> flores = [];
  bool isLoading = true;
  String categoriaSeleccionada = 'Todas';

  final List<String> categorias = [
    'Todas',
    'Flores Frescas',
    'Ramos',
    'Flores de Campo',
    'Flores Aromáticas',
    'Plantas',
  ];

  @override
  void initState() {
    super.initState();
    cargarFlores();
  }

  Future<void> cargarFlores() async {
    setState(() {
      isLoading = true;
    });

    try {
      final floresData = await FlorService.getFlores();
      setState(() {
        flores = floresData;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error al cargar las flores: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  List<Flor> get floresFiltradas {
    if (categoriaSeleccionada == 'Todas') {
      return flores;
    }
    return flores.where((flor) => flor.categoria == categoriaSeleccionada).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '🌸 Florería Bella',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xFF4CAF50),
        elevation: 0,
        actions: [
          IconButton(
            icon: Stack(
              children: [
                const Icon(Icons.shopping_cart, color: Colors.white),
                Consumer<CarritoProvider>(
                  builder: (context, carrito, child) {
                    if (carrito.itemCount > 0) {
                      return Positioned(
                        right: 0,
                        top: 0,
                        child: Container(
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          constraints: const BoxConstraints(
                            minWidth: 16,
                            minHeight: 16,
                          ),
                          child: Text(
                            '${carrito.itemCount}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ],
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/carrito');
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Color(0xFF4CAF50),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Las flores más hermosas para ti',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 40,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categorias.length,
                    itemBuilder: (context, index) {
                      final categoria = categorias[index];
                      final isSelected = categoria == categoriaSeleccionada;

                      return Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: FilterChip(
                          label: Text(categoria),
                          selected: isSelected,
                          onSelected: (selected) {
                            setState(() {
                              categoriaSeleccionada = categoria;
                            });
                          },
                          backgroundColor: Colors.white.withValues(alpha: 0.15),
                          selectedColor: Colors.white,
                          checkmarkColor: const Color(0xFF2E7D32),
                          labelStyle: TextStyle(
                            color: isSelected ? const Color(0xFF2E7D32) : Colors.black87,
                            fontWeight: isSelected ? FontWeight.bold : FontWeight.w600,
                          ),
                          side: BorderSide(
                            color: isSelected ? Colors.white : Colors.white.withValues(alpha: 0.5),
                            width: 1,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: isLoading
                ? const Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF4CAF50)),
                    ),
                  )
                : floresFiltradas.isEmpty
                    ? const Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.local_florist_outlined,
                              size: 64,
                              color: Colors.grey,
                            ),
                            SizedBox(height: 16),
                            Text(
                              'No hay flores disponibles',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      )
                    : GridView.builder(
                        padding: const EdgeInsets.all(16),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.75,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                        ),
                        itemCount: floresFiltradas.length,
                        itemBuilder: (context, index) {
                          final flor = floresFiltradas[index];
                          return FlorCard(
                            flor: flor,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => FlorDetalleScreen(flor: flor),
                                ),
                              );
                            },
                          );
                        },
                      ),
          ),
        ],
      ),
    );
  }
}