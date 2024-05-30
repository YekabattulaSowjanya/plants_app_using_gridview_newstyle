import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/plants_model.dart';
import '../provider/cart_items.dart';

class DetailsBottomPage extends StatelessWidget {

   String detailsPrize;
   String detailsImage;

   DetailsBottomPage({Key? key,required this.detailsPrize, required this.detailsImage}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    void _addCartItems() {
      String cartItemPrize = detailsPrize;
      String cartItemsImage = detailsImage;

      Plants plant = Plants(Image: cartItemsImage, title: 'plants', prize: cartItemPrize);

      var plantProvider = Provider.of<CartProvider>(context, listen: false);
      plantProvider.addToCart(plant);
      Navigator.of(context).pop();
    }

    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(40),
        topRight: Radius.circular(40),
      ),
      child: Container(
        padding:
        const EdgeInsets.only(top: 30, right: 40, left: 40, bottom: 30),
        color: Colors.lightGreen[800],
        height: 230,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: const [
                        Icon(
                          Icons.height,
                          size: 30,
                          color: Colors.white,
                        ),
                        Text('Height',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                        Text('350m - 400m',
                            style: TextStyle(
                              color: Colors.white,
                            ))
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: const [
                        Icon(
                          Icons.ten_mp,
                          size: 30,
                          color: Colors.white,
                        ),
                        Text('Temparature',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                        Text('20c - 30c',
                            style: TextStyle(
                              color: Colors.white,
                            ))
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: const [
                        Icon(
                          Icons.photo_size_select_small_sharp,
                          size: 30,
                          color: Colors.white,
                        ),
                        Text(
                          'Pot',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        Text('ceramic',
                            style: TextStyle(
                              color: Colors.white,
                            ))
                      ],
                    ),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  key: const Key('rich_text_key1'),
                  maxLines: 2,
                  text: TextSpan(
                    children: <TextSpan>[
                      const TextSpan(
                        text: 'Enjoy your \v',
                        style: TextStyle(fontSize: 20),
                      ),
                      TextSpan(
                        text: detailsPrize,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: _addCartItems,
                  child: Container(
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, top: 20, bottom: 20),
                    decoration: BoxDecoration(
                      color: Colors.lightGreen[900],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      'Add to Cart',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.white),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
