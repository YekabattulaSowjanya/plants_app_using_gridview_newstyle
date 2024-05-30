import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:plants_app_using_new_widgets/home_screens/curved_buttom_navigation_bar.dart';
import 'package:plants_app_using_new_widgets/model/plants_model.dart';
import 'package:plants_app_using_new_widgets/provider/cart_items.dart';
import 'package:plants_app_using_new_widgets/provider/search_plants_info.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('description', (widgetTester) async {
    var curvedBottomNavigationBar = CurvedBottomNavigationBar();

    await widgetTester.pumpWidget(ChangeNotifierProvider(
      create: (_) => SearchPlantsProvider(),
      child: ChangeNotifierProvider(
          create: (_) => CartProvider(),
          child: MaterialApp(home: curvedBottomNavigationBar)),
    ));

    expect(find.byType(Scaffold), findsWidgets);
  });

  testWidgets('badge cart icon', (widgetTester) async {
    var curvedBottomNavigationBar = CurvedBottomNavigationBar();

    final cartProvider = CartProvider();

    await widgetTester.pumpWidget(ChangeNotifierProvider(
      create: (_) => SearchPlantsProvider(),
      child: ChangeNotifierProvider(
          create: (_) => CartProvider(),
          child: MaterialApp(home: curvedBottomNavigationBar)),
    ));

    expect(find.byKey(const Key('shrink_key')), findsWidgets);

    expect(find.byKey(const Key('badge')), findsNothing);

    cartProvider.addToCart(Plants( title: 'plants1',
      prize: "\$5.99",
      Image: 'assets/image_plant1.jpg',));

    await widgetTester.pumpAndSettle();

    expect(cartProvider.cartItems.length, 1);
    //expect(find.byKey(const Key('badge_key')), findsWidgets);

  });
}
