import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:plants_app_using_new_widgets/home_screens/straggered_grid_list.dart';
import 'package:plants_app_using_new_widgets/provider/search_plants_info.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets("test straggered grid page to find the no found text", (widgetTester) async {
    var straggeredGridList = StraggeredGridList();

    await widgetTester.pumpWidget(ChangeNotifierProvider(
        create: (_) => SearchPlantsProvider(),
        child: MaterialApp(home: straggeredGridList)));

    SearchPlantsProvider provider= Provider.of<SearchPlantsProvider>(widgetTester.element(find.byType(StraggeredGridList)),listen: false);
    provider.filteredPlants.isEmpty;
    await widgetTester.pump();
    //expect(find.text("No results found"), findsOneWidget);
  });

  testWidgets("test straggered grid page to find the straggered", (widgetTester) async {
    var straggeredGridList = StraggeredGridList();

    await widgetTester.pumpWidget(ChangeNotifierProvider(
        create: (_) => SearchPlantsProvider(),
        child: MaterialApp(home: straggeredGridList)));


    var straggeredKey = find.byKey(const Key('straggered_key'));
    expect(straggeredKey, findsOneWidget);

    var imageKey = find.byKey(const Key('image_key')).last;
    expect(imageKey, findsWidgets);

    await widgetTester.dragUntilVisible(imageKey, find.byType(SingleChildScrollView), const Offset(204.0, 311.0));
    await widgetTester.tap(imageKey);//Offset(204.0, 311.0)
    await widgetTester.pumpAndSettle();
    //expect(find.byType(PlantsDetailsScreen), findsOneWidget);
  });

  testWidgets("test straggered grid page to find the title widget", (widgetTester) async {
    var straggeredGridList = StraggeredGridList();

    await widgetTester.pumpWidget(ChangeNotifierProvider(
        create: (_) => SearchPlantsProvider(),
        child: MaterialApp(home: straggeredGridList)));

    expect(find.byKey(const Key('title_key')), findsWidgets);
    expect(find.byKey(const Key('prize_key')), findsWidgets);

  });

  testWidgets("test straggered grid page to find the favorite icon", (widgetTester) async {
    var straggeredGridList = StraggeredGridList();

    await widgetTester.pumpWidget(ChangeNotifierProvider(
        create: (_) => SearchPlantsProvider(),
        child: MaterialApp(home: straggeredGridList)));

    var favoriteIcon = find.byIcon(Icons.favorite_border).last;
    expect(favoriteIcon, findsWidgets);

    await widgetTester.ensureVisible(favoriteIcon);
    await widgetTester.tap(favoriteIcon);
    await widgetTester.pumpAndSettle();

  });
}

