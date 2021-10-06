// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:intouch/core/constants/core.dart';
import 'package:intouch/core/init/size_config.dart';
import 'package:intouch/core/navigation/navigation_constants.dart';

// Login Success Body
class Body extends StatefulWidget {
  @override
  _LoginSuccessScreenState createState() => new _LoginSuccessScreenState();
}

class _LoginSuccessScreenState extends State<Body> {
  // Page Routing
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () => goToHome(context));
  }

  static void goToHome(BuildContext context) {
    Navigator.popAndPushNamed(context, NavigationConstants.HOME);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: SizeConfig.screenHeight * 0.08),
        // Success Image
        Image.asset(
          AppImages.pngSuccess,
          height: SizeConfig.screenHeight * 0.5,
        ),
        SizedBox(height: SizeConfig.screenHeight * 0.04),
        Text(
          "Login Success",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: getProportionateScreenWidth(30),
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        Spacer(),
      ],
    );
  }
}
