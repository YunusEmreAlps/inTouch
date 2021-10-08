// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_svg/svg.dart';

// Project imports:
import 'package:intouch/core/constants/core.dart';
import 'package:intouch/core/init/app_localizations.dart';
import 'package:intouch/core/navigation/navigation_constants.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTimeout() {
    Future.delayed(Duration(seconds: 8), () {
      Navigator.pushReplacementNamed(context, NavigationConstants.ONBOARD);
    });
  }

  @override
  void initState() {
    super.initState();
    startTimeout();
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations.of(context);
    return Scaffold(
      body: DecoratedBox(
        position: DecorationPosition.background,
        decoration: BoxDecoration(
          color: Colors.transparent,
          image: DecorationImage(
              image: AssetImage(AppImages.pngBackgroundImage),
              fit: BoxFit.cover),
        ),
        

        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            // Logo
            Center(
              child: SvgPicture.asset(
                AppImages.svgLogo,
                height: 200, 
                color: AppColors.colorPrimary.withOpacity(1.0),
                colorBlendMode: BlendMode.srcATop
              ),
            ),

            // Animated Text
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    RotateAnimatedTextKit(
                      alignment: Alignment.center,
                      onTap: () {
                        print("Tap Event");
                      },
                      text: [
                        AppStrings.SPLASH_TEXT,
                        AppStrings.SPLASH_TEXT,
                        AppStrings.SPLASH_TEXT
                      ],
                      textStyle: TextStyle(
                          fontSize: 18.0,
                          fontFamily: AppStrings.FONT_FAMILY,
                          foreground: Paint()
                            ..shader = AppGradients.primaryTextGradientColor),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
