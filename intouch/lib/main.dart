// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:flutter_localizations/flutter_localizations.dart';

// Project imports:
import 'package:intouch/core/constants/core.dart';
import 'package:intouch/core/init/app_localizations.dart';
import 'package:intouch/core/init/theme.dart';
import 'package:intouch/core/model/user_location.dart';
import 'package:intouch/core/navigation/navigation_constants.dart';
import 'package:intouch/ui/view/authenticate/login/login_screen.dart';
import 'package:intouch/ui/view/authenticate/login_success/login_success_screen.dart';
import 'package:intouch/ui/view/authenticate/onboard/onboard_screen.dart';
import 'package:intouch/ui/view/authenticate/register/register_screen.dart';
import 'package:intouch/ui/view/authenticate/splash/splashscreen.dart';
import 'package:intouch/ui/view/home/home_navigator.dart';
import 'package:provider/provider.dart';

import 'core/service/location_service.dart';

void main() => runApp(InTouch());

class InTouch extends StatefulWidget {
  @override
  _InTouchState createState() => _InTouchState();
}

class _InTouchState extends State<InTouch> {
  @override
  Widget build(context) {
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
      theme: theme(),
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
        NavigationConstants.LOGIN: (context) => LoginScreen(),
        NavigationConstants.LOGIN_SUCCESS: (context) => LoginSuccessScreen(),
        NavigationConstants.REGISTER: (context) => RegisterScreen(),
        NavigationConstants.HOME: (context) => HomeNavigator(),
      },
    );
  }
}
