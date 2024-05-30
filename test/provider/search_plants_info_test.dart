import 'package:flutter_test/flutter_test.dart';
import 'package:plants_app_using_new_widgets/provider/search_plants_info.dart';

void main() {
  test("find search logic", () async {
    var searchPlantsProvider = SearchPlantsProvider();

    expect(searchPlantsProvider.plants, isNotEmpty);
    expect(searchPlantsProvider.filteredPlants,
        equals(searchPlantsProvider.plants));
  });

  test("check the search operation correct", () async {
    var searchPlantsProvider = SearchPlantsProvider();
    var query = 'Plants1';

    searchPlantsProvider.searchPlants(query);

    expect(searchPlantsProvider.filteredPlants, hasLength(1));
    expect(searchPlantsProvider.filteredPlants.first.title.toLowerCase(),
        contains(query.toLowerCase()));
  });

  test("check the favorite icon logic", () async {
    var searchPlantsProvider = SearchPlantsProvider();
    var index = 0;

    expect(searchPlantsProvider.isFavorite(index),
        equals(searchPlantsProvider.plants[index].isFavorite));
  });
}
