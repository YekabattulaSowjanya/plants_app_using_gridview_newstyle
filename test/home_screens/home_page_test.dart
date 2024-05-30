import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:plants_app_using_new_widgets/home_screens/home_page.dart';
import 'package:plants_app_using_new_widgets/provider/search_plants_info.dart';
import 'package:provider/provider.dart';

void main(){

  testWidgets("to test straggered page to find the Icon and search product", (widgetTester) async{

    var straggeredHomePage= StraggeredHomePage();

    await widgetTester.pumpWidget(ChangeNotifierProvider(
        create: (_) =>SearchPlantsProvider(),
        child: MaterialApp(home: straggeredHomePage)));

    expect(find.byType(SingleChildScrollView), findsOneWidget);

    expect(find.text('Search Products'), findsOneWidget);

    var backArrowIcon = find.byIcon(Icons.arrow_back_ios);
    expect(backArrowIcon, findsOneWidget);

    await widgetTester.tap(backArrowIcon);
    await widgetTester.pumpAndSettle();

  });

  testWidgets("to test straggered page to find search with provider", (widgetTester) async{

    var straggeredHomePage= StraggeredHomePage();

    var searchPlantsProvider =SearchPlantsProvider();
    await widgetTester.pumpWidget(ChangeNotifierProvider(
        create: (_) =>SearchPlantsProvider(),
        child: MaterialApp(home: straggeredHomePage)));


    var searchKey = find.byKey(const Key('search_text_key'));
    expect(searchKey, findsOneWidget);

    await widgetTester.enterText(searchKey, 'plants1');
    expect(searchPlantsProvider.filteredPlants, hasLength(11));
    expect(searchPlantsProvider.filteredPlants.first.title, 'plants1');
    
  });

  testWidgets("to test straggered page to find add chart icon", (widgetTester) async{

    var straggeredHomePage= StraggeredHomePage();

    await widgetTester.pumpWidget(ChangeNotifierProvider(
        create: (_) =>SearchPlantsProvider(),
        child: MaterialApp(home: straggeredHomePage)));


    var addIcon = find.byIcon(Icons.add_chart_outlined);
    expect(addIcon, findsOneWidget);

  });
}