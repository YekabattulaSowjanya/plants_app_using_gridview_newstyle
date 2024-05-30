import 'package:flutter/material.dart';
import 'package:plants_app_using_new_widgets/provider/cart_items.dart';
import 'package:plants_app_using_new_widgets/provider/pageview_user_details_provider.dart';
import 'package:plants_app_using_new_widgets/provider/search_plants_info.dart';
import 'package:plants_app_using_new_widgets/starting_page/intro_page.dart';
import 'package:provider/provider.dart';

import 'consts/grid_vierw.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
        create: (_) => PageViewUserDetailsProvider(),),
        ChangeNotifierProvider(
        create: (_) => SearchPlantsProvider(),),
        ChangeNotifierProvider(
        create: (_) => CartProvider(),),
      ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: IntroPlantsPage(),//StrggeredHomePage(),
        ),

    );
  }
}
