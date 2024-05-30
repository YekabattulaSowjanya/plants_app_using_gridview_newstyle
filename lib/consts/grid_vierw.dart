import 'package:flutter/material.dart';

import 'list_of_price_title.dart';

class Products extends StatelessWidget {
  const Products({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: GridView.builder(
          padding: const EdgeInsets.only(bottom: 40 * 2),
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.65,
              mainAxisSpacing: 30,
              crossAxisSpacing: 30),
          itemCount: 10, //productList.length,
          itemBuilder: (context, index) {
            return Transform.translate(
              offset: Offset(0.0, index.isEven ? 50 : 0.0),
              child: buildGridItem(index, context),
            );
          }),
    ));
  }

  Widget buildGridItem(int index, BuildContext context) {
    //final plantsProvider= Provider.of<SearchPlantsProvider>(context);
    return Container(
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
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (_) => PlantsDetailsScreen(
              //             detailsImage: imagesUrl[index],
              //             //detailedTitle: Title $index,
              //             detailsPrize: dollerPrice[index])));
            },
            child: Container(
              margin: const EdgeInsets.only(
                left: 5,
                right: 5,
              ),
              height: 150,
              child: Center(
                child: Image.asset(
                  imagesUrl[index],
                  fit: BoxFit.cover,
                  //scale: 5,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12.0, bottom: 5, left: 15),
            child: Text(
              'Title $index',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0, right: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  dollerPrice[index],
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
                const CircleAvatar(
                    backgroundColor: Colors.black,
                    child: Icon(
                      Icons.favorite,
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
