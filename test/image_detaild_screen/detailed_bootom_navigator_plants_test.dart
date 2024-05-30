import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:plants_app_using_new_widgets/image_detailed_screen/detailed_bootom_navigator_plants.dart';
import 'package:plants_app_using_new_widgets/provider/cart_items.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('test detailed page to find icons', (widgetTester) async {
    var detailsBottomPage = DetailsBottomPage(
      detailsPrize: '23',
      detailsImage: 'assets/image_plant1.jpg',
    );

    await widgetTester.pumpWidget(MaterialApp(home: detailsBottomPage));

    expect(find.byType(ClipRRect), findsOneWidget);
  });

  testWidgets('test detailed page to find height row text',
      (widgetTester) async {
    var detailsBottomPage = DetailsBottomPage(
      detailsPrize: '23',
      detailsImage: 'assets/image_plant1.jpg',
    );

    await widgetTester.pumpWidget(MaterialApp(home: detailsBottomPage));

    expect(find.byIcon(Icons.height), findsOneWidget);
    expect(find.text('Height'), findsOneWidget);
    expect(find.text('350m - 400m'), findsOneWidget);
  });

  testWidgets('test detailed page to find temperature row text',
      (widgetTester) async {
    var detailsBottomPage = DetailsBottomPage(
      detailsPrize: '23',
      detailsImage: 'assets/image_plant1.jpg',
    );

    await widgetTester.pumpWidget(MaterialApp(home: detailsBottomPage));

    expect(find.byIcon(Icons.ten_mp), findsOneWidget);
    expect(find.text('Temparature'), findsOneWidget);
    expect(find.text('20c - 30c'), findsOneWidget);
  });

  testWidgets('test detailed page to find pot row text', (widgetTester) async {
    var detailsBottomPage = DetailsBottomPage(
      detailsPrize: '23',
      detailsImage: 'assets/image_plant1.jpg',
    );

    await widgetTester.pumpWidget(MaterialApp(home: detailsBottomPage));

    expect(find.byIcon(Icons.photo_size_select_small_sharp), findsOneWidget);
    expect(find.text('Pot'), findsOneWidget);
    expect(find.text('ceramic'), findsOneWidget);
  });

  testWidgets('test detailed page to find rich text', (widgetTester) async {
    var detailsBottomPage = DetailsBottomPage(
      detailsPrize: '23',
      detailsImage: 'assets/image_plant1.jpg',
    );

    await widgetTester.pumpWidget(MaterialApp(home: detailsBottomPage));

    var findKey = find.byKey(const Key('rich_text_key1'));

    expect(findKey, findsOneWidget);

    final richTextWidget = widgetTester.widget<RichText>(findKey);
    final textSpanWidget = richTextWidget.text.debugDescribeChildren();

    expect(textSpanWidget.length, 2);

    final textContent = richTextWidget.text.toPlainText();
    expect(textContent, 'Enjoy your \v23');
  });

  testWidgets('test detailed page to find button', (widgetTester) async {
    var detailsBottomPage = DetailsBottomPage(
      detailsPrize: '23',
      detailsImage: 'assets/image_plant1.jpg',
    );

    await widgetTester.pumpWidget(ChangeNotifierProvider(
        create: (_) => CartProvider(),
        child: MaterialApp(home: detailsBottomPage)));

    var addToCartText = find.text('Add to Cart');
    expect(addToCartText, findsOneWidget);

    await widgetTester.tap(addToCartText);
    await widgetTester.pumpAndSettle();
  });
}
