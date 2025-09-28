import 'package:flutter/material.dart';
import 'inmueble.dart';

//gestor de estado para favoritos.
class FavoritesProvider with ChangeNotifier {
  final Set<int> _favoriteIds = {};

  Set<int> get favoriteIds => _favoriteIds;

  // agregar o quitar un inmueble por su ID.
  void toggleFavorite(int inmuebleId) {
    if (_favoriteIds.contains(inmuebleId)) {
      _favoriteIds.remove(inmuebleId);
    } else {
      _favoriteIds.add(inmuebleId);
    }
    notifyListeners(); // Notifica a los widgets que la lista ha cambiado.
  }

  //  verificar si un inmueble es favorito por su ID.
  bool isFavorite(int inmuebleId) {
    return _favoriteIds.contains(inmuebleId);
  }
}
