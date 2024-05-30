import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:plants_app_using_new_widgets/provider/search_plants_info.dart';
import 'package:provider/provider.dart';
import '../image_detailed_screen/plants_detaied_screen.dart';

class StraggeredGridList extends StatelessWidget {
  const StraggeredGridList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (Provider.of<SearchPlantsProvider>(context).filteredPlants.isEmpty) {
      return const Center(
        child: Text("No results found"),
      );
    }
    return Column(
      children: [
        // Center(
        //     child: Text(
        //   "Found ${Provider.of<SearchPlantsProvider>(context).filteredPlants.length} Results",
        //   maxLines: 2,
        //   style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        // )),
        SizedBox(
            height: 580,
            child: Consumer<SearchPlantsProvider>(
                builder: (context, plantsProvider, child) {
              return StaggeredGridView.countBuilder(
                key: const Key('straggered_key'),
                padding: const EdgeInsets.only(left: 23, right: 23, top: 30),
                crossAxisCount: 2,
                physics: const ScrollPhysics(),
                shrinkWrap: true,
                crossAxisSpacing: 30,
                mainAxisSpacing: 30,
                itemCount: plantsProvider.filteredPlants.length,
                itemBuilder: (context, index) {
                  final plants = plantsProvider.filteredPlants[index];
                  return index == 0
                      ? Center(
                          child: Text(
                          "Found ${plantsProvider.filteredPlants.length} Results",
                          maxLines: 2,
                          style: const TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ))
                      :
                      // Transform.translate(
                      //     offset: Offset(0.0, index.isEven ? 50 : 0.0),
                      //child: cart ui, ---func
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25)),
                          alignment: Alignment.center,
                          child: Container(
                            padding: const EdgeInsets.only(top: 10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(26),
                                boxShadow: const [
                                  BoxShadow(spreadRadius: 0.1)
                                ]),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => PlantsDetailsScreen(
                                                detailsImage: plants.Image,
                                                detailsPrize: plants.prize)));
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(
                                      left: 5,
                                      right: 5,
                                    ),
                                    height: 150,
                                    child: Center(
                                      child: Image.asset(
                                        key: const Key('image_key'),
                                        plants.Image,
                                        fit: BoxFit.cover,
                                        //scale: 5,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 12.0, bottom: 5, left: 15),
                                  child: Text(
                                    key:const Key('title_key'),
                                    plants.title,
                                    //'Title $index ',
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 12.0, right: 12),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        key: const Key('prize_key'),
                                        plants.prize,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                      CircleAvatar(
                                          backgroundColor: Colors.black,
                                          child: GestureDetector(
                                            onTap: () {
                                              plantsProvider
                                                  .toggleFavorite(plants);
                                              print(
                                                  "Tapped the favorite ${plantsProvider.plants[index].title}");
                                            },
                                            child: Icon(
                                              plantsProvider
                                                      .plants[index].isFavorite
                                                  // plantsProvider.isFavorite(index)
                                                  ? Icons.favorite
                                                  : Icons.favorite_border,
                                              color: plantsProvider
                                                      .plants[index].isFavorite
                                                  ? Colors.red
                                                  : Colors.grey,
                                            ),
                                          )),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                },
                staggeredTileBuilder: (index) {
                  return index == 0
                      ? const StaggeredTile.count(1, .5) //For Text
                      : const StaggeredTile.count(1, 1.5); // others item
                },
              );
            }))
      ],
    );
  }
}
