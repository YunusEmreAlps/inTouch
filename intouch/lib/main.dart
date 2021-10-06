// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:flutter_localizations/flutter_localizations.dart';

// Project imports:
import 'package:intouch/core/constants/core.dart';
import 'package:intouch/core/init/app_localizations.dart';
import 'package:intouch/core/navigation/navigation_constants.dart';
import 'package:intouch/view/authenticate/onboard/onboard_screen.dart';
import 'package:intouch/view/authenticate/splash/splashscreen.dart';
import 'package:intouch/view/home/home_navigator.dart';

void main() => runApp(InTouch());

class InTouch extends StatefulWidget {
  @override
  _InTouchState createState() => _InTouchState();
}

class _InTouchState extends State<InTouch> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );
    // Portrait Mode
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: AppStrings.APP_NAME,
      debugShowCheckedModeBanner: false,
      supportedLocales: [Locale("en"), Locale("tr")],
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      initialRoute: NavigationConstants.SPLASH,
      routes: {
        NavigationConstants.SPLASH: (context) => SplashScreen(),
        NavigationConstants.ONBOARD: (context) => OnboardScreen(),
        NavigationConstants.HOME: (context) => HomeNavigator(),
      },
    );
  }
}
