import 'package:badges/badges.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:plants_app_using_new_widgets/bottom_screens/cart_screen.dart';
import 'package:plants_app_using_new_widgets/bottom_screens/favorite_screen.dart';
import 'package:plants_app_using_new_widgets/home_screens/home_page.dart';
import 'package:plants_app_using_new_widgets/provider/cart_items.dart';
import 'package:provider/provider.dart';

import '../provider/search_plants_info.dart';

class CurvedBottomNavigationBar extends StatefulWidget {
  @override
  State<CurvedBottomNavigationBar> createState() =>
      _CurvedBottomNavigationBarState();
}

class _CurvedBottomNavigationBarState extends State<CurvedBottomNavigationBar> {
  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    final screens = [
      CartScreen(
        cartItems: Provider.of<CartProvider>(context).cartItems,
      ),
      StraggeredHomePage(),
      FavouriteScreen(
        favoriteMeals:
            Provider.of<SearchPlantsProvider>(context).getFavoritePlants(),
      )
    ];
    return Scaffold(
      extendBody: true,
      body: screens[_currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        index: _currentIndex,
        backgroundColor: Colors.white,
        color: Colors.green,
        items: [
          Stack(children: [
            const Icon(
              Icons.shopping_cart,
              size: 30,
              color: Colors.white,
            ),
            Positioned(
              top: -8,
              right: -4,
              child:
                  Consumer<CartProvider>(builder: (context, cartProvider, _) {
                var cartItemCount = cartProvider.cartItems.length;
                return cartItemCount > 0
                    ? Badge(
                  key: const Key('badge_key'),
                        badgeContent: Text(
                          cartItemCount.toString(),
                          style: const TextStyle(color: Colors.white),
                        ),
                        badgeColor: Colors.red,
                        position: BadgePosition.topEnd(top: -6, end: -6),
                        animationDuration: const Duration(milliseconds: 300),
                        animationType: BadgeAnimationType.slide,
                      )
                    : const SizedBox.shrink();
              }),
            ),
          ]),
          const Icon(Icons.home, size: 30, color: Colors.white),
          Stack(children: [
            const Icon(Icons.favorite, size: 30, color: Colors.white),
            Positioned(
              top: -8,
              right: -4,
              child: Consumer<SearchPlantsProvider>(
                  builder: (context, provider, _) {
                int favoriteCount = provider.getFavoritePlants().length;

                print("Favorite Count: $favoriteCount");
                print("_showBadge: ${provider.showBadge}");

                return favoriteCount > 0
                    ? Badge(
                        badgeContent: Text(
                          favoriteCount.toString(),
                          style: const TextStyle(color: Colors.white),
                        ),
                        badgeColor: Colors.red[400]!,
                        animationType: BadgeAnimationType.scale,
                        animationDuration: const Duration(milliseconds: 300),
                      )
                    : const SizedBox.shrink(key: Key('shrink_key'),);
              }),
            )
          ]),
        ],
        animationDuration: const Duration(milliseconds: 1000),
        animationCurve: Curves.linearToEaseOut,
        letIndexChange: (index) => true,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
