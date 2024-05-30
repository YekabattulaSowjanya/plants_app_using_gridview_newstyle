import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:plants_app_using_new_widgets/image_detailed_screen/plants_detaied_screen.dart';

void main(){

  testWidgets('test plant detailed page to find icons', (widgetTester) async {
    var detailsBottomPage = PlantsDetailsScreen(
      detailsPrize: '23',
      detailsImage: 'assets/image_plant1.jpg',
    );

    await widgetTester.pumpWidget(MaterialApp(home: detailsBottomPage));

    var shoppingIcon= find.byIcon(Icons.shopping_cart_outlined);
    expect(shoppingIcon, findsOneWidget);
    await widgetTester.tap(shoppingIcon);
    await widgetTester.pumpAndSettle();
  });

  testWidgets('test plant detailed page to find icons', (widgetTester) async {
    var detailsBottomPage = PlantsDetailsScreen(
      detailsPrize: '23',
      detailsImage: 'assets/image_plant1.jpg',
    );

    await widgetTester.pumpWidget(MaterialApp(home: detailsBottomPage));

    var arrowIcon= find.byIcon(Icons.arrow_back_ios);
    expect(arrowIcon, findsOneWidget);
    await widgetTester.tap(arrowIcon);
    await widgetTester.pumpAndSettle();
  });
}