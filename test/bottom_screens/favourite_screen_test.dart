import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:plants_app_using_new_widgets/bottom_screens/favorite_screen.dart';
import 'package:plants_app_using_new_widgets/model/plants_model.dart';

void main() {
  testWidgets('Test favourite page to find app bar',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
        home: FavouriteScreen(
      favoriteMeals: [
        Plants(
          title: 'plants1',
          prize: "\$5.99",
          Image: 'assets/image_plant1.jpg',
        ),
        Plants(
          title: 'tree',
          prize: "\$6.90",
          Image: 'assets/image_plant3.jpg',
        ),
      ],
    )));

    expect(find.text('Favourite'), findsOneWidget);

    var arrowIcon = find.byIcon(Icons.arrow_back);
    expect(arrowIcon, findsOneWidget);
    await tester.tap(arrowIcon);
    await tester.pumpAndSettle();
  });

  testWidgets('Test favourite page to find gridview',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
        home: FavouriteScreen(
      favoriteMeals: [
        Plants(
          title: 'plants1',
          prize: "\$5.99",
          Image: 'assets/image_plant1.jpg',
        ),
        Plants(
          title: 'tree',
          prize: "\$6.90",
          Image: 'assets/image_plant3.jpg',
        ),
      ],
    )));

    var key = find.byKey(const Key('grid_view_key'));
    expect(key, findsOneWidget);

    var title = find.text('plants1');
    expect(title, findsOneWidget);

    var prize = find.text("\$5.99");
    expect(prize, findsOneWidget);

    var imageKey = find.byKey(const Key('image_key')).last;
    expect(imageKey, findsWidgets);

    await tester.tap(imageKey);
    await tester.pumpAndSettle();
  });

  testWidgets('Test favourite page to find image navigation',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
        home: FavouriteScreen(
      favoriteMeals: [
        Plants(
          title: 'plants1',
          prize: "\$5.99",
          Image: 'assets/image_plant1.jpg',
        ),
        Plants(
          title: 'tree',
          prize: "\$6.90",
          Image: 'assets/image_plant3.jpg',
        ),
      ],
    )));

    var imageKey = find.byKey(const Key('image_key')).last;
    expect(imageKey, findsWidgets);

    await tester.dragUntilVisible(imageKey, find.byType(SingleChildScrollView),
        const Offset(595.0, 115.8));
    await tester.ensureVisible(imageKey);
    await tester.tap(imageKey);
    await tester.pumpAndSettle();
  });
}
