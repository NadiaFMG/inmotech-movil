import 'package:flutter/material.dart';
import '../models/inmueble.dart';

// Importa tu modelo de Inmueble. Ajusta la ruta si es necesario.
// Este es el gestor de estado para tus favoritos.
class FavoritesProvider with ChangeNotifier {
  final Set<int> _favoriteIds = {};

  Set<int> get favoriteIds => _favoriteIds;

  // Un método para agregar o quitar un inmueble por su ID.
  void toggleFavorite(int inmuebleId) {
    if (_favoriteIds.contains(inmuebleId)) {
      _favoriteIds.remove(inmuebleId);
    } else {
      _favoriteIds.add(inmuebleId);
    }
    notifyListeners(); // Notifica a los widgets que la lista ha cambiado.
  }

  // Un método para verificar si un inmueble es favorito por su ID.
  bool isFavorite(int inmuebleId) {
    return _favoriteIds.contains(inmuebleId);
  }
}
