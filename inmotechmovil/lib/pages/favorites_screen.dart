import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/favorites_provider.dart';
import '../../models/inmueble.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  // Método de ejemplo para obtener un Inmueble por ID.
  // DEBES REEMPLAZAR ESTO con tu propia lógica de obtención de datos.
  Inmueble? _getInmuebleById(int id) {
    // Ejemplo: buscar en una lista de datos mockeados.
    // En tu caso, probablemente harías una llamada a la API o a tu base de datos local.
    // List<Inmueble> todosLosInmuebles = ...
    // return todosLosInmuebles.firstWhere((inmueble) => inmueble.id == id);
    return null; // Devuelve null si no lo encuentra.
  }

  @override
  Widget build(BuildContext context) {
    final favoritesProvider = Provider.of<FavoritesProvider>(context);

    if (favoritesProvider.favoriteIds.isEmpty) {
      return const Center(child: Text('Aún no tienes inmuebles favoritos.'));
    }

    // Convertir los IDs de favoritos a objetos Inmueble
    final List<Inmueble> favoriteInmuebles = favoritesProvider.favoriteIds
        .map((id) => _getInmuebleById(id))
        .whereType<Inmueble>() // Filtrar los null
        .toList();

    if (favoriteInmuebles.isEmpty) {
      return const Center(
        child: Text('No se encontraron los inmuebles favoritos.'),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Mis Favoritos')),
      body: ListView.builder(
        itemCount: favoriteInmuebles.length,
        itemBuilder: (context, index) {
          final inmueble = favoriteInmuebles[index];
          return Card(
            child: ListTile(
              leading: Image.network(
                inmueble.imagenes.first,
                fit: BoxFit.cover,
              ),
              title: Text(inmueble.titulo ?? 'Inmueble'),
              subtitle: Text(inmueble.direccion ?? 'Sin dirección'),
              trailing: IconButton(
                icon: const Icon(Icons.favorite, color: Colors.red),
                onPressed: () {
                  if (inmueble.id != null) {
                    favoritesProvider.toggleFavorite(inmueble.id!);
                  }
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
