// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:intouch/core/constants/core.dart';
import 'package:intouch/core/init/size_config.dart';
import 'package:intouch/core/navigation/navigation_constants.dart';
import 'components/body.dart';

// Sign In/Login Screen
class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(AppStrings.SIGN_IN),
      ),
      body: Body(),
      // Sticky Layout
      // Don't have an account
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(15.0), // 8
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              AppStrings.DONT_HAVE_AN_ACCOUNT,
            ),
            // Register
            GestureDetector(
              onTap: () => {
                Navigator.pushNamed(context, NavigationConstants.REGISTER),
              },
              child: Text(
                AppStrings.SIGN_UP,
                style: TextStyle(
                    fontSize: getProportionateScreenWidth(16),
                    fontWeight: FontWeight.w600,
                    color: AppColors.colorPrimary),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
