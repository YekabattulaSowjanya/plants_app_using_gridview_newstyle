import 'package:flutter_test/flutter_test.dart';
import 'package:plants_app_using_new_widgets/provider/pageview_user_details_provider.dart';

void main(){

  test("test the current index page", () async{

    var pageViewUserDetailsProvider= PageViewUserDetailsProvider();
    expect(pageViewUserDetailsProvider.currentIndexPage, 0);
  });

  test("test the current index page", () async{

    var pageViewUserDetailsProvider= PageViewUserDetailsProvider();

    pageViewUserDetailsProvider.setCurrentIndexPage(2);
    expect(pageViewUserDetailsProvider.currentIndexPage.bitLength, 2);

    pageViewUserDetailsProvider.setCurrentIndexPage(52);
    expect(pageViewUserDetailsProvider.currentIndexPage.bitLength, 6);

  });

}