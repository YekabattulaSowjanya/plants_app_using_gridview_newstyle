import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:plants_app_using_new_widgets/home_screens/curved_buttom_navigation_bar.dart';
import 'package:plants_app_using_new_widgets/provider/cart_items.dart';
import 'package:plants_app_using_new_widgets/provider/pageview_user_details_provider.dart';
import 'package:plants_app_using_new_widgets/provider/search_plants_info.dart';
import 'package:plants_app_using_new_widgets/starting_page/intro_page.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets("To test the intro page to find the stack", (widgetTester) async {
    var introPlantsPage = IntroPlantsPage();

    // provideMockedNetworkImages(() async {
    await widgetTester.pumpWidget(ChangeNotifierProvider(
        create: (_) => PageViewUserDetailsProvider(),
        child: MaterialApp(home: introPlantsPage)));

    var stackWidget = find.byType(Stack);
    expect(stackWidget, findsWidgets);
    await widgetTester.pumpAndSettle();
  });

  testWidgets("To test the intro page to find the skip", (widgetTester) async {
    var introPlantsPage = IntroPlantsPage();

    // provideMockedNetworkImages(() async {
    await widgetTester.pumpWidget(
      MultiProvider(providers: [
        ChangeNotifierProvider(
          create: (_) => CartProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => PageViewUserDetailsProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => SearchPlantsProvider(),
        )
      ], child: MaterialApp(home: introPlantsPage)),
    );

    var skipText = find.text('Skip');
    expect(skipText, findsWidgets);
    await widgetTester.tap(skipText);
    await widgetTester.pumpAndSettle();
    expect(find.byType(CurvedBottomNavigationBar), findsOneWidget);
  });

  testWidgets("To test the intro page to find the dotted indication",
      (widgetTester) async {
    var introPlantsPage = IntroPlantsPage();

    await widgetTester.pumpWidget(
      MultiProvider(providers: [
        ChangeNotifierProvider(
          create: (_) => PageViewUserDetailsProvider(),
        ),
      ], child: MaterialApp(home: introPlantsPage)),
    );

    var dottedKey = find.byKey(const Key('dotted_indicator_key'));
    expect(dottedKey, findsWidgets);
  });

  testWidgets("To test the intro page to find the rich text",
      (widgetTester) async {
    var introPlantsPage = IntroPlantsPage();

    await widgetTester.pumpWidget(
      MultiProvider(providers: [
        ChangeNotifierProvider(
          create: (_) => PageViewUserDetailsProvider(),
        ),
      ], child: MaterialApp(home: introPlantsPage)),
    );

    var findKey = find.byKey(const Key('rich_text_key'));

    expect(findKey, findsOneWidget);

    final richTextWidget = widgetTester.widget<RichText>(findKey);
    final textSpanWidget = richTextWidget.text.debugDescribeChildren();

    expect(textSpanWidget.length, 3);

    final textContent = richTextWidget.text.toPlainText();
    expect(textContent, 'Enjoy your      Life wih Plants');
    //expect(textSpanWidget[0].name,'Enjoy your      ');
    // expect(find.text(' Plants'));
  });

  testWidgets("To test the intro page to find the circle arrow",
      (widgetTester) async {
    var introPlantsPage = IntroPlantsPage();

    await widgetTester.pumpWidget(
      MultiProvider(providers: [
        ChangeNotifierProvider(
          create: (_) => PageViewUserDetailsProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => CartProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => SearchPlantsProvider(),
        ),
      ], child: MaterialApp(home: introPlantsPage)),
    );

    var findArrow = find.byIcon(Icons.arrow_circle_right);
    expect(findArrow, findsOneWidget);
    await widgetTester.tap(findArrow);
    await widgetTester.pumpAndSettle();

    expect(find.byType(CurvedBottomNavigationBar), findsOneWidget);
  });

  testWidgets("To test the intro page to find pageview provider",
      (widgetTester) async {
    var introPlantsPage = IntroPlantsPage();

    final List<String> images = [
      "assets/images_pageview1.jpg",
      "assets/images_pageview2.jpg",
      "assets/images_pageview3.jpg",
    ];

    final pageViewProvider = PageViewUserDetailsProvider();
    await widgetTester.pumpWidget(ChangeNotifierProvider(
        create: (_) => PageViewUserDetailsProvider(),
        child: MaterialApp(home: introPlantsPage)));

    expect(find.byKey(const Key('page_view_key')), findsOneWidget);

    expect(pageViewProvider.currentIndexPage, 0);

    pageViewProvider.setCurrentIndexPage(1);

    expect(pageViewProvider.currentIndexPage, 1);

    expect(find.byKey(const Key('image_key')), findsWidgets);
  });
}
