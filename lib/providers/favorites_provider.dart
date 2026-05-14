import 'package:flutter/foundation.dart';
import '../data/flowers.dart';
import '../models/flower.dart';

class FavoritesProvider extends ChangeNotifier {
  final Set<String> _favoriteIds = {'1', '2', '9', '11'};

  Set<String> get favoriteIds => Set.unmodifiable(_favoriteIds);

  List<Flower> get favorites =>
      flowers.where((f) => _favoriteIds.contains(f.id)).toList();

  bool isFavorite(String id) => _favoriteIds.contains(id);

  void toggle(String id) {
    if (_favoriteIds.contains(id)) {
      _favoriteIds.remove(id);
    } else {
      _favoriteIds.add(id);
    }
    notifyListeners();
  }
}
