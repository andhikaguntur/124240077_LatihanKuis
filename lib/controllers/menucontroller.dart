import 'package:flutter/foundation.dart';

import '../models/data.dart';

class AppMenuController extends ChangeNotifier {
  final List<String> categories = const ['Semua', 'Mie', 'Dimsum', 'Minuman'];

  String selectedCategory = 'Semua';
  String searchQuery = '';
  final Set<int> favoriteIds = {};

  List<Menu> get filteredMenus {
    final query = searchQuery.toLowerCase();

    return menus.where((menu) {
      final matchCategory =
          selectedCategory == 'Semua' || menu.category == selectedCategory;
      final matchSearch =
          query.isEmpty ||
          menu.name.toLowerCase().contains(query) ||
          menu.category.toLowerCase().contains(query);

      return matchCategory && matchSearch;
    }).toList();
  }

  void setSearch(String value) {
    searchQuery = value;
    notifyListeners();
  }

  void setCategory(String category) {
    selectedCategory = category;
    notifyListeners();
  }

  void toggleFavorite(int menuId) {
    if (favoriteIds.contains(menuId)) {
      favoriteIds.remove(menuId);
    } else {
      favoriteIds.add(menuId);
    }
    notifyListeners();
  }

  bool isFavorite(int menuId) {
    return favoriteIds.contains(menuId);
  }
}
