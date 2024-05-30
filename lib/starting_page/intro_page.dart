import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:plants_app_using_new_widgets/provider/pageview_user_details_provider.dart';
import 'package:provider/provider.dart';

import '../consts/colors_const.dart';
import '../consts/list_of_price_title.dart';
import '../home_screens/curved_buttom_navigation_bar.dart';
import '../home_screens/home_page.dart';

class IntroPlantsPage extends StatelessWidget {
  IntroPlantsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox(
              height: 430,
              width: MediaQuery.of(context).size.width,
              child:
                  PageView.builder(
                    key:  const Key('page_view_key'),
                itemCount: images.length,
                pageSnapping: true,
                controller: PageController(viewportFraction: 1),
                onPageChanged: (index) {
                  Provider.of<PageViewUserDetailsProvider>(context,
                          listen: false)
                      .setCurrentIndexPage(index);
                },
                itemBuilder: (context, index) {
                  // try {
                    return Image.asset(
                      key: const Key('image_key'),
                       images[index],
                      scale: 0.6,
                     // fit: BoxFit.cover,
                    );
                  // }catch (e){
                  //   print('error image $e');
                  //   return Container(color: Colors.red,);
                  // }
                },
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => CurvedBottomNavigationBar()));
                },
                child: const Padding(
                  padding: EdgeInsets.only(top: 16.0, bottom: 16, right: 23),
                  child: Text(
                    'Skip',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 350,
                  ),
                  Expanded(
                    child: DotsIndicator(
                      key: const Key('dotted_indicator_key'),
                      dotsCount: images.length,
                      //position: currentIndexPage.toDouble(),
                      position: Provider.of<PageViewUserDetailsProvider>(context)
                          .currentIndexPage
                          .toDouble(),

                      decorator: DotsDecorator(
                        color: CustomColors.dotIndicatorDefaultColor,
                        activeColor: CustomColors.dotIndicatorActiveColor,
                        size: const Size.square(9.0),
                        activeSize: const Size(18.0, 9.0),
                        activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin:
                          const EdgeInsets.only(left: 50.0, top: 20, bottom: 20),
                      child: RichText(
                        key: const Key('rich_text_key'),
                        maxLines: 2,
                        text: const TextSpan(
                          //style: DefaultTextStyle.of(context).style,
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Enjoy your      ',
                              style: TextStyle(color: Colors.black, fontSize: 45),
                            ),
                            TextSpan(
                              text: 'Life wih',
                              style: TextStyle(color: Colors.black, fontSize: 45),
                            ),
                            TextSpan(
                              text: ' Plants',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 45),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                        padding: const EdgeInsets.only(right: 10, top: 0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => CurvedBottomNavigationBar()));
                          },
                          child: const Icon(
                            Icons.arrow_circle_right,
                            size: 120,
                            color: CustomColors.dotIndicatorDefaultColor,
                          ),
                        )),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
