// Libraries

// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:intouch/core/constants/core.dart';
import 'package:intouch/core/init/size_config.dart';
import 'login_form.dart';

// Components

// Sign In/Login Body
class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Welcome Text
                SizedBox(height: SizeConfig.screenHeight * 0.02), // 0.02
                Text(
                  AppStrings.WELCOME_BACK,
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(28),
                    color: AppColors.colorPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  AppStrings.LOGIN_GUIDE,
                  textAlign: TextAlign.center,
                ),

                // Login form
                SizedBox(height: SizeConfig.screenHeight * 0.08), // 0.06
                LoginForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
