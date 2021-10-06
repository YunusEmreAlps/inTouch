// Libraries

// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:intouch/core/constants/core.dart';
import 'package:intouch/core/init/size_config.dart';
import 'package:intouch/core/navigation/navigation_constants.dart';
import 'package:intouch/widget/default_button.dart';
import 'onboard_content.dart';

// Components

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String, String>> welcomeData = [
    {"text": AppStrings.ONBOARDING_TITLE_1, "image": AppImages.pngSlider1},
    {"text": AppStrings.ONBOARDING_TITLE_2, "image": AppImages.pngSlider2},
    {"text": AppStrings.ONBOARDING_TITLE_3, "image": AppImages.pngSlider3},
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: welcomeData.length,
                itemBuilder: (context, index) => OnBoardContent(
                  image: welcomeData[index]["image"],
                  text: welcomeData[index]['text'],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)),
                child: Column(
                  children: <Widget>[
                    // Dots
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        welcomeData.length,
                        (index) => buildDot(index: index),
                      ),
                    ),

                    Spacer(
                      flex: 2,
                    ),
                    DefaultButton(
                      text: AppStrings.CONTINUE,
                      buttonColor: AppColors.colorPrimary,
                      textColor: Colors.white,
                      press: () {
                        Navigator.popAndPushNamed(context, NavigationConstants.LOGIN);
                      } ,
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Dot Animations
  AnimatedContainer buildDot({int index}) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 250),
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? AppColors.colorPrimary : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
