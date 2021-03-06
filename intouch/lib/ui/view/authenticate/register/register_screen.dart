// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:intouch/core/constants/core.dart';
import 'package:intouch/core/init/size_config.dart';
import 'package:intouch/core/navigation/navigation_constants.dart';
import 'components/body.dart';

// Sign Up/Register Screen
class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
       title: Text(AppStrings.SIGN_UP),
      ),
      body: Body(),
      // Sticky or Fixed Layout
      // Don't have an account
      bottomNavigationBar: Padding(
          padding: EdgeInsets.all(15.0), // 8
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                AppStrings.ALREADY_HAVE_AN_ACCOUNT,
              ),
              // Sign Up Page router
              GestureDetector(
                onTap: () => {
                  Navigator.pushNamed(context, NavigationConstants.LOGIN),
                },
                child: Text(
                  AppStrings.SIGN_IN,
                  style: TextStyle(
                      fontSize: getProportionateScreenWidth(16),
                      fontWeight: FontWeight.w600,
                      color: AppColors.colorPrimary),
                ),
              ),
            ],
          )),
    );
  }
}
