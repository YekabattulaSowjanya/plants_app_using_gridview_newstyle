
import 'package:flutter/material.dart';

import 'detailed_bootom_navigator_plants.dart';

class PlantsDetailsScreen extends StatelessWidget {
  String detailsImage;
  String detailsPrize;

  PlantsDetailsScreen(
      {Key? key, required this.detailsImage, required this.detailsPrize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15.0, top: 10, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(Icons.arrow_back_ios)),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.shopping_cart_outlined)),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height/2,
              child: Center(
                  child: Image.asset(
                detailsImage,
                //scale: 1.5,
                    fit: BoxFit.cover,
              )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, top: 5),
              child: Text(
                detailsPrize,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: DetailsBottomPage(
        detailsPrize: detailsPrize,
        detailsImage: detailsImage,
      ),
    );
  }
}
