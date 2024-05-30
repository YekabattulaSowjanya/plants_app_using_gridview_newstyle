import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/plants_model.dart';
import '../provider/cart_items.dart';

class CartScreen extends StatelessWidget {
  final List<Plants> cartItems;
  const CartScreen({super.key, required this.cartItems});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Column(children: [
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
                  'cartTitle',
                  style: TextStyle(
                    fontSize: 27,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 220,
          child: Consumer<CartProvider>(
            builder: (context, cartProvider, _) {
              var cartPlants = cartProvider.cartItems;
              return ListView.separated(
                key: const Key('listview_key'),
                itemCount: cartPlants.length,
                separatorBuilder: (context, index) => Padding(
                  key:  const Key('key'),
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Divider(
                    height: 1,
                    color: Colors.red[400],
                    thickness: 1,
                  ),
                ),
                itemBuilder: (context, index) {
                  var cartItem = cartPlants[index];
                  return ListTile(
                    leading: GestureDetector(
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => ItemDetailsPage(
                        //       name: cartItem.name,
                        //       price: dollerPrice[index],
                        //       price1: provider.getTotalPrice1(index).toString(),
                        //       quantity: provider.getQuantity(index),
                        //       description: description[index],
                        //       imageUrl: cartItem.imageUrl,
                        //     ),
                        //   ),
                        // );
                      },
                      child: Image.asset(
                        cartItem.Image,
                        width: 70,
                        height: 70,
                      ),
                    ),
                    title: Text(
                      cartItem.title,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    subtitle: Text(
                      cartItem.prize,
                      style: TextStyle(
                          color: Colors.red[400], fontWeight: FontWeight.bold),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ]),
    );
  }
}
