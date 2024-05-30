import 'package:flutter_test/flutter_test.dart';
import 'package:plants_app_using_new_widgets/model/plants_model.dart';
import 'package:plants_app_using_new_widgets/provider/cart_items.dart';

void main() {
  test('find cart provider', () async {
    var cartProvider = CartProvider();
    expect(cartProvider.cartItems.isEmpty, isTrue);
  });

  test('add messages', () async {
    var cartProvider = CartProvider();

    cartProvider.addToCart(Plants(
      title: 'plants1',
      prize: "\$5.99",
      Image: 'assets/image_plant1.jpg',
    ));

    expect(cartProvider.cartItems.isNotEmpty, isTrue);
    expect(cartProvider.cartItems.length, 1);
    expect(cartProvider.cartItems[0].title, 'plants1');
    expect(cartProvider.cartItems[0].prize, '\$5.99');
  });


  test('add messages', () async {
    var cartProvider = CartProvider();

    var plantList1 = Plants(Image: "assets/image_plant3.jpg",
        title: 'tree',
        prize: "\$6.90");
    var plantList2 = Plants(
        Image: "assets/image_plant4.jpg",
        title: 'car plants',
        prize: "\$6.85");
    var plantList3= Plants(
        Image: "assets/image_plant6.jpg",
        title: 'bus',
        prize: "\$7.99");

    cartProvider.addToCart(plantList1);
    cartProvider.addToCart(plantList2);
    cartProvider.addToCart(plantList3);

    expect(cartProvider.cartItems.length, 3);
    expect(cartProvider.cartItems[0].title, 'tree');
    expect(cartProvider.cartItems[1].title, 'car plants');
    expect(cartProvider.cartItems[2].title, 'bus');
  });
}
