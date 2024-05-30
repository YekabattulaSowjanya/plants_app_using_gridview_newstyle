import 'package:flutter/material.dart';
import 'package:plants_app_using_new_widgets/model/plants_model.dart';
import '../image_detailed_screen/plants_detaied_screen.dart';

class FavouriteScreen extends StatelessWidget {
  final List<Plants> favoriteMeals;

  const FavouriteScreen({super.key, required this.favoriteMeals});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.arrow_back),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 90),
                    child: Text(
                      'Favourite',
                      style: TextStyle(
                        fontSize: 27,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            GridView.builder(
              key: const Key('grid_view_key'),
                padding: const EdgeInsets.only(left: 20, right: 20, top: 35),
                itemCount: favoriteMeals.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  childAspectRatio: 0.65,
                ),
                itemBuilder: (context, index) {
                  final plant = favoriteMeals[index];
                  return Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(25)),
                    alignment: Alignment.center,
                    child: Transform.translate(
                      offset: Offset(0.0, index.isEven ? 50 : 0.0),
                      child: Container(
                        padding: const EdgeInsets.only(top: 10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(26),
                            boxShadow: const [BoxShadow(spreadRadius: 0.1)]),
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
                                            detailsImage: plant.Image,
                                            detailsPrize: plant.prize)));
                              },
                              child: Container(
                                margin: const EdgeInsets.only(
                                  left: 5,
                                  right: 5,
                                ),
                                height: 150,
                                child: Center(
                                  key: const Key('image_key'),
                                  child: Image.asset(
                                    plant.Image,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 12.0, bottom: 5, left: 15),
                              child: Text(
                                plant.title,
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 12.0, right: 12),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    plant.prize,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
