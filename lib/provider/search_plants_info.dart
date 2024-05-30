import 'package:flutter/cupertino.dart';
import 'package:plants_app_using_new_widgets/model/plants_model.dart';
import '../model/plants_details.dart';

class SearchPlantsProvider with ChangeNotifier {
  List<Plants> plants = getPlantsInfo;
  List<Plants> filteredPlants = [];

  SearchPlantsProvider() {
    filteredPlants = plants;
  } //.sublist(1)

  void searchPlants(String query) {
    filteredPlants = plants
        .where(
            (plant) => plant.title.toLowerCase().contains(query.toLowerCase()))
        .toList();
    print("Search Results: ${filteredPlants.map((name) => name.title)}");
    notifyListeners();
  }

  ///favorite
  bool isFavorite(int index) {
    return plants[index].isFavorite;
  }

  bool _showBadge = false;

  bool get showBadge => _showBadge;

  void toggleFavorite(Plants plant) {
    plant.isFavorite = !plant.isFavorite;
    print("_showBadge: $_showBadge");
    _showBadge = plants.any((plant) => plant.isFavorite);

    notifyListeners();
  }

  List<Plants> getFavoritePlants() {
    return plants.where((plant) => plant.isFavorite).toList();
  }
}
